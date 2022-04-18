import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:slbfe_client/data/models/complaint.dart';
import 'package:slbfe_client/data/repositories/repository.dart';

import '../../../data/shared/shared_service.dart';

part 'complaints_state.dart';

class ComplaintsCubit extends Cubit<ComplaintsState> {
  ComplaintsCubit() : super(ComplaintsInitial());

  Future getComplaints() async {
    try {
      emit(ComplaintsLoading());
      final String uid = await SharedServices.getUid();
      List<Complaint> complaints = await Repository.getComplaints(uid: uid);
      emit(ComplaintsLoaded(complaints: complaints));
    } catch (e) {
      emit(ComplaintsFailed(errorMsg: e.toString()));
    }
  }
}
