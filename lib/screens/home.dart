import 'package:flutter/material.dart';
import 'package:text_to_speech/text_to_speech.dart';

import '../widgets/camera.dart';
import '../widgets/caption.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextToSpeech tts = TextToSpeech();

  String captionText = 'This is out final year project.';

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
            Caption(captionText: captionText),
            const SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  _speak(captionText);
                },
                child: const Icon(Icons.transcribe_rounded)),
          ],
        ),
      ),
    );
  }
}
