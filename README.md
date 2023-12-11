# Mobile Challenge - Flutter

## Expanded Overview of App's Architecture

This chat application, created using Flutter, features a modular design based on the [Bloc (Business Logic Component) pattern](https://bloclibrary.dev/#/), enhancing codebase maintenance, scalability, and comprehension.

### Main Components

1. **`App`**: Serves as the app's entry point. Sets up [RepositoryProviders](https://pub.dev/documentation/flutter_bloc/latest/flutter_bloc/RepositoryProvider-class.html) and the [Application Theme](https://api.flutter.dev/flutter/material/ThemeData-class.html), adapting to the user's device settings. Includes the `AppView` widget, which forms the MaterialApp and determines the displayed content.
   1. **`AppThemeBloc`**: Manages theme transitions (light/dark) within the app, using events for theme changes and maintaining the current state.
   2. **`AppRouter`**: Manages navigation routes using [go_router](https://pub.dev/packages/go_router).
2. **`ChatBloc`**: Core of the app's logic, handling chat states like message sending/receiving, photo selection, and message deletion. Interfaces with `ChatRepository` for local storage operations.
   1. Automated responses are also managed here.
   2. Utilizes the [uuid](https://pub.dev/packages/uuid) package to create unique message IDs, enabling specific message functions and deletion.
3. **`ChatRepository`**: Abstracts storage operations (save, read, delete messages) using [path_provider](https://pub.dev/packages/path_provider) for local storage.
4. **`ChatPage` and `ChatView`**: UI components presenting the chat interface. `ChatPage` supplies a `ChatBloc` to `ChatView`, which displays messages and input bar.
5. The `utils` folder contains useful methods for app-wide use.

### Key Features

- **Theme Management**: Toggles light and dark modes using `AppThemeBloc`, aligning with the device's theme setting.
- **Chat Flow**: Supports message sending/viewing, image handling, and error management.
  - **Customized Bot Responses**: Adaptive bot responses based on user input.
  - **Quick Messages**: Predefined messages for efficient communication.
  - **Image Sending**: Supports camera and gallery images, with cropping functionality.
  - **Upcoming Audio Messages**: Placeholder for future audio messaging.
  - **Individual Message Deletion**: Enabled via long tap.
- **Data Persistence**: Local message storage using `ChatRepository`.
- **Reusable UI Components**: The `ui_package` folder contains customizable UI components.

## Instructions for Building and Running the App Locally

1. Clone the project:
   ```jsx
   cd packages/chat_app_ui
   ```
   ```jsx
   fvm flutter pub get
   ```
   ```jsx
   cd gallery/
   ```
   ```jsx
   fvm flutter pub get
   ```
   ```jsx
   cd ..
   cd ..
   ```
   ```jsx
   cd chat_repository/
   ```
   ```jsx
   fvm flutter pub get
   ```
2. Open in Visual Studio Code.
3. Resolve dependencies using `fvm flutter pub get` (or `flutter pub get` if fvm is not installed).
4. Navigate through the project directories to resolve any folder-specific dependencies.
5. Use the “Run and Debug” feature in VSCode to start the app.

## Development Assumptions

- English communication.
- Snackbar notifications for reporting.
- Familiarity with standard chat app interfaces.
- Modular code design for scalability.

## List of Known Bugs

Currently, no bugs reported. Contact [carglassm@gmail.com](mailto:carglassm@gmail.com) for bug reporting.

## Suggestions for Potential Features

- Date-wise conversation history.
- Bulk message deletion.
- Message search feature.
- Favorite messages marking.
- Login/Sign-up functionality.
- Automatic message translation.
