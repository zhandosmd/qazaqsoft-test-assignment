import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qazaqsoft_test_assignment/feature/users/presentation/bloc/users_bloc.dart';
import 'package:qazaqsoft_test_assignment/feature/users/presentation/bloc/users_event.dart';
import 'package:qazaqsoft_test_assignment/feature/users/presentation/bloc/users_state.dart';

import '../../../../injection_container.dart';
import '../widgets/error_widget.dart';
import '../widgets/loading_widget.dart';
import '../widgets/users_widget.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final ScrollController scrollController = ScrollController();
  bool showAppBar = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() => setState(() => showAppBar = scrollController.position.pixels > 50));
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar ? AppBar(
        title: const Text('Пользователи'),
      ) : null,
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<UsersBloc>()..add(GetUserContactsEvent()),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<UsersBloc, UsersState>(
              builder: (context, state) {
                if (state is Loading) {
                  return const LoadingWidget();
                } else if (state is Loaded) {
                  return UsersDisplay(
                    users: state.users,
                    showAppBar: showAppBar,
                    scrollController: scrollController,
                  );
                } else if (state is Error) {
                  return const ErrorDisplayWidget();
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}
