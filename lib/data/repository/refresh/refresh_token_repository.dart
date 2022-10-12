import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sample_app_getx/base/base_repository.dart';
import 'package:sample_app_getx/data/models/token/refresh_token_request.dart';
import 'package:sample_app_getx/data/models/token/refresh_token_response.dart';
import 'package:sample_app_getx/data/provider/api_client.dart';
import 'package:sample_app_getx/data/provider/response_handler.dart';
import 'package:sample_app_getx/data/provider/server_error.dart';

class RefreshTokenRepository extends BaseRepository {
  final ApiClient _apiClient = ApiClient.getInstance();

  Future<ResponseHandler<RefreshTokenResponse>> _fetchRefreshToken(
      {required RefreshTokenRequest request}) async {
    RefreshTokenResponse response;
    try {
      response = await _apiClient.refreshToken(request);
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> refreshToken({required RefreshTokenRequest request}) async {
    final response = await _fetchRefreshToken(request: request);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
          response.getException()?.getErrorMessage() ?? '');
    }
  }
}
