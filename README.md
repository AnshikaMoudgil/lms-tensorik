# LMS Learning App

A modern, highly interactive Learning Management System (LMS) built with Flutter and Firebase. 

This application provides a rich, responsive interface for users to browse courses, watch lessons, take quizzes, and track their progress over time. The app utilizes a clean feature-first architecture powered by Riverpod for state management.

---

## 🛠 Technologies & Third-Party Libraries Used

### Core Technologies
* **Framework:** [Flutter](https://flutter.dev/) (SDK ^3.11.1)
* **Language:** Dart
* **Backend:** [Firebase](https://firebase.google.com/)

### Third-Party Packages
* **State Management:** `flutter_riverpod`, `hooks_riverpod`, `flutter_hooks`
* **Backend Services:** `firebase_core`, `firebase_auth`, `cloud_firestore`
* **Authentication:** `google_sign_in`
* **Routing:** `go_router`
* **Notifications:** `flutter_local_notifications`, `firebase_messaging`, `timezone`, `flutter_timezone`
* **UI/Animation:** `flutter_animate`, `lottie`, `shimmer`, `cached_network_image`, `cupertino_icons`
* **Utilities:** `shared_preferences`, `connectivity_plus`, `intl`, `equatable`, `uuid`
* **Code Generation:** `freezed`, `json_serializable`, `build_runner`

---

## 🚀 Project Setup Instructions

### Prerequisites
1. **Flutter SDK** (v3.11.1 or higher) installed and configured on your path.
2. **Dart SDK** installed.
3. An active Firebase Project configured for Android, iOS, and Web.
4. Android Studio or VS Code for development.

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/AnshikaMoudgil/lms-tensorik.git
   cd lms-tensorik
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Firebase Configuration:**
   * Make sure you have `google-services.json` placed inside `android/app/` if testing Android natively.
   * Make sure `firebase_options.dart` exists in `lib/`.

4. **Run the App:**
   ```bash
   flutter run
   ```

### Building for Release (Android APK)

To build a release APK for Android devices:

```bash
flutter build apk --release
```
The output APK will be located in `build/app/outputs/flutter-apk/app-release.apk`.

---

## 📂 Folder Structure Overview

The project strictly follows a **Feature-First Architecture** inside the `lib/` directory:

```text
lib/
├── core/                        # Core application utilities and shared logic
│   ├── constants/               # Colors, sizes, and global UI constants
│   ├── services/                # Device-level services (Notifications, API clients)
│   ├── theme/                   # Light & Dark mode theme definitions
│   ├── utils/                   # Helper functions, routing logic, and data seeders
│   └── widgets/                 # Shared UI components (Animated buttons, cards)
├── features/                    # Independent feature modules
│   ├── auth/                    # Authentication (Login, Signup, Repositories)
│   ├── course/                  # Course discovery and details
│   ├── dashboard/               # Main user dashboard and progress tracking
│   ├── lesson/                  # Video lessons and course content delivery
│   ├── profile/                 # User settings, stats, and theme toggling
│   └── quiz/                    # Interactive quizzes and results logic
├── firebase_options.dart        # Auto-generated Firebase initialization config
└── main.dart                    # Application entry point
```
*Each feature folder typically contains its own `data/` (repositories, models) and `presentation/` (views, viewmodels, providers) directories to enforce separation of concerns.*

---

## ⚠️ Assumptions & Limitations

* **Web CORS:** When running on Flutter Web locally, some images/assets (like Google's CDN logo) may fail to load due to browser CORS policies. Native desktop/mobile apps do not face this limitation.
* **Google Sign-In on Android:** Google Sign-In requires your app's `SHA-1` and `SHA-256` fingerprints to be actively registered in the Firebase Console. The Web Client ID must also be explicitly provided or available via `google-services.json`.
* **Video Playback:** The app currently mocks or delegates heavy video lesson delivery depending on the mock backend data state. Production video hosting logic (e.g. AWS S3, Vimeo) is omitted in this scope.
* **Notifications:** Push notifications via FCM require a physical device on iOS, and appropriate permission granting on Android 13+. Local notifications are currently scheduled directly on the device.

---

*Designed and built with ❤️ using Flutter.*
