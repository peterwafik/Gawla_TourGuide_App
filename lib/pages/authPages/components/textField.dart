import 'package:flutter/material.dart';

class TProgress extends StatelessWidget {
  TProgress({Key? key,required this.hintText,this.prefix,this.validator}) : super(key: key);

  String hintText;
  var prefix;
  FormFieldValidator? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.3),
      borderRadius: BorderRadius.circular(15)
      ),
      child: TextFormField(
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: prefix,// 3ashan attribute el prefix elli 3amalnah fo2 yesama3
          hintText: hintText,
            border: OutlineInputBorder(
            borderSide: BorderSide.none
          )
        ),
      ),
    );
  }
}
