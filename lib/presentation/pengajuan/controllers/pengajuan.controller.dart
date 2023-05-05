import 'package:get/get.dart';

class PengajuanController extends GetxController {
  var selectedItem = ''.obs;
  var kategoriPinjaman = ''.obs;
  var jenisBungaPinjaman = ''.obs;
  var tipeJaminan = ''.obs;
  //TODO: Implement PengajuanController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void updateSelectedItem(String value) {
    selectedItem.value = value;

    // Do something with the selected item value
    if (selectedItem.value == 'Option 1') {
      // Perform some operation
    } else if (selectedItem.value == 'Option 2') {
      // Perform some other operation
    } else {
      // Perform yet another operation
    }
  }
}
