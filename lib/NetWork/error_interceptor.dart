import 'dart:async';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'App_Exception.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    AppException appException = AppException.create(err);
    debugPrint('DioError ===: ${appException.toString()}');
    err.error = appException;
    return super.onError(err, handler);
  }
}
