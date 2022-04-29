import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:gawla/constants.dart';
import 'package:gawla/pages/navPages/home_page.dart';

class CreditStep extends StatefulWidget {
  const CreditStep({Key? key}) : super(key: key);

  @override
  State<CreditStep> createState() => _CreditStepState();
}

class _CreditStepState extends State<CreditStep> {
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
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
          ),
          Row(
            children: [
              SizedBox(width: 20,),
              Spacer(),
              TextButton(

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      },
                    ),
                  );
                },
                child: const Text(
                  'Submit',
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

          SizedBox(height: 40)


        ],
      ),
    );

  }
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
