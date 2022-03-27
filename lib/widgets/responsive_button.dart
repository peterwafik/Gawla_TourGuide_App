import 'package:flutter/cupertino.dart';
import 'package:gawla/misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;     //? : means optional to pass it a value or not

  ResponsiveButton({Key? key,this.width,this.isResponsive=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor
      ),
      child: Row(
        children: [
          Image.asset("assets/img/button-one.png")
        ],
      ),
    );
  }
}
