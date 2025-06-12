import 'import_file.dart';

class VacationScreen extends StatelessWidget {
  const VacationScreen({super.key});

  static final List<Widget> body = [
    const NoVacationWidget(),
    const VacationRequestWidget(),
    const BodyTabWidget(),
    VacationDetailsWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<VacationCubit>()),
        BlocProvider(create: (context) => VacationTabCubit()),
        BlocProvider(create: (context) => sl<VacationTypeCubit>()..fetchVacationTypes()),
        BlocProvider(create: (context) => sl<DefaultReviewerCubit>()),
        BlocProvider(create: (context) => sl<PostVacationCubit>()),
        BlocProvider(create: (context) => sl<CalculateVacationDurationCubit>()),
        BlocProvider(create: (context) => sl<DateCubit>()),
        BlocProvider(create: (context) => sl<ValidateVacationCubit>()),
        BlocProvider(create: (context) => sl<CheckHandledAlertsCubit>()),
      ],
      child: BlocBuilder<VacationCubit, int>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0).r,
            child: SingleChildScrollView(child: body[state]),
          );
        },
      ),
    );
  }
}
