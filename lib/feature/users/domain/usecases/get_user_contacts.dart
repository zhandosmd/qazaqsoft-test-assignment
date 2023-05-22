import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/user_model.dart';
import '../repositories/users_repositories.dart';

class GetUserContacts implements UseCase<List<User>, NoParams>{
  final UsersRepository repository;

  GetUserContacts(this.repository);

  @override
  Future<Either<Failure, List<User>>> call(NoParams params) async {
    return await repository.getUserContacts();
  }
}