// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/news_app_cubit.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsAppCubit.get(context);
        return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return newsListBuild(context, list.sportsList[index]);
          },
          separatorBuilder: (context, index) {
            return mySperator();
          },
          itemCount: list.sportsList.length,
        );
      },
    );
  }
}
