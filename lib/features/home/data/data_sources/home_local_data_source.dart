import 'package:clean_arch_bookly_app/constants.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeatureBooks({int pageNumber = 0});
  List<BookEntity> fetchNewestBooks();
  List<BookEntity> fetchSimilarBooks();

}
class HomeLocalDataSourceImpl extends HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeatureBooks({int pageNumber = 0}){
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kFeaturedBox);
    int length = box.values.length;
    if(startIndex>=length || endIndex>length){
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchSimilarBooks() {
    var box = Hive.box<BookEntity>(kSimilarBox);
    return box.values.toList();
  }

}