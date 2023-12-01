# Finance Goal Tracker
Finance Goal Tracker is a Flutter application designed to help users set, manage, and visualize
their financial goals. This README provides instructions on setting up the project, running the
application, and configuring Firebase Firestore.

## Table of Contents

- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Firebase Configuration](#firebase-configuration)
- [Running the Application](#running-the-application)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgments](#acknowledgments)

## Getting Started

These instructions will guide you through setting up the project on your local machine.

### Prerequisites

Make sure you have Flutter installed. If not, follow
the [official installation guide](https://flutter.dev/docs/get-started/install).

### Installation

1. Clone the repository:
   git clone https://github.com/your-username/finance_goal_tracker.git

2. Navigate to the project directory:
   cd finance_goal_tracker


3. Install dependencies:
   flutter pub get

## Firebase Configuration

The project uses Firebase Firestore to store and retrieve financial goal data. Follow these steps to
set up Firebase:

1. Create a new project on the [Firebase Console](https://console.firebase.google.com/).
2. Add a new Android or iOS app to your Firebase project.
3. Follow the provided instructions to download the configuration files (`google-services.json` for
   Android or `GoogleService-Info.plist` for iOS) and place them in the respective directories of
   your Flutter project.
4. Enable Firestore in the Firebase Console.

Your Firebase configuration is now set up for the Finance Goal Tracker project.

## Running the Application

Ensure that an emulator or physical device is connected, then run the application:

```bash
flutter run
```

The Finance Goal Tracker app will be launched on your device.
