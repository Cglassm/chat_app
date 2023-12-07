import 'package:chat_app/chat/chat.dart';
import 'package:chat_app/l10n/l10n.dart';
import 'package:chat_app_ui/chat_app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_picker/media_picker.dart';

class App extends StatelessWidget {
  const App({required MediaPicker mediaPicker, super.key})
      : _mediaPicker = mediaPicker;

  final MediaPicker _mediaPicker;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _mediaPicker),
      ],
      child: MaterialApp(
        theme: CHTheme().lightTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const ChatPage(),
      ),
    );
  }
}
