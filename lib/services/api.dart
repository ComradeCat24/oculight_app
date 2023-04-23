import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiServices extends ChangeNotifier {
  String _predictedString = "";

  String get predictedString => _predictedString;

  bool isLoading = false;

  setLoading(bool status) {
    isLoading = status;
    notifyListeners();
  }

  Future<void> postReq(XFile file) async {
    setLoading(true);
    String filePath = file.path;
    String fileName = 'imageToString';

    try {
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(filePath, filename: fileName),
      });

      Response response =
          await Dio().post("http://10.0.2.2:5000/predict", data: formData);
      debugPrint("File upload response: $response");
      debugPrint(response.toString());
      _predictedString = response.toString();
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    } finally{
      setLoading(false);
    }
  }
}
