import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_search_app/pages/issues_page.dart';
import 'package:flutter_search_app/pages/repositories_page.dart';
import 'package:flutter_search_app/pages/users_page.dart';
import 'package:flutter_search_app/service/issues/issues_repo.dart';
import 'package:flutter_search_app/service/repositories/repositories_repo.dart';
import 'package:flutter_search_app/service/users/users_repo.dart';
import 'package:flutter_search_app/widget/neumorphism_button.dart';
import 'package:flutter_search_app/widget/radio_button.dart';

class MyMainPage extends StatefulWidget {
  const MyMainPage({Key? key}) : super(key: key);

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  TextEditingController? _editingController;
  late int selectRadio = 1;

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController();
    //selectRadio = 0;
  }

  void setSelectedRadio(int val) {
    setState(() {
      selectRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 54,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.23),
                        )
                      ]),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _editingController,
                          textAlignVertical: TextAlignVertical.center,
                          onChanged: (_) => setState(() {}),
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.5)),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      _editingController!.text.trim().isEmpty
                          ? IconButton(
                              icon: Icon(Icons.search,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.5)),
                              onPressed: null)
                          : IconButton(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              icon: Icon(Icons.clear,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.5)),
                              onPressed: () => setState(() {
                                    _editingController!.clear();
                                  })),
                    ],
                  ),
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RadioButtonCustom(
                    val: 1,
                    groupVal: selectRadio,
                    text: 'User',
                    setValueRadio: setSelectedRadio,
                  ),
                  RadioButtonCustom(
                    val: 2,
                    groupVal: selectRadio,
                    text: 'Issues',
                    setValueRadio: setSelectedRadio,
                  ),
                  RadioButtonCustom(
                    val: 3,
                    groupVal: selectRadio,
                    text: 'Repositories',
                    setValueRadio: setSelectedRadio,
                  ),
                ],
              ),
              NeuButton(),
              SizedBox(
                height: 10,
              ),
              selectRadio == 1
                  ? RepositoryProvider(
                      create: (context) => UserRepository(),
                      child: UserPage(),
                    )
                  : selectRadio == 2
                      ? RepositoryProvider(
                          create: (context) => IssuesRepository(),
                          child: IssuesPage(),
                        )
                      : RepositoryProvider(
                          create: (context) => RepoRepository(),
                          child: RepositoriesPage(),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
