import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:essmohr/presentation/newDesign/feature/layout/export_Layout_file.dart';
import '../../../../../../../application/app_prefs.dart';
import '../../../../../../../application/constants.dart';
import '../../../../../../../application/di.dart';
import '../../../../../../../domain/model/model.dart';

class VacationCarouselWidget extends StatefulWidget {
  const VacationCarouselWidget({super.key});

  @override
  State<VacationCarouselWidget> createState() => _VacationCarouselWidgetState();
}

class _VacationCarouselWidgetState extends State<VacationCarouselWidget> {
  final PageController _pageController = PageController(viewportFraction: 0.65);
  double _currentPage = 0.0;
  late Future<List<VacationsType>> _vacationTypesFuture;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  void initState() {
    super.initState();
    _vacationTypesFuture = getVacationType();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0.0;
      });
    });
  }

  Future<List<VacationsType>> getVacationType() async {
    try {
      final cachedData = await _appPreferences.getCachedVacationTypes();
      final cachedTime = await _appPreferences.getVacationTypesCacheTime();
      final now = DateTime.now();

      if (cachedData != null &&
          cachedTime != null &&
          now.difference(cachedTime).inMinutes < 35) {
        final List<dynamic> jsonList = jsonDecode(cachedData);
        return jsonList.map((e) => VacationsType.fromJson(e)).toList();
      }

      final userId = await _appPreferences.getUserToken();
      final response = await http.get(
        Uri.parse(Constants.vacationTypeUrl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'userId': userId!,
        },
      ).timeout(const Duration(seconds: 15));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        await _appPreferences.saveCachedVacationTypes(jsonEncode(data));
        await _appPreferences.setVacationTypesCacheTime(now);

        return data.map((json) => VacationsType.fromJson(json)).toList();
      } else {
        throw Exception('فشل تحميل أنواع الإجازات');
      }
    } catch (e) {
      throw Exception('حدث خطأ أثناء تحميل أنواع الإجازات: $e');
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<VacationsType>>(
      future: _vacationTypesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("خطأ: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("لا توجد أنواع إجازات"));
        }

        final vacations = snapshot.data!;

        return SizedBox(
          height: 250,
          child: PageView.builder(
            controller: _pageController,
            itemCount: vacations.length,
            itemBuilder: (context, index) {
              final scale = max(0.85, 1 - (_currentPage - index).abs() * 0.2);
              final vacation = vacations[index];

              return Transform.scale(
                scale: scale,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: AppColor.primary,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            vacation.name.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Text('الرصيد المتاح: ${vacation.balance}', style: const TextStyle(
                            //fontSize: 20,
                           // fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),),
                          Text('الرصيد الكلى: ${vacation.limit}', style: const TextStyle(
                           // fontSize: 20,
                            //fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}