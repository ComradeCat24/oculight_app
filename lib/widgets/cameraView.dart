import 'dart:io';
import 'package:Oculight/services/api.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class Camera extends StatelessWidget {
//   const Camera({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Card(
//         child: SizedBox(
//           width: 300,
//           height: 500,
//           child: Center(child: Text('<Camera> Card')),
//         ),
//       ),
//     );
//   }
// }

// A screen that allows users to take a picture using a given camera.
class CameraView extends StatefulWidget {
  const CameraView({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  CameraViewState createState() => CameraViewState();
}

class CameraViewState extends State<CameraView> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  void sendFile(XFile file) async {
    try {
      await ApiServices().postReq(file);
      print("After req");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the Future is complete, display the preview.
          return Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              CameraPreview(_controller),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: ElevatedButton(
                    style: IconButton.styleFrom(fixedSize: const Size(100, 40)),
                    onPressed: () async {
                      try {
                        await _initializeControllerFuture;
                        final image = await _controller.takePicture();
                        sendFile(image);
                      } catch (e) {
                        debugPrint(e.toString());
                      }
                    },
                    child: const Icon(CupertinoIcons.camera)),
              ),
                  
            ],
          );
        } else {
          // Otherwise, display a loading indicator.
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}
