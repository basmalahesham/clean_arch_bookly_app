import 'package:clean_arch_bookly_app/core/utils/function/launch_url.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

class BookSAction extends StatelessWidget {
  const BookSAction({super.key, required this.model,});
  final Model model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              text: '19.99€',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () {
                launchCustomUrl(context, model.books[model.index].previewLink);
              },
              text: getText(model),
              fontSize: 16,
              backgroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getText(Model bookModel) {
    if (model.books[model.index].previewLink == null) {
      return "Not Available";
    } else {
      return 'Free Preview';
    }
  }
}
