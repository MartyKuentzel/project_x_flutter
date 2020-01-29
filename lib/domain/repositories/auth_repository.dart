import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signUp(
      String userName, String email, String password);
  void signOut();
  Future<Either<Failure, User>> signIn(String email, String password);
}
