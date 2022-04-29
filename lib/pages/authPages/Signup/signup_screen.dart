import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gawla/constants.dart';
import 'package:gawla/pages/authPages/components/page1.dart';
import 'package:gawla/pages/authPages/components/page3.dart';
import 'package:gawla/pages/authPages/components/progress.dart';
//import 'package:intl_phone_number_input/intl_phone_number_input.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int currentStep = 0;
  //int _value =1;

  late PFormController pformController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pformController = PFormController(3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.white,
        title: Text("Signup process",),
        centerTitle: true,
      ),*/
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
                        "SIGN UP",
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
                        "assets/Authentication/icons/signup.svg",
                        height: 190,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          DraggableScrollableSheet(
              maxChildSize: 0.9,
              minChildSize: 0.5,
              initialChildSize: 0.6,
              builder:(ctx,controller) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 18,vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)
              ),
              child: SingleChildScrollView(
                controller: controller,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PForm(
                      controller: pformController,
                        pages: [
                          //LoginScreen(),
                          Page1(),
                          Text("Page 2"),
                          CreditStep(),
                          //HomePage(),
                        ],
                        title: [
                          PTitle(title: "Personal Info"),
                          PTitle(title: "Professional Info", ),
                          PTitle(title: "Credit Info"),

                        ]
                    )
                  ],
                ),
              ),
            );

          }
          ),
          Positioned(
            bottom: 10,
            right: 80,
            child:TextButton(
            onPressed: () {},
            child: const Text(
              'Already Have An Account?',
            ),
            style: TextButton.styleFrom(
                primary: kPrimaryColor,
                backgroundColor: kPrimaryLightColor,
                textStyle:
                const TextStyle(fontSize: 18,)),
          ),
          )
        ]
      ),
/*
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ////back button
          InkWell(
            onTap: () {
              pformController.prevPage();
              setState(() {});
            },
            child: Visibility(
              visible: pformController.currentPage != 0 ? true : false,
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          ////front button
          InkWell(
            onTap: () {
              pformController.nextPage();
              setState(() {});
            },
            child: Visibility(
              visible: pformController.currentPage == pformController.length - 1
                  ? false
                  : true,
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),

 */
    );

  }
/*
  List<Step> getSteps() =>[
    Step(
      isActive: currentStep>=0,
      title: Text('Account'),
      content: Column(
        children: <Widget>[
          TextFormField(
            controller: firstName,
            decoration: InputDecoration(labelText: 'First Name:'),
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: lastName,
            decoration: InputDecoration(labelText: 'Last Name:'),
          ),
          SizedBox(height: 10,),
          InternationalPhoneNumberInput(
              onInputChanged: (value){},
          ),
          Row(children: [
            Radio(value: 1, groupValue: 1, onChanged: (value){}),
            Text("Male"),
            Radio(value: 2, groupValue: 2, onChanged: (value){}),
            Text("Female"),
            Radio(value: 3, groupValue: 3, onChanged: (value){}),
            Text("Other"),

          ],)
        ],
      ),
    ),
    Step(
      state: currentStep>0? StepState.complete : StepState.indexed,
      isActive: currentStep>=1,
      title: Text('Job'),
      content: Column(
        children: <Widget>[
          TextFormField(
            controller: firstName,
            decoration: InputDecoration(labelText: 'First Name:'),
          ),
          TextFormField(
            controller: lastName,
            decoration: InputDecoration(labelText: 'Last Name:'),
          )
        ],
      ),
    ),
    Step(
      state: currentStep>0? StepState.complete : StepState.indexed,
      isActive: currentStep>=2,
      title: Text('Payment'),
      content: SafeArea(
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
              onCreditCardWidgetChange: (CreditCardBrand) {},),
             SingleChildScrollView(
                  child: Column(
                    children: [
                      CreditCardForm(cardNumber: cardNumber,
                        expiryDate: expiryDate,
                        cardHolderName: cardHolderName,
                        cvvCode: cvvCode,
                        //onCreditCardModelChange: onCreditCardModelChange,
                        themeColor: Colors.blue,
                        formKey: formKey,
                        cardNumberDecoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Number',
                            hintText: 'xxxx xxxx xxxx xxxx'
                        ),
                        expiryDateDecoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Expired Date',
                            hintText: 'xx/xx'
                        ),
                        cvvCodeDecoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'CVV',
                            hintText: 'xxx'
                        ),
                        cardHolderDecoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Card Holder',
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            primary: Color(0xff1b447b)

                        ),
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          child: Text(
                            'validate',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'halter',
                              fontSize: 14,
                              package: 'flutter_credit_card',
                            ),
                          ),
                        ),
                        onPressed: (){
                          if(formKey.currentState!.validate()){
                            print('valid');
                          }
                          else{
                            print('inValid');
                          }
                        },
                      )
                    ],
                  ),
                )

          ],
        ),
      ),
    )
  ];
*/
}

