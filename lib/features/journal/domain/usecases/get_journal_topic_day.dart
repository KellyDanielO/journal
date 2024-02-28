import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/journal_day.dart';
import '../repository/journal_repository.dart';

class GetJournalTopicDay{
  JournalRepository repository;

  GetJournalTopicDay(this.repository);

  Future<Either<Failure, JournalDayEntity>> call(String id, String date){
    return repository.getJournalDay(id, date);
  }
}