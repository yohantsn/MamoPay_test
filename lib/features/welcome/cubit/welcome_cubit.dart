import 'package:bloc/bloc.dart';
import 'package:mamopay_test/features/welcome/cubit/welcome_state.dart';
import 'package:mamopay_test/repository/repository.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit({required AuthContract authContract})
      : _authContract = authContract,
        super(WelcomeInitialState()) {
    signIn();
  }

  final AuthContract _authContract;

  void signIn() async {
    await _authContract.signInAnonymously();
    emit(WelcomeSignInSuccesstate());
  }
}
