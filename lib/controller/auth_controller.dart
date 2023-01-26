// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:rackathon/common/exception.dart';
import 'package:rackathon/common/ui.dart';
import 'package:rackathon/service/firebase_service.dart';
import 'package:rackathon/view/root/root.dart';

class AuthController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseService firebaseService = FirebaseService();

  GlobalKey<FormState> get formKey => _formKey;

  String? validate(String? value) {
    if (value!.isEmpty) {
      return "This field is required";
    } else {
      return null;
    }
  }

  void loginOnPressed(
      BuildContext context, String userId, String password) async {
    if (userId.isEmpty) {
      UI.showToast(context, errorText: "User Id is required");
    } else if (password.isEmpty) {
      UI.showToast(context, errorText: "Password is required");
    } else {
      try {
        FocusScope.of(context).unfocus();
        UI.showLoader(context);
        bool authenticateuser = await firebaseService.authenticateUser(
          userId,
          password,
        );
        UI.hideLoader();
        if (authenticateuser) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const RootView()));
        }
        
      } on AuthException catch (e) {
        UI.hideLoader();
        UI.showToast(context, errorText: e.message);
      }
    }
  }

  void resetOnPressed(
      BuildContext context, String userId, String password) async {
    if (userId.isEmpty) {
      UI.showToast(context, errorText: "User Id is required");
    } else if (password.isEmpty) {
      UI.showToast(context, errorText: "Password is required");
    } else {
      try {
        FocusScope.of(context).unfocus();
        UI.showLoader(context);
        bool authenticateuser = await firebaseService.resetPassword(
          userId,
          password,
        );
        if (authenticateuser) {
          UI.showToast(context,
              errorText: "Your password has been successfully reset");
          Navigator.of(context).pop();
        }
        UI.hideLoader();
      } on AuthException catch (e) {
        UI.hideLoader();
        UI.showToast(context, errorText: e.message);
      }
    }
  }
}
