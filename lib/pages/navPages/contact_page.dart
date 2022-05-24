import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gawla/constants.dart';
import 'package:gawla/cubit/cubits.dart';
import 'package:gawla/pages/navPages/home_page.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);


  Future<void> StatingStep() async {
    const apiKey = "85u9gh4kpf2c";
    const userToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoicGV0ZXIifQ.NSEcti19pLUV6LI6XIlVO0X6abty1YO1HQ_ynX_jHrA";

    final client = StreamChatClient(
      apiKey,
      logLevel: Level.INFO,
    );

    await client.connectUser(
      User(
        id: 'peter',
        extraData: {
          'image': 'https://i0.wp.com/codigoespagueti.com/wp-content/uploads/2021/02/Tom-Holland-unico-Peter-Parker-Spider-Man.jpg?fit=1280%2C720&quality=80&ssl=1',
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
      id: 'Peter',
      extraData: {
        "name": "Chatting window",
        "image": "https://i0.wp.com/codigoespagueti.com/wp-content/uploads/2021/02/Tom-Holland-unico-Peter-Parker-Spider-Man.jpg?fit=1280%2C720&quality=80&ssl=1",
      },
    );

    /// `.watch()` is used to create and listen to the channel for updates. If the
    /// channel already exists, it will simply listen for new events.
    channel.watch();
    runApp(chat(client, channel));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw StatingStep();
  }
}
class chat extends StatelessWidget {
  /// Instance of [StreamChatClient] we created earlier. This contains information about
  /// our application and connection state.
   StreamChatClient client;

  /// The channel we'd like to observe and participate.
   Channel channel;
  /// To initialize this example, an instance of [client] and [channel] is required.
  //const ContactPage(Key? key): super(key: key);
   chat(this.client,this.channel);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData.dark().copyWith(
      accentColor: kPrimaryLightColor,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, widget) {
        return StreamChat(
          child: widget,
          client: client,
          streamChatThemeData: StreamChatThemeData.fromTheme(theme),
        );
      },
      home: StreamChannel(
        channel: channel,
        child: ChannelPage(),
      ),
    );
  }
}

/// Displays the list of messages inside the channel
class ChannelPage extends StatelessWidget {
  const ChannelPage({
    Key? key,
  }) : super(key: key);

  BuildContext get context => ChannelPage().context;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: ChannelHeader(
        showBackButton: true,
        //onBackPressed: BlocProvider.of<Cubits>(context).goHome()
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: MessageListView(),
          ),
          MessageInput(),
        ],
      ),
    );
  }

}
