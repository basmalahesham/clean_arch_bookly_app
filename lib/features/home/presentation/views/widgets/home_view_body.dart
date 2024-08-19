import 'package:clean_arch_bookly_app/core/utils/styles.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/feature_books_list_view.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: CustomAppBar(),
              ),
              FeatureBooksListView(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  'Newest Books',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: NewestBooksListView(),
          ),
        ),
      ],
    );
  }
}

