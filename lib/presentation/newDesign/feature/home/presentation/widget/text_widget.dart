
//import 'package:essmohr/presentation/newDesign/core/configure/extension/app_context_extension.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key, required this.title, this.overflow});

  final String title;

  final dynamic overflow;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: context.text.titleSmall); //AppTextStyle.nun14w400
  }
}