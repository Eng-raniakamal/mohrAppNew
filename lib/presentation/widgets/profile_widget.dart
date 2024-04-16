
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mohr_hr/presentation/resources/assets_manager.dart';
import 'package:permission_handler/permission_handler.dart';


File? imageFile;

class ProfileWidget extends StatefulWidget {
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const  ProfileWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = true,
    required this.onClicked,
  }) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(context),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  // create the image profile and edit the image
  Widget buildImage(BuildContext context) {
   // try {
    final  image;
    if(widget.imagePath != null)
    {
    image = NetworkImage(widget.imagePath!);
    }
     else
      {
        image= AssetImage(ImageAssets.noPhoto);
      }
      return ClipOval(
        child: Material(
          color: Colors.transparent,
          child: Ink.image(
            image: image ,
            fit: BoxFit.cover,
            width: 110,
            height: 110,
            child: InkWell(onTap:
            widget.onClicked),
          ),
        ),
      );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 2,
        child: buildCircle(
          color: color,
          all: 0,
          child: IconButton(onPressed:widget.onClicked,
              padding: EdgeInsets.all(0.0),
            icon:widget.isEdit ? Icon(Icons.add_a_photo,size: 20,) : Icon(Icons.edit,size: 20,),
            color: Colors.white,
            //iconSize: 20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}


final picker = ImagePicker();

void showImagePicker(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (builder){
        return Card(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/5.2,
              margin: const EdgeInsets.only(top: 8.0),
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: InkWell(
                        child: Column(
                          children: const [
                            Icon(Icons.image, size: 60.0,color:Colors.blue),
                            SizedBox(height: 12.0),
                            Text(
                              "Gallery",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16, color: Colors.black),
                            )
                          ],
                        ),
                        onTap: () {
                          _imgFromGallery();
                          Navigator.pop(context);
                        },
                      )),
                  Expanded(
                      child: InkWell(
                        child: SizedBox(
                          child: Column(
                            children: const [
                              Icon(Icons.camera_alt, size: 60.0,color:Colors.blue,),
                              SizedBox(height: 12.0),
                              Text(
                                "Camera",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              )
                            ],
                          ),
                        ),
                        onTap: () {

                          _imgFromCamera();
                          Navigator.pop(context);
                        },
                      ))
                ],
              )),
        );
      }
  );
}

_imgFromGallery() async {
  await  picker.pickImage(
      source: ImageSource.gallery, imageQuality: 50
  ).then((value){
    if(value != null){
      _cropImage(File(value.path));
    }
  });
}

_imgFromCamera() async {
  await picker.pickImage(
      source: ImageSource.camera, imageQuality: 50
  ).then((value){
    if(value != null){
      _cropImage(File(value.path));
    }
  });
}

_cropImage(File imgFile) async {
  final croppedFile = await ImageCropper().cropImage(
      sourcePath: imgFile.path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ] : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9
      ],
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
    //setState(() {
      imageFile = File(croppedFile.path);
   // });
    // reload();
  }
}

void selectImage(BuildContext context)
async {
  Map<Permission, PermissionStatus> statuses = await [
    Permission.storage, Permission.camera].request();
  if (statuses[Permission.storage]!.isGranted &&
      statuses[Permission.camera]!.isGranted) {
    showImagePicker(context);
  }
}
