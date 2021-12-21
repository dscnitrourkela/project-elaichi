import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:elaichi/app/utils/strings.dart';
import 'package:elaichi/auth/domain/datamodel/user_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'feed_state.dart';
part 'feed_cubit.freezed.dart';

///Cubit for Feed State
class FeedCubit extends Cubit<FeedState> {
  /// Default Constructor for [FeedCubit]
  FeedCubit() : super(const FeedState.initial());

  ///TextEditing Controller for the roll number field in Webmail Login
  TextEditingController rollNoController = TextEditingController();

  ///TextEditing Controller for the password field in Webmail Login
  TextEditingController passwordController = TextEditingController();

  ///Form key for the Webmail Login Form
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  /// Check zimbra credential
  Future<String?> checkCredentials({String? token}) async {
    final connectivity = await Connectivity().checkConnectivity();

    if (connectivity != ConnectivityResult.none) {
      final remoteConfig = RemoteConfig.instance;
      final baseURL = remoteConfig.getString('zimbra_base_url');
    } else {
      return Future.delayed(
        const Duration(milliseconds: 10),
        () => Strings.noInternet,
      );
    }
  }

  /// Method to sign in the user as a NIT Rourkela Student
  Future<String?> setZimbraAuth(
    String rollNumber,
    String password,
  ) async {
    emit(const FeedState.mailunchecked());
    final prefs = await SharedPreferences.getInstance();
    final token = base64.encode(utf8.encode('$rollNumber:$password'));
    try {
      await prefs.setString('rollNumber', rollNumber);
      await prefs.setString('token', token);
      UserData.instance().rollNumber = rollNumber;
      UserData.instance().token = token;

      emit(const FeedState.success());
      return 'Login Successful';
    } catch (e) {
      emit(const FeedState.mailunchecked());
      return e.toString();
    }
  }

  ///Check whether the user has signedin through zimbra or not
  Future getMailId() async {
    emit(const FeedState.loading());
    try {
      if (UserData.instance().getRollNumber == null) {
        emit(const FeedState.mailunchecked());
      } else {
        emit(const FeedState.success());
      }
    } catch (e) {
      emit(FeedState.error(e.toString()));
    }
  }
}
