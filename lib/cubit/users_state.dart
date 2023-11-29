part of 'users_cubit.dart';

sealed class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

final class UsersInitial extends UsersState {}

class UsersLoadingState extends UsersState{}

class UsersLoadedState extends UsersState{
  final List<UserModel> userModel;

  const UsersLoadedState({ required this.userModel});

    @override
  List<Object> get props => [userModel];
}

class UsersErrorState extends UsersState{

  final String errorMessage;

  const UsersErrorState(this.errorMessage);

}
