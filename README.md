# LMS Learning App

A modern, highly interactive Learning Management System (LMS) built with Flutter and Firebase. 

This application provides a rich, responsive interface for users to browse courses, watch lessons, take quizzes, and track their progress over time. The app utilizes a clean architecture powered by Riverpod for state management.

## 🌟 Key Features

* **Authentication:** Secure Email/Password & Google Sign-In using Firebase Auth.
* **Dashboard:** Personalized greetings, progress overviews, and recent courses.
* **Course Exploration:** Search and filter through available courses with beautiful UI cards.
* **Interactive Lessons:** Video lessons with descriptions and resources.
* **Quizzes:** Built-in quiz system to test knowledge after completing modules.
* **User Profile:** Real-time stats on enrolled courses, completed lessons, and certificates.
* **Notifications:** Local & Push notifications for daily learning reminders, lesson alerts, and new course availability (powered by `flutter_local_notifications` & Firebase Cloud Messaging).
* **Dark/Light Mode:** Full theming support that adapts to system preferences or user choice.

## 🛠 Tech Stack

* **Framework:** [Flutter](https://flutter.dev/)
* **State Management:** [Riverpod](https://riverpod.dev/) (`hooks_riverpod`)
* **Backend / Database:** [Firebase](https://firebase.google.com/) (Auth, Firestore)
* **Routing:** `go_router`
* **Local Storage:** `shared_preferences`
* **Animations:** `flutter_animate`, `lottie`
* **Network Images:** `cached_network_image`

## 🚀 Getting Started

### Prerequisites

* Flutter SDK (v3.11.1 or higher)
* Dart SDK
* An active Firebase Project configured for Android, iOS, and Web.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/AnshikaMoudgil/lms-tensorik.git
   ```

2. Navigate to the project directory:
   ```bash
   cd lms-tensorik
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

*(Note: For Google Sign-In to work on Android, you must register your SHA-1 key in your Firebase Console. For Web, ensure you provide the correct Client ID.)*

## 📱 Build for Android (APK)

To build a release APK for Android devices:

```bash
flutter build apk --release
```
The output APK will be located in `build/app/outputs/flutter-apk/app-release.apk`.

---

*Designed and built with ❤️ using Flutter.*
