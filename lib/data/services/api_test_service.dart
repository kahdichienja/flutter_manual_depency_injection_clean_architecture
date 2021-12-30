import 'package:dio/dio.dart';

import '../base_api.dart';
import 'config/api_path_strings.dart';

/*
All Api services are registered here
The api providers point here to get access to the api class

*/
class ApiTestService extends BaseApi {

  ///It takes a [data] and pases the [data] and [path]
  ///The [Path] points to  a specific end point in the [Api]

  Future<Response> addNewUser(Map<String, dynamic> data) async => api.postData(path: users, data: data);


  ///It takes a [data] and pases the [data] and [path]
  ///The [Path] points to  a specific end point in the [Api]

  Future<Response> updateUser(Map<String, dynamic> data) async => api.updateData(path: users, data: data);


  ///It takes a [data] and pases the [data] and [path]
  ///The [Path] points to  a specific end point in the [Api]

  Future<Response> deleteUser(Map<String, dynamic> data) async => api.deleteData(path: users, data: data);


  ///it takes a [Path] which is made up of the url 

  Future<Response> getUsers() async => api.getData(path: '$users');

}
