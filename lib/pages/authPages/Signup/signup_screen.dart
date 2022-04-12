import 'package:flutter/material.dart';
import 'package:gawla/pages/authPages/Signup/components/body.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String cardNumber = '';
  String expiryDate= '';
  String cardHolderName = '';
  String cvvCode= '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int currentStep = 0;
  //int _value =1;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final address = TextEditingController();
  final postcode = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.white,
        title: Text("Signup process"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        width: double.maxFinite,
        height: double.maxFinite,
        child:
        Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(primary: Colors.deepPurpleAccent)
          ),

          child: Stepper(
            type: StepperType.horizontal,
            steps: getSteps(),
            currentStep: currentStep,
            onStepContinue: (){
              final isLastStep = currentStep == getSteps().length -1;
              if (isLastStep){
                print('Completed');
                //send data to server then
              }else{
                setState(() => currentStep +=1);
              }
            },
            onStepCancel: (){
              currentStep == 0? null :  setState(() => currentStep -=1);
            },
            onStepTapped: (step)=> setState(() => currentStep =step,),

      ),
        ),
    )
    );

  }

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
                        onCreditCardModelChange: onCreditCardModelChange,
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
  void onCreditCardModelChange(CreditCardModel creditCardModel){
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}

