import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/manager/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookly/features/home/presentation/manager/popular_books_cubit/popular_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Get single instance of HomeRepoImpl using singleton pattern
    final homeRepo = HomeRepoImpl();
    
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsetBooksCubit(homeRepo)),
        BlocProvider(create: (context) => PopularBooksCubit(homeRepo)..fetchPopularBooks()),
      ],
        child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
