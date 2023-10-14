// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AuthRegisterModel {
  String email;
  String password;
  AuthRegisterModel({
    required this.email,
    required this.password,
  });

  AuthRegisterModel copyWith({
    String? email,
    String? password,
  }) {
    return AuthRegisterModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory AuthRegisterModel.fromMap(Map<String, dynamic> map) {
    return AuthRegisterModel(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthRegisterModel.fromJson(String source) =>
      AuthRegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AuthModel(email: $email, password: $password)';

  @override
  bool operator ==(covariant AuthRegisterModel other) {
    if (identical(this, other)) return true;

    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
