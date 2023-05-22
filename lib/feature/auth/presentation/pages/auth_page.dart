import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../widgets/auth_background_widget.dart';
import '../widgets/auth_controller_widget.dart';
class AuthPage extends StatelessWidget {

  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      children: [
        const AuthBackgroundWidget(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KeyboardVisibilityBuilder(
                builder: (context, isKeyboardVisible) {
                  return isKeyboardVisible
                    ? const SizedBox.shrink()
                    : const Text('Вход', style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Colors.white),);
                }
              ),
              // if(WidgetsBinding.instance.window.viewInsets.bottom == 0)
              //   const Text('Вход', style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Colors.white),),
              const SizedBox(height: 40,),
              const AuthControllerWidget()
            ],
          ),
        ),
      ],
    ),
    );
  }
}


