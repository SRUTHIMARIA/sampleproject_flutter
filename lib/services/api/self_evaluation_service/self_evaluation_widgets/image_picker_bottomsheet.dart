import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/utils/constants/font_data.dart';
import 'package:flutter_template/utils/extensions/context_extensions.dart';
import 'package:flutter_template/utils/theme/app_colors.dart';
import 'package:flutter_template/widgets/camera_popup/camera_popup.dart';
import 'package:flutter_template/widgets/snackbar/text_snackbar.dart';
import 'package:flutter_template/widgets/text/text_style.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';


class ImageUploadBottomSheetWidget extends StatefulWidget {
  final Function(XFile? image) profileImage;
  final BuildContext profileContext;
  const ImageUploadBottomSheetWidget({
    Key? key,
    required this.profileImage,
    required this.profileContext,
  }) : super(key: key);

  @override
  State<ImageUploadBottomSheetWidget> createState() => _ImageUploadBottomSheetWidgetState();
}

class _ImageUploadBottomSheetWidgetState extends State<ImageUploadBottomSheetWidget> {
  final ImagePicker _picker = ImagePicker();

  // Future<File> getImage(ImageSource imageSource) async {
  //   if (imageSource == ImageSource.gallery) {
  //     try {
  //       PickedFile? imageFile = await ImagePicker()
  //           .getImage(source: imageSource, imageQuality: 100);
  //       int sizeInBytes = File(imageFile.path).lengthSync();
  //       double sizeInMb = sizeInBytes / (1024 * 1024);
  //
  //       if (imageFile == null) {
  //         _image = null;
  //       } else if (sizeInBytes > 2000000) {
  //         ToastUtils.showToastMessage('File size is more than 2 MB');
  //         _image = null;
  //       } else {
  //         _image = File(imageFile.path);
  //       }
  //     } catch (e) {
  //       debugPrint(e.toString());
  //     }
  //   } else {
  //     //
  //     var image = await ImagePicker.pickImage(
  //         source: ImageSource.camera, imageQuality: 100);
  //
  //     int sizeInBytes = File(image.path).lengthSync();
  //     if (image == null) {
  //       _image = null;
  //     } else if (sizeInBytes > 2000000) {
  //       ToastUtils.showToastMessage('File size is more than 2 MB');
  //       _image = null;
  //     } else {
  //       _image = File(image.path);
  //     }
  //   }
  //
  //   return _image;
  // }
  Future<void> cameraPermission() async {
    PermissionStatus cameraStatus = await Permission.camera.request();
    if (cameraStatus == PermissionStatus.granted) {
      XFile? image = await _picker.pickImage(source: ImageSource.camera, imageQuality: 100);
      int sizeInBytes = File(image!.path).lengthSync();

      if (sizeInBytes > 4000000) {
        // Navigator.of(context).pop();
        print('File size is more than 4 MB');
        AppSnackBar.showSnackBarWithText(
            text: 'File size is more than 4 MB', context: widget.profileContext,);
        image = null;
      } else {
        widget.profileImage(image);
        // Navigator.of(context).pop();
      }
    }
    if (cameraStatus == PermissionStatus.denied) {
      await cameraPermission();
      AppSnackBar.showSnackBarWithText(text: 'This Permission Recommended', context: context);
    }
    if (cameraStatus == PermissionStatus.permanentlyDenied) {
      // openAppSettings();
      await cameraPermission();

    }
  }

  Future<void> galleryOnTap() async {
    Navigator.of(context).pop();
    // PermissionStatus galleryStatus = await Permission.photos.request();

    XFile? image = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    int sizeInBytes = File(image!.path).lengthSync();

    if (sizeInBytes > 4000000) {
      // Navigator.of(context).pop();
      debugPrint('File size is more than 4 MB');
      AppSnackBar.showSnackBarWithText(
        text: 'File size is more than 4 MB',
        context: widget.profileContext,
      );
    } else {
      widget.profileImage(image);
    }
  }

  Future<void> cameraOnTap() async {
    Navigator.of(context).pop();

    PermissionStatus cameraStatus = await Permission.camera.request();
    if (cameraStatus == PermissionStatus.granted) {
      XFile? image = await _picker.pickImage(source: ImageSource.camera, imageQuality: 100);
      int sizeInBytes = File(image!.path).lengthSync();

      if (sizeInBytes > 4000000) {
        // Navigator.of(context).pop();
        debugPrint('File size is more than 4 MB');
        AppSnackBar.showSnackBarWithText(
          text: 'File size is more than 4 MB',
          context: widget.profileContext,
        );
      } else {
        widget.profileImage(image);
        // Navigator.of(context).pop();
      }
    }
    if (cameraStatus == PermissionStatus.denied) return;
    if (cameraStatus == PermissionStatus.permanentlyDenied) {
      await showDialog(context: context, builder: (_) => const CameraPermissionPopup());

      await Permission.camera.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.percentHeight * 20,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(10.0), topLeft: Radius.circular(10.0)),
        color: AppColors.whiteColor,
      ),
      child: GestureDetector(
        onTap: () => SystemChannels.textInput.invokeMethod('TextInput.hide'),
        child: ListView(
          padding: MediaQuery.of(context).viewInsets,
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: context.heightPx * 15,
                  ),
                  Text(
                    'Choose a Photo',
                    style: FontData().montFont70018TextStyle,
                  ),
                  SizedBox(
                    height: context.heightPx * 15,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 1,
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          child: Text(
                            'Browse from Gallery',
                            style: FontData().montFont50014BlackTextStyle,
                          ),
                          onPressed: () async => galleryOnTap(),
                        ),
                        const Divider(
                          height: 2,
                          thickness: 1,
                        ),
                        MaterialButton(
                          child: Text(
                            'Use a Camera',
                            style: FontData().montFont50014BlackTextStyle,
                          ),
                          onPressed: () async => cameraOnTap(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
