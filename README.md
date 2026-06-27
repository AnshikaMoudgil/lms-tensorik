# LearnFlow - LMS Learning App

LearnFlow is a modern, interactive Learning Management System (LMS) built with Flutter and Firebase. It features a clean, responsive UI with a premium dark/light mode experience, AI-generated quizzes, interactive lessons, and real-time user progress tracking.

## 🚀 Project Setup Instructions

### Prerequisites
- **Flutter SDK**: ^3.24.0 (Ensure you are on the stable channel)
- **Dart SDK**: ^3.5.0
- **Android Studio** (for Android deployment)
- **Firebase Project** (Configure a Firebase project and add `google-services.json` for Android)

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/AnshikaMoudgil/lms-tensorik.git
   cd lms-tensorik
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run Code Generation (for Freezed & Riverpod models):
   ```bash
   dart run build_runner build -d
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## 🛠 Technologies Used
- **Framework**: Flutter (Dart)
- **Backend & Authentication**: Firebase (Auth, Firestore)
- **State Management**: Riverpod (`hooks_riverpod`, `flutter_riverpod`)
- **Navigation**: GoRouter
- **Architecture**: Clean Architecture + MVVM

## 📂 Folder Structure Overview
The project follows a **Feature-First Clean Architecture** for scalability and maintainability:

```text
lib/
├── core/                   # Shared utilities, theme, constants, and global widgets
│   ├── constants/          # App sizes, colors, text styles
│   ├── theme/              # Light and Dark theme configurations
│   ├── utils/              # Helper functions, router config
│   └── widgets/            # Reusable UI components (buttons, text fields)
├── features/               # Independent feature modules
│   ├── auth/               # Login, Sign up, Splash, User Auth logic
│   ├── course/             # Course browsing, details, enrollment
│   ├── dashboard/          # Home screen, category grid, bottom navigation
│   ├── lesson/             # Video lessons, text content, progress tracking
│   ├── profile/            # User profile, statistics, settings
│   └── quiz/               # AI-generated quizzes, final assessment, certificates
└── main.dart               # App entry point & Firebase initialization
```
Each feature inside `lib/features/` is further divided into:
- `presentation/`: Views, ViewModels, and Providers.
- `domain/`: Data models and repositories interfaces.
- `data/`: Repositories implementations and network services.

## ⚠️ Assumptions or Limitations
- **Android-Only Deployment**: Platform folders for iOS, Web, macOS, Linux, and Windows have been intentionally removed to restrict the build to Android.
- **AI Quizzes**: The AI Quiz generation depends on an external AI service which requires an internet connection and a valid API configuration.
- **Video Playback**: The current video player implementation assumes valid network URLs for video streaming.
- **Authentication**: Users must register/login to track progress and enroll in courses. Guest mode is not fully persistent.

## 📦 Third-Party Libraries Used
- `flutter_riverpod` & `hooks_riverpod`: Reactive caching and state management.
- `firebase_core`, `firebase_auth`, `cloud_firestore`: Backend database and authentication.
- `go_router`: Declarative routing and deep linking.
- `freezed_annotation` & `json_annotation`: Immutable data models and JSON serialization.
- `cached_network_image`: Efficient image caching.
- `flutter_animate` & `shimmer`: Beautiful UI animations and loading states.
- `shared_preferences`: Local storage for theme and simple preferences.
- `uuid`: Unique identifier generation.
