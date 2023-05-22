import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/user_model.dart';

// contract between data and domain repositories.

abstract class UsersRepository extends Equatable{
  Future<Either<Failure, List<User>>> getUserContacts();
}