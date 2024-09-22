import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastType {
  normal,
  error,
}

void showToast({
  required String msg,
  ToastType toastType = ToastType.normal,
}) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: switch (toastType) {
      ToastType.normal => const Color(0xFF004f52),
      ToastType.error => const Color(0xffc73724),
    },
    textColor: Colors.white,
  );
}
