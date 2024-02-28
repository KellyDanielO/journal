import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/router/router_config.dart';
import '../../../data/datasources/local/local_journal_datasource.dart';
import '../../../data/models/journal_day_title_wrapper.dart';
import '../../../data/models/journal_topic_wrapper.dart';
import '../../../data/repository/journal_repository_impl.dart';
import '../../../domain/entities/journal_day.dart';
import '../../../domain/entities/journal_topic.dart';
import '../../../domain/repository/journal_repository.dart';
import '../../../domain/usecases/create_journal_topic.dart';
import '../../../domain/usecases/create_journal_topic_day.dart';
import '../../../domain/usecases/delete_journal_topic.dart';
import '../../../domain/usecases/delete_journal_topic_day.dart';
import '../../../domain/usecases/edit_journal_topic_day.dart';
import '../../../domain/usecases/get_journal_topic_day.dart';
import '../../../domain/usecases/get_journal_topic_days.dart';
import '../../../domain/usecases/get_journal_topics_usecase.dart';

class JournalController extends GetxController {
  TextEditingController createInputController = TextEditingController();
  Rx<TextEditingController> editInputController = TextEditingController().obs;
  RxBool textFieldEmpty = true.obs;
  RxBool textFieldEditEmpty = true.obs;
  RxInt typeCounter = 0.obs;
  RxInt typeCounterEdit = 0.obs;

  RxBool editDayMode = false.obs;
  RxString storyMessage = ''.obs;

  RxList<JournalTopicEntity> journalTopicValues = <JournalTopicEntity>[].obs;
  RxList<JournalDayEntity> journalDayValues = <JournalDayEntity>[].obs;

  Rx<JournalDayEntity?> editJournalValue = null.obs;

  // Databse
  final Box<JournalTopicDayWrapper> journalTopicDaysBox =
      Hive.box('journalTopicDaysWrapper');
  final Box<JournalTopicWrapper> journalTopicsBox = Hive.box('journalTopics');

  // Initialization of usecases
  late LocalDataSource localDataSource;
  late JournalRepository journalRepository;

  // tablet variables

  RxBool tabSelected = false.obs;
  RxString seleectedTitle = ''.obs;
  RxString selectedId = ''.obs;

  // Usecases
  late GetJournalTopics getJournalTopics;
  late CreateJournalTopic createJournalUseCase;
  late GetJournalTopicDays getJournalTopicDaysUseCase;
  late CreateJournalTopicDay createJournalTopicDayUseCase;
  late DeleteJournalTopic deleteJournalTopicUseCase;
  late DeleteJournalTopicDay deleteJournalTopicDayUseCase;
  late GetJournalTopicDay getJournalTopicDayUseCase;
  late EditJournalTopicDay editJournalTopicDayUseCase;

  @override
  void onInit() {
    // Boxes
    createInputController.clear();
    // Local Data Source
    localDataSource = LocalDataSource(journalTopicsBox, journalTopicDaysBox);
    // Repository
    journalRepository = JournalRepositoryImpl(localDataSource);
    // Usecase
    getJournalTopics = GetJournalTopics(journalRepository);
    createJournalUseCase = CreateJournalTopic(journalRepository);
    getJournalTopicDaysUseCase = GetJournalTopicDays(journalRepository);
    createJournalTopicDayUseCase = CreateJournalTopicDay(journalRepository);
    deleteJournalTopicUseCase = DeleteJournalTopic(journalRepository);
    deleteJournalTopicDayUseCase = DeleteJournalTopicDay(journalRepository);
    getJournalTopicDayUseCase = GetJournalTopicDay(journalRepository);
    editJournalTopicDayUseCase = EditJournalTopicDay(journalRepository);

    debounce(typeCounter, (callback) {
      if (createInputController.value.text.isEmpty) {
        textFieldEmpty.value = true;
      } else {
        textFieldEmpty.value = false;
      }
    });
    debounce(typeCounterEdit, (callback) {
      if (editInputController.value.value.text.isEmpty) {
        textFieldEditEmpty.value = true;
      } else {
        textFieldEditEmpty.value = false;
      }
    });
    super.onInit();
  }

  Future<void> createJournalTitle() async {
    String title = createInputController.value.text;
    if (title.isNotEmpty) {
      String date = DateTime.now().toString();
      var uuid = const Uuid();
      String newUuid = uuid.v4();

      JournalTopicEntity journalTopic =
          JournalTopicEntity(title: title, date: date, id: newUuid);
      createJournalUseCase.call(journalTopic);
      await getJournalTopicsValues();
      createInputController.clear();
      Get.back();
    }
  }

  Future<void> deleteJournalTitle(JournalTopicEntity journal) async {
    deleteJournalTopicUseCase.call(journal);
    await getJournalTopicsValues();
    Get.back();
  }

  Future<void> createJournalDay(String id) async {
    String message = createInputController.value.text;
    if (message.isNotEmpty) {
      String date = DateFormat('yyyy-MM-d').format(DateTime.now());

      JournalDayEntity journalTopicDay =
          JournalDayEntity(date: date, message: message, subTitle: '');

      createJournalTopicDayUseCase.call(id, journalTopicDay);
      await getJournalTopicDays(id);
      createInputController.text = '';
      createInputController.clear();
      Get.back();
    }
  }

  Future<void> editJournalDay(String id, String date) async {
    String message = editInputController.value.text;
    if (message.isNotEmpty) {
      JournalDayEntity journalTopicDay =
          JournalDayEntity(date: date, message: message, subTitle: '');

      editJournalTopicDayUseCase.call(id, journalTopicDay);
      storyMessage.value = message;
      editInputController.value.text = '';
      editInputController.value.clear();
      await getJournalTopicDays(id);
    }
  }

  Future<void> deleteJournalDay(
      String id, JournalDayEntity journalDayEntity) async {
    deleteJournalTopicDayUseCase.call(id, journalDayEntity);
    await getJournalTopicDays(id);
    Get.back();
  }

  Future<void> getJournalTopicsValues() async {
    final journalTopics = await getJournalTopics.call();
    journalTopics.fold(
      (Failure error) => journalTopicValues.value = [],
      (List<JournalTopicEntity> journalTopicReponse) =>
          journalTopicValues.value = journalTopicReponse,
    );
  }

  Future<void> getJournalTopicDays(String id) async {
    final getJournalTopicDaysData = await getJournalTopicDaysUseCase.call(id);
    getJournalTopicDaysData.fold(
      (Failure error) => journalTopicValues.value = [],
      (List<JournalDayEntity> journalDayReponse) =>
          journalDayValues.value = journalDayReponse,
    );
  }

  void moveToCreate(String id) async {
    String date = DateFormat('yyyy-MM-d').format(DateTime.now());
    final res = await getJournalTopicDayUseCase.call(id, date);
    res.fold((l) {
      Get.toNamed(
        AppRouter.createStory,
        arguments: {'id': id},
      );
    }, (r) {
      Get.toNamed(
        AppRouter.eachDay,
        arguments: {'story': r, 'edit': true, 'id': id},
      );
    });
  }
}
