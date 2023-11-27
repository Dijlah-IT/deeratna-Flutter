import 'package:deeratna/Constants/constants.dart';
import 'package:flutter/material.dart';

class MessagePosts {
  final String? message;
  final String? token;

  MessagePosts({
    this.message,
    this.token,
  });
  factory MessagePosts.fromJson(Map<String, dynamic> json) {
    debugPrint(json['message']);
    Constants.message = json['message'];
    return MessagePosts(
      message: json['message'],
    );
  }
}

class UserInformations {
  final int? id;
  final String? userName;
  final String? profilePhotoUrl;

  UserInformations({
    this.id,
    this.userName,
    this.profilePhotoUrl,
  });
  factory UserInformations.fromJson(Map<String, dynamic> json) {
    ConstUserInformations.id = json['id'];
    ConstUserInformations.name = json['name'];
    ConstUserInformations.photoURL = json['profile_photo_url'];

    debugPrint("${ConstUserInformations.id}<-----");
    debugPrint("${ConstUserInformations.name}<-----");
    debugPrint("${ConstUserInformations.photoURL}<-----");
    return UserInformations(
      id: json['id'],
      userName: json['name'],
      profilePhotoUrl: json['profile_photo_url'],
    );
  }
}
