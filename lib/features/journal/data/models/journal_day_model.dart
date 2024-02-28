import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/journal_day.dart';

part 'journal_day_model.g.dart';

@HiveType(typeId: 1)
class JournalDayModel extends Equatable {
  @HiveField(0)
  final String message;
  @HiveField(1)
  final String date;
  @HiveField(2)
  final String subTitle;

  const JournalDayModel({
    required this.message,
    required this.date,
    required this.subTitle,
  });

  @override
  List<Object?> get props => [message, date, subTitle];

  JournalDayEntity toEntity() => JournalDayEntity(
        subTitle: subTitle,
        message: message,
        date: date,
      );

  factory JournalDayModel.toModel(JournalDayEntity entity) => JournalDayModel(
      message: entity.message, date: entity.date, subTitle: entity.subTitle);
}
