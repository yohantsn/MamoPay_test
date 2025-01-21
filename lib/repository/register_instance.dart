import 'package:iod/iod.dart';
import 'package:mamopay_test/repository/api/api_service.dart';
import 'package:mamopay_test/repository/auth/auth_contract.dart';
import 'package:mamopay_test/repository/auth/auth_service.dart';
import 'package:mamopay_test/repository/repository.dart';

class Register {
  static init() {
    IoD.register<AuthContract>(AuthService());
    IoD.register<ApiContract>(ApiService(
      authContract: IoD.read<AuthContract>(),
    ));
  }

  static T instance<T>() {
    return IoD.read<T>();
  }
}
