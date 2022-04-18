part of 'slbfe_user_cubit.dart';

@immutable
abstract class SlbfeUserState {}

class SlbfeUserInitial extends SlbfeUserState {}

class SlbfeUserLoading extends SlbfeUserState {}

class SlbfeUserLoaded extends SlbfeUserState {
  final SlbfeUser user;
  SlbfeUserLoaded({
    required this.user,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SlbfeUserLoaded && other.user == user;
  }

  @override
  int get hashCode => user.hashCode;

  @override
  String toString() => 'SlbfeUserLoaded(user: $user)';
}

class SlbfeUserFailed extends SlbfeUserState {
  final String errorMsg;
  SlbfeUserFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SlbfeUserFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'SlbfeUserFailed(errorMsg: $errorMsg)';
}
