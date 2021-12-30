import 'package:flutter/foundation.dart';

class ApiBaseProvider with ChangeNotifier {
  ///This is the [MAIN STATE PROVIDER] for the [API]

  bool _busy = false;

  /// any api error (Rarely user) /handled by [ApiResponse]
  @Deprecated('Any api error (Rarely used) /handled by [ApiResponse]')
  String? _apiError;

  bool get busy => _busy;
  String get getApiErrors => _apiError!;

  ///[Method]sets api error
  setError(error) {
    _apiError = error;
    _busy = false;
    notifyListeners();
  }

  ///[Method]sets api state to busy

  setBusy(bool val) {
    _busy = val;
    notifyListeners();
  }
}
