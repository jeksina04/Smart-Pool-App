import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'api_service.dart';

mixin class ApiCaller {
  final apiCaller = GetIt.I.get<ApiService>();

  execute(Future<Response> apiCall) async {
    var message = "Something went wrong";
    try {
      if (await _isInternetConnected()) {
        var data = (await apiCall).data;
        return data;
      }
    } catch (e) {
      if (e is DioException) {
        message = e.error.toString();
      } else if (e is HttpException) {
        message = e.message;
      }
      throw HttpException(message);
    }
  }

  Future<bool> _isInternetConnected() async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else {
      throw const HttpException("Internet not connected");
    }
  }
}
