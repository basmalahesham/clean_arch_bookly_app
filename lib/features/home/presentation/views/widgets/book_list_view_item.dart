import 'package:clean_arch_bookly_app/core/utils/app_router.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.kBookDetailsView,
        );
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            const CustomBookImage(imageUrl: 'assets/images/test_image.png'),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      'bookModel.volumeInfo.title!',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGtSectraFire,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    '?? ',
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const BookRating(
                        rating: 0,
                        count: 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
