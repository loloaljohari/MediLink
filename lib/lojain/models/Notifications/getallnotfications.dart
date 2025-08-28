import 'dart:convert';

import 'package:MediLink/lojain/Static/Static.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetallnotficationsState {}

class GetallnotficationsLoading extends GetallnotficationsState {}

class GetallnotficationsLoaded extends GetallnotficationsState {
  final  notifications;
  GetallnotficationsLoaded({
    required this.notifications,
  });
}

class GetallnotficationsError extends GetallnotficationsState {
  final String messageError;
  GetallnotficationsError({
    required this.messageError,
  });
}

class GetallnotficationsCubit extends Cubit<GetallnotficationsState> {
  GetallnotficationsCubit() : super(GetallnotficationsLoading());

  Future fetchProfile() async {
    emit(GetallnotficationsLoading());
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      //  sharedPreferences.remove('token');

      var token = sharedPreferences.getString('token');
    print(token);
      String Authorization = 'Bearer $token';
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Accept-Language': 'en',
        'Cookie': 'syrian_clinic_session=QQdtfdqLyqQooaJ1vRVd5SC1ZOJ9bSUmwk25GCqD',
        'Authorization': '$Authorization',
      };
      final response =
          await http.get(Uri.parse('$url/notifications'), headers: headers);
      var notifications = json.decode(response.body);
      print(await response.body);

      if (response.statusCode == 200||response.statusCode == 201) {
        print(await response.body);

        emit(GetallnotficationsLoaded(notifications: notifications));
      } else {
        print(await response.body);

        emit(GetallnotficationsLoaded(notifications: notifications));
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
      emit(GetallnotficationsError(messageError: e.toString()));
    }
  }


}




class GetnotficationsState {}

class GetnotficationsLoading extends GetnotficationsState {}

class GetnotficationsLoaded extends GetnotficationsState {
  final  notifications;
  GetnotficationsLoaded({
    required this.notifications,
  });
}

class GetnotficationsError extends GetnotficationsState {
  final String messageError;
  GetnotficationsError({
    required this.messageError,
  });
}

class GetnotficationsCubit extends Cubit<GetnotficationsState> {
  GetnotficationsCubit() : super(GetnotficationsLoading());

 Future fetch() async {
    emit(GetnotficationsLoading());
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      //  sharedPreferences.remove('token');

      var token = sharedPreferences.getString('token');
    print(token);
      String Authorization = 'Bearer $token';
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Accept-Language': 'en',
        'Cookie':'syrian_clinic_session=QQdtfdqLyqQooaJ1vRVd5SC1ZOJ9bSUmwk25GCqD',
        'Authorization': '$Authorization',
      };
      final response =
          await http.get(Uri.parse('$url/notifications/unread'), headers: headers);
      var notifications = json.decode(response.body);
      print(await response.body);

      if (response.statusCode == 200||response.statusCode == 201) {
        print(await response.body);

        emit(GetnotficationsLoaded(notifications: notifications));
      } else {
        print(await response.body);

        emit(GetnotficationsLoaded(notifications: notifications));
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
      emit(GetnotficationsError(messageError: e.toString()));
    }
  }


}


