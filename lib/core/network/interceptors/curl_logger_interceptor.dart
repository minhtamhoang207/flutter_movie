import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

class CurlLoggerInterceptor extends Interceptor {
  final bool logRequestBody;
  final bool logResponseBody;
  final bool logRequestHeaders;
  final bool logResponseHeaders;

  CurlLoggerInterceptor({
    this.logRequestBody = true,
    this.logResponseBody = true,
    this.logRequestHeaders = true,
    this.logResponseHeaders = true,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final curlCommand = _getCurlCommand(options);
    log('\n🌐 cURL Request:\n$curlCommand\n');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (logResponseBody) {
      log('\n📥 Response [${response.statusCode}] - ${response.requestOptions.uri}');
      if (logResponseHeaders) {
        log('Headers:');
        response.headers.forEach((name, values) {
          log('  $name: ${values.join(", ")}');
        });
      }
      log('Body: ${_prettylogJson(response.data)}\n');
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('\n❌ Error [${err.response?.statusCode}] - ${err.requestOptions.uri}');
    if (err.response != null && logResponseBody) {
      log('Response: ${_prettylogJson(err.response?.data)}\n');
    }
    handler.next(err);
  }

  String _getCurlCommand(RequestOptions options) {
    var command = ['curl -X ${options.method}'];

    // Add headers
    if (logRequestHeaders) {
      options.headers.forEach((k, v) {
        if (k != 'Cookie') {
          command.add('-H "$k: $v"');
        }
      });
    }

    // Add body
    if (logRequestBody && options.data != null) {
      var data = options.data;
      if (data is Map || data is List) {
        data = json.encode(data);
      }
      command.add('-d "${data.toString().replaceAll('"', '\\"')}"');
    }

    // Add URL
    command.add('"${options.uri.toString()}"');

    return command.join(' ');
  }

  String _prettylogJson(dynamic json) {
    if (json == null) return 'null';
    if (json is Map || json is List) {
      const encoder = JsonEncoder.withIndent('  ');
      return encoder.convert(json);
    }
    return json.toString();
  }
}