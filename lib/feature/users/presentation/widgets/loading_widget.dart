import 'package:flutter/material.dart';
import 'package:qazaqsoft_test_assignment/core/theme/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: AppColors.mainColor,
      ),
    );
  }
}