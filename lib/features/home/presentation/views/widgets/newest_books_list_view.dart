import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: BookListViewItem(
        ),
      ),
    );
  }
}
