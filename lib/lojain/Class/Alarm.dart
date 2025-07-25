import 'package:alarm/alarm.dart';

Future<void> resetAlarmForNextDay(AlarmSettings alarmSettings) async {
  
    // نضيف يوم واحد لوقت المنبه الحالي
    try {
  DateTime newAlarmTime = alarmSettings.dateTime.add(Duration(days: 1));
  
  // ننشئ إعدادات منبه جديدة للوقت الجديد
  final newAlarmSettings = AlarmSettings(
    id: alarmSettings.id,
    dateTime: newAlarmTime,
    assetAudioPath: alarmSettings.assetAudioPath,
    loopAudio: alarmSettings.loopAudio,
    vibrate: alarmSettings.vibrate,
    androidFullScreenIntent: alarmSettings.androidFullScreenIntent,
    volume: alarmSettings.volume,
    notificationSettings: NotificationSettings
    ( stopButton: 'stop',
      title: 
    'take medi', body: 'tomorow'),
  );
  
  // نضبط المنبه الجديد
  await Alarm.set(alarmSettings: newAlarmSettings);
  
   
    Alarm.setWarningNotificationOnKill(
        'حان موعد الدواء ', ' يجب ان تأخذ     الدواء هو');

  
//   // نعيد تسجيل المستمع للحدث
//  await Alarm.ringStream.stream.listen((alarmId) {
//     if (alarmId .id== alarmSettings.id) {
//       resetAlarmForNextDay(alarmId);
//     }
//   });
} on Exception catch (e) {
  print(e);
}
  }
