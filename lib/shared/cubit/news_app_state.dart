part of 'news_app_cubit.dart';

@immutable
sealed class NewsAppState {}

final class NewsAppInitial extends NewsAppState {}

class ChangeNavBarItems extends NewsAppState {}

class DataLoadedSuccsessfully extends NewsAppState {}

class ErrorOnDataLoad extends NewsAppState {}

class LoadingData extends NewsAppState {}

class ChangeAppModeState extends NewsAppState {}
