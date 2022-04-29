
import 'package:flutter/cupertino.dart';
import 'package:gawla/models/user_model.dart';

class UserProvider extends ChangeNotifier{

  late DataModel _user ;

  DataModel get user => _user;

  void setUser (DataModel user){
    _user = user;
    notifyListeners();
  }
}