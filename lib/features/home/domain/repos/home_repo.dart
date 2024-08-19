import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';

abstract class HomeRepo{
  Future<List<BookEntity>> fetchFeatureBooks();
  Future<List<BookEntity>> fetchNewestBooks();

}