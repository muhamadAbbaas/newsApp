// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/layouts/home_layout.dart';
import 'package:news_app/shared/cubit/news_app_cubit.dart';
import 'package:news_app/shared/networks/local/cache_helper.dart';
import 'package:news_app/shared/networks/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');
  runApp(MyApp(isDark!));
}

class MyApp extends StatelessWidget {
  bool isDark;
  MyApp(this.isDark, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NewsAppCubit()
          ..getBusinessData()
          ..getSportsData()
          ..getScienceData()
          ..changeAppMode(checkGetter: isDark),
        child: BlocConsumer<NewsAppCubit, NewsAppState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsAppCubit.get(context);
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                textTheme: const TextTheme(
                  bodyMedium: TextStyle(
                    color: Colors.black,
                  ),
                ),
                primarySwatch: Colors.deepOrange,
                appBarTheme: const AppBarTheme(
                  actionsIconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                ),
                scaffoldBackgroundColor: Colors.white,
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.white,
                ),
              ),
              darkTheme: ThemeData(
                textTheme: const TextTheme(
                  bodyMedium: TextStyle(
                    color: Colors.white,
                  ),
                ),
                primarySwatch: Colors.deepOrange,
                appBarTheme: AppBarTheme(
                  actionsIconTheme: const IconThemeData(
                    color: Colors.white,
                  ),
                  backgroundColor: HexColor('333739'),
                  elevation: 0.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('333739'),
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  titleTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: const IconThemeData(
                    color: Colors.white,
                  ),
                ),
                scaffoldBackgroundColor: HexColor('333739'),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: HexColor('333739'),
                  unselectedItemColor: Colors.grey,
                ),
              ),
              themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
              home: const HomeLayout(),
            );
          },
        ));
  }
}
