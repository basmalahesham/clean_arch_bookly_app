import 'package:bloc/bloc.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:meta/meta.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.similarBooksUseCase) : super(SimilarBooksInitial());
  final FetchSimilarBooksUseCase similarBooksUseCase;
  Future<void> fetchSimilarBooks(
      {required String category, int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(SimilarBooksLoading());
    } else {
      emit(SimilarBooksPaginationLoading());
    }
    var result = await similarBooksUseCase.call(category, pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(SimilarBooksFailure(failure.errMessage));
      } else {
        emit(SimilarBooksPaginationFailure(failure.errMessage));
      }
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
