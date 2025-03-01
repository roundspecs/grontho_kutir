import 'package:flutter/material.dart';

import '../ui/core/themes/colors.dart';

extension ShowSnackBar on BuildContext {
  void showSnackBar({
    required String message,
    required bool isError,
  }) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: isError ? AppColors.error : AppColors.success,
          behavior: SnackBarBehavior.floating,
          showCloseIcon: true,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(this).size.height - 75,
            left: 10,
            right: 10,
          ),
        ),
      );
  }
}
