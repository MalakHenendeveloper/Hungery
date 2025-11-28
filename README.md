# 🍔 Hungery - Food Delivery App
<div align="center">
  <img src="https://raw.githubusercontent.com/USERNAME/REPO/main/assets/images/hungryLogo.png" alt="Hungery Logo" width="200"/>
  
  <h3>Modern Food Delivery Experience</h3>

  A feature-rich Flutter application that revolutionizes food ordering with an elegant UI and seamless user experience.

  <br/>

  <a href="https://flutter.dev/"><img src="https://img.shields.io/badge/Flutter-3.0+-blue.svg"/></a>
  <a href="https://dart.dev/"><img src="https://img.shields.io/badge/Dart-3.0+-blue.svg"/></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-green.svg"/></a>
</div>


---

## 📱 About The Project

**Hungery** is a comprehensive food delivery application built with Flutter, designed to provide users with an intuitive and delightful food ordering experience. The app combines modern UI/UX principles with robust architecture, offering features like product customization, cart management, and order tracking.

### ✨ Key Highlights

- 🎨 **Modern UI/UD**: Glassmorphism design with smooth animations
- 🏗️ **Clean Architecture**: Separation of concerns with Domain, Data, and Presentation layers
- 🔄 **State Management**: BLoC pattern for predictable state handling
- 📦 **Dependency Injection**: Using GetIt for loose coupling
- 🌐 **API Integration**: RESTful API communication with proper error handling
- 🎯 **Custom Widgets**: Reusable components for consistent design

---

## 🚀 Features

### 🍕 Product Browsing & Customization
- Browse menu items with high-quality images
- Customize orders with toppings and side options
- Adjustable spice level slider
- Real-time price calculation

### 🛒 Cart Management
- Add/remove items with quantity controls
- Persistent cart state
- Total price calculation
- Smooth animations for cart updates

### 👤 User Authentication
- Secure login and registration
- Modern feedback notifications
- Input validation
- Session management

### 📦 Order History
- View past orders with details
- Order status tracking
- Reorder functionality
- Clean, card-based layout

### 🎨 User Profile
- Profile picture with edit functionality
- Personal information management
- Delivery address setup
- Payment method selection
- Account actions (Change Password, Logout)

---

## 🛠️ Tech Stack

### Core Technologies
- **Flutter** - UI Framework
- **Dart** - Programming Language
- **BLoC** - State Management
- **GetIt** - Dependency Injection
- **Injectable** - Code Generation for DI

### Key Packages
```yaml
flutter_bloc: ^8.1.3          # State Management
get_it: ^7.6.4                # Service Locator
injectable: ^2.3.2            # DI Code Generation
dio: ^5.4.0                   # HTTP Client
flutter_svg: ^2.0.9           # SVG Support
gap: ^3.0.1                   # Spacing Widgets
loading_animation_widget: ^1.2.0+4  # Loading Indicators
shared_preferences: ^2.2.2    # Local Storage
skeletonizer: ^1.0.1          # Skeleton Loaders
```

---

## 🏗️ Architecture

The project follows **Clean Architecture** principles with clear separation of layers:

```
lib/
├── Core/                    # Shared utilities and resources
│   ├── Injectable/          # Dependency Injection setup
│   ├── Routes/              # Navigation management
│   ├── Widgets/             # Reusable UI components
│   └── constants/           # App-wide constants
│
├── Data/                    # Data layer
│   ├── Api/                 # API service implementations
│   ├── DataSource/          # Remote and local data sources
│   ├── Model/               # Data models (DTOs)
│   └── RepoImp/             # Repository implementations
│
├── Domain/                  # Business logic layer
│   ├── Entities/            # Domain models
│   ├── Repo/                # Repository interfaces
│   └── UseCases/            # Business use cases
│
└── Feature/                 # Presentation layer
    ├── Auth/                # Authentication screens
    ├── Home/                # Home screen
    ├── Products/            # Product details
    ├── Cart/                # Shopping cart
    ├── Profile/             # User profile
    ├── OrderHistory/        # Order tracking
    └── MainLayout/          # Bottom navigation
```

### Architecture Diagram

```
┌─────────────────────────────────────────────────┐
│              Presentation Layer                 │
│  (UI, Widgets, BLoC/Cubit, ViewModels)         │
└──────────────────┬──────────────────────────────┘
                   │
┌──────────────────▼──────────────────────────────┐
│               Domain Layer                      │
│     (Entities, UseCases, Repository Interfaces) │
└──────────────────┬──────────────────────────────┘
                   │
┌──────────────────▼──────────────────────────────┐
│                Data Layer                       │
│   (Models, API, DataSource, Repository Impl)   │
└─────────────────────────────────────────────────┘
```

---

## 📸 Screenshots

> *Add screenshots of your app here to showcase the UI*

---

## 🔧 Getting Started

### Prerequisites

- Flutter SDK (3.0 or higher)
- Dart SDK (3.0 or higher)
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/hungery.git
   cd hungery
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code for dependency injection**
   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Build for Production

```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release
```

---

## 📁 Project Structure

```
hungery/
├── assets/                  # Images, fonts, and other assets
│   ├── images/
│   └── svgs/
│
├── lib/
│   ├── Core/               # Core utilities
│   ├── Data/               # Data layer
│   ├── Domain/             # Business logic
│   └── Feature/            # UI/Presentation
│
├── test/                   # Unit and widget tests
├── pubspec.yaml           # Project dependencies
└── README.md              # This file
```

---

## 🎯 Key Features Implementation

### BLoC Pattern
The app uses BLoC (Business Logic Component) pattern for state management:
- Clear separation between UI and business logic
- Predictable state transitions
- Easy testing and debugging

### Dependency Injection
Using GetIt and Injectable for:
- Loose coupling between components
- Easy mocking for tests
- Centralized dependency management

### Modern UI Components
- **Glassmorphism Effects**: Frosted glass cards with blur
- **Smooth Animations**: Page transitions and micro-interactions
- **Skeleton Loaders**: Elegant loading states
- **Modern Feedback**: Non-intrusive notifications

---

## 🔐 API Integration

The app integrates with a RESTful backend API for:
- User authentication (Login/Register)
- Product catalog retrieval
- Cart operations (Add/Update/Delete)
- Order placement and history

### Error Handling
- Centralized error handling
- User-friendly error messages
- Retry mechanisms for failed requests

---

## 🎨 Design Patterns

- **Repository Pattern**: Abstraction for data sources
- **Use Case Pattern**: Encapsulated business logic
- **Factory Pattern**: Object creation
- **Observer Pattern**: State updates (BLoC)
- **Singleton Pattern**: Service instances

---

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage
```

---

## 🚀 Performance Optimizations

- **Image Caching**: Using `cacheWidth` and `cacheHeight` for memory efficiency
- **Lazy Loading**: Products loaded on demand
- **State Optimization**: Minimal rebuilds with BLoC
- **Code Splitting**: Feature-based module organization

---

## 🤝 Contributing

Contributions are welcome! If you'd like to contribute:

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 📧 Contact

**My Name** - [@Malak Henen](malakhenen92@gmail.com) - malakhenen92@gmail.com

Project Link: [Hungery App](https://github.com/MalakHenendeveloper/Hungery.git)

---

## 🙏 Acknowledgments

- Flutter Team for the amazing framework
- BLoC Library contributors
- All open-source packages used in this project

---

<div align="center">
  <p>Made with ❤️ using Flutter</p>
  <p>⭐ Star this repo if you find it helpful!</p>
</div>
