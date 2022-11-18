import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_search_app/blocs/bloc_repository/repository_bloc.dart';
import 'package:flutter_search_app/model/repositories_model.dart';
import 'package:flutter_search_app/service/repositories/repositories_repo.dart';

class RepositoriesPage extends StatelessWidget {
  const RepositoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RepositoriesBloc(RepositoryProvider.of<RepoRepository>(context))
            ..add(LoadRepositoriesEvent()),
      child: BlocBuilder<RepositoriesBloc, RepositoriesState>(
        builder: (context, state) {
          if (state is RepositoriesLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is RepositoriesLoadedState) {
            List<RepositoriesModel> userList = state.users;
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
                          userList[index].name,
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userList[index].fullName,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
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
