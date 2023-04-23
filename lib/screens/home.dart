import 'package:Oculight/services/api.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/camera_view.dart';
import '../widgets/caption.dart';

class Home extends StatefulWidget {
  final List<CameraDescription> cameras;
  const Home({super.key, required this.cameras});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    ApiServices apiServices = context.watch<ApiServices>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Oculight'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(20),
                child: CameraView(camera: widget.cameras[0], apiServices: apiServices,),),
            const SizedBox(height: 10),
            Caption(
              captionText: apiServices.predictedString, apiServices: apiServices
            ),
          ],
        ),
      ),
    );
  }
}
