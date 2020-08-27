// ignore_for_file: public_member_api_docs

import 'dart:convert';
import 'dart:io';

import 'package:elaichi/app/failure.dart';
import 'package:elaichi/app/locator.dart';
// import 'package:elaichi/datamodels/api_models.dart';
import 'package:elaichi/datamodels/user.dart';
import 'package:elaichi/services/api.dart';

class FeedService {
  final Api _apiClient = locator<Api>();

  Future<User> getUser() async {
    try {
      final user = await _apiClient.getUser("test");
      return User.fromMap(json.decode(user));
    } on SocketException {
      throw Failure(0, 'No Internet Connection');
    } on HttpException {
      throw Failure(1, 'Could not find user');
    } on FormatException {
      throw Failure(2, 'Bad Response Format');
    }
  }
}
