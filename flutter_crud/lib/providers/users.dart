//user é a parte de usuários, enquanto users vai gerenciar esses usuarios
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_crud/data/dummy_users.dart';
import 'package:flutter_crud/models/user.dart';
class Users with ChangeNotifier{
       Map<String, User> _items = {...DUMMY_USERS};

       List<User> get all{
           return [..._items.values];
       }

       int get count{
           return _items.length;
       }

       User byIndex(int indice){
return _items.values.elementAt(indice);
       }
       //trim remove os possiveis finais do começo e fim de um texto
      void put(User user){
  if(user.id != null && user.id!.trim().isNotEmpty && _items.containsKey(user.id)){
    //update:
    _items.update(user.id!, (_) => User(id: user.id, nome: user.nome, email: user.email,  avatarURL: user.avatarURL));
  } else {
    //insert
    final id = Random().nextDouble().toString();
    _items.putIfAbsent(id, () => User(id: id, nome: user.nome, email: user.email, avatarURL: user.avatarURL));
  }
  notifyListeners();

       }
       void remove(User user){
  if(user != null && user.id != null && _items.containsKey(user.id)){
    _items.remove(user.id);
    notifyListeners();
  }
}
}