import 'package:flutter/material.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:translator/translator.dart';

import '../widgets/camera.dart';
import '../widgets/caption.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextToSpeech tts = TextToSpeech();
  final translator = GoogleTranslator();

  // String _text = '<Text>';
  String enCaption = 'This is out final year project.';

  String hiCaption = '';

  @override
  void initState() {
    super.initState();

    translator
        .translate(enCaption, to: 'hi')
        .then((value) => hiCaption = value.text);
  }

  void _speak(String text) {
    tts.setVolume(1);
    // String language = 'hi-IN';
    String language = 'en-IN';
    tts.setLanguage(language);
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Camera(),
            const SizedBox(height: 100),
            Caption(enCaption: enCaption, hiCaption: hiCaption),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _speak(enCaption);
        },
        tooltip: 'TTS',
        child: const Icon(Icons.surround_sound),
      ),
    );
  }
}
