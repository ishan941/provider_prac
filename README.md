# Prov - Flutter Firebase App

A comprehensive Flutter application demonstrating state management with Provider pattern and Firebase integration for authentication and data storage.

## 🚀 Features

- **Counter App**: Interactive counter with Provider state management
- **Task Management**: Create, read, update, and delete tasks
- **User Authentication**: Sign up and login functionality with Firebase Auth
- **Cloud Storage**: Data persistence using Cloud Firestore
- **Provider Pattern**: Clean state management architecture
- **Custom Widgets**: Reusable UI components

## 📱 Screenshots

_Add your app screenshots here_

## 🛠️ Technologies Used

- **Flutter**: Cross-platform mobile development framework
- **Firebase Auth**: User authentication service
- **Cloud Firestore**: NoSQL document database
- **Provider**: State management solution
- **Dart**: Programming language

## 📋 Prerequisites

Before running this project, make sure you have:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (latest stable version)
- [Dart SDK](https://dart.dev/get-dart) (comes with Flutter)
- [Node.js](https://nodejs.org/) (for Firebase CLI)
- Android Studio / Xcode for mobile development
- A Firebase project set up

## 🔧 Installation & Setup

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/prov.git
cd prov
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Change Package Name (Required for Play Store)

```bash
flutter pub run change_app_package_name:main com.nextstep.app
```

_Replace `com.nextstep.app` with your desired package name_

### 4. Install Firebase CLI

Install Node.js dependencies:

```bash
npm install -g npm
npm install -g firebase-tools@latest
```

**For macOS users, use:**

```bash
sudo npm install -g firebase-tools@latest
```

**For Windows users:**

1. Open PowerShell as Administrator
2. Run: `Set-ExecutionPolicy RemoteSigned`
3. Press Y and Enter to confirm

### 5. Install FlutterFire CLI

```bash
dart pub global activate flutterfire_cli
```

Add Dart global packages to your PATH:

- **Windows**: Add `C:\Users\[USERNAME]\AppData\Local\Pub\Cache\bin` to system variables
- **macOS/Linux**: Usually automatically added to PATH

### 6. Firebase Authentication

```bash
firebase login
```

### 7. Configure FlutterFire

```bash
flutterfire configure --project=your-firebase-project-id
```

_Replace `your-firebase-project-id` with your actual Firebase project ID_

### 8. Add Firebase Dependencies

```bash
flutter pub add firebase_core
flutter pub add firebase_auth
flutter pub add cloud_firestore
```

## 🔥 Firebase Setup

### 1. Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project
3. Add your iOS and/or Android app

### 2. Download Configuration Files

**For Android:**

- Download `google-services.json`
- Place it in `android/app/google-services.json`

**For iOS:**

- Download `GoogleService-Info.plist`
- Add it to your Xcode project in the `Runner` folder

### 3. Configure Android

Update `android/build.gradle`:

```gradle
dependencies {
    classpath 'com.google.gms:google-services:4.3.15'
}
```

Update `android/app/build.gradle`:

```gradle
apply plugin: 'com.google.gms.google-services'
```

### 4. Initialize Firebase in main.dart

```dart
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
```

## 🏗️ Project Structure

```
lib/
├── main.dart                 # App entry point
├── counter_app.dart         # Counter application
├── counter_app2.dart        # Alternative counter implementation
├── counter_provider.dart    # Counter state management
├── enum.dart               # Application enums
├── firebase_options.dart   # Firebase configuration
├── login/                  # Authentication module
│   ├── login_page.dart
│   ├── login_provider.dart
│   ├── signup_page.dart
│   └── signup_provider.dart
├── task_app/              # Task management module
│   ├── task_app.dart
│   └── task_app_provider.dart
└── widgets/               # Reusable widgets
    └── custom_text_form_field.dart
```

## 🚀 Running the App

1. Connect your device or start an emulator
2. Run the application:

```bash
flutter run
```

For specific platforms:

```bash
flutter run -d android    # For Android
flutter run -d ios        # For iOS
```

## 🧪 Testing

Run unit tests:

```bash
flutter test
```

## 📚 Key Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^3.5.0
  firebase_auth: ^5.2.0
  cloud_firestore: ^4.17.5
  provider: ^6.1.2
```

## 🔗 Useful Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Firebase for Flutter](https://firebase.flutter.dev/)
- [Provider Documentation](https://pub.dev/packages/provider)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)

## 🤝 Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Your Name**

- GitHub: [@yourusername](https://github.com/yourusername)
- Email: your.email@example.com

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase team for the backend services
- Provider package maintainers

---

⭐ Don't forget to star this repository if you found it helpful!
