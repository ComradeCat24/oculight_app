import 'package:flutter/material.dart';

<<<<<<< HEAD
abstract class TranslateAPI {
  Future<Translation> translate(String text, {to});
}

class GoogleTranslateAPI implements TranslateAPI {
  final translator = GoogleTranslator();

  @override
  Future<Translation> translate(String text, {to}) {
    return translator.translate(text, to: to);
  }
}

class Caption extends StatefulWidget {
  Caption({super.key, required this.captionText, required this.translateAPI});

  String captionText;
  bool isEnglish = true;
  final TranslateAPI translateAPI;

  @override
  _CaptionState createState() => _CaptionState();
}

class _CaptionState extends State<Caption> {
  void translate() async {
    final targetLanguage = widget.isEnglish ? 'en' : 'hi';
    final Translation translation = await widget.translateAPI
        .translate(widget.captionText, to: targetLanguage);
    setState(() {
      widget.captionText = translation.text;
      widget.isEnglish = !widget.isEnglish;
    });
  }
=======
class Caption extends StatelessWidget {
  const Caption({super.key, required this.enCaption, required this.hiCaption});

  final String enCaption;
  final String hiCaption;
>>>>>>> parent of 34f469e (:globe_with_meridians: implimented translation)

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          enCaption,
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(height: 20),
        Text(
          hiCaption,
          style: Theme.of(context).textTheme.headline5,
        ),
      ],
    );
  }
}
