import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart' as toast;
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class UI {
  static BuildContext? _dialogcontext;

  static showLoader(BuildContext context) {
    showDialog<dynamic>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        _dialogcontext = context;
        return WillPopScope(
          onWillPop: () async => false,
          child: MediaQuery.removeViewInsets(
            removeLeft: true,
            removeTop: true,
            removeRight: true,
            removeBottom: true,
            context: context,
            child: Container(
              color: Colors.transparent,
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(
                  const Size.fromRadius(60),
                ),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                    strokeWidth: 6,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static void hideLoader() {
     final context = _dialogcontext;
    if (context == null) {
      return;
    }
    Navigator.of(context).pop();
    _dialogcontext = null;
  }

  static void showToast(BuildContext context, {String errorText = "",int seconds = 3}) {
    toast.showToast(
      errorText,
      duration:  Duration(seconds: seconds),
      backgroundColor: Colors.grey.shade900,
      context: context,
      isHideKeyboard: true,
      animation: StyledToastAnimation.fade,
      reverseAnimation: StyledToastAnimation.fadeScale
    );
  }
}
