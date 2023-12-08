part of 'app_theme_bloc.dart';

enum AppTheme {
  light,
  dark;

  bool get isLightMode => this == AppTheme.light;
  bool get isDarkMode => this == AppTheme.dark;
}

class AppThemeState extends Equatable {
  const AppThemeState({required this.theme});

  const AppThemeState.initial(AppTheme theme) : this(theme: theme);

  final AppTheme theme;

  @override
  List<Object> get props => [theme];

  AppThemeState copyWith({AppTheme? theme}) {
    return AppThemeState(theme: theme ?? this.theme);
  }
}
