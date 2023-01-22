import 'package:flutter/material.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:translator/translator.dart';

class Caption extends StatefulWidget {
  Caption({super.key, required this.captionText});
  final translator = GoogleTranslator();
  final TextToSpeech tts = TextToSpeech();

  String captionText;
  bool isEnglish = true;

  @override
  _CaptionState createState() => _CaptionState();
}

class _CaptionState extends State<Caption> {
  void translate() async {
    final targetLanguage = widget.isEnglish ? 'en' : 'hi';

    final Translation translation = await widget.translator
        .translate(widget.captionText, to: targetLanguage);

    setState(() {
      widget.captionText = translation.text;
      widget.isEnglish = !widget.isEnglish; // added this
    });
  }

  void speak() {
    widget.tts.setVolume(1.0);

    widget.isEnglish
        ? widget.tts.setLanguage('en')
        : widget.tts.setLanguage('hi');

    widget.tts.speak(widget.captionText);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Text(
            widget.captionText,
            key: ValueKey(widget.captionText),
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        const SizedBox(height: 50),
        ElevatedButton(
          onPressed: () {
            translate();
          },
          child: Icon(widget.isEnglish ? Icons.language : Icons.translate),
        ),
        ElevatedButton(
            onPressed: () {
              speak();
            },
            child: const Icon(Icons.transcribe_rounded)),
      ],
    );
  }
}
