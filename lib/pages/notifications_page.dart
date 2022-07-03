
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gawla/constants.dart';
import 'package:gawla/cubit/cubits.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: listView(),
    );
  }

  PreferredSizeWidget appBar(context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_outlined),
        onPressed:(){
          BlocProvider.of<Cubits>(context).goHome();
      } ,),
      backgroundColor: kPrimaryColor,
      title: Text("Notifications"),

    );
  }
}
Widget listView(){
  return ListView.separated(itemBuilder: (context, index) {
    return listViewItem(index);
  }, separatorBuilder: (context,index){
    return Divider(height: 0,);
  }, itemCount: 1);


}

Widget listViewItem(int index) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 13,vertical: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        prefixIcon(),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 10),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                message(index),
                timeAndDate(index),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
Widget prefixIcon(){
  return Container(
    height: 50,
    width: 50,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.grey,
    ),
  );
}
Widget message(int index) {
 double textSize =20;
 return Container(
   child: RichText(
     maxLines: 3,
     overflow: TextOverflow.ellipsis,
     text: TextSpan(
       text: 'Message',
       style: TextStyle(
         fontSize: textSize,
         color: Colors.black,
         fontWeight: FontWeight.bold
       ),
       children: [
         TextSpan(
           text: " Are you a certified Tour guide? " "\n" "Verify your job certificates to gain extra visibility",
           style: TextStyle(
             fontWeight: FontWeight.w400,
             fontSize: 20
           )
         )

       ]

     ),

   ),
 );
}
Widget timeAndDate(int index){
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '23-06-2022',
          style: TextStyle(
            fontSize: 10,
          ),
        ),
        Text(
          '07:00 am',
          style: TextStyle(
            fontSize: 10,
          ),
        ),
      ],
    ),
  );
}
