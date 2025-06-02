import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:essmohr/presentation/newDesign/feature/person/control/education_page/education_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/person/presentation/widget/tab_education/add_education_widget.dart';
import 'package:essmohr/presentation/newDesign/feature/person/presentation/widget/tab_education/all_education_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class EducationDataWidget extends StatelessWidget {
  EducationDataWidget({super.key});

  final List<Widget> page = [AllEducationWidget(), AddEducationWidget()];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EducationPageCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
        child:BlocBuilder<EducationPageCubit,int>(builder: (context, state) => SingleChildScrollView(
            child: page[state]),),
      ),
    );
  }
}


