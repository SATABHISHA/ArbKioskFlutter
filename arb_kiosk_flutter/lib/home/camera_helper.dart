import 'package:camera/camera.dart';

Future<List<CameraDescription>> getAvailableCameras() async {
  try {
    return await availableCameras();
  } catch (e) {
    print('Error getting available cameras: $e');
    return [];
  }
}