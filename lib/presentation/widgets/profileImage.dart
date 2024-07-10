
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:essmohr/presentation/resources/assets_manager.dart';
import 'package:permission_handler/permission_handler.dart';


File? imageFile;

class ProfileImageWidget extends StatefulWidget {
  final String imagePath;


  const  ProfileImageWidget({
    Key? key,
    required this.imagePath,

  }) : super(key: key);

  @override
  State<ProfileImageWidget> createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(context),


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

        ),
      ),
    );
  }



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

