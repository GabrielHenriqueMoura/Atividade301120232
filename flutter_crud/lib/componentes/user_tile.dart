import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/providers/users.dart';
import 'package:flutter_crud/views/user_form.dart';
import 'package:flutter_crud/views/user_list.dart';
import 'package:provider/provider.dart';

import '../routes/app_routes.dart';

class UserTile extends StatelessWidget {
  User user;

  UserTile({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    CircleAvatar ca ;
    if(user.avatarURL.isEmpty){
      ca = CircleAvatar(child: Icon(Icons.person));
    }else{
      ca = CircleAvatar(backgroundImage: NetworkImage(user.avatarURL));
    }
     
    return ListTile(
      leading: ca,
      title: Text(user.nome),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(children: [
          IconButton(
            onPressed: () {
            Navigator.of(context).pushNamed(
              AppRoutes.USER_FORM,
              arguments: user,
              );
            },
            icon: Icon(Icons.edit),
            color: Color.fromARGB(115, 255, 81, 0),
          ),
          IconButton(
            onPressed: () {
        
              Provider.of<Users>(context, listen: false).remove(user);
            },
            icon: Icon(Icons.delete),
            color: Color.fromARGB(255, 5, 35, 75),
          ),
        ]),
      ),
    );
  }
}
