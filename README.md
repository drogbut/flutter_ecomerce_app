# E-commerce App - Clean architecture

## Features:

### Professional App configurations
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

### Folder Structure
Here is the folder structure we have been using in this project

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

## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/drogbut/flutter_folders_structure.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 3:**

This project uses `inject` library that works with code generation, execute the following command to generate files:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

or watch command in order to keep the source code synced automatically:

```
flutter packages pub run build_runner watch
```

## Hide Generated Files

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



## Conclusion

I will be happy to answer any questions that you may have on this approach, and if you want to lend a hand with the boilerplate then please feel free to submit an issue and/or pull request 🙂

Again to note, this is example can appear as over-architecture for what it is - but it is an example only. If you liked my work, don’t forget to ⭐ star the repo to show your support.
