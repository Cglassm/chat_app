import 'package:chat_app/chat/chat.dart';
import 'package:chat_app/l10n/l10n.dart';
import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_picker/media_picker.dart';

class App extends StatelessWidget {
  const App({
    required MediaPicker mediaPicker,
    required ChatRepository chatRepository,
    super.key,
  })  : _mediaPicker = mediaPicker,
        _chatRepository = chatRepository;

  final MediaPicker _mediaPicker;
  final ChatRepository _chatRepository;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final mediaQueryTextScaleFactor = MediaQuery.textScaleFactorOf(context);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _mediaPicker),
        RepositoryProvider.value(value: _chatRepository),
      ],
      child: MediaQuery(
        data: mediaQueryTextScaleFactor > 1.5
            ? mediaQuery.copyWith(
                textScaleFactor: 1.5,
              )
            : mediaQuery,
        child: MaterialApp(
          theme: CHTheme().lightTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const ChatPage(),
        ),
      ),
    );
  }
}
