import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qazaqsoft_test_assignment/feature/users/presentation/bloc/users_state.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/get_user_contacts.dart';
import 'package:qazaqsoft_test_assignment/feature/users/presentation/bloc/users_event.dart';

const String serverFailureMessage = 'Server Failure';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetUserContacts getConcreteNumberTrivia;

  UsersBloc({
    required this.getConcreteNumberTrivia,
  })  : super(Loading()) {
    on<GetUserContactsEvent>((GetUserContactsEvent event, Emitter<UsersState> emit) async {
      try {
        emit(Loading());
        final failureOrTrivia = await getConcreteNumberTrivia(NoParams());
        failureOrTrivia.fold(
          (failure) {
            emit(Error(message: _mapFailureToMessage(failure)));
          },
          (users) {
            emit(Loaded(users: users));
          },
        );
      } catch (e) {
        emit(const Error(message: 'Unexpected Error'));
      }
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      default:
        return 'Unexpected Error';
    }
  }
}
