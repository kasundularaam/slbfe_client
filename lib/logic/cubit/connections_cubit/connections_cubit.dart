import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:slbfe_client/data/models/connection_user.dart';

part 'connections_state.dart';

class ConnectionsCubit extends Cubit<ConnectionsState> {
  ConnectionsCubit() : super(ConnectionsInitial());

  List<ConnectionUser> allUsers = [];
  List<String> connections = [];

  Future<void> loadUsers() async {
    try {
      if (allUsers.isNotEmpty) {
        emit(ConnectionsLoaded(connectionUsers: allUsers));
      }
      emit(ConnectionsLoading());
    } catch (e) {
      emit(ConnectionsFailed(errorMsg: e.toString()));
    }
  }
}
