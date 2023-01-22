import 'package:flutter/material.dart';
import 'package:text_to_speech/text_to_speech.dart';

import '../widgets/camera.dart';
import '../widgets/caption.dart';

class Home extends StatelessWidget {
  Home({super.key});

  String captionText = 'This is out final year project.';

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
          ],
        ),
      ),
    );
  }
}
