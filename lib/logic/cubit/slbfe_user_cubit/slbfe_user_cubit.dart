import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/slbfe_user.dart';
import '../../../data/repositories/repository.dart';
import '../../../data/shared/shared_service.dart';

part 'slbfe_user_state.dart';

class SlbfeUserCubit extends Cubit<SlbfeUserState> {
  SlbfeUserCubit() : super(SlbfeUserInitial());

  Future getUser() async {
    try {
      emit(SlbfeUserLoading());
      final String nic = await SharedServices.getNic();
      SlbfeUser user = await Repository.getSlbfeUser(nic: nic);
      emit(SlbfeUserLoaded(user: user));
    } catch (e) {
      emit(SlbfeUserFailed(errorMsg: e.toString()));
    }
  }
}
