import 'package:clean_arch_bookly_app/core/utils/app_router.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeatureBooksListView extends StatelessWidget {
  const FeatureBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.kBookDetailsView,
              );
            },
            child: const CustomBookImage(
              imageUrl: 'assets/images/test_image.png',
            ),
          ),
        ),
      ),
    );
  }
}
