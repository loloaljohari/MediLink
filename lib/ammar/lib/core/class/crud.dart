import 'dart:convert';
import 'package:MediLink/ammar/lib/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import 'statusrequest.dart';

class Crud {
  String? sessionCookie;

  Future<Either<Statusrequest, Map>> PostData(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(
          Uri.parse(linkurl),
          body: data,
          headers: {
            'Accept': 'application/json',
            if (sessionCookie != null) 'Cookie': sessionCookie!,
          },
        );

        print("================= CRUD =================");
        print("URL: $linkurl");
        print("Status Code: ${response.statusCode}");
        print("Headers: ${response.headers}");
        print("Body: ${response.body}");

        if (response.headers.containsKey('set-cookie')) {
          String rawCookie = response.headers['set-cookie']!;
          sessionCookie = rawCookie.split(";").first;
          print("✅ تم التقاط الكوكي: $sessionCookie");
        }

        if ([200, 201, 400, 401, 404, 403, 422, 429]
            .contains(response.statusCode)) {
          try {
            Map responseBody = jsonDecode(response.body);
            return Right(responseBody);
          } catch (e) {
            print("❌ JSON Decode Error: $e");
            return const Left(Statusrequest.serverExecption);
          }
        } else {
          return const Left(Statusrequest.serverfailur);
        }
      } else {
        return const Left(Statusrequest.offlinefailure);
      }
    } catch (e) {
      print("❌ General Exception: $e");
      return const Left(Statusrequest.serverExecption);
    }
  }
}
