import 'dart:convert';

import 'package:deeratna/Api/message_posts.dart';
import 'package:deeratna/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

saveToken(String userToken) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString("userToken", userToken);
}

Future<MessagePosts> login(
    String phoneNumber, String password, String deviceName) async {
  final response = await http.post(
      Uri.https("deeratna.net", 'api/login', {
        'phone': phoneNumber,
        'password': password,
        'device_name': deviceName,
      }),
      headers: <String, String>{
        'X-Requested-With': 'XMLHttpRequest',
        'Content-Type': 'application/json; charset = UTF-8',
      });
  Constants.statusCode = response.statusCode;
  if (response.statusCode == 404 || response.statusCode == 422) {
    return MessagePosts.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 200) {
    return MessagePosts.fromJson(jsonDecode('{"message": " "}'));
  } else {
    throw Constants.message = "Erorr";
  }
}

Future<MessagePosts> registerPhone(String phoneNumber) async {
  final response = await http.post(
      Uri.https("deeratna.net", 'api/pre-activate', {'phone': phoneNumber}),
      headers: <String, String>{
        'X-Requested-With': 'XMLHttpRequest',
        'Content-Type': 'application/json; charset = UTF-8',
      });

  debugPrint(Constants.message);
  Constants.statusCode = response.statusCode;
  if (response.statusCode == 404 || response.statusCode == 422) {
    return MessagePosts.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 200) {
    Constants.userToken = response.body;
    return MessagePosts.fromJson(jsonDecode('{"message": " "}'));
  } else {
    throw Constants.message = "Erorr";
  }
}

register(String phoneNumber, String password, String passwordConfirmation,
    String deviceName) async {
  final response = await http.post(
      Uri.https("deeratna.net", 'api/activate', {
        'phone': phoneNumber,
        'password': password,
        'password_confirmation': passwordConfirmation,
        'device_name': deviceName,
      }),
      headers: <String, String>{
        'X-Requested-With': 'XMLHttpRequest',
        'Content-Type': 'application/json; charset = UTF-8',
      });
  Constants.statusCode = response.statusCode;
  if (response.statusCode == 404 || response.statusCode == 422) {
    return MessagePosts.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 200) {
    saveToken(response.body);
    Constants.userToken = response.body;
  } else {
    throw Constants.message = "Erorr";
  }
}

Future<UserInformations> getUserInformations(String token) async {
  final response = await http
      .get(Uri.https("deeratna.net", 'api/user'), headers: <String, String>{
    'X-Requested-With': 'XMLHttpRequest',
    'Authorization': 'Bearer $token',
    'Content-Type': 'application/json; charset = UTF-8',
  });

  debugPrint("getUserInformations");
  Constants.statusCode = response.statusCode;
  if (response.statusCode == 404 || response.statusCode == 422) {
    return UserInformations.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 200) {
    return UserInformations.fromJson(jsonDecode(response.body));
  } else {
    throw Constants.message = "Erorr";
  }
}
