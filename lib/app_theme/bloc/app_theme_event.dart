part of 'app_theme_bloc.dart';

abstract class AppThemeEvent extends Equatable {
  const AppThemeEvent();
}

class AppThemeToggled extends AppThemeEvent {
  const AppThemeToggled();

  @override
  List<Object> get props => [];
}
