import 'package:equatable/equatable.dart';


class JournalDayEntity extends Equatable{
  final String date;
  final String subTitle;
  final String message;

  const JournalDayEntity({required this.date, required this.message, required this.subTitle});
  
  @override
  List<Object?> get props => [date, message, subTitle];
}