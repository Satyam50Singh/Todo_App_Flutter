# Todo Flutter App (Clean Architecture + BLoC)

A scalable and maintainable Todo application built using **Flutter**, following **Clean Architecture** principles and **BLoC** for state management. The project is structured to ensure clear separation of concerns, testability, and long-term scalability.

---

## 🏗️ Architecture Overview

The application follows **Clean Architecture**, divided into three primary layers:

- **Presentation Layer**
    - Handles UI rendering and user interactions
    - Uses BLoC for state management
- **Domain Layer**
    - Contains business logic, entities, and use cases
    - Independent of Flutter and external frameworks
- **Data Layer**
    - Responsible for data handling from remote or local sources
    - Implements repositories and data sources

---

## 📂 Folder Structure

```text
lib/
├── core/
│   ├── constants/
│   ├── network/
│   ├── utils/
│   └── di/
│
├── features/
│   └── todo/
│       ├── data/
│       │   ├── datasources/
│       │   ├── models/
│       │   └── repositories/
│       │
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       │
│       └── presentation/
│           ├── bloc/
│           ├── pages/
│           └── widgets/
│
└── main.dart
```

## Flutter Useful Commands

- flutter clean
- flutter pub get
- flutter packages pub run build_runner build
- flutter packages pub run build_runner watch
- flutter pub run build_runner watch --delete-conflicting-outputs

## iOS Setup
- pod init
- pod install
- pod update

## 📌 What Has Been Implemented So Far

- Initialized the Flutter project with a Clean Architecture–oriented folder structure.
- Segregated the application into Presentation, Domain, and Data layers to enforce separation of concerns.
- Implemented BLoC (Business Logic Component) pattern for predictable and reactive state management.
- Defined events and states to handle user actions and asynchronous flows.
- Applied the Repository Pattern to abstract data access and decouple the domain layer from implementation details.
- Implemented remote data sources for API communication.
- Configured a network layer including base API services and endpoint constants.
- Added request and response models with proper JSON serialization/deserialization.
- Integrated dependency injection to manage BLoCs, repositories, use cases, and services efficiently.
- Implemented input validation logic at the BLoC level to ensure data integrity.
- Added error handling for API failures, validation issues, and unexpected exceptions.
- Implemented UI state handling for loading, success, and error states.
- Created reusable widgets and centralized theming for consistent UI/UX.
- Followed Flutter and Dart best practices for code organization, immutability, and naming conventions.
- Structured the codebase to support easy testing, scalability, and future feature expansion.
