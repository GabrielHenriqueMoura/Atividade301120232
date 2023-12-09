import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../providers/users.dart';

class UserForm extends StatelessWidget{
  
final _form = GlobalKey<FormState>();
final Map<String?, String?> _formData = {};
void loadFormData(User user){
  if(user != null){
 _formData['id'] = user.id;
  _formData['nome'] = user.nome;
  _formData['email'] = user.email;
  _formData['avatarURL'] = user.avatarURL;
  }
 

}

  @override
  Widget build(BuildContext context){
final user = ModalRoute.of(context)?.settings.arguments as User?;


if (user != null) {
  loadFormData(user);
}


return Scaffold(
  appBar: AppBar(title: Text('Formulário de usuário'),
  actions: <Widget>[
    IconButton(icon: Icon(Icons.save), onPressed: (){
      
      //final isValid = _form.currentState!.validate();
     // if(isValid){
 _form.currentState?.save();
 Provider.of<Users>(context, listen: false).put(User(
   id: _formData['id'] ?? '',
  nome: _formData['nome'] ?? '',
  email: _formData['email'] ?? '',
  avatarURL: _formData['avatarURL'] ?? '',
 ),
 ); // User 
 
      Navigator.of(context).pop();
      }
     
    //},
     ),
  ],
  ),
  body: Padding(padding: EdgeInsets.all(15),
  child: Form(
    key: _form,
    child: Column(
children: <Widget>[
TextFormField(
  initialValue: _formData['nome'],
  decoration: InputDecoration(labelText: 'Nome'),
  validator: (value){
    return 'Ocorreu um erro';
  },
  onSaved:(value) => _formData['nome'] = value,

),
TextFormField(
    initialValue: _formData['email'],
  decoration: InputDecoration(labelText: 'Email'),
   validator: (value){
    return 'Ocorreu um erro';
  },
    onSaved:(value) => _formData['email'] = value,
),
TextFormField(
    initialValue: _formData['avatarURL'],
  decoration: InputDecoration(labelText: 'URL do avatar'),
   validator: (value){
    return 'Ocorreu um erro';
  },
    onSaved:(value) => _formData['avatarURL'] = value,
),
]
  ),
  )
  )
);
  }
}