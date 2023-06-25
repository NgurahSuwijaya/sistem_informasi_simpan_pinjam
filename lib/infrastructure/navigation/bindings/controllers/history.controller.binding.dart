import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../../../domain/core/data/member_remote_data_source.dart';
import '../../../../domain/core/interfaces/member_repository_impl.dart';
import '../../../../domain/core/repositories/member_repository.dart';
import '../../../../domain/core/usecase/member_usecase.dart';
import '../../../../presentation/history/controllers/history.controller.dart';

class HistoryControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Client());
    Get.lazyPut<MemberDataSource>(() => MemberDataSourceImpl(Get.find()));
    Get.lazyPut<MemberRepository>(() => MemberRepositoryImpl(Get.find()));
    Get.lazyPut<MemberUseCase>(() => MemberUseCase(Get.find()));
    Get.lazyPut<HistoryController>(
      () => HistoryController(Get.find()),
    );
  }
}
