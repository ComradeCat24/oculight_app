import 'package:Oculight/services/api.dart';
import 'package:flutter/material.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:translator/translator.dart';

// ignore: must_be_immutable
class Caption extends StatefulWidget {
  Caption({super.key, required this.captionText, required this.apiServices});

  String captionText;
  final ApiServices apiServices;

  final translator = GoogleTranslator();
  final TextToSpeech tts = TextToSpeech();

  // String captionText = 'This is our final year project.';
  bool isEnglish = false;

  @override
  // ignore: library_private_types_in_public_api
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
          child: widget.apiServices.isLoading
          ? const CircularProgressIndicator()
          : Text(
              widget.captionText,
              textAlign: TextAlign.center,
              key: ValueKey(widget.captionText),
              style: const TextStyle(fontSize: 20),
            ),
            
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          if(!(widget.captionText.isEmpty ||
                    widget.captionText == ''))
            ElevatedButton(
              onPressed: () {
                  translate();

                
              },
              child: Text(
                widget.isEnglish ? 'A' : 'आ',
                style: const TextStyle(
                  fontSize: 22
                ),
                // style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            // const SizedBox(width: 0),
          if(!(widget.captionText.isEmpty ||
                    widget.captionText == ''))
            ElevatedButton(
              onPressed: () {
                if (!(widget.captionText.isEmpty ||
                    widget.captionText == '')) {
                  speak();
                } else {
                  debugPrint("I no speak");
                }
              },
              child: const Icon(Icons.transcribe_rounded)),
          ],
        )
      ],
    );
  }
  @override
  void didUpdateWidget(covariant Caption oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.apiServices.isLoading == false) {
      setState(() {
        speak();
      });
    }
  }
}
