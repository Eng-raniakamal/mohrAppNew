import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:essmohr/presentation/Requests/Vacations/view/vactionRequests_view.dart';
import 'package:essmohr/presentation/resources/routes.dart';
import 'package:flutter/material.dart';
import 'package:essmohr/application/di.dart';
import 'package:essmohr/domain/model/model.dart';
import 'package:essmohr/presentation/common/state_renderer/state_render_impl.dart';
import 'package:essmohr/presentation/resources/colors.dart';
import 'package:essmohr/presentation/resources/strings_manager.dart';
import 'package:essmohr/presentation/underConstraction.dart';
import 'package:essmohr/presentation/widgets/appbar_widget.dart';
import 'package:essmohr/presentation/widgets/navigator_bar.dart';
import 'package:essmohr/presentation/widgets/profile_widget.dart';
import '../../../../application/constants.dart';
import '../viewModel/vacationViewModel.dart';


double? allDays;
double? availableDays;
double? usedDays;
class vacationsView extends StatefulWidget {
  const vacationsView({Key? key}) : super(key: key);

  @override
  State<vacationsView> createState() => _vacationsViewState();
}


final items=<Widget>
[ const Icon(Icons.person,size: 30,),
  const Icon(Icons.home,size: 30,),
  const Icon(Icons.notifications,size: 30,),

];
class _vacationsViewState extends State<vacationsView> {

  final VacationViewModel _viewModel = instance <VacationViewModel>();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind() {
    _viewModel.start();
  }

  @override
  Widget build(BuildContext context) {

    return ThemeSwitchingArea(
        child: Builder(
            builder: (context) =>
                Scaffold(
                    appBar: buildAppBar(context),
                    bottomNavigationBar:NavigatorBar(index: 0,notificationNumber: Constants.notificationNumber,),

                    // ),
                    body:
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(

                          children: [ StreamBuilder<FlowState>(
                              stream: _viewModel.outputState,
                              builder: (context, snapshot) {
                                return
                                  snapshot.data?.getScreenWidget(
                                      context, _getContentWidget(),
                                          () {
                                        _viewModel.start();
                                      },
                                          () {
                                      }) ??
                                      _getContentWidget();
                                //Container();
                              }),
                            //  )
                          ] ),
                    ))));
  }

  Widget _getContentWidget() {
    return
      StreamBuilder<VacationViewObject>(
          stream: _viewModel.outputVacations,
          builder: (context, snapshot) {
            return
              SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*2,
                          child: Column(
                            children: [
                              const Padding(padding: EdgeInsets.only(top:50)),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children:[
                                    Column(
                                      children: [
                                        _getImageWidget(),
                                        //NumbersWidget(),
                                        const SizedBox(height: 10),
                                        SizedBox(height: 40,
                                            width: 150,

                                            child: FloatingActionButton(
                                              backgroundColor: colorManager.primary,//child widget inside this button
                                              shape:BeveledRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10)),
                                              onPressed: ()
                                              {
                                                // Navigator.push(
                                                //     context,
                                                Navigator.of(context).pushNamed(Routes.VacationRequest);

                                                // MaterialPageRoute(builder: (context) => const UnderConstructionScreen()));
                                              },
                                              child:Text(AppStrings.Vacation_Request.tr(),style: const TextStyle(color: colorManager.white),),)),
                                      ],
                                    ),
                                  ]),
                              SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: [
                                    Container(
                                        child: _getVacation(snapshot.data?.vacations)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          //  ),
                          //    ],
                          // ),
                        )]));
          }
        //))
      );
  }

  Widget _getVacation(List<Vacation>? vacations) {
    if (vacations != null) {
      allDays=_calculateAllDays(vacations);
      usedDays=_calculateUsedDays(vacations);
      availableDays =_calculateAvailableDays(vacations);
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(mainAxisAlignment:MainAxisAlignment.start,
          children: [
            Container(padding: EdgeInsets.fromLTRB(20,30,10,30),
                width: MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height,

                child:SingleChildScrollView(scrollDirection: Axis.horizontal,
                  child: DataTable(showBottomBorder: true,
                      headingRowColor: MaterialStateColor.resolveWith((states) => colorManager.primary),
                      columns:  [
                        DataColumn(label: Text(AppStrings.Vacation_Type.tr(),style: TextStyle(color: colorManager.white),)),
                        DataColumn(label: Text(AppStrings.Current.tr(),style: TextStyle(color: colorManager.white))),
                        DataColumn(label: Text(AppStrings.Transferred.tr(),style: TextStyle(color: colorManager.white))),
                        DataColumn(label: Text(AppStrings.Total.tr(),style: TextStyle(color: colorManager.white))),
                        DataColumn(label: Text(AppStrings.Consumed.tr(),style: TextStyle(color: colorManager.white))),
                        DataColumn(label: Text(AppStrings.Available.tr(),style: TextStyle(color: colorManager.white))),
                        DataColumn(label: Text(AppStrings.Pending.tr(),style: TextStyle(color: colorManager.white))),
                      ],
                      rows: vacations
                          .map((vacation) =>
                          DataRow(cells: [
                            DataCell(Text(vacation.vacationTypeName)),
                            DataCell(Text((vacation.vacationTypeDuration).toString())),
                            DataCell(Text((vacation.transferred).toString())),
                            DataCell(Text((vacation.total).toString())),
                            DataCell(Text((vacation.consumed).toString())),
                            DataCell(Text((vacation.available).toString())),
                            DataCell(Text((vacation.pending).toString())),
                          ]))
                          .toList()
                  ),
                )
            ),
          ],
        ),
      );


    }

    return Padding(padding: const EdgeInsets.all(25.0),
        child: Container());
  }
  Widget _getImageWidget() {

    return ProfileWidget(
        imagePath:  Constants.imagePath,
        onClicked: () {}
    );

  }

}

