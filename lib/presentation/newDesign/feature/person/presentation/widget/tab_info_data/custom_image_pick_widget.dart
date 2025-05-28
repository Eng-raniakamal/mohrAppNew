import 'dart:io';

import 'package:essmohr/presentation/newDesign//core/utils/import_file.dart';
import 'package:file_picker/file_picker.dart';

class CustomImagePickWidget extends StatefulWidget {
  const CustomImagePickWidget({super.key});

  @override
  State<CustomImagePickWidget> createState() => _CustomImagePickWidgetState();
}

class _CustomImagePickWidgetState extends State<CustomImagePickWidget> {
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: GestureDetector(
        onTap: _pickImage,
        child: Column(
          children: [
            Container(
              width: 128.w,
              height: 128.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12).r,
                color: Color.fromRGBO(15, 103, 254, 0.25),
              ),
              child:
              _imageFile == null
                  ? Center(
                child: SizedBox(
                  width: 48.w,
                  height: 48.h,
                  child: SvgPicture.asset(
                    fit: BoxFit.fill,
                    "assets/image/person/upload.svg",
                  ),
                ),
              )
                  : Image.file(_imageFile!, fit: BoxFit.fill),

            ),
            SizedBox(height: 8),
            Text("ارفع صورة شخصية",style:AppTextStyle.iBMP14w500,),
          ],
        ),
      ),
    );
  }
  Future<void> _pickImage() async {
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

}
