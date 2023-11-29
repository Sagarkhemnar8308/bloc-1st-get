import 'package:api/cubit/users_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    context.read<UsersCubit>().onLoadProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UsersCubit, UsersState>(
        listener: (context, state) {
          if (state is UsersErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Center(child: Text("Data Failed to loaded"))));
          } else if (state is UsersLoadedState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Center(child: Text("Data Get Successfully !"))));
          }
        },
        builder: (context, state) {
          if (state is UsersLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UsersErrorState) {
            return const Text("Got a Error or a Internet Isssue");
          } else if (state is UsersLoadedState) {
            return ListView.builder(
                itemCount: state.userModel.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(state.userModel[index].id.toString()),
                    title: Text(state.userModel[index].name.toString()),
                    trailing: Text(state.userModel[index].phone.toString()),
                  );
                });
          }
          return const SizedBox();
        },
      ),
    );
  }
}