// DataTable _createVacationTable(List<Vacation> vacation) {
//   return DataTable(
//
//     columns: _createColumns(),
//     rows: _createRows(vacation),
//   );
// }
// List<DataColumn> _createColumns() {
//   return [
//       DataColumn(label: Text(AppStrings.Vacation_Type.tr())),
//       DataColumn(label: Text(AppStrings.Current.tr())),
//       DataColumn(label: Text(AppStrings.Transferred.tr())),
//       DataColumn(label: Text(AppStrings.Total.tr())),
//       DataColumn(label: Text(AppStrings.Consumed.tr())),
//       DataColumn(label: Text(AppStrings.Pending.tr()))
//         ];
//
// }
// List<DataRow> _createRows(List<Vacation> vacations) {
//
//     return vacations
//         .map((vacation) =>
//         DataRow(cells: [
//           DataCell(Text(vacation.vacationTypeName)),
//           DataCell(Text((vacation.vacationTypeDuration).toString())),
//           DataCell(Text((vacation.transferred).toString())),
//           DataCell(Text((vacation.total).toString())),
//           DataCell(Text((vacation.consumed).toString())),
//           DataCell(Text((vacation.pending).toString()))
//         ]))
//         .toList();
//
//
// }
double _calculateAllDays(List<Vacation> vacations)
{
  double all=0;
  vacations.map((e)=>(all+= e.total)).toList();

  String inString = all.toStringAsFixed(3);
  double inDouble = double.parse(inString);

  all=inDouble;

  return all;
}
double _calculateUsedDays(List<Vacation> vacations)
{
  double Used=0.0;
  vacations.map((e)=>(Used+= e.consumed)).toList();
  String inString = Used.toStringAsFixed(3);
  double inDouble = double.parse(inString);
  Used=inDouble;
  return Used;
}
double _calculateAvailableDays(List<Vacation> vacations)
{
  double Available=0.0;
  vacations.map((e)=>(Available+= e.available)).toList();
  String inString = Available.toStringAsFixed(3);
  double inDouble = double.parse(inString);
  Available=inDouble;
  return Available;
}
class NumbersWidget extends StatelessWidget {
  const NumbersWidget({super.key});

  @override
  Widget build(BuildContext context) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(context, AppStrings.Available.tr(), availableDays.toString()+AppStrings.days.tr()),
          buildDivider(),
          buildButton(context, AppStrings.All.tr(), allDays.toString()+AppStrings.days.tr()),
          buildDivider(),
          buildButton(context, AppStrings.Used.tr(), usedDays.toString()+AppStrings.days.tr()),
        ],
      );

  Widget buildDivider() =>
      const SizedBox(
        height: 24,
        child: VerticalDivider(),
      );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 2),
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ],
        ),
      );
}
