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
        if (e.response?.data is Map && e.response?.data['message'] != null) {
          message = e.response?.data['message'].toString() ?? message;
        } else if (e.response?.data is Map && e.response?.data['error'] != null) {
          message = e.response?.data['error'].toString() ?? message;
        } else if (e.message != null && e.message!.isNotEmpty) {
          message = e.message!;
        } else {
          message = e.error?.toString() ?? "Something went wrong";
        }
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
