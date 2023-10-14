import 'package:authenticate/models/auth_register_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

sealed class AuthService {
  Future<User?> userRegister({required AuthRegisterModel authModel});
  Future<User?> signinUser({required AuthRegisterModel authRegisterModel});
  FirebaseAuth getFirebaseAuth() => FirebaseAuth.instance;
}

class UserRegisterService extends AuthService {
  static UserRegisterService? userRegisterService;
  UserRegisterService._internal();
  factory UserRegisterService() {
    return userRegisterService ??= UserRegisterService._internal();
  }
  @override
  Future<User?> userRegister({required AuthRegisterModel authModel}) async {
    UserCredential userCredential = await getFirebaseAuth()
        .createUserWithEmailAndPassword(
            email: authModel.email, password: authModel.password);
    return userCredential.user;
  }

  @override
  Future<User?> signinUser(
      {required AuthRegisterModel authRegisterModel}) async {
    UserCredential userCredential = await getFirebaseAuth()
        .signInWithEmailAndPassword(
            email: authRegisterModel.email,
            password: authRegisterModel.password);
    return userCredential.user;
  }
}
