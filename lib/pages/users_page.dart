import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_search_app/service/users/users_repo.dart';

import '../blocs/bloc_user/users_bloc.dart';
import '../model/users_model.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UsersBloc(RepositoryProvider.of<UserRepository>(context))
            ..add(LoadUserEvent()),
      child: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if (state is UsersLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is UsersLoadedState) {
            List<UsersModel> userList = state.users;
            return Expanded(
              child: ListView.builder(
                itemCount: userList.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      color: Colors.lightBlueAccent,
                      elevation: 4,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(
                          userList[index].login,
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userList[index].nodeId,
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              userList[index].score.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        trailing: CircleAvatar(
                          backgroundImage:
                              NetworkImage(userList[index].avatarUrl),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
