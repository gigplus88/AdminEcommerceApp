import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/foundation.dart';

class Crud {
  final String _basicAuth =
      'Basic ${base64Encode(utf8.encode('dddd:sdfsdfsdfsdffdsf'))}'; // ضع بياناتك هنا

  Map<String, String> get _myheaders => {'authorization': _basicAuth};
  Future<Either<StatusRequest, Map>> postData(String linkUrl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkUrl), body: data);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print("Status Code: ${response.statusCode}");
          print("Raw Body: '${response.body}'");
          if (response.body.isEmpty) {
            return left(StatusRequest.serverfailure);
          }
          return right(responseBody);
        } else {
          print("Error in Crud status is: ${response.statusCode}");
          return left(StatusRequest.serverfailure);
        }
      } else {
        return left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      print("Error in Crud is: $e");
      return left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, Map>> addRequestWithImageOne(
    String url,
    Map data,
    dynamic imageFile, [
    String? namerequest,
  ]) async {
    if (namerequest == null) {
      namerequest = "files";
    }

    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(_myheaders);

    if (imageFile != null) {
      if (kIsWeb) {
        // إذا كنا على الويب: imageFile سيكون من نوع Uint8List
        var multipartFile = http.MultipartFile.fromBytes(
          namerequest,
          imageFile as Uint8List,
          filename: "upload.svg", // أو استخراج اسم افتراضي للصورة
        );
        request.files.add(multipartFile);
      } else {
        // إذا كنا على الموبايل: imageFile سيكون من نوع File
        File file = imageFile as File;
        var length = await file.length();
        var stream = http.ByteStream(file.openRead());
        var multipartFile = http.MultipartFile(
          namerequest,
          stream,
          length,
          filename: basename(file.path),
        );
        request.files.add(multipartFile);
      }
    }

    // إضافة البيانات النصية للطلب
    data.forEach((key, value) {
      request.fields[key] = value;
    });

    // إرسال الطلب
    var myrequest = await request.send();
    var response = await http.Response.fromStream(myrequest);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailure);
    }
  }
}
