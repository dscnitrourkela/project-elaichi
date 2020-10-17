import 'package:elaichi/datamodels/api_models.dart';
import 'package:flutter/foundation.dart';

/// Defines the interface used by the API services.
abstract class Api {
  ///
  // @factoryMethod
  // @singleton
  // factory Api() {
  // return Api();
  // }

  /// Provides interface for login functionality.
  /// The parameters [username] and [password] must be non-null.
  Future<LoginResponse> login(
      {@required String username, @required String password});

  /// Provides interface for getting user details.
  /// The parameter [userId] must be non null.
  Future<String> getUser(String userId);
}
