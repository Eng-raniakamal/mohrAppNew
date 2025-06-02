import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/person/control/page_cubit/page_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/person/presentation/widget/tab_info_data/next_page_data_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/person/presentation/widget/tab_info_data/page_one_of_info_data_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoDataWidget extends StatelessWidget {
   InfoDataWidget({super.key});

 final List<Widget> page = [PageOneOfInfoDataWidget(), NextPageDataWidget()];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageCubit(),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16).r,
        child: BlocBuilder<PageCubit, int>(
          builder: (context, state) {
            return page[state];
          },
        ),
      ),
    );
  }
}



