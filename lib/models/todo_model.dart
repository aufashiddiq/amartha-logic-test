import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 1)
class TodoModel extends HiveObject {
  @HiveField(0)
  String text;

  @HiveField(1)
  bool hasDone;

  TodoModel({required this.text, this.hasDone = false});
}
