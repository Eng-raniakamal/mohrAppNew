import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class AddDocumentButtonWidget extends StatelessWidget {
  const AddDocumentButtonWidget({super.key, this.widget, this.title, this.onTap});
final String ? title;
  final  Widget? widget;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
      onTap: onTap,

      child: Container(
        height: 54.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10).r,
            border: Border.all(
              color:AppColor.blue,
            )
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget??  Container(
                  width: 14.w,height: 14.h,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColor.blue
                      )
                  ),
                  child: Center(
                      child: Icon(
                         Icons.add,color: AppColor.blue,size: 10,
                      ))),

              SizedBox(width: 8.w),
              Text(
               title?? "اضافة وثائق",
                style:context.text.titleLarge !.copyWith(
                    color: AppColor.blue),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
