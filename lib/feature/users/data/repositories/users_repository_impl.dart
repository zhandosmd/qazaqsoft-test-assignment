import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/users_repositories.dart';
import '../datasources/users_remote_data_source.dart';
import '../models/user_model.dart';

class UsersRepositoryImpl implements UsersRepository{
  final UsersRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  UsersRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;

  @override
  Future<Either<Failure, List<User>>> getUserContacts() async{
    if(await networkInfo.isConnected){
      try{
        final remoteTrivia = await remoteDataSource.getUserContacts();
        return Right(remoteTrivia);
      } on ServerException{
        return Left(ServerFailure());
      }
    }else{
      return Left(ServerFailure());
    }
  }
}