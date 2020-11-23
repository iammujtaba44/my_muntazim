import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

CustomToast({String text, ToastGravity gravity, Toast len, Color bgcolor}) {
  return Fluttertoast.showToast(
      msg: text,
      toastLength: len == null ? Toast.LENGTH_LONG : len,
      gravity: gravity == null ? ToastGravity.CENTER : gravity,
      backgroundColor: bgcolor == null ? Color(0xFFE6798A) : bgcolor);
}
