# Fitness Tracker - A Personal Workout & Progress Companion 💪

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
[![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)](https://firebase.google.com/)
[![Provider](https://img.shields.io/badge/Provider-State_Management-blue?style=for-the-badge)](https://pub.dev/packages/provider)

**Fitness Tracker** is a comprehensive, cross-platform mobile application built with Flutter and Firebase. It's designed to be an all-in-one personal fitness companion, helping users to set goals, follow structured workout plans, track their progress visually, and stay motivated on their fitness journey.

---

## 📖 Table of Contents

- [📌 Project Vision](#-project-vision)
- [✨ Feature Walkthrough](#-feature-walkthrough)
- [📸 Application Screenshots](#-application-screenshots)
- [🏛️ Architecture & State Management](#️-architecture--state-management)
- [🛠️ Technology Stack & Key Packages](#️-technology-stack--key-packages)
- [🗄️ Firebase Integration](#️-firebase-integration)
- [🚀 Getting Started](#-getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation & Firebase Setup](#installation--firebase-setup)
- [🤝 Contributing](#-contributing)

---

## 📌 Project Vision

The goal of this project is to provide users with a beautiful, intuitive, and feature-rich application that makes fitness tracking simple and effective. The app moves beyond simple calorie counting and offers a holistic approach to fitness by integrating workout planning, detailed exercise instructions, activity tracking, and visual progress monitoring. By leveraging a robust backend with Firebase, the app ensures that user data is secure, synchronized, and accessible anytime, anywhere.

---

## ✨ Feature Walkthrough

The application is packed with features designed to guide and support the user through every step of their fitness journey.

### 1. User Onboarding & Authentication
-   **Seamless Onboarding:** A multi-step, visually appealing onboarding process to introduce users to the app's features.
-   **Personalized Goal Setting:** Users can define their primary fitness goals (e.g., weight loss, muscle gain) during the initial setup.
-   **Secure Authentication:** A complete authentication flow with options for email/password sign-up and login, powered by Firebase Auth.
-   **Profile Completion:** A dedicated screen for users to enter personal details like gender, date of birth, weight, and height to personalize their experience.

### 2. Personalized Dashboard (`HomeView`)
-   **At-a-Glance Stats:** A central dashboard displaying key metrics like heart rate, water intake, and sleep patterns.
-   **Upcoming Workouts:** A section that highlights the user's next scheduled workout.
-   **Latest Activity:** A feed showing recent workout sessions and achievements.
-   **Customizable Targets:** Users can set and track daily targets.

### 3. Workout & Exercise Tracking
-   **Workout Library (`WorkoutTrackerView`):** A collection of pre-defined workout plans (e.g., Full Body, Lower Body).
-   **Detailed Workout View (`WorkoutDetailView`):** Each workout plan includes a list of exercises with sets, reps, and difficulty levels.
-   **Step-by-Step Exercise Guide (`ExecisesStepDetails`):** Detailed instructions and visuals for each exercise to ensure proper form and technique.

### 4. Progress Monitoring
-   **Activity Tracker (`ActivityTrackerView`):** A visual representation of workout progress over time, likely using charts to display trends.
-   **Photo Progress (`PhotoProgressView`):** A unique feature allowing users to upload and compare progress photos over time, providing powerful visual motivation.

### 5. Profile & Settings (`ProfileView`)
-   **User Profile Management:** View and edit personal information and fitness goals.
-   **Application Settings:** Access to settings for notifications, privacy, and contact information.
-   **Notifications:** A dedicated screen to view all app-related notifications.



## 🏛️ Architecture & State Management

The application is structured to promote separation of concerns and maintainability.

-   **View Layer:** The `lib/view` directory contains all the UI screens, which are responsible for rendering the user interface.
-   **Service Layer:** The `lib/view/services` directory abstracts the backend logic. `AuthService` handles all Firebase Authentication tasks, while `DatabaseService` manages all Firestore CRUD operations. This decouples the UI from the backend implementation.
-   **Widget Library:** The `lib/common_widget` directory contains a rich library of reusable custom widgets (`RoundButton`, `SettingRow`, `WorkoutRow`, etc.), ensuring a consistent look and feel across the app and promoting code reuse.
-   **State Management:** The project uses **Provider** for dependency injection and state management. The `AuthService` is provided at the top level of the widget tree, making it accessible throughout the application for managing the user's authentication state.

---

## 🛠️ Technology Stack & Key Packages

-   **Core:** Flutter, Dart
-   **Backend & Database:** Firebase (Auth, Firestore, Storage)
-   **State Management:** `provider`
-   **UI & Graphics:**
    -   `fl_chart`: For creating beautiful and interactive charts in the activity tracker.
    -   Custom-built widgets for a unique and consistent UI.
-   **Image Handling:** `image_picker` for selecting progress photos from the user's gallery or camera.
-   **HTTP:** `http` package for making network requests if needed.

---

## 🗄️ Firebase Integration

Firebase is the backbone of this application, providing a suite of powerful backend services:

-   **Firebase Authentication:** Handles the entire user lifecycle, including registration, login, and session management.
-   **Cloud Firestore:** Used as the primary NoSQL database to store all user data, including profiles, workout plans, activity logs, and progress photos metadata.
-   **Firebase Storage:** Used to upload and store user-generated content, such as profile pictures and progress photos.

---

## 🚀 Getting Started

To get a local copy up and running, please follow these instructions.

### Prerequisites

-   An up-to-date version of the [Flutter SDK](https://flutter.dev/docs/get-started/install).
-   A configured IDE like [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/).
-   A Firebase project set up on the [Firebase Console](https://console.firebase.google.com/).

### Installation & Firebase Setup

1.  **Configure Firebase:**
    -   Create a new project on the Firebase Console.
    -   Set up an **Android** and/or **iOS** app within your Firebase project.
    -   Enable **Authentication** (Email/Password method) and **Firestore Database**.
    -   Enable **Firebase Storage**.
    -   Download the `google-services.json` file for Android and the `GoogleService-Info.plist` for iOS.
    -   Place `google-services.json` in the `android/app/` directory.
    -   Place `GoogleService-Info.plist` in the `ios/Runner/` directory via Xcode.
    -   Use the FlutterFire CLI to generate the `lib/firebase_options.dart` file, or replace the existing one with the configuration from your project.

2.  **Clone the Repository:**
    ```bash
    git clone [https://github.com/your-username/flutter_gym.git](https://github.com/your-username/flutter_gym.git)
    cd flutter_gym
    ```

3.  **Install Dependencies:**
    ```bash
    flutter pub get
    ```

4.  **Run the Application:**
    Connect a device or start an emulator/simulator and run:
    ```bash
    flutter run
    ```

---

## 🤝 Contributing

Contributions are what make the open-source community an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1.  **Fork** the Project.
2.  Create your Feature Branch (`git checkout -b feature/NewWorkoutFeature`).
3.  Commit your Changes (`git commit -m 'Add some NewWorkoutFeature'`).
4.  Push to the Branch (`git push origin feature/NewWorkoutFeature`).
5.  Open a **Pull Request**.
