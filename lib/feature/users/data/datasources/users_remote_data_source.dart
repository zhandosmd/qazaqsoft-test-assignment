import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qazaqsoft_test_assignment/feature/users/data/models/user_model.dart';

import '../../../../core/error/exception.dart';

abstract class UsersRemoteDataSource {
  /// Calls the https://jsonplaceholder.typicode.com/users endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<User>> getUserContacts();
}

class UsersRemoteDataSourceImpl implements UsersRemoteDataSource {
  final http.Client client;

  UsersRemoteDataSourceImpl({required this.client});

  @override
  Future<List<User>> getUserContacts() async {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return List<User>.from(json.decode(response.body).map((x) => User.fromJson(x)));
    } else {
      throw ServerException();
    }
  }
}
