import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gawla/components/validator.dart';
import 'package:gawla/constants.dart';
import 'package:gawla/pages/authPages/components/textField.dart';
import 'package:provider/provider.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);


  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);
  final formKey = GlobalKey<FormState>();
  String? _username , _password, _confirmPassword;

  @override
  Widget build(BuildContext context) {
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
                  prefixIcon:Icon(Icons.work_outlined),// 3ashan attribute el prefix elli 3amalnah fo2 yesama3
                  hintText: "Job",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none
                  )
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              autofocus: false,
              //obscureText: true,
              //validator: (value)=>value!.isEmpty?'Please enter password':null,
              // onSaved: (value) => _password = value,
              decoration: InputDecoration(
                  prefixIcon:Icon(Icons.airplanemode_active),// 3ashan attribute el prefix elli 3amalnah fo2 yesama3
                  hintText: "Country",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none
                  )
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(

              //validator: validateEmail,
              //onSaved: (value) => _username = value,
              decoration: InputDecoration(
                  prefixIcon:Icon(Icons.approval),// 3ashan attribute el prefix elli 3amalnah fo2 yesama3
                  hintText: "Address",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none
                  )
              ),
            ),
            SizedBox(height: 20,),

            TextFormField(

              //validator: validateEmail,
              //onSaved: (value) => _username = value,
              decoration: InputDecoration(
                  prefixIcon:Icon(Icons.ad_units),// 3ashan attribute el prefix elli 3amalnah fo2 yesama3
                  hintText: "Phone Number",
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
