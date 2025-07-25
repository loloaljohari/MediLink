import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DropgeneralState {
  final String? selectedValue;

  const DropgeneralState({this.selectedValue});
}

class DropgeneralCubit extends Cubit<DropgeneralState> {
  DropgeneralCubit() : super(const DropgeneralState());

  Future<void> loadSelectedValue(init) async {
    emit(DropgeneralState(selectedValue: init));
  }

  Future<void> setSelectedValue(String value) async {
    emit(DropgeneralState(selectedValue: value));
    print(state.selectedValue);
  }
}
