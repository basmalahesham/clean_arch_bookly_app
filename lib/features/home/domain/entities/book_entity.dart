class BookEntity {
  final String? bookId;
  final String? image;
  final String? title;
  final String? authorName;
  final num? price;
  final num? rating;
  final num? count;

  BookEntity({
    this.image,
    this.title,
    this.authorName,
    this.price,
    this.rating,
    this.bookId,
    this.count,
  });
}
