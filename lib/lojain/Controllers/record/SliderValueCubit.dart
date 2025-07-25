
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderValueCubit extends Cubit<double> {
  SliderValueCubit() : super(0); // القيمة الابتدائية

  void updateValue(double newValue) => emit(newValue);
}