import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class Caption extends StatefulWidget {
  Caption({super.key, required this.captionText});
  final translator = GoogleTranslator();

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
      ],
    );
  }
}
