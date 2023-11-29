import 'package:api/Models/usermodel.dart';
import 'package:api/repo/users_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final UsersRepo usersRepo;
  UsersCubit(this.usersRepo) : super(UsersLoadingState());

  onLoadProduct() async {
    try {
      emit(UsersLoadingState());

      //get api
      var data = await usersRepo.getUsers();
      emit(UsersLoadedState(userModel: data));
    } catch (e) {
      emit(UsersErrorState(e.toString()));
    }
  }

  void add() {}
}
