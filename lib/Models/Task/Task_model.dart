import 'package:hive/hive.dart';
part 'Task_model.g.dart';

@HiveType(typeId: 1)
class Task_model extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String date;
  @HiveField(2)
  int color;
  bool isCompleted;


  Task_model({required this.title,
    required this.date,
    required this.color,
    this.isCompleted=false

  });

}