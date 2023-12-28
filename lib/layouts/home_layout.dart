import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:news_app/shared/cubit/news_app_cubit.dart";

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
            actions: [
              const IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                onPressed: cubit.changeAppMode,
                icon: const Icon(
                  Icons.brightness_4_rounded,
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items: cubit.items,
            onTap: (index) {
              cubit.changeNavBarItems(index);
            },
          ),
        );
      },
    );
  }
}
