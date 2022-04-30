import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gawla/components/validator.dart';
import 'package:gawla/constants.dart';
import 'package:gawla/pages/authPages/components/textField.dart';
import 'package:provider/provider.dart';


class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);


  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);
  final formKey = GlobalKey<FormState>();
  String? _username , _password, _confirmPassword;

  @override
  Widget build(BuildContext context) {
    /*


    AuthProvider auth = Provider.of<AuthProvider>(context);

    var loading  = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text(" Registering ... Please wait")
      ],
    );

    var doRegister = (){
      print('on doRegister');

      final form = formKey.currentState;
      if(form!.validate()){

        form.save();

        auth.loggedInStatus = Status.Authenticating;
        auth.notify();

        Future.delayed(loginTime).then((_) {
          Navigator.pushReplacementNamed(context, '/login');
          auth.loggedInStatus = Status.LoggedIn;
          auth.notify();
        });


      }else{
        print("invalid form");
        /*Flushbar(
          title: 'Invalid form',
          message: 'Please complete the form properly',
          duration: Duration(seconds: 10),
        ).show(context);*/
      }

    };

    */
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: 20,),
            TextFormField(

              //validator: validateEmail,
              //onSaved: (value) => _username = value,
              decoration: InputDecoration(
                  prefixIcon:Icon(Icons.email),// 3ashan attribute el prefix elli 3amalnah fo2 yesama3
                  hintText: "E-mail",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none
                  )
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              autofocus: false,
              obscureText: true,
              //validator: (value)=>value!.isEmpty?'Please enter password':null,
             // onSaved: (value) => _password = value,
              decoration: InputDecoration(
                  prefixIcon:Icon(Icons.lock),// 3ashan attribute el prefix elli 3amalnah fo2 yesama3
                  hintText: "Password",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none
                  )
              ),
            ),
            SizedBox(height: 20,),

            TextFormField(
              autofocus: false,
              obscureText: true,
              //validator: (value)=>value!.isEmpty?'Your password is required':null,
              //onSaved: (value) => _confirmPassword = value,
              decoration: InputDecoration(
                  prefixIcon:Icon(Icons.lock),// 3ashan attribute el prefix elli 3amalnah fo2 yesama3
                  hintText: "Confirm Password",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none
                  )
              ),
            ),

            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 20,),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Next',
                  ),
                  style: TextButton.styleFrom(
                      primary: kPrimaryColor,
                      backgroundColor: kPrimaryLightColor,
                      textStyle:
                      const TextStyle(fontSize: 18,)),
                ),
                SizedBox(width: 50,),


              ],
            ),
            SizedBox(height: 20,),
            //auth.loggedInStatus == Status.Authenticating ?loading : Container()

          ],

        ),
      ),

    );
  }
}
