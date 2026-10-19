import 'dart:io';
import 'package:flutter/foundation.dart'; // ضروري لمعرفة هل التطبيق يعمل على الويب أم لا
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

/// دالة التقاط الصورة من الكاميرا (تدعم الويب والموبايل)
imageUploadCamera() async {
  final XFile? pickedFile = await ImagePicker().pickImage(
    source: ImageSource.camera,
    imageQuality: 90,
  );
  
  if (pickedFile != null) {
    if (kIsWeb) {
      // على الويب: نعيد XFile أو الـ bytes والاسم، لأن File(path) لا يعمل
      // يمكنك إرجاع pickedFile مباشرة أو قراءة البايتات حسب حاجتك في التطبيق
      return pickedFile; 
    } else {
      // على الموبايل: نرجع كائن File التقليدي
      return File(pickedFile.path);
    }
  }
  return null;
}

fileUploadGallery([isSvg = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: isSvg
        ? ['SVG', 'svg']
        : ['png', 'PNG', 'jpg', 'JPG', 'gif'],
    withData: true, // مهم جداً على الويب لضمان تحميل البايتات (bytes)
  );

  if (result != null && result.files.single != null) {
    PlatformFile platformFile = result.files.single;

    if (kIsWeb) {
      // على الويب: مسار الـ path غير متاح، نعتمد على bytes أو نُرجع الـ PlatformFile نفسه
      // إذا كان كودك في مكان آخر يعتمد على الـ bytes، يمكنك إرجاع platformFile.bytes أو platformFile كاملاً
      return platformFile; 
    } else {
      // على الموبايل: التأكد من أن الـ path ليس فارغاً ثم إرجاع File
      if (platformFile.path != null) {
        File file = File(platformFile.path!);
        return file;
      }
    }
  }
  return null;
}

Future<dynamic> imageUploadChooser(BuildContext context, [isSvg = false]) async {
  dynamic selectedFile;
  
  await showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(20),
        height: 160,
        child: Column(
          children: [
            const Text(
              "Choose Image Source",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    Navigator.pop(context); 
                    selectedFile = await fileUploadGallery(isSvg);
                  },
                  icon: const Icon(Icons.image),
                  label: const Text("Gallery"),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    Navigator.pop(context); 
                    selectedFile = await imageUploadCamera();
                  },
                  icon: const Icon(Icons.camera_alt),
                  label: const Text("Camera"),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
  
  return selectedFile;
}