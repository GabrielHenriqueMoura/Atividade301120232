import 'package:flutter/material.dart';
import 'package:flutter_crud/componentes/user_tile.dart';
import 'package:flutter_crud/data/dummy_users.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/providers/users.dart';
import 'package:provider/provider.dart';

import '../routes/app_routes.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});
// ctrl + . é responsável por dar opções de soluções de problemas
  @override
  Widget build(BuildContext context) {
    //map é responsavel por cadastrar os usuários em uma ordem determinada por quem o escrever, como criar uma com letras que possuem seus próprios valores
   // Map<String, User> users = {...DUMMY_USERS}; 
   //capturando dados do dummy_users
   //const users = {DUMMY_USERS};
   Users users = Provider.of(context);


//provider é uma classe que gerencia o acesso de dados com as classes, funcionando como um dao, porém com funcionalidades extras.
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Usuários"),
        actions: [IconButton(onPressed: () {
         Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
         ///  users.put(user);
        }, icon: Icon(Icons.add)),],
       
      ),
      body: ListView.builder(
        itemBuilder: (context, i) {
    //      return UserTile(user: users.values.elementAt(i));
       return UserTile(user: users.byIndex(i));
          ;
        },
        itemCount: users.count,
      ),
    );
  }
}
