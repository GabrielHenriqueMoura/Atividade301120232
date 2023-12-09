import 'package:flutter/material.dart';
import 'package:flutter_crud/providers/users.dart';
import 'package:flutter_crud/views/user_form.dart';
import 'package:flutter_crud/views/user_list.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:provider/provider.dart';

import 'routes/app_routes.dart';

void main() {
  runApp(const MinhaAplicacao());
}

class MinhaAplicacao extends StatelessWidget {
  const MinhaAplicacao({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Users(),
      //
      child: MaterialApp(
      title: "flutter CRUD",
      home: UserList(),
routes:{
  AppRoutes.USER_FORM:(_) =>UserForm(),
  // AppRoutes.HOME:(_) =>UserList()
},
     // debugShowCheckedModeBanner: false,
    ), //materialApp
    );//ChangeNotifierProvider
  }
}
//atalho st para escolher uma

//StatelessWidget
// - Estado estatico, ou seja, sem interação

//stateFulWigdget
// - Estado dinamico, ou seja, vai ter funcionalidades e metodos que modificam elementos