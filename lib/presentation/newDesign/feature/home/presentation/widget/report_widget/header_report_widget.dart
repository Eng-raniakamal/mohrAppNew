import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../application/app_prefs.dart';
import '../../../../../../../application/constants.dart';
import '../../../../../../../application/di.dart';
import '../../../../../../../domain/model/model.dart';
import '../../../../../../User/User_viewModel.dart';
import '../header_home_widget.dart';

class HeaderReportWidget extends StatelessWidget {
   HeaderReportWidget({
    super.key,
    required this.typeReport, this.widget,
  });

  final String? typeReport;
  final Widget? widget;
  final EmployeeViewModel _viewModel = instance<EmployeeViewModel>();
  //final EmployeeImageViewModel _imageViewModel = instance<EmployeeImageViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  Widget _getEmployeeDataWidget(EmployeeDataModel? userData) {

    if (userData != null) {
      var empData = userData.userDataModel;
      Constants.canUpload = empData.masterImage["CanUploadMasterImage"];
     // canEditImage = empData.masterImage["CanUploadMasterImage"];
      String name = _appPreferences.getLanguage() == "en"
          ? empData.EnglishName
          : empData.ArabicName;
      // String email = empData.UserName.toString();
      // String code = empData.EmployeeCode.toString();

      return Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderHomeWidget(title: name),
          // Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: colorManager.white)),
          // const SizedBox(height: 3),
          // Text(email, style: const TextStyle(color: colorManager.white)),
          // const SizedBox(height: 3),
          // Text(code, style: const TextStyle(color: colorManager.white)),
        ],
      );
    }
    return Container();

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 21.0).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset("assets/images/NewDesign/image/home/report_icon.svg"),
              SizedBox(width: 8.h),
              Text(typeReport ?? "", style: AppTextStyle.iBMP12w700),
            ],
          ),
          widget!=null? Icon(Icons.arrow_forward_outlined):SizedBox(),
        ],
      ),
    );
  }
}
