# flutter_folders_structure

## Features:

* [Flutter Clean Architecture by Reso Coder](https://resocoder.com/flutter-clean-architecture-tdd/)
* [Multilingual Support by PodCoder](https://www.youtube.com/watch?v=WrqH5fF2ZuY&list=PLtuW0sh7ZGJFrd4FYRk0PJf0qHF-q96MQ&index=4)
* Dependency Injection
* App Theme with material design 3
* Responsive App - mobile first as approach 
* [Firebase setup with CLI](https://firebase.flutter.dev/docs/cli/)
* Firebase Authentication - splash_screen, sign_in, sign_up, forgot_password and gender_and_age
* [Cloud Firestore](https://firebase.flutter.dev/docs/firestore/)

### Folder Structure
Here is the folder structure we have been using in this project

```
flutter-app/
|- android
|- assets/
|   |- fonts
|   |- icons
|   |- images
|   |- sounds
|   |- vectors
|- build
|- ios
|- lib/
|   |- core/
|   |   |- constants/
|   |   |   |- colors.dart
|   |   |   |- dates.dart
|   |   |   |- styles.dart
|   |   |- enums/
|   |   |   |- datetime.dart
|   |   |   |- module.dart
|   |   |   |- pages.dart
|   |   |- erros/
|   |   |   |- exceptions.dart
|   |   |   |- failures.dart
|   |   |- extensions/
|   |   |   |- bool.dart
|   |   |   |- color.dart
|   |   |   |- context.dart
|   |   |   |- date_time.dart
|   |   |   |- string.dart
|   |   |   |- widget.dart
|   |   |- routing
|   |   |   |- app_router.dart
|   |   |- themes/
|   |   |   |- dark/
|   |   |   |   |- dark.dart
|   |   |   |   |- hight_contrast.dart
|   |   |   |- light/
|   |   |   |   |- light.dart
|   |   |   |   |- hight_contrast.dart
|   |- modules/
|   |   |- authentication/
|   |   |   |- data/  
|   |   |   |- domain/
|   |   |   |   |- constants
|   |   |   |   |- enums
|   |   |   |- presenter/
|   |   |   |   |- providers
|   |   |   |   |- ui
|   |   |   |   |   |- enter_password.dart
|   |   |   |   |   |- forgot_password.dart
|   |   |   |   |   |- sign_in.dart
|   |   |   |   |   |- sign_up.dart
|   |   |   |   |   |- splash.dart
|   |   |- responsive
|   |   |   |   |- domain
|   |   |   |   |   |- breakpoints.dart
|   |   |   |   |   |- device.dart
|   |   |   |   |   |- sizing_info.dart
|   |   |   |   |- presenter
|   |   |   |   |   |- context.dart
|   |   |   |   |   |- responsive_builder.dart
|   |   |   |   |   |- responsive_view.dart
|   |- ui
|   |   |- appbar
|   |   |- buttons
|   |   |- fileds
|   |   |- icons
|   |   |- text
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
