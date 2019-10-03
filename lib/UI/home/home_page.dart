import 'package:flutter/material.dart';
import 'package:ngts/UI/component/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:flutter_text_to_speech/flutter_text_to_speech.dart';

import 'package:ngts/share_p.dart';

class HomePage extends StatelessWidget {
  List<String> user = SharedP.sharedPreferences.getStringList('Account');

  // List<String> user = [
  //   'https://lh3.googleusercontent.com/a-/AAuE7mDNnvzAQfxu3JiS_F0npVcGo3auzYAg77e20HB9=s96-c',
  //   'Gaurav Jajoo',
  //   'gauravjajoo998@gmail.com',
  //   '285734573457'
  // ];

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NGTS'),
        backgroundColor: Theme.of(context).accentColor,
      ),
      drawer: DrawerHome().drawer(context, user, _scaffoldState),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Start(),
              ),
            );
          },
          child: Text(
            'Start',
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('GK').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          // List a = snapshot.data.documents[0].data['Option'];
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return PageView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (BuildContext context, int i) {
              return QuestionOption(snapshot.data.documents[i].data['Question'],
                  snapshot.data.documents[i].data['Option']);
            },
          );
        },
      ),
    );
  }
}

class QuestionOption extends StatefulWidget {
  final String question;
  final List option;
  QuestionOption(this.question, this.option);

  @override
  _QuestionOptionState createState() => _QuestionOptionState();
}

class _QuestionOptionState extends State<QuestionOption> {
  String questionAndOption;
  List a = ['A', 'B', 'C', 'D'];
  VoiceController voiceController =
      FlutterTextToSpeech.instance.voiceController();

  @override
  void initState() {
    super.initState();
    questionSpeak();
    // print('questionAnswer is $questionOption');
    // print('Options are $options');
  }

  questionSpeak() {
    questionAndOption = widget.question;
    for (var i = 0; i < widget.option.length; i++) {
      questionAndOption += 'Option ${a[i]} ${widget.option[i]}';
    }
    voiceController.init().then((_) {
      voiceController.speak(
          questionAndOption, VoiceControllerOptions(speechRate: 0.8));
    });
  }

  // optionSpeak(String option) {
  //   voiceController.init().then(
  //       (_) => voiceController.speak(option, VoiceControllerOptions(delay: 3)));
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            widget.question,
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
        ),
        RadioButtonGroup(
          labels: [
            for (var i = 0; i < a.length; i++) '${widget.option[i]}',
          ],
          // labels: ,
          onSelected: (String selected) => print(selected),
          labelStyle: TextStyle(fontSize: 18.0),
        ),
        SizedBox(
          height: 30.0,
        ),
        RaisedButton(
          onPressed: questionSpeak,
          child: Text(
            'Repeat',
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
        )
      ],
    );
  }
}
