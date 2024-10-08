import 'package:clean_arch_bookly_app/core/utils/service_locator.dart';
import 'package:clean_arch_bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/home_view.dart';
import 'package:clean_arch_bookly_app/features/search/presentation/views/search_view.dart';
import 'package:clean_arch_bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            FetchSimilarBooksUseCase(
              getIt.get<HomeRepoImpl>(),
            ),
          ),
          child: BookDetailsView(
            model: state.extra as Model,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
