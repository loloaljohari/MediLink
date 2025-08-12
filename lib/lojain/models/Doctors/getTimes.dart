import 'dart:convert';

import 'package:MediLink/lojain/Static/Static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetTimesState {}

class GetTimesLoading extends GetTimesState {}

class GetTimesLoaded extends GetTimesState {
  final  times;
  GetTimesLoaded({
    required this.times,
  });
}

class GetTimesError extends GetTimesState {
  final String messageError;
  GetTimesError({
    required this.messageError,
  });
}

class GetTimesCubit extends Cubit<GetTimesState> {
  GetTimesCubit() : super(GetTimesLoading());

  Future fetchProfile({required id, required date}) async {
    emit(GetTimesLoading());
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      //  sharedPreferences.remove('token');

      var token = sharedPreferences.getString('token');

      String Authorization = 'Bearer $token';
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Accept-Language': 'en',
        'Authorization': '$Authorization',
      };
      final response =
          await http.get(Uri.parse('$url/doctor/$id/day-slots?date=$date'), headers: headers);
      var times = json.decode(response.body);
      print(await response.body);

      if (response.statusCode == 200) {
        print(await response.body);

        emit(GetTimesLoaded(times: times));
      } else {
        print(await response.body);

        emit(GetTimesLoaded(times: times));
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
      emit(GetTimesError(messageError: e.toString()));
    }
  }
}
