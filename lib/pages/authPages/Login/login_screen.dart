import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gawla/constants.dart';
import 'package:gawla/cubit/cubits.dart';
import 'package:gawla/pages/authPages/Signup/signup_screen.dart';
import 'package:gawla/pages/authPages/components/text_widget.dart';
import 'package:gawla/pages/navPages/home_page.dart';
import 'package:gawla/services/my_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController textController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  _showMsg(msg) { //
    final snackBar = SnackBar(
      backgroundColor: kPrimaryLightColor,
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _login() async {
    var data = {
      'email' : emailController.text,
      'password' : textController.text,
    };

    var res = await CallApi().getData('users');
    var body = json.decode(res.body);
    print(body);
    if(body['success']){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', body['token']);
      localStorage.setString('user', json.encode(body['user']));
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => HomePage()));
    }else{
      _showMsg(body['message']);
      BlocProvider.of<Cubits>(context).getData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [kPrimaryColor, Colors.white],
                      begin: Alignment.topCenter,
                      end:  Alignment.bottomCenter

                  )
              ),

              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "SIGN IN",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kPrimaryLightColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SvgPicture.asset(
                          "assets/Authentication/icons/login.svg",
                          height: 190,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            DraggableScrollableSheet(
                maxChildSize: 0.6,
                minChildSize: 0.6,
                initialChildSize: 0.6,
                builder:(ctx,controller) {
                  return SingleChildScrollView(
                    child: Container(
                      height: 520,//dummyyyyyyyyyy and ineffective
                      padding: EdgeInsets.symmetric(horizontal: 18,vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Column(
                        children: [

                          SizedBox(height:20),
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
                          SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //TextWidget(text:"Sign in", fontSize:22, isUnderLine:false),
                              Spacer(),
                              GestureDetector(
                                  onTap: (){
                                    BlocProvider.of<Cubits>(context).getData();

                                    //_login();
                                  },
                                  child:
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      shape:BoxShape.circle,
                                      color:kPrimaryColor,
                                    ),
                                    child: Icon(Icons.arrow_forward, color:Colors.white, size:30),
                                  )
                              )
                            ],
                          ),
                          SizedBox(height:50),

                          Align(
                            alignment: Alignment.center,
                              child:TextButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=> const SignUpScreen())
                                  );
                                },
                                child: const Text(
                                  "Don't Have An Account?",
                                ),
                                style: TextButton.styleFrom(
                                    primary: kPrimaryColor,
                                    backgroundColor: kPrimaryLightColor,
                                    textStyle:
                                    const TextStyle(fontSize: 18,)),
                              ),

                          ),

                        ],

                      ),
                    ),
                  );

                }
            ),
          ]
      ),
    );
  }
}
class TextInput extends StatelessWidget {
  final String? textString;
  TextEditingController? textController;
  final String hint;
  bool obscureText;
  TextInput({Key? key, this.textString, this.textController, required this.hint, this.obscureText=false}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Color(0xFF000000)),
      cursorColor: Color(0xFF9b9b9b),
      controller: textController,
      keyboardType: TextInputType.text,
      obscureText: obscureText,
      decoration: InputDecoration(

        hintText: this.textString,
        hintStyle: TextStyle(
            color: Color(0xFF9b9b9b),
            fontSize: 15,
            fontWeight: FontWeight.normal),
      ),
    );
  }
}

