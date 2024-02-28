import 'package:equatable/equatable.dart';

class JournalTopicEntity extends Equatable{
  final String title;
  final String date;
  final String id;

  const JournalTopicEntity({required this.title, required this.date, required this.id});
  
  @override
  List<Object?> get props => [title, date, id];
}