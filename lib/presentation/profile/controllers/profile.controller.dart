import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sistem_informasi_simpan_pinjam/domain/entities/institution.dart';
import 'package:sistem_informasi_simpan_pinjam/widget/app_alert_dialog.dart';
import 'package:sistem_informasi_simpan_pinjam/widget/app_ok_dialog.dart';
import '../../../domain/core/usecase/member_usecase.dart';
import '../../../domain/entities/member.dart';
import '../../../domain/entities/user.dart';

class ProfileController extends GetxController {
  final MemberUseCase _getMemberdata;
  RxBool isPasswordVisible = false.obs;
  final hasSelectedImage = RxBool(false);

  RxBool isNotificationOn = false.obs;
  final imageFile = Rx<File?>(File(''));

  final memberProfileData = Rx<Member>(Member(
    id: 0,
    institutionId: 0,
    userId: 0,
    jenisKelamin: '',
    tanggalLahir: DateTime.now(),
    tempatLahir: '',
    nomorIndukAnggota: '',
    nomorKtp: '',
    memberStatus: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    user: User(
        id: 0,
        roleId: 0,
        name: '',
        email: '',
        phoneNumber: '',
        address: '',
        city: '',
        province: '',
        photoPath: '',
        institutionId: 0,
        institutions: Institution(
            id: 0,
            name: '',
            address: "",
            city: "",
            province: "",
            phoneNumber: "",
            email: "",
            photoPath: "",
            persentaseBungaSimpanan: 0,
            persentasePajakBungaSimpanan: 0,
            awalTahunBuku: 0,
            status: '',
            // note: '',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now())),
    kontrolPenarikan: '',
    rekeningGiro: false,
  ));

  ProfileController(this._getMemberdata);

  final _isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getMember();
  }

  @override
  void onReady() {
    super.onReady();
  }

  bool get isLoading => _isLoading.value;

  @override
  void onClose() {
    super.dispose();
    super.onClose();
  }

  Future<void> getMember() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isNotificationOn.value = prefs.getBool('isNotification')!;
    _isLoading.value = true;
    final token = prefs.getString('token');
    final id = prefs.getInt('user_id');
    final result = await _getMemberdata.execute(token: token, id: id);

    result.fold((failure) {
      _isLoading.value = true;
      Get.snackbar('Error', failure.message);
      print(failure.message);
    }, (success) {
      _isLoading.value = false;
      memberProfileData.value = success.data;
      print(success.data.user.name);
    });
  }

  Future<void> selectImageGalery() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
      if (!status.isGranted) {
        Get.snackbar('Permission denied',
            'Please grant storage permission to select an image');
        return;
      }
    }

    final pickedFile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, maxWidth: 600);
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);

      final fileType = lookupMimeType(pickedFile.path);
      if (fileType != null &&
          !(fileType.contains('jpg') ||
              fileType.contains('png') ||
              fileType.contains('jpeg'))) {
        Get.snackbar(
          'Error',
          'Please select a valid image file (JPG, JPEG, PNG)',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      // Check file size
      final fileSize = await pickedFile.length();
      if (fileSize > 5 * 1024 * 1024) {
        Get.snackbar(
          'Error',
          'File size must not exceed 5MB',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );

        deleteImage();
        return;
      }
      Get.dialog(AppAlertDialog(
        title: "Pemberitahuan",
        content:
            "Apakah anda akan mengganti photo profile dengan menggunakan photo yang sudah anda pilih ?",
        onPressed: () => updateProfileUser(imageFile.value!),
      ));
      hasSelectedImage.value = true;
    }
  }

  Future<void> selectImageCamera() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      status = await Permission.camera.request();
      if (!status.isGranted) {
        Get.snackbar('Permission denied',
            'Please grant storage permission to use the camera an image');
        return;
      }
    }

    final pickedFile = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxWidth: 600);
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);

      final fileType = lookupMimeType(pickedFile.path);
      if (fileType != null &&
          !(fileType.contains('jpg') ||
              fileType.contains('png') ||
              fileType.contains('jpeg'))) {
        Get.snackbar(
          'Error',
          'Please select a valid image file (JPG, JPEG, PNG)',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      // Check file size
      final fileSize = await pickedFile.length();
      if (fileSize > 5 * 1024 * 1024) {
        Get.snackbar(
          'Error',
          'File size must not exceed 5MB',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );

        deleteImage();
        return;
      }

      Get.dialog(AppAlertDialog(
        title: "Pemberitahuan",
        content:
            "Apakah anda akan mengganti photo profile dengan menggunakan photo yang sudah anda pilih ?",
        onPressed: () => updateProfileUser(imageFile.value!),
      ));
      hasSelectedImage.value = true;
    }
  }

  Future<void> updateProfileUser(File photoProfile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isNotificationOn.value = prefs.getBool('isNotification')!;
    _isLoading.value = true;
    final token = prefs.getString('token');
    final result = await _getMemberdata.onUpdateProfile(
        token: token, photoProfile: photoProfile);
    result.fold(
        (l) => Get.snackbar("Error", l.message),
        (r) => {
              Get.dialog(AppOkeDialog(
                title: "Pemberitahuan",
                content: r.message!,
                onPressed: () => Get.offAllNamed('/home'),
              ))
            });
  }

  void deleteImage() {
    imageFile.value = File('');
    hasSelectedImage.value = false;
  }
}
