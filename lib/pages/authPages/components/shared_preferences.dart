import 'package:gawla/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
class UserPreferences {

  Future<bool> saveUser(DataModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('id',user.id);
    prefs.setString('first_name',user.firstName);
    prefs.setString('last_name',user.lastName);
    prefs.setString('birth',user.birthDate);
    prefs.setString('gender',user.gender);
    prefs.setString('phone',user.phone);
    prefs.setString('email',user.email);
    prefs.setString('password',user.password);
    prefs.setString('job',user.userRole);
    prefs.setString('address',user.address);

    return prefs.commit();

  }

  Future<DataModel> getUser ()  async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int id = prefs.getInt("id");
    String? firstName = prefs.getString("first_name");
    String? lastName = prefs.getString("last_name");
    String? birthDate = prefs.getString("firstName");
    String? gender = prefs.getString("firstName");
    String? language = prefs.getString("firstName");

    String? email = prefs.getString("email");
    String? phone = prefs.getString("phone");
    String? password = prefs.getString("password");
    String? userRole = prefs.getString("userRole");
    //String? likedtours = prefs.getString("likedtours");
    String? address = prefs.getString("address");

    return DataModel(
        id: id,
        firstName: firstName,
        lastName: lastName,
        birthDate: birthDate,
        gender: gender,
        language: language,
        phone: phone,
        email: email,
        password: password,
        userRole: userRole,
        //likedtours: likedtours,
        address: address

    );

  }

  void removeUser() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('id');
    prefs.remove('first_name');
    prefs.remove('last_name');
    prefs.remove('birth');
    prefs.remove('gender');
    prefs.remove('phone');
    prefs.remove('email');
    prefs.remove('password');
    prefs.remove('job');
    prefs.remove('address');

  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    return token;
  }

}

 */