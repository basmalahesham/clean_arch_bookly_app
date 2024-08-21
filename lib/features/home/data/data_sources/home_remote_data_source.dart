import 'package:clean_arch_bookly_app/constants.dart';
import 'package:clean_arch_bookly_app/core/utils/api_service.dart';
import 'package:clean_arch_bookly_app/core/utils/function/save_books.dart';
import 'package:clean_arch_bookly_app/features/home/data/models/book_model.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeatureBooks();
  Future<List<BookEntity>> fetchNewestBooks();
  Future<List<BookEntity>> fetchSimilarBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeatureBooks() async {
    var data = await apiService.get(
        endPoint: 'volumes?q=subject:programming&Filtering=free-ebooks');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
        endPoint:
            'volumes?q=computer science&Filtering=free-ebooks&Sorting=newest');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kNewestBox);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks() async {
    var data = await apiService.get(
        endPoint:
            'volumes?q=subject:programming&Filtering=free-ebooks&Sorting=relevance');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kSimilarBox);

    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
