import 'package:flutter_bloc/flutter_bloc.dart';

class SwipeCubit extends Cubit<List<Map<String, String>>> {
  SwipeCubit(List<Map<String, String>> initialItems) : super(List.from(initialItems));

  double dragOffset = 0.0;

  void updateDrag(double delta) {
    dragOffset += delta;
    emit(List.from(state)); // إعادة إرسال نفس القائمة لتحديث الواجهة
  }

  void endDrag() {
    if (dragOffset > 80) {
      final first = state.first;
      final updatedList = List<Map<String, String>>.from(state)
        ..removeAt(0)
        ..add(first);

      dragOffset = 0.0;
      emit(updatedList);
    } else {
      dragOffset = 0.0;
      emit(List.from(state)); // فقط نعيد نفس القائمة بدون تعديل لإجبار BlocBuilder على إعادة البناء
    }
  }
}