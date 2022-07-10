import 'package:copy_facebook_ui/NetWork/error_interceptor.dart';
import 'package:copy_facebook_ui/NetWork/proxy.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class Http {
  // ignore: constant_identifier_names
  static const int CONNECT_TIMEOUT = 30000;
  // ignore: constant_identifier_names
  static const int RECEIVE_TIMEOUT = 30000;

  static Http _instance = Http._internal();

  late Dio dio;

  // ignore: unused_field
  final CancelToken _cancelToken = CancelToken();

  static get instance {
    return _instance;
  }

  Http._internal() {
    // ignore: unnecessary_null_comparison
    print('initization dio object');

    BaseOptions options = BaseOptions(
      connectTimeout: CONNECT_TIMEOUT,
      receiveTimeout: RECEIVE_TIMEOUT,
      headers: {},
    );

    dio = Dio(options);
    dio.interceptors.add(ErrorInterceptor());

    if (PROXY_ENABLE) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.findProxy = (uri) {
          return "PROXY $PROXY_IP:$PROXY_PORT";
        };
        client.badCertificateCallback = (cert, host, port) => true;
      };
    }
  }
}
