//import 'package:cached_network_image/cached_network_image.dart';
import 'package:essmohr/presentation/newDesign/core/utils/import_file.dart';

import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/default_reviewer/default_reviewer_cubit.dart';
import 'package:essmohr/presentation/newDesign/feature/vacation/presentation/control/default_reviewer/default_reviewer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../vacation/data/model/default_reviewer/default_reviewer_model.dart';

class ListReviewerWidget extends StatelessWidget {
  const ListReviewerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context).textTheme;
    return
    SizedBox(
      height: context.height*0.13,
      child:

      BlocBuilder<DefaultReviewerCubit, DefaultReviewerState>(
        builder: (context, state) {
          final defaultReviewerState = context.watch<DefaultReviewerCubit>().state;

          List <DefaultReviewerModel> list = defaultReviewerState.reviewers;
          if (defaultReviewerState.isLoading) {
            return Center(child: Center(child: CircularProgressIndicator()));
          }

            if (defaultReviewerState.errorMessage != null) {
            return Center(child: Text(defaultReviewerState.errorMessage!));
          }
            if (defaultReviewerState.reviewers.isEmpty) {
            return Center(child: Text("لا توجد مؤاجعين متاحة"));
          }

            return
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: list.length,
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemBuilder: (context, index) {
                final reviewer = list[index];
                return Row(
                  textDirection: TextDirection.rtl,
                  children: [

                    // CachedNetworkImage(
                    //   imageUrl: "https://mohrapi.azurewebsites.net/Content/Images/employeeIcon.png",
                    //   imageBuilder: (context, imageProvider) => CircleAvatar(
                    //     radius: 24.r,
                    //     backgroundImage: imageProvider,
                    //   ),
                    //   placeholder: (context, url) => Center(child: Text("جارى تحميل الصورة")),
                    //   errorWidget: (context, url, error) => CircleAvatar(
                    //     radius: 24.r,
                    //     backgroundImage: AssetImage('assets/images/NewDesign/image/request/user.png'),
                    //   ),
                    // ),






                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          reviewer.id.toString()??"645533",
                          style: theme.titleSmall,
                        ),
                        Text(
                          reviewer.name??"لاسما",
                          style: theme.titleLarge,
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  CircleAvatar(
                    radius: 24.r,
                    backgroundImage: AssetImage('assets/images/NewDesign/image/request/user.png'), // غير المسار حسب صورتك
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '645533',
                        style: theme.titleSmall,
                      ),
                      Text(
                        'محمد فتحى محمد',
                        style: theme.titleLarge,
                      ),
                    ],
                  ),
                ],
              );



        },
      )
    );





  }
}
