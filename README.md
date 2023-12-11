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
  To test this feature:
      1. Go to device settings.
      2. Change the theme.
      3. Return to the app and restart it.
- **Chat Flow**: Supports message sending/viewing, image handling, and error management.
  - **Customized Bot Responses**: An adaptive bot response system based on the user's message content. For example, if a user sends "Hello," the bot responds with "Hello, how can I help?".
  - **Quick Messages**: Users can quickly send predefined messages via a scrollable horizontal chip list, enhancing communication efficiency.
  - **Default bot response**: The default bot response is "Message received!" but functionality allows varying responses based on message context or adding new potential responses.
  - **Image Sending**: Supports camera and gallery images, with cropping functionality.
     - Uses **`MediaPicker`** for selecting and cropping images, integrated with `CropperService` and `ImagePicker`.
       - Camera access functionality is testable only on an Android simulator or physical Android device, as the Xcode simulator does not support camera functionality.
       - The same applies to email access from the **`Support`** button.
     - Option to crop the selected image using **`CropperService`** with the [image_cropper](https://pub.dev/packages/image_cropper) package.
     - **`ImagePicker`** allows users to select images from their gallery or take photos with the device camera.
     - Users can cancel sending an image by pressing the “X” button.
  - **Upcoming Audio Messages**: Placeholder in the input bar for future audio messaging. Pressing on that icon informs users that this feature is upcoming.
  - **Individual Message Deletion**: Enabled via long tap.
- **Data Persistence**: Local message storage using `ChatRepository` with the `path_provider` package.
- **Reusable UI Components**: The `ui_package` folder contains customizable UI components used across the app, with plans for future common components.

## Instructions for Building and Running the App Locally

1. Clone the project:
   ```jsx
   git clone https://github.com/Cglassm/chat_app.git
   ```
2. Open in Visual Studio Code.
3. Resolve dependencies using `fvm flutter pub get` (or `flutter pub get` if fvm is not installed).
4. Navigate through the project directories to resolve any folder-specific dependencies.
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
5. Use the “Run and Debug” feature in VSCode to start the app.
6. Pressing on the green triangle at the top and run the app by choosing “Launch development” or “Launch production,” selecting your connected device.

## Development Assumptions

- Users will communicate in English.
- Snackbar notifications are sufficient for error and success reporting.
- The modular code structure, including Bloc usage, indicates a design aimed at scalability and maintenance.
- Users are familiar with chat app UIs (like [WhatsApp](https://www.whatsapp.com/?lang=es_LA)) and can navigate various app functionalities like sending images, typing long texts, and deleting a message with a long press.

## List of Known Bugs

Currently, no bugs reported. Contact [carglassm@gmail.com](mailto:carglassm@gmail.com) for bug reporting.

## Suggestions for Potential Features

- Saving conversations in a date-wise history to avoid scrolling to the top to find older messages.
- Bulk message deletion.
- Message search feature.
- Favorite messages marking.
- Login/Sign-up functionality.
- Automatic message translation.
