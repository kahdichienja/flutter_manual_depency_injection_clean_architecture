import 'package:dio/dio.dart';

import '../providers/api_base_provider.dart';

class ErrorInterceptor extends ApiBaseProvider with Interceptor {
  /// This is the [ERROR] interceptor from the [HTTP] request
  /// It formats The errors in a correct way


 @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    switch (err.type) {
      case DioErrorType.cancel:
        err.error = "Request to  server was cancelled";
        setError("Request to  server was cancelled");
        break;
      case DioErrorType.connectTimeout:
        err.error = "Connection to  server timed out";
        setError("Connection to  server timed out");
        break;
      case DioErrorType.other:
        err.error = "Connection to Server failed,try again later .";
        setError("Connection to Server failed,try again later");
        break;
      case DioErrorType.receiveTimeout:
        err.error = "Receive timeout in connection with  server";
        setError("Receive timeout in connection with  server");
        break;
      case DioErrorType.sendTimeout:
        err.error = "Send timeout in connection with  server";
        setError("Send timeout in connection with  server");
        break;
      case DioErrorType.response:
        if (err.response!.data != null) {
          if (err.response!.data is String) {
            err.error = "${err.response!.statusCode}: ${err.response!.data}";
            setError(" ${err.response!.data}");
          } else
            err.error = err.response!.data['message'];
          if (err.response!.statusCode == 404 && err.response!.data is String) {
            err.error = "${err.response!.statusCode} Page not found.";
            setError(" Page not found.");
          }
          if (err.response!.statusCode == 500 && err.response!.data is String) {
            err.error = "${err.response!.statusCode} Internal server error.";
            setError("Internal server error.");
          }

          if (err.response!.statusCode == 401 ||
              err.response!.statusCode == 403) {
            err.error = "Unauthorized";
            setError("Unauthorized");
          }
        } else {
          err.error =
              "Received invalid status code: ${err.response!.statusCode}";
          setError("${err.response!.statusCode}");
        }

        break;
    }
    notifyListeners();
    return super.onError(err, handler);
  }
}
