import 'package:cleanachitecture/data/models/freezed/test_api_freezed_model.dart';
import 'package:dio/dio.dart';

import '../services/api_test_service.dart';
import 'api_base_provider.dart';
import 'api_response.dart';

class ApiTests extends ApiBaseProvider {
  final ApiTestService apiTestService = ApiTestService();

  List<TestAPIUserModel> _testAPIUserModel = <TestAPIUserModel>[];
  TestAPIUserModel _testAPIuser = TestAPIUserModel();

  List<TestAPIUserModel> get testAPIUserModel => _testAPIUserModel;
  TestAPIUserModel get testAPIuser => _testAPIuser;

  /// This method [Send & Receives] data from [Test Service] passed from the [API]
  /// It takes an instance of [NewUser] as [data] required by the [API] to fetch data for specifc Test

  Future<ApiResponse> addNewUser(TestAPIUserModel data) async {
    ///The data recived  by function is [Mapped] for Dispatch
    Map<String, dynamic> postData = {
      "name": data.name,
      "username": data.username,
      "email": data.email,
      "address": {
        "street": data.address!.street,
        "suite": data.address!.suite,
        "city": data.address!.city,
        "zipcode": data.address!.zipcode,
        "geo": data.address!.geo!.toJson(),
      },
      "phone": data.phone,
      "website": data.website,
      "company": data.company!.toJson()
    };
    try {
      setBusy(true);

      ///[Response] from the [API]
      Response response = await apiTestService.addNewUser(postData);

      ///[PRINT]s [API] response for [DEBUG] purposes
      print('[API PROVIDER RESPONSE] ${response.data}');

      ///[Validation] if the fetch was a [SUCCESS]
      if (response.statusCode == 200) {
        setBusy(false);
        return ApiResponse(
            TestAPIUserModel.fromJson(response.data), false, [null]);

        ///Write data kwa firebase
      } else {
        setBusy(false);

        /// if there is an error in the response
        /// this is the data returned
        /// ///This will return an instance of [ApiResponse] containig [T(null),hasError(true),error message (List of the error messages) ]
        return ApiResponse(
            null, true, [TestAPIUserModel.fromJson(response.data).toJson()]);
      }
    } catch (e) {
      setBusy(false);
      print(getApiErrors);

      /// if there is an error in the [HTTP REQUEST]
      /// this is the data returned
      /// ///This will return an instance of [ApiResponse] containig [T(null),hasError(true),error message (List of the error messages) ]
      return ApiResponse(null, true, [getApiErrors]);
    }
  }

  /// This method [Send & Receives] data from [Test Service] passed from the [API]
  /// It takes an instance of [CompletedOrders] as [data] required by the [API] to fetch data for specifc Test
  Future<ApiResponse> updateUser(TestAPIUserModel data) async {
    ///The data recived  by function is [Mapped] for Dispatch
    Map<String, dynamic> patchData = data.toJson();

    try {
      setBusy(true);

      ///[Response] from the [API]
      Response response = await apiTestService.updateUser(patchData);

      ///[PRINT]s [API] response for [DEBUG] purposes
      print('[API PROVIDER RESPONSE] ${response.data}');

      ///[Validation] if the fetch was a [SUCCESS]
      if (response.statusCode == 200) {
        ///Return [DATA] of type [ApiResponse] which wraps [data,hasError,List of Errors]
        ///This will return an instance of [ApiResponse] containig [Instance of CompletedOrdersResponse,hasError(false),error message (null) ]
        return ApiResponse(
            TestAPIUserModel.fromJson(response.data), false, [null]);
      } else {
        setBusy(false);

        /// if there is an error in the response
        /// this is the data returned
        /// ///This will return an instance of [ApiResponse] containig [T(null),hasError(true),error message (List of the error messages) ]
        return ApiResponse(
            null, true, [TestAPIUserModel.fromJson(response.data)]);
      }
    } catch (e) {
      setBusy(false);

      /// if there is an error in the [HTTP REQUEST]
      /// this is the data returned
      /// ///This will return an instance of [ApiResponse] containig [T(null),hasError(true),error message (List of the error messages) ]
      return ApiResponse(null, true, [e.toString()]);
    }
  }

  /// This method [Send & Receives] data from [Test Service] passed from the [API]
  /// It takes an instance of [CancelledOrders] as [data] required by the [API] to fetch data for specifc Test
  Future<ApiResponse> deleteUser(TestAPIUserModel data) async {
    ///The data recived  by function is [Mapped] for Dispatch
    var patchData = data.toJson();
    try {
      setBusy(true);

      ///[Response] from the [API]
      Response response = await apiTestService.deleteUser(patchData);

      ///[PRINT]s [API] response for [DEBUG] purposes
      print('[API PROVIDER RESPONSE] ${response.data}');

      ///[Validation] if the fetch was a [SUCCESS]
      if (response.statusCode == 200) {
        ///Return [DATA] of type [ApiResponse] which wraps [data,hasError,List of Errors]
        ///This will return an instance of [ApiResponse] containig [Instance of CancelledOrdersResponce,hasError(false),error message (null) ]
        return ApiResponse(
            TestAPIUserModel.fromJson(response.data), false, [null]);
      } else {
        setBusy(false);

        /// if there is an error in the response
        /// this is the data returned
        /// ///This will return an instance of [ApiResponse] containig [T(null),hasError(true),error message (List of the error messages) ]
        return ApiResponse(
            null, true, [TestAPIUserModel.fromJson(response.data)]);
      }
    } catch (e) {
      setBusy(false);

      /// if there is an error in the [HTTP REQUEST]
      /// this is the data returned
      /// ///This will return an instance of [ApiResponse] containig [T(null),hasError(true),error message (List of the error messages) ]
      return ApiResponse(null, true, [e.toString()]);
    }
  }

  /// This method [Send & Receives] data from [Test Service] passed from the [API]
  /// It takes [TestId] required by the [API] to fetch data for specifc Test

  Future<ApiResponse> getAllUsers() async {
    try {
      setBusy(true);

      ///[Response] from the [API]
      Response response = await apiTestService.getUsers();

      ///[PRINT]s [API] response for [DEBUG] purposes
      print('[API PROVIDER RESPONSE] ${response.data}');

      ///[Validation] if the fetch was a [SUCCESS]
      if (response.statusCode == 200) {
        setBusy(false);

        ///Return [DATA] of type [ApiResponse] which wraps [data,hasError,List of Errors]
        ///This will return an instance of [ApiResponse] containig [Instance of TestStatusResponse,hasError(false),error message (null) ]


        response.data.forEach((users) => _testAPIUserModel.add(TestAPIUserModel.fromJson(users)));

        return ApiResponse(TestAPIUserModel.fromJson(response.data), false, [null]);
      } else {
        setBusy(false);

        /// if there is an error in the response
        /// this is the data returned
        /// ///This will return an instance of [ApiResponse] containig [T(null),hasError(true),error message (List of the error messages) ]
        return ApiResponse(
            null, true, [TestAPIUserModel.fromJson(response.data)]);
      }
    } catch (e) {
      setBusy(false);

      /// if there is an error in the [HTTP REQUEST]
      /// this is the data returned
      /// ///This will return an instance of [ApiResponse] containig [T(null),hasError(true),error message (List of the error messages) ]
      return ApiResponse(null, true, [e.toString()]);
    }
  }
}
