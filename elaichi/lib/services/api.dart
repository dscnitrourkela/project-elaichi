import 'package:elaichi/datamodels/api_models.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

/// Defines the interface used by the API services.
@singleton
abstract class Api {
  ///
  @factoryMethod
  factory Api() {
    return Api();
  }

  /// Provides interface for login functionality.
  /// The parameters [username] and [password] must be non-null.
  Future<LoginResponse> login(
      {@required String username, @required String password});

  /// Provides interface for getting user details.
  /// The parameter [userId] must be non null.
  Future<User> getUser(String userId);
}
