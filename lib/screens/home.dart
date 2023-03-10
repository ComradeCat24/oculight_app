import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../widgets/cameraView.dart';
import '../widgets/caption.dart';

class Home extends StatelessWidget {
  const Home({super.key, required availableCameras});

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
            const CameraView(camera: availableCameras),
            const SizedBox(height: 50),
            Caption(),
          ],
        ),
      ),
    );
  }
}
