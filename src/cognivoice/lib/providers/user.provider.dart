import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = Provider<User>((ref) {
  return User(email: '', password: '');
});

class User {
  String email;
  String password;
  String selectedMode = '';

  User({required this.email, required this.password, this.selectedMode = ''});
}
