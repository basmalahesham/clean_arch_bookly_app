import 'package:clean_arch_bookly_app/core/utils/app_router.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarBooksListView extends StatefulWidget {
  const SimilarBooksListView(
      {super.key, required this.books, required this.model});

  final List<BookEntity> books;
  final Model model;

  @override
  State<SimilarBooksListView> createState() => _SimilarBooksListViewState();
}

class _SimilarBooksListViewState extends State<SimilarBooksListView> {
  late final ScrollController _scrollController;
  var nextPage = 1;
  var isLoading = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async{
    var currentPosition = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxScrollLength) {
      if (!isLoading){
        isLoading = true;
        await BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
          category: widget.model.books[widget.model.index].category ?? '',
          pageNumber: nextPage++,
        );
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.kBookDetailsView,
                extra: Model(widget.books, index),
              );
            },
            child: CustomBookImage(
              imageUrl: widget.books[index].image ?? '',
            ),
          ),
        ),
      ),
    );
  }
}
