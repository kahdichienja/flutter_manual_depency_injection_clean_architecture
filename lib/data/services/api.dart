import 'package:dio/dio.dart';

import '../rest_client.dart';
import 'config/api_path_strings.dart';

class Api {
////Internal constructor of the Api Class
  static final _api = Api._internal();
  factory Api() {
    return _api;
  }
  Api._internal();
////Getting The instance of the Rest Api client
  Dio _dioClient = RestClient().dio;

  ///Accesssing the api cache options
  ///use this if u need to cache the data
  Options _cacheOptions = RestClient().cacheOptions;

  ///This fucnctions points perfomrs a [GET] request to the Api
  ///It takes a [path]
  ///The [Path] points to  a specific end point in the [Api]

  ///It return a [Response]
  Future<Response> getData({required String path}) async {
    print('[Api Main Get] $baseUrl$path');
    var data = await _dioClient.get('$baseUrl$path', options: _cacheOptions);
    // print(data);
    return data;
  }

  ///This fucnctions points perfomrs a [PATCH] request to the Api
  ///It takes a [path] ,and [data] passed from [API Services]
  ///The [Path] points to  a specific end point in the [Api]

  ///It return a [Response]
  Future<Response> postData({required String path,required Map<String, dynamic> data}) async {
    // print('[Api Main Post] Data  : $baseUrl$path');
    var rdata = await _dioClient.post('$baseUrl$path', data: data);
    return rdata;
  }

  ///This fucnctions points perfomrs a [PATCH] request to the Api
  ///It takes a [path] ,and [data] passed from [API Services]
  ///The [Path] points to  a specific end point in the [Api]

  ///It return a [Response]
  Future<Response> updateData({required String path, required Map<String, dynamic>  data}) async {
    print('[Api Main Update] Data :$data : $baseUrl$path');
    var rdata = await _dioClient.patch('$baseUrl$path', data: data);
    return rdata;
  }
  ///This fucnctions points perfomrs a [DELETE] request to the Api
  ///It takes a [path] ,and [Optional data] passed from [API Services]
  ///The [Path] points to  a specific end point in the [Api]

  ///It return a [Response]
  Future<Response> deleteData({required String path, Map<String, dynamic>?  data}) async {
    print('[Api Main Update] Data :$data : $baseUrl$path');
    var rdata = await _dioClient.delete('$baseUrl$path', data: data);
    return rdata;
  }
}
