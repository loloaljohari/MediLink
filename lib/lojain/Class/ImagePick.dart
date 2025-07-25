import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Imagepick {
  var profileimage = File("");
  final ImagePicker picker = ImagePicker();
  Future<String> image() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileimage = File(pickedFile.path);
    }
    return profileimage.path;
  }
}
