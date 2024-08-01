import 'package:hive/hive.dart';

part 'user_info.g.dart';

@HiveType(typeId: 0)
class UserInfo extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String gender;

  @HiveField(2)
  final String age;

  @HiveField(3)
  final String diagnosis;

  @HiveField(4)
  final String medication;

  @HiveField(5)
  final String behavioralIssues;

  @HiveField(6)
  final String behaviorPatterns;

  @HiveField(7)
  final String dailyRoutine;

  UserInfo({
    required this.name,
    required this.gender,
    required this.age,
    required this.diagnosis,
    required this.medication,
    required this.behavioralIssues,
    required this.behaviorPatterns,
    required this.dailyRoutine,
  });

  @override
  String toString() {
    return 'UserInfo{name: $name, gender: $gender, age: $age, diagnosis: $diagnosis, medication: $medication, behavioralIssues: $behavioralIssues, behaviorPatterns: $behaviorPatterns, dailyRoutine: $dailyRoutine}';
  }
}
