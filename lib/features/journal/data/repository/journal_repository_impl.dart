import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:journal/features/journal/domain/entities/journal_day.dart';
import 'package:journal/features/journal/domain/entities/journal_topic.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/widgets/action_toast.dart';
import '../../domain/repository/journal_repository.dart';
import '../datasources/local/local_journal_datasource.dart';
import '../models/journal_day_model.dart';
import '../models/journal_topic_model.dart';

class JournalRepositoryImpl implements JournalRepository {
  final LocalDataSource localDataSource;
  JournalRepositoryImpl(this.localDataSource);

  @override
  void createJournalDay(String id, JournalDayEntity journalDay) {
    final day = JournalDayModel.toModel(journalDay);
    localDataSource.addJournalTopicDay(id, day);
    actionToast('added'.tr);
  }

  @override
  void createJournalTopic(JournalTopicEntity entity) {
    final topic = JournalTopicModel.toModel(entity);
    localDataSource.addJournalTopic(topic);
    actionToast('added'.tr);
  }

  @override
  Future<Either<Failure, List<JournalTopicEntity>>> getJournalTopics() async {
    try {
      List<JournalTopicModel> res = localDataSource.getAllJournalTopics();
      List<JournalTopicEntity> response =
          res.map((e) => e.toEntity()).toList().reversed.toList();
      return Right(response);
    } catch (e) {
      return Left(DataFailure('unknown'));
    }
  }

  @override
  Future<Either<Failure, List<JournalDayEntity>>> getJournalTopicDays(
      String id) async {
    try {
      List<JournalDayModel> res = localDataSource.getJournalTopicDays(id);
      List<JournalDayEntity> response =
          res.map((e) => e.toEntity()).toList().reversed.toList();
      return Right(response);
    } catch (e) {
      return Left(DataFailure('unknown'));
    }
  }

  @override
  void deleteJournalDay(String id, JournalDayEntity journalDay) {
    localDataSource.deleteJournalTopicDay(
        id, JournalDayModel.toModel(journalDay));
    actionToast('deleted'.tr);
  }

  @override
  void deleteJournalTopic(JournalTopicEntity journal) {
    localDataSource.deleteJournalTopic(JournalTopicModel.toModel(journal));
    actionToast('deleted'.tr);
  }

  @override
  Future<Either<Failure, JournalDayEntity>> getJournalDay(
      String id, String date) async {
    final journalDay = localDataSource.getJournalDay(id, date);
    if (journalDay != null) {
      return Right(journalDay.toEntity());
    } else {
      return Left(DataFailure('unknown'));
    }
  }
  
  @override
  void editJournalDay(String id, JournalDayEntity journalDay) {
    localDataSource.editJournalTopicDay(id, JournalDayModel.toModel(journalDay));
    actionToast('edited'.tr);
  }
}
