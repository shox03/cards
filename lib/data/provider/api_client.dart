import 'package:chuck_interceptor/chuck_interceptor.dart';
import 'package:dio_retry_plus/dio_retry_plus.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/base/base_functions.dart';
import 'package:sample_app_getx/core/constants/constants.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:sample_app_getx/data/data_source/local_source.dart';
import 'package:sample_app_getx/data/models/banners/banners_response.dart';
import 'package:sample_app_getx/data/models/categories/category_response.dart';
import 'package:sample_app_getx/data/models/products/products_response.dart';
import 'package:sample_app_getx/data/models/token/refresh_token_request.dart';
import 'package:sample_app_getx/data/models/token/refresh_token_response.dart';
import 'package:sample_app_getx/routes/app_routes.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ApiClient {
  static Alice alice = Alice(
    navigatorKey: AppConstants.navigatorKey,
    showNotification: true,
    showInspectorOnShake: false,
    darkTheme: false,
  );

  static get getDio {
    Dio dio = Dio(BaseOptions(followRedirects: false));

    ///Alice chuck interceptor
    dio.interceptors.add(alice.getDioInterceptor());

    /// Tries the last error request again.
    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        toNoInternetPageNavigator: () async =>
            await Get.toNamed(Routes.internetConnection),
        accessTokenGetter: () => LocalSource.getInstance().getAccessToken(),
        refreshTokenFunction: BaseFunctions.refreshToken,
      ),
    );
    dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
        request: true,
      ),
    );
    return dio;
  }

  static CancelToken cancelToken = CancelToken();

  static ApiClient? _apiClient;

  static ApiClient getInstance({String baseUrl = AppConstants.baseUrl}) {
    if (_apiClient != null) {
      return _apiClient!;
    } else {
      _apiClient = ApiClient(getDio, cancelToken, baseUrl);
      return _apiClient!;
    }
  }

  factory ApiClient(Dio dio, CancelToken cancelToken, String baseUrl) {
    dio.options = BaseOptions(receiveTimeout: 30000, connectTimeout: 30000);
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  /// Get banner list
  @GET('banner')
  Future<BannersResponse> getBanners(
    @Header('Shipper') String shipperId,
    @Query('page') int page,
    @Query('limit') int limit,
  );

  /// Get categories and products
  @GET('category')
  Future<CategoryResponse> getCategoryWithProduct(
    @Header('Shipper') String shipperId,
    @Query('page') int page,
    @Query('limit') int limit,
    @Query('with_products') bool withProducts,
    @Query('all') bool all,
  );

  /// Get product info
  @GET('product/{product_id}')
  Future<Products> getProductDetail(
    @Header('Shipper') String shipperId,
    @Path('product_id') String productId,
  );

  /// Get all products
  @GET('product')
  Future<ProductsResponse> getProducts(
    @Header('Shipper') String shipperId,
    @Query('search') String search,
    @Query('page') int page,
    @Query('limit') int limit,
  );

  @GET('customers/refresh-token')
  Future<RefreshTokenResponse> refreshToken(
    @Body() RefreshTokenRequest request,
  );
}
