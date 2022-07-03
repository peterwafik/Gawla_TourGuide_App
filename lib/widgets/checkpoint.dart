import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gawla/constants.dart';
import 'package:gawla/cubit/cubits.dart';
import 'package:gawla/pages/create_checkpoint_page.dart';

class Checkpoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SOF()
    );
  }
}

class SOF extends StatefulWidget {
  @override
  _SOFState createState() => _SOFState();
}

class _SOFState extends State<SOF> {
  var nameTECs = <TextEditingController>[];
  var cards = <Container>[];

  Container createCard() {
    var nameController = TextEditingController();
    nameTECs.add(nameController);

    return Container(
        //decoration: BoxDecoration(color: Colors.deepPurpleAccent),
      constraints: BoxConstraints(minWidth: 70),
      width: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              BlocProvider.of<Cubits>(context).goCreateCheckpoint();
            },
            color: AppColors.buttonBackground,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            child: Text('Checkpoint ${cards.length + 1}'),
          )

        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    cards.add(createCard());
  }

  _onDone() {
    List<PersonEntry> entries = [];
    for (int i = 0; i < cards.length; i++) {
      var name = nameTECs[i].text;
      entries.add(PersonEntry(name));
    }
    Navigator.pop(context, entries);
  }

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            child: Text('Add new'),
            onPressed: () => setState(() => cards.add(createCard())),
          ),
        ),

        Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topRight,
                width: 140,
                height: 140,
                child: ListView.builder(
                  itemCount: cards.length,
                  itemBuilder: (BuildContext context, int index) {
                    return cards[index];
                  },
                ),
              ),
            ],
          ),
      ],
    );
      //floatingActionButton:
      //FloatingActionButton(child: Icon(Icons.done), onPressed: _onDone),

  }
}

class PersonEntry {
  final String name;
  PersonEntry(this.name);
}