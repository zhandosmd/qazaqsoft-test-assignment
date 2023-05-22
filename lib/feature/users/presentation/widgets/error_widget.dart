import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../bloc/users_bloc.dart';
import '../bloc/users_event.dart';

class ErrorDisplayWidget extends StatelessWidget {
  const ErrorDisplayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/icons/ic_warning.svg'),
          const SizedBox(height: 32,),
          const Text('Не удалось загрузить информацию'),
          const SizedBox(height: 32,),
          SizedBox(
            height: 38,
            width: 230,
            child: ElevatedButton(
              onPressed: (){
                BlocProvider.of<UsersBloc>(context).add(GetUserContactsEvent());
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Text('Обновить'),
            ),
          )
        ],
      ),
    );
  }
}
