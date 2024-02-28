import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/journal_day.dart';
import '../repository/journal_repository.dart';

class GetJournalTopicDays{
  JournalRepository repository;

  GetJournalTopicDays(this.repository);

  Future<Either<Failure, List<JournalDayEntity>>> call(String id){
    return repository.getJournalTopicDays(id);
  }
}