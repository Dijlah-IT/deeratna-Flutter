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
