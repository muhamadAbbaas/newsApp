// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business.dart';
import 'package:news_app/modules/science.dart';
import 'package:news_app/modules/sports.dart';
import 'package:news_app/shared/networks/local/cache_helper.dart';
import 'package:news_app/shared/networks/remote/dio_helper.dart';

part 'news_app_state.dart';

class NewsAppCubit extends Cubit<NewsAppState> {
  NewsAppCubit() : super(NewsAppInitial());
  static NewsAppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'science',
    ),
  ];

  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];

  void changeNavBarItems(int index) {
    currentIndex = index;
    emit(ChangeNavBarItems());
  }

  List<dynamic> businessList = [];
  List<dynamic> sportsList = [];
  List<dynamic> scienceList = [];

  void getBusinessData() {
    emit(LoadingData());
    DioHelper.getDate(
      url: 'api/v4/top-headlines',
      query: {
        'country': 'eg',
        'category': 'world',
        'apikey': '3c91debb3199f5558da4f42fd7d23e17',
      },
    ).then((value) {
      businessList = value.data['articles'];
      print(businessList.length);
      emit(DataLoadedSuccsessfully());
    }).catchError((err) {
      print(err);
      emit(ErrorOnDataLoad());
    });
  }

  void getSportsData() {
    emit(LoadingData());
    DioHelper.getDate(
      url: 'api/v4/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apikey': '3c91debb3199f5558da4f42fd7d23e17',
      },
    ).then((value) {
      sportsList = value.data['articles'];
      print(sportsList.length);
      emit(DataLoadedSuccsessfully());
    }).catchError((err) {
      print(err);
      emit(ErrorOnDataLoad());
    });
  }

  void getScienceData() {
    emit(LoadingData());
    DioHelper.getDate(
      url: 'api/v4/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apikey': '3c91debb3199f5558da4f42fd7d23e17',
      },
    ).then((value) {
      scienceList = value.data['articles'];
      print(scienceList.length);
      emit(DataLoadedSuccsessfully());
    }).catchError((err) {
      print(err);
      emit(ErrorOnDataLoad());
    });
  }

  bool isDark = false;

  void changeAppMode({bool? checkGetter}) {
    if (checkGetter != null) {
      isDark = checkGetter;
      emit(ChangeAppModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(ChangeAppModeState());
      });
    }
  }
}
