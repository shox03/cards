import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sample_app_getx/base/base_repository.dart';
import 'package:sample_app_getx/data/models/banners/banners_response.dart';
import 'package:sample_app_getx/data/models/categories/category_response.dart';
import 'package:sample_app_getx/data/models/products/products_response.dart';
import 'package:sample_app_getx/data/provider/api_client.dart';
import 'package:sample_app_getx/data/provider/response_handler.dart';
import 'package:sample_app_getx/data/provider/server_error.dart';

class HomeRepository extends BaseRepository {
  ApiClient? apiClient;

  HomeRepository({required this.apiClient}) : assert(apiClient != null);

  Future<ResponseHandler<BannersResponse>> _fetchBanners(
      {required String shipperId,
      required int page,
      required int limit}) async {
    BannersResponse response;
    try {
      response = await apiClient!.getBanners(shipperId, page, limit);
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getBanners({required String shipperId}) async {
    final response =
        await _fetchBanners(shipperId: shipperId, limit: 100, page: 1);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
          response.getException()?.getErrorMessage() ?? '');
    }
  }

  Future<ResponseHandler<CategoryResponse?>> _fetchCategoryWithProducts(
      {required String shipperId, int page = 1, int limit = 1000}) async {
    CategoryResponse response;
    try {
      response = await apiClient!
          .getCategoryWithProduct(shipperId, page, limit, true, false);
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getCategoryWithProducts({required String shipperId}) async {
    final response = await _fetchCategoryWithProducts(shipperId: shipperId);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }

  Future<ResponseHandler<ProductsResponse>> _fetchSearchProducts(
      {required String shipperId,
      required String search,
      int page = 1,
      int limit = 1000}) async {
    ProductsResponse response;
    try {
      response = await apiClient!.getProducts(shipperId, search, page, limit);
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getSearchProducts(
      {required String shipperId,
      required String search,
      int limit = 1000,
      int page = 1}) async {
    final response = await _fetchSearchProducts(
        shipperId: shipperId, search: search, limit: limit, page: page);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }
}
