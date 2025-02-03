import 'package:clean_arch_bookly_app/core/utils/styles.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/similar_books_list_view_bloc_consumer.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key, required this.model});
  final Model model;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        SimilarBooksListViewBlocConsumer(
          model: model,
        ),
      ],
    );
  }
}
