import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../users/presentation/pages/users_page.dart';

class AuthControllerWidget extends StatefulWidget {
  const AuthControllerWidget({
    super.key,
  });

  @override
  State<AuthControllerWidget> createState() => _AuthControllerWidgetState();
}

class _AuthControllerWidgetState extends State<AuthControllerWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 48),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 10),
              color: Color.fromRGBO(2, 28, 96, 0.2),
              blurRadius: 20,
              spreadRadius: 0
          )
        ]
      ),
      child: Column(
        children: [
          TextField(
            controller: emailController,
            onChanged: (_) => setState(() {}),
            decoration: const InputDecoration(
              labelText: 'Email',
              focusColor: AppColors.mainColor,
            ),
          ),
          const SizedBox(height: 32,),
          TextField(
            controller: passwordController,
            onChanged: (_) => setState(() {}),
            decoration: const InputDecoration(
              labelText: 'Пароль',
              focusColor: AppColors.mainColor,
            ),
            obscureText: true,
            obscuringCharacter: '●',
          ),
          const SizedBox(height: 56,),
          SizedBox(
            height: 38,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) ? (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const UsersPage();
                    }
                  )
                );
              } : null,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Text('Войти'),
            ),
          )
        ],
      ),
    );
  }
}
