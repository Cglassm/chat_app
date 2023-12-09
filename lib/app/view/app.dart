import 'package:chat_app/app_theme/app_theme.dart';
import 'package:chat_app/l10n/l10n.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:media_picker/media_picker.dart';

class App extends StatelessWidget {
  const App({
    required MediaPicker mediaPicker,
    required ChatRepository chatRepository,
    required GoRouter router,
    super.key,
  })  : _mediaPicker = mediaPicker,
        _chatRepository = chatRepository,
        _router = router;

  final MediaPicker _mediaPicker;
  final ChatRepository _chatRepository;
  final GoRouter _router;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final mediaQueryTextScaleFactor = MediaQuery.textScaleFactorOf(context);
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _mediaPicker),
        RepositoryProvider.value(value: _chatRepository),
      ],
      child: BlocProvider(
        create: (context) => AppThemeBloc(
          appTheme: isDarkMode ? AppTheme.dark : AppTheme.light,
        ),
        child: MediaQuery(
          data: mediaQueryTextScaleFactor > 1.5
              ? mediaQuery.copyWith(
                  textScaleFactor: 1.5,
                )
              : mediaQuery,
          child: AppView(
            router: _router,
          ),
        ),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    required this.router,
    super.key,
  });

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    final appTheme = context.select((AppThemeBloc bloc) => bloc.state.theme);

    return MaterialApp.router(
      theme: appTheme.theme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: router,
    );
  }
}
