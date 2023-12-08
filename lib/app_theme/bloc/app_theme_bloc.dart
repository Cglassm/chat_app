import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_theme_event.dart';
part 'app_theme_state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc({required AppTheme appTheme})
      : super(AppThemeState.initial(appTheme)) {
    on<AppThemeToggled>(_onAppThemeToggled);
  }

  void _onAppThemeToggled(
    AppThemeToggled event,
    Emitter<AppThemeState> emit,
  ) {
    if (state.theme.isLightMode) {
      emit(state.copyWith(theme: AppTheme.dark));
    } else {
      emit(state.copyWith(theme: AppTheme.light));
    }
  }
}
