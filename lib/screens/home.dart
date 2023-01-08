import 'package:flutter/material.dart';
import 'package:text_to_speech/text_to_speech.dart';

class ElevatedCard extends StatelessWidget {
  const ElevatedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        child: SizedBox(
          width: 300,
          height: 500,
          child: Center(child: Text('<Camera> Card')),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // String _text = '<Text>';
  final String _text = 'This is out final year project.';

  // void _updateText() {
  //   setState(() {
  //     _text = 'hello World!';
  //   });
  // }

  TextToSpeech tts = TextToSpeech();

  void _speak(String text) {
    tts.setVolume(1);
    tts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Oculight'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const ElevatedCard(),
            Text(
              _text,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _speak(_text);
        },
        tooltip: 'TTS',
        child: const Icon(Icons.surround_sound),
      ),
    );
  }
}
