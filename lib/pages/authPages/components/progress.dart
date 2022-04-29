import 'package:flutter/material.dart';
import 'package:gawla/constants.dart';

class PForm extends StatefulWidget {
  final List<Widget> pages;
  final List<PTitle> title;
  final PFormController controller;
  final double? height;
  final Color? activeColor, disableColor;

  const PForm(
      {Key? key,
        this.activeColor= kPrimaryColor,
        this.disableColor= kPrimaryLightColor,
        required this.controller,
        this.height=250,
        required this.pages,
        required this.title}) : super(key: key);

  @override
  State<PForm> createState() => _PFormState();
}

class _PFormState extends State<PForm> with TickerProviderStateMixin{
   late List<AnimationController> _controllers;
   late List<Animation<double>> _animations;
   late List<Animation<double>> _animationsOpavity;
   late List<bool> activeColor;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllers = List.generate(widget.pages.length, (index) => AnimationController(vsync: this,duration: Duration(milliseconds: 200),lowerBound:0.1 ));//lowerBound is responsible for the gaps in between the left bubbles
    _animations = _controllers.map((_controller) => Tween<double>(begin: 0.05, end: 1).animate(_controller)).toList();//begin and end of the sizesof expansion
    _animationsOpavity = _controllers.map((_controller) => Tween<double>(begin: 0, end: 1).animate(_controller)).toList();//level of opacity before and after clicking
    activeColor = List.generate(widget.pages.length, (index) => false);

    if (widget.controller != null) {
      widget.controller.addListener(() {
        controlColor(widget.controller.currentPage);
      });
    }

   }
  controlColor(int index){
     for(var i=0; i<activeColor.length;i++){
       if(index ==i){
         if(_controllers[index].isCompleted)
           _controllers[index].reverse();
         else
           _controllers[index].animateTo(1);
       }else{
         if(_controllers[i].isCompleted)
           _controllers[i].reverse();
       }
     }
     for(var i=0;i<=index;i++){
       print("three");
       activeColor[i] = true;
     }
     for(var i=index + 1;i<activeColor.length;i++){
       print("four");
       activeColor[i] = false;
     }
     setState(() {});
  }
  @override
  void dispose(){
     // TODO: implement dispose
    super.dispose();
    _controllers.forEach((c) {
      c.dispose();
    });
   }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.pages.map((e){
          int index = widget.pages.indexOf(e);
          return Stack(
            children: [
              if(index!= widget.pages.length-1)
                Container(//middle lines
                  margin: EdgeInsets.only(
                      left: 2,
                      top: 37
                  ),
                  child: SizeTransition(//expansion controlling for the middle lines
                    sizeFactor: _animations[index],
                    child: Container(
                    margin: EdgeInsets.only(
                      left: 13,
                      right: 20
                    ),
                    width: 3,
                    height: 300,
                    color: activeColor[index+1]? kPrimaryColor : Colors.grey
                    ),
                  ),
                ),
              Column(
                children: [
                  Row(
                    children: [
                      InkWell(//the left circles
                        onTap: (){
                          for (var i=0; i<widget.pages.length;i++){
                            controlColor(index);
                          }
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: activeColor[index]? kPrimaryColor : Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      widget.title[index]//titles next to the circles
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 50,),
                      Expanded(
                          child: FadeTransition(//the fading that occurs after clicking the circles
                            opacity: _animationsOpavity[index],
                            child: SizeTransition(sizeFactor: _animations[index],
                            child: e),
                          )
                      )
                    ],
                  )
                ],
              )
            ],
          );
        }).toList(),
      ),
    );
  }
}

class PTitle extends StatelessWidget {
  String? title,subtitle;
  Color? activeColor;
  PTitle({Key? key, this.title, this.activeColor, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(activeColor == null) activeColor = Colors.black;
    return Column(
      children: [
        Text(title!,style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: activeColor
        )),
        if(subtitle !=null) Text(subtitle!),

      ],
    );
  }
}
class PFormController extends ChangeNotifier {
  PFormController(this.length);
  int _page = -1;
  final int length;

  nextPage() {
    if (_page < length - 1) _page++;

    notifyListeners();
  }

  get currentPage => _page;

  set jumpToPage(int p) {
    _page = p;
    notifyListeners();
  }

  prevPage() {
    if (_page > 0) _page--;
    notifyListeners();
  }
}

