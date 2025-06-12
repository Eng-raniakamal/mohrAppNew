import '../../../../core/utils/import_file.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DropdownCubit extends Cubit<String?> {
  DropdownCubit() : super(null);

  void selectItem(String item) => emit(item);
}


class DropdownPage extends StatelessWidget {
  static final List<String> items = [
    "طلب اداري",
    "طلب اذن",
    "طلب إضافي",
    "ساعات عمل شهري",
    "طلب سلفة",
    "طلب مالي",
    "طلب مأمورية",
  ];

  const DropdownPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DropdownCubit(),
      child: Center(
        child: BlocBuilder<DropdownCubit, String?>(
          builder: (context, selectedItem) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(

                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  underline: SizedBox(),
                  // لإزالة الخط السفلي
                  value: selectedItem,
                  hint: Text("اختر نوع الطلب"),
                  items: items.map((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      context.read<DropdownCubit>().selectItem(value);
                    }
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

