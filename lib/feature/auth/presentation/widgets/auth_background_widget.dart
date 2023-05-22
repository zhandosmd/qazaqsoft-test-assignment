import 'package:flutter/material.dart';

class AuthBackgroundWidget extends StatelessWidget {
  const AuthBackgroundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/im_auth_background.png',
      height: MediaQuery.of(context).size.height * 0.6,
      fit: BoxFit.cover,
    );
  }
}