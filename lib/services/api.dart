import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiServices extends ChangeNotifier {
  String _predictedString = "";

  String get predictedString => _predictedString;

  Future<void> postReq(XFile file) async {
    String filePath = file.path;
    String fileName = 'imageToString';

    try {
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath, filename: fileName),
      });

      Response response =
          await Dio().post("https://localhost:3000/predict", data: formData);
      print("File upload response: $response");
      print(response.data['data']);
      _predictedString = response.data["data"];
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
