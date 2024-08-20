import 'package:clean_arch_bookly_app/constants.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeatureBooks();
  List<BookEntity> fetchNewestBooks();
}
class HomeLocalDataSourceImpl extends HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeatureBooks() {
    var box = Hive.box<BookEntity>(kFeaturedBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }

}