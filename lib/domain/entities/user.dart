import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String email;
  final String userName;

  const User(
      {@required this.uid, @required this.email, @required this.userName})
      : assert(uid != null),
        assert(email != null),
        assert(userName != null);

  @override
  List<Object> get props => [uid, email, userName];
}
