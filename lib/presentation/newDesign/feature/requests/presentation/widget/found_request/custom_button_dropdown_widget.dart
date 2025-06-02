import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
//import 'package:essmohr/presentation/newDesign/feature/request/control/dropdown/dropdown_cubit.dart';
//import 'package:essmohr/presentation/newDesign/feature/request/control/request/request_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../control/dropdown/dropdown_cubit.dart';
import '../../../control/request/request_cubit.dart';

class CustomButtonDropdownWidget extends StatelessWidget {
  static final List<String> options = [
    "طلب اداري",
    "طلب اذن",
    "طلب اضافي",
    "ساعات عمل شهري",
    "طلب سلفة",
    "طلب مالي",
    "طلب مأمورية"
  ];


  final Widget child;
  const CustomButtonDropdownWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (TapDownDetails details) async {
          functionOnTapDown( context, details);

        },
        child:child
    );
  }

  functionOnTapDown(BuildContext context,TapDownDetails details) async {
    final RenderBox overlay =  Overlay.of(context).context.findRenderObject() as RenderBox;

    final selectedItem = await showMenu<String>(
      context: context,
      position: RelativeRect.fromRect(
        details.globalPosition & const Size(40, 40),
        Offset.zero & overlay.size,
      ),
      items: options.map((option) {
        return PopupMenuItem<String>(
          value: option,
          height: 30, // <--- ده بيتحكم في ارتفاع العنصر الواحد في القايمة (المساحة البيضاء)
          child: Align( // <--- استخدم Align عشان تحط المحتوى في المكان اللي أنت عايزه
            alignment: Alignment.centerRight, // <--- النص هيكون على اليمين زي الصورة
            child: Text(
              option,
            ),
          ),
        );
      }).toList(),
    );

    if (selectedItem != null) {
      if(context.mounted){
        context.read<DropdownCubit>().selectItem(selectedItem);
        final selectedIndex = options.indexOf(selectedItem);
        context.read<RequestCubit>().changePage(selectedIndex);
      }
    }


  }
}