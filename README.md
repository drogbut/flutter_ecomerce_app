# flutter_folders_structure

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

## Features:

* Multilingual Support
* Dependency Injection
* App Theme
* Splash
* Login
* Home
* Routing
* Dio
* Database
* Encryption
* Validation
* User Notifications

### Up-Coming Features:

* Connectivity Support
* Background Fetch Support

### Libraries & Tools Used

* [Dio](https://github.com/flutterchina/dio)
* 

### Folder Structure
Here is the folder structure we have been using in this project

```
flutter-app/
|- android
|- assets/
|   |- icons
|   |- images
|   |- licences
|   |- spalshscreen
|   |- sounds
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
|   |   |   |- string.dart
|   |   |   |- datetime.dart
|   |   |- themes/
|   |   |   |- dark/
|   |   |   |   |- dark.dart
|   |   |   |   |- hight_contrast.dart
|   |   |   |- light/
|   |   |   |   |- light.dart
|   |   |   |   |- hight_contrast.dart
|   |   |- routing
|   |   |   |- app_router.dart
|   |- modules/
|   |   |- authentication/
|   |   |   |- login/
|   |   |   |   |- data
|   |   |   |   |- domain
|   |   |   |   |- presenter  
|   |   |   |- register/
|   |   |   |   |- data
|   |   |   |   |- domain
|   |   |   |   |- presenter
|   |   |   |- reset_passaword/
|   |   |   |   |- data
|   |   |   |   |- domain
|   |   |   |   |- presenter
|   |   |- responsive
|   |   |   |   |- domain
|   |   |   |   |   |- breakpoints.dart
|   |   |   |   |   |- device.dart
|   |   |   |   |   |- sizing_info.dart
|   |   |   |   |- presenter
|   |   |   |   |   |- context.dart
|   |   |   |   |   |- responsive_builder.dart
|   |   |   |   |   |- responsive_view.dart
|   |   |- settings
|   |- ui
|   |   |- appbar
|   |   |- buttons
|   |   |- cards
|   |   |- pickers
|   |   |- textfields
|   |- main.dart
|- test
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- core -
2- module - 
3- ui -  
4- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```

### Constants

This directory contains all the application level constants. A separate file is created for each type as shown in example below:

```
constants/
|- app_theme.dart
|- dimens.dart
|- endpoints.dart
|- preferences.dart
|- strings.dart
```

### UI

This directory contains all the ui of your application. Each screen is located in a separate folder making it easy to combine group of files related to that particular screen. All the screen specific widgets will be placed in `widgets` directory as shown in the example below:

```
ui/
|- login
   |- login_screen.dart
   |- widgets
      |- login_form.dart
      |- login_button.dart
```

### Utils

Contains the common file(s) and utilities used in a project. The folder structure is as follows: 

```
utils/
|- encryption
   |- xxtea.dart
|- date
  |- date_time.dart
```

### Widgets

Contains the common widgets that are shared across multiple screens. For example, Button, TextField etc.

```
widgets/
|- app_icon_widget.dart
|- empty_app_bar.dart
|- progress_indicator.dart
```

### Routes

This file contains all the routes for your application.

```dart
import 'package:flutter/material.dart';

import 'ui/post/post_list.dart';
import 'ui/login/login.dart';
import 'ui/splash/splash.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/post';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
  };
}
```

### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

```dart
import 'package:boilerplate/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants/app_theme.dart';
import 'constants/strings.dart';
import 'ui/splash/splash.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: themeData,
      routes: Routes.routes,
      home: SplashScreen(),
    );
  }
}
```

## Wiki



## Conclusion

I will be happy to answer any questions that you may have on this approach, and if you want to lend a hand with the boilerplate then please feel free to submit an issue and/or pull request 🙂

Again to note, this is example can appear as over-architectured for what it is - but it is an example only. If you liked my work, don’t forget to ⭐ star the repo to show your support.
