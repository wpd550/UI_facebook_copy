import 'package:dio/dio.dart';

class AppException implements Exception {
  final String _message;
  final int _code;

  AppException(this._message, this._code);

  String toString() {
    return "$_code$_message";
  }

  factory AppException.create(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        {
          return BadRequestException(-1, '请求取消');
        }

      case DioErrorType.connectTimeout:
        {
          return BadRequestException(-1, '连接超时');
        }

      case DioErrorType.sendTimeout:
        {
          return BadRequestException(-1, '请求超时');
        }

      case DioErrorType.receiveTimeout:
        {
          return BadRequestException(-1, '效应超时');
        }

      case DioErrorType.response:
        {
          try {
            int? errCode = error.response!.statusCode;
            switch (errCode) {
              case 400:
                {
                  return BadRequestException(errCode!, '请求语法错误');
                }
              case 401:
                {
                  return UnauthoriseException(errCode!, '没有权限');
                }
              case 403:
                {
                  return UnauthoriseException(errCode!, '服务器拒绝执行');
                }
              case 404:
                {
                  return UnauthoriseException(errCode!, '无法连接服务器');
                }
              case 405:
                {
                  return UnauthoriseException(errCode!, '请求方法被静止');
                }
              case 500:
                {
                  return UnauthoriseException(errCode!, '服务器内部错误');
                }
              case 502:
                {
                  return UnauthoriseException(errCode!, '无效的请求');
                }
              case 503:
                {
                  return UnauthoriseException(errCode!, '服务器挂逼了');
                }
              case 505:
                {
                  return UnauthoriseException(errCode!, '不支持的http协议请求');
                }
              default:
                {
                  return AppException(error.response!.statusMessage!, errCode!);
                }
            }
          } on Exception catch (_) {
            return AppException("未知错误", -1);
          }
        }
      default:
        {
          return AppException(error.message, -1);
        }
    }
  }
}

class BadRequestException extends AppException {
  BadRequestException(int code, String message) : super(message, code);
}

class UnauthoriseException extends AppException {
  UnauthoriseException(int code, String message) : super(message, code);
}
