import 'package:flutter_bloc/flutter_bloc.dart';


class MonthCubit extends Cubit<DateTime> {
  MonthCubit() : super(DateTime(DateTime.now().year, DateTime.now().month));

  void selectMonth(DateTime month) {
    emit(DateTime(month.year, month.month));
  }
}