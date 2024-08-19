import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

class BookSAction extends StatelessWidget {
  const BookSAction({super.key,});

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
                //launchCustomUrl(context, bookModel.volumeInfo.previewLink);
              },
              text: 'Free Preview',
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

  /*String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return "Not Available";
    } else {
      return 'Free Preview';
    }
  }*/
}
