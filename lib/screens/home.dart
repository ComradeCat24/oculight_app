import 'package:Oculight/services/api.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/cameraView.dart';
import '../widgets/caption.dart';

class Home extends StatelessWidget {
  final List<CameraDescription> cameras;
  const Home({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    ApiServices apiServices = context.watch<ApiServices>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Oculight'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CameraView(camera: cameras[0]),
              const SizedBox(height: 10),
              Caption(
                captionText: apiServices.predictedString,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
