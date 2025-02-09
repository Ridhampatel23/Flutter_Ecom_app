# 🛍️ FlyBuy - Flutter E-Commerce App

## 📌 Overview
FlyBuy is a **modern, cross-platform eCommerce application** built using **Flutter** and **Firebase**. It provides users with a seamless shopping experience with features like **multi-authentication**, **real-time product updates**, and **secure transactions**.

This project follows the **Model-View-Controller (MVC) architecture** to maintain a clean and scalable codebase. It is designed for **Android and iOS** with a **Material 3 UI** that adapts beautifully to different screen sizes.

---
## 🚀 Features
### 🛒 User Features
- **📌 Multi-Authentication** (Google, Email/Password, Anonymous Sign-in)
- **🔍 Smart Search & Filtering**
- **❤️ Wishlist & Cart Management**
- **💳 Secure Checkout with Payment Gateway Integration**
- **📦 Order Tracking & Notifications**
- **🌙 Dark & Light Mode Support**

### 🛠️ Technical Features
- **📌 State Management:** GetX for efficient state and dependency management.
- **📂 Architecture:** Follows MVC (Model-View-Controller) pattern.
- **🌐 Backend:** Firebase (Firestore, Authentication, Storage, Cloud Functions).
- **💾 Local Storage:** Shared Preferences.
- **📲 Cross-Platform:** Works on **Android & iOS**.
- **🔒 Security:** Uses Firebase Rules, Google Sign-In, and token-based authentication.
- **⚡ Performance:** Optimized with lazy loading and Firestore indexing.
- **📡 Real-time Updates:** Firebase Firestore for dynamic product updates.

---
## 🏗️ Tech Stack
| **Technology**  | **Usage** |
|------------|--------|
| **Flutter** | Frontend framework |
| **Dart** | Primary programming language |
| **GetX** | State management |
| **Firebase** | Backend services |
| **Cloud Firestore** | NoSQL database |
| **Firebase Authentication** | Multi-auth system |
| **Firebase Storage** | Image and file storage |
| **Firebase Cloud Functions** | Serverless backend logic |
| **Stripe/PayPal API** | Payment processing |

---
## 🔧 Installation & Setup
### 🛠️ Prerequisites
- Install **Flutter SDK** (v3.10+)
- Setup **Firebase Project** & download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
- Enable **Email/Password and Google Authentication** in Firebase Console

### 📥 Clone the Repository
```sh
git clone https://github.com/yourusername/flybuy.git
cd flybuy
```

### 🚀 Install Dependencies
```sh
flutter pub get
```

### 🔥 Run the App
```sh
flutter run
```

---
## 🔑 Firebase Configuration
Ensure you have configured Firebase properly:
1. **Android**: Place `google-services.json` inside `android/app/`.
2. **iOS**: Place `GoogleService-Info.plist` inside `ios/Runner/`.
3. Enable Firestore, Authentication, and Storage in Firebase Console.

---
