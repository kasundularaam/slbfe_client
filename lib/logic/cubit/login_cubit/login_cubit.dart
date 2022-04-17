import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future login() async {
    try {
      emit(LoginLoading());
      await Future.delayed(Duration(seconds: 2));
    } catch (e) {
      emit(LoginFailed(errorMsg: e.toString()));
    }
  }
}
