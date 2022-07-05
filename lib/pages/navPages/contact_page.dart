import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gawla/cubit/cubit_logics.dart';
import 'package:gawla/cubit/cubits.dart';
import 'package:gawla/main.dart';
import 'package:gawla/pages/authPages/Login/login_screen.dart';
import 'package:gawla/pages/navPages/home_page.dart';
import 'package:gawla/pages/navPages/newsfeed.dart';
import 'package:gawla/pages/welcome_page.dart';
import 'package:gawla/services/data_services.dart';
import 'package:gawla/widgets/appbar.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import '../../constants.dart';
class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    startChat(context);
    return Container();
  }
}
Future<ContactListPage?> startChat(context) async{
  const apiKey = "r7p9bw265rbt";//appears in homepage
  const userToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJyZXNvdXJjZSI6ImFuYWx5dGljcyIsImFjdGlvbiI6IioiLCJ1c2VyX2lkIjoiKiJ9.YYcYqjKuqxHgDJixQSu4GDpTfjHzQon82RA_fHV9ChE";//from analytics side bar
  final client = StreamChatClient(
    apiKey,
    logLevel: Level.INFO,
  );
  await client.connectUser(
    User(
      id: 'Vision',
      extraData: {
        'image': 'https://pyxis.nymag.com/v1/imgs/1ec/f1c/a9bc3b8b01cfa5b3f8e7598f611654b563-vision-wandavision.rsquare.w700.jpg',
      },
    ),
    userToken,
  );
  /// Creates a channel using the type `messaging` and `coolkids`.
  /// Channels are containers for holding messages between different members. To
  /// learn more about channels and some of our predefined types, checkout our
  /// our channel docs: https://getstream.io/chat/docs/initialize_channel/?language=dart
  final channel = client.channel(
    'messaging',
    id: 'Vision',
    extraData: {
      "name": "Vision",
      "image": "https://pyxis.nymag.com/v1/imgs/1ec/f1c/a9bc3b8b01cfa5b3f8e7598f611654b563-vision-wandavision.rsquare.w700.jpg",
    },
  );
  /// `.watch()` is used to create and listen to the channel for updates. If the
  /// channel already exists, it will simply listen for new events.
  channel.watch();
//  print("so far not so good");
  runApp(ContactListPage(client: client,channel: channel,));
}

class ContactListPage extends StatelessWidget {
  const ContactListPage({
    Key? key,
    required this.client,
    required this.channel
  }) : super(key: key);
  final StreamChatClient client;
  final Channel channel;

  @override
  Widget build(BuildContext context) {
    print("so far so good");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return StreamChat(client: client, child: child);
      },
      home: StreamChannel(
        channel: channel,
        child: const ChatList(),
      ),
    );
  }
}
class ChannelPage extends StatelessWidget {
  const ChannelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ChannelHeader(
          showBackButton: true,
          //onBackPressed: BlocProvider.of<Cubits>(context).goHome()
        ),
        body: Column(
          children: [
            Expanded(child: MessageListView(),
            ),
            MessageInput(),
          ],
        )
    );
  }
}
class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
        elevation: 0,
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        leading: IconButton(onPressed: (){
          runApp(
            MaterialApp(
              debugShowCheckedModeBanner: false,
              home:  BlocProvider<Cubits>(//BlockProvider: injects cubits
                create: (context)=>Cubits(
                  data: DataServices(),
                ),//pass the class of function,create the cubit
                child: CubitLogics(),//then show the logic
                //pass the child that checks the cubits/states
              ),
            ),
          );

          }, icon: Icon(Icons.arrow_back_ios_outlined)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.edit))
        ],
      ),
      body: ChannelsBloc(
          child: ChannelListView(
            channelWidget: ChannelPage(),

          ),),
          //then show the logic
        //pass the child that checks the cubits/states



    );
  }
}


