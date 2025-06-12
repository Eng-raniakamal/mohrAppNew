import 'dart:convert';
import 'dart:io';


import 'dart:convert';
import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:essmohr/application/di.dart';

import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/presentation/AddImage/viewModel/GetImage_ViewModel.dart';
import 'package:essmohr/presentation/editEmployee/View/empAcademicDegree_view.dart';
import 'package:essmohr/presentation/resources/assets_manager.dart';

import 'package:essmohr/presentation/resources/colors.dart';
import 'package:essmohr/presentation/resources/routes.dart';
import 'package:essmohr/presentation/widgets/appbar_widget.dart';
import 'package:essmohr/presentation/widgets/appbarstart.dart';
import 'package:essmohr/presentation/widgets/navigator_bar.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import 'package:async/async.dart';








import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/application/app_prefs.dart';
import 'package:essmohr/application/constants.dart';
import 'package:essmohr/presentation/newDesign//core/utils/import_file.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:essmohr/presentation/widgets/profile_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_cropper/image_cropper.dart' show AndroidUiSettings, CropAspectRatioPreset, IOSUiSettings, ImageCropper;
import 'package:image_picker/image_picker.dart' show ImageSource;
import 'package:path_provider/path_provider.dart' show getApplicationDocumentsDirectory;
import 'package:http/http.dart' as http;


class CustomImagePickWidget extends StatefulWidget {
  const CustomImagePickWidget({super.key});

  @override
  State<CustomImagePickWidget> createState() => _CustomImagePickWidgetState();
}

class _CustomImagePickWidgetState extends State<CustomImagePickWidget> {
  File? _imageFile;
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final EmployeeImageViewModel _imageViewModel = instance<
  EmployeeImageViewModel>();
  final _Formkey = GlobalKey<FormState>();
  String? userId;
  String? userImage;

  _bind() {
    _imageViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap:() { _pickImage(context);},
        child: Column(
          children: [
            Container(
              width: 128.w,
              height: 128.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius
                    .circular(12)
                    .r,
                color: Color.fromRGBO(15, 103, 254, 0.25),
              ),
              child:
              // _imageFile == null
              //     ? Center(
              //   child: SizedBox(
              //     width: 48.w,
              //     height: 48.h,
              //     child: SvgPicture.asset(
              //       fit: BoxFit.fill,
              //       "assets/images/NewDesign/image/person/upload.svg",
              //     ),
              //   ),
              // )
                //  :
            StreamBuilder<UserImageModel>(
                  stream: _imageViewModel.outputUserImage,
                  builder: (context, snapshot) {

                    return
                      _getImageWidget(
                          snapshot.data,context)
                    ;}
              ),

              //Image.file(_imageFile!, fit: BoxFit.fill),

            ),
            SizedBox(height: 8),
            Text("ارفع صورة شخصية", style: AppTextStyle.iBMP14w500,),
          ],
        ),
      ),
    );
  }

  Future _pickImage(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "اختر مصدر الصورة",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text("اختيار من الملفات"),
                onTap: () async {
                  Navigator.pop(context);
                  FilePickerResult? result = await FilePicker.platform
                      .pickFiles(type: FileType.image);
                  if (result != null && result.files.single.path != null) {
                    setState(() {
                      _imageFile = File(result.files.single.path!);
                    });
                  }
                },
              ),
              if (_imageFile != null)
                ListTile(
                  leading: Icon(Icons.delete, color: Colors.red),
                  title: Text(
                    "حذف الصورة",
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      _imageFile = null;
                    });
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _getImageWidget(UserImageModel? image, BuildContext context) {
    if (image != null) {
      // userImage = image.data;
      Constants.imagePath = image.data;
      return ProfileWidget(
          imagePath: image.data,
          isEdit: true,
          onClicked: () async {
            showImagePicker(context);
          }
      );
    }
    else {
      //  userImage = ImageAssets.noPhoto;
      Constants.imagePath = ImageAssets.noPhoto;
      return ProfileWidget(
          imagePath: ImageAssets.noPhoto,
          isEdit: true,
          onClicked: () async {
            showImagePicker(context);
          }
      );
    }
  }

  showImagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Card(
            child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 5.2,
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: InkWell(
                          child: Column(
                            children: [
                              const Icon(
                                  Icons.image, size: 60.0, color: Colors.blue),
                              const SizedBox(height: 12.0),
                              Text(
                                AppStrings.Gallary.tr(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 16,
                                    color: Colors.black),
                              )
                            ],
                          ),
                          onTap: () {
                            // setState(() {
                            _imgFromGallery();
                            // Navigator.pop(context);
                            // });

                          },
                        )),
                    Expanded(
                        child: InkWell(
                          child: SizedBox(
                            child: Column(
                              children: [
                                const Icon(Icons.camera_alt, size: 60.0,
                                  color: Colors.blue,),
                                const SizedBox(height: 12.0),
                                Text(
                                  AppStrings.Camera.tr(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            // setState(() {
                            _imgFromCamera();
                            //Navigator.pop(context);
                            // });

                          },
                        ))
                  ],
                )),
          );
        }
    );
  }

  _imgFromGallery() async {
    final image = await picker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    ).then((value) {
      if (value != null) {
        _cropImage(File(value.path));
      }
    });
  }

  _imgFromCamera() async {
    final image = await picker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    ).then((value) {
      if (value != null) {
        _cropImage(File(value.path));
      }
    });
  }

  _cropImage(File image_File) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: image_File.path,

        uiSettings: [AndroidUiSettings(
            toolbarTitle: "Image Cropper",
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      // setState(() {
      imageFile = File(croppedFile.path);
      // final imagePermanent = await saveImagePermanently(croppedFile.path);
      setState(() {
        userImage = croppedFile.path;
        Constants.imagePath = userImage!;
        if (imageFile != null) {
          upload(File(croppedFile.path));
          Navigator.of(this.context).pushNamed(Routes.editProfileRoute);
        }
      });
      //});
      // reload();
    }
  }

  Future<File> saveImagePermanently(String imagePath) async
  {
    Directory directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final imageFile = File('${directory.path}/$name');
    final newImage =
    await File(imagePath).copy(imageFile.path);
    return newImage;
  }

  void selectImage(BuildContext context) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage, Permission.camera].request();
    if (statuses[Permission.storage]!.isGranted &&
        statuses[Permission.camera]!.isGranted) {
      showImagePicker(context);
    }
  }

  Future<bool> upload(File imageFile) async {
    userId = await _appPreferences.getUserToken();
    // open a bytestream
    var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse(Constants.postImageUrl);

    // create multipart request
    var request = http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = http.MultipartFile('file', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.headers.addAll(<String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'userId': userId!});
    request.files.add(multipartFile);


    // send
    var response = await request.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print("Added");
      return true;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      return false;
      //throw Exception('Failed to Save Image.');
      //return false;
    }
  }

}

