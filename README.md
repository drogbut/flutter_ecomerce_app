# E-commerce App - Clean architecture
The eCommerce Flutter App is a mobile solution that allows users to browse, search, and purchase products online. It is built using the Flutter framework and connects to a backend API for managing products, users, and orders. The goal is to provide an intuitive and responsive user interface while offering seamless payment and delivery management.

## FRONTEND FEATURES
### APP CONFIGURATIONS
* Create new project & setup the folders structure - feature first approach
* Light & dark mode setup include Buttons, textfileds, appBar and more.
* Create Helper functions,  utilities and constantes classes

### LOGIN / REGISTER UI/UX
* Native Splash Screen
* Onboarding Screens
* Register Screen with Email Verification and Success Screen
* Login Screen
* Forget Password & reset Password

### E-COMMERCE APP DESIGN
* Bottom Navigation
* Curved Design Challenge with Backend
* Custom AppBar
* Search Widgets & Scrolling Categories
* Banners with Sliders
* Product Design & Grid Layout
* Tab Layout, AppBar, Search & featured Brands
* TabBar Categories Contents
* Whislist Screen
* Settings Screens
* Profile Screen
* Product Details - Images & Text
* Product Details - Attributes & Variations
* Ratings & Reviews
* Adresses
* Cards
* Checkout
* Orders Screen
* Sub-categories with Horizontal Scroll
* View All Products
* View All Brands & Brand Specific Products

## BACKEND FEATURES
### LOGIN BACKEND - FIREBASE AUTHENTICATION
* Firebase Setup
* onboarding with single Timer appearance (Local Storage)
* Register User & Email Verification (Email and Pasword - Store data in Firebase)
* Login Using Email & Password
* GOOGLE SIGN-IN
* FACEBOOK SIGN-IN
* Forget Password & reset Password

### E-COMMERCE APP BACKEND 
* Fetch Categories
* Fetch Brands
* Fetch products (Create Stream to reduce Reads and Writes on Firestore)
* Add, Remove Whislist items of each user
* Add to Card (From product card, Single & varaition product from Product Details)
* Ceckout & Creat Ordres

## Technologies Used
* Flutter: Cross-platform development framework.
* Dart: Programming language used with Flutter.
* Firebase: Backend service for authentication, database (Firestore), and push notifications.
* Provider: State management for communication between different components.
* Stripe / PayPal API: Integrated payment solutions for secure transactions.
* REST API: For communication between the app and the backend server.

## Requirements
* Flutter SDK: Version 3.0+ (ensure compatibility with your Flutter version)
* Android Studio or Visual Studio Code: Code editors with Flutter and Dart extensions.
* Firebase Account: Required for managing authentication and push notifications.
* Stripe or PayPal Developer Account: For handling payments.

## Installation

1. Clone the repository:
```
https://github.com/drogbut/ecommerce_app-flutter.git
cd ecommerce-app_flutter
```

2. Install dependencies:
```
flutter pub get 
```

3. Configure Firebase:
* Create a Firebase project.
* Enable email/password authentication and set up Firestore.
* Download google-services.json (Android) and GoogleService-Info.plist (iOS), and place them in their respective folders.

4. Set up payment configuration:
* Create developer accounts on Stripe or PayPal and configure API keys within the app.

5. Auto generate files
```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

or watch command in order to keep the source code synced automatically:

```
flutter packages pub run build_runner watch
```

6. Hide Generated Files

In-order to hide generated files, navigate to `Android Studio` -> `Preferences` -> `Editor` -> `File Types` and paste the below lines under `ignore files and folders` section:

```
*.inject.summary;*.inject.dart;*.g.dart;
```

In Visual Studio Code, navigate to `Preferences` -> `Settings` and search for `Files:Exclude`. Add the following patterns:
```
**/*.inject.summary
**/*.inject.dart
**/*.g.dart
```
7. Run the app:
```
flutter run
```

## Folder Structure
```
flutter-app/
|- android
|- assets/
|   |- fonts
|   |- icons
|     |- brands
|     |- categories
|     |- payment_methods
|   |- images
|     |- animations
|     |- app_logos
|     |- banners
|     |- contents
|     |- onboarding_images
|     |- products
|     |- reviews
|   |- Logos
|   |- vectors
|- build
|- ios
|- lib/
|   |- modules/
|   |   |- authentication/
|   |   |   |- data/  
|   |   |   |- domain/
|   |   |   |   |- constants
|   |   |   |   |- enums
|   |   |   |- screens/
|   |   |   |   |- forget_password
|   |   |   |   |   |- forget_password.dart
|   |   |   |   |- login
|   |   |   |   |   |- widgets
|   |   |   |   |   |- login.dart
|   |   |   |   |- onboarding
|   |   |   |   |   |- widgets
|   |   |   |   |   |- onboarding.dart
|   |   |   |   |- register
|   |   |   |   |   |- widgets
|   |   |   |   |   |- register.dart
|   |- utilities 
|   |   |- colors
|   |   |- device
|   |   |- Exceptions
|   |   |- formatters
|   |   |- helpers
|   |   |- http
|   |   |- local_storage
|   |   |- Logging
|   |   |- popups
|   |   |- themes
|   |   |- validators
|   |- ui
|   |   |- appbar
|   |   |- buttons
|   |   |- cards
|   |   |- carousels
|   |   |- ckeckbox_and-radio
|   |   |- chips
|   |   |- ...
|   |- app.dart
|   |- firebase_options.dart
|   |- main.dart
|- test
```
## Future Features
* Multilingual Support: Add support for multiple languages.
* Dark Mode: Enable dark mode for the user interface.
* Coupons and Promotions: Integrate a discount code management system.
* Live Chat: Provide customer support with a live chat feature.


## Conclusion

I will be happy to answer any questions that you may have on this approach, and if you want to lend a hand with the boilerplate then please feel free to submit an issue and/or pull request 🙂

Again to note, this is example can appear as over-architecture for what it is - but it is an example only. If you liked my work, don’t forget to ⭐ star the repo to show your support.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.

