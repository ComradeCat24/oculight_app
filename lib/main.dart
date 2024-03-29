import 'package:Oculight/services/api.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home.dart';

late List<CameraDescription> _cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  _cameras = await availableCameras();

  runApp(ChangeNotifierProvider(
      create: (context) => ApiServices(), child: MyApp(cameras: _cameras)));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;

  const MyApp({super.key, required this.cameras});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oculight',
      theme: ThemeData(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ), // standard dark theme
      themeMode: ThemeMode.system, // device controls theme
      debugShowCheckedModeBanner: false,
      home: Home(cameras: cameras),
    );
  }
}
