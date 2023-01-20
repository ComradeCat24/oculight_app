import 'package:flutter/material.dart';

class Caption extends StatelessWidget {
  const Caption({super.key, required this.enCaption, required this.hiCaption});

  final String enCaption;
  final String hiCaption;

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
