import 'services/api.dart';

/*
All service are pointed here  to get access to the api
This creates an instance of Api and provides to children classes
*/
class BaseApi {
  Api api = Api();
}
