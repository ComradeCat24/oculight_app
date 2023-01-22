import 'package:flutter/material.dart';

import '../widgets/camera.dart';
import '../widgets/caption.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
            const SizedBox(height: 50),
            Caption(),
          ],
        ),
      ),
    );
  }
}
