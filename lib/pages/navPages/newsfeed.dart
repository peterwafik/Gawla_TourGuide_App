import 'package:flutter/material.dart';
import 'package:gawla/constants.dart';
import 'package:gawla/widgets/appbar.dart';
import 'package:gawla/widgets/postsitem.dart';
import 'package:gawla/widgets/saveitem.dart';
import 'package:gawla/widgets/storyitem.dart';


class NewsFeed extends StatefulWidget {
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: header(context),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: ListView(
                padding: EdgeInsets.only(left: 20, right: 10),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                children: [
                  SizedBox(height: 15.0),
                  Text(" Top tour guides",style: const TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.black),),
                  SizedBox(height: 10.0),
                  StoryItem(),
                  SizedBox(height: 10.0),
                  Text(" Top tourism destinations",style: const TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.black),),
                  SizedBox(height: 10.0),
                  SavedItem(),
                  SizedBox(height: 10.0),
                  Text(" Upcoming Events",style: const TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.black),),
                  SizedBox(height: 10.0),
                  PostItem(),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Newsfeed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Ubuntu-Regular',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
