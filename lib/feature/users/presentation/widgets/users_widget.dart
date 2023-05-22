import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../data/models/user_model.dart';
import '../bloc/users_bloc.dart';
import '../bloc/users_event.dart';

class UsersDisplay extends StatelessWidget {
  final ScrollController scrollController;
  final bool showAppBar;
  final List<User> users;
  const UsersDisplay({
    required this.showAppBar,
    required this.scrollController,
    required this.users,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(!showAppBar) const Padding(
          padding: EdgeInsets.only(top: 16, bottom: 24),
          child: Text('Пользователи', style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.w700
          ),),
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<UsersBloc>(context).add(GetUserContactsEvent());
            },
            child: ListView.separated(
              controller: scrollController,
              itemBuilder: (BuildContext context, int index) {
                final currentUser = users[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/ic_user.svg'),
                      const SizedBox(width: 21,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(currentUser.name ?? '', style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700
                          ),),
                          Text(currentUser.email ?? '', style: const TextStyle(
                              fontSize: 13, color: AppColors.gray
                          ),),
                          Text(currentUser.company?.name ?? '', style: const TextStyle(
                            fontSize: 13,
                          ),),
                        ],
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index)
              => const SizedBox(height: 10,),
              itemCount: users.length,
            ),
          ),
        )
      ],
    );
  }
}
