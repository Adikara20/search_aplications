import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_search_app/blocs/bloc_issue/issue_bloc.dart';
import 'package:flutter_search_app/model/issues_model.dart';
import 'package:flutter_search_app/service/issues/issues_repo.dart';
import 'package:flutter_search_app/service/users/users_repo.dart';

class IssuesPage extends StatelessWidget {
  const IssuesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          IssuesBloc(RepositoryProvider.of<IssuesRepository>(context))
            ..add(LoadIssuesEvent()),
      child: BlocBuilder<IssuesBloc, IssuesState>(
        builder: (context, state) {
          if (state is IssuesLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is IssuesLoadedState) {
            List<IssuesModel> issuesList = state.issues;
            return Expanded(
              child: ListView.builder(
                itemCount: issuesList.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      color: Colors.lightBlueAccent,
                      elevation: 4,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(
                          issuesList[index].title,
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   issuesList[index].updatedAt.toString(),
                            //   style: TextStyle(color: Colors.white),
                            // ),
                            Text(
                              issuesList[index].state,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        // trailing: CircleAvatar(
                        //   backgroundImage:
                        //       NetworkImage(issuesList[index].),
                        // ),
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
