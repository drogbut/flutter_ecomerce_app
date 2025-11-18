import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app.dart';
import 'app/service/bloc_observer.dart';
import 'features/app/cubit/auth_cubit.dart';
import 'features/app_settings/data/repository/user_repository.dart';
import 'features/app_settings/presenter/cubit/user_cubit.dart';
import 'features/authentication/data/repository/auth_repository.dart';
import 'features/authentication/presenter/onboarding/cubit/onbording_cubit.dart';
import 'features/shop/home/data/repository/category_repository.dart';
import 'firebase_options.dart';
import 'utilities/helpers/network_manager_cubit.dart';

Future<void> main() async {
  /// Add widget binding
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// Preserve splash screen until setup is done
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /// Init the bloc observer
  Bloc.observer = const AppBlocObserver();

  /// Create repositories
  final authRepository = AuthenticationRepository();
  final userRepository = UserRepository();
  final categoryRepository = CategoryRepository();

  /// Create cubits
  final authCubit = AuthenticationCubit(authRepository);

  /// Wait for initialisation to complete
  await authCubit.initializeApp();

  /// Run app
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: authRepository),
        RepositoryProvider.value(value: userRepository),
        RepositoryProvider.value(value: categoryRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: authCubit),
          BlocProvider(create: (_) => OnboardingCubit()),
          BlocProvider(create: (_) => NetworkManagerCubit()),
          BlocProvider(create: (_) => UserCubit(userRepository)),
        ],
        child: App(authCubit: authCubit),
      ),
    ),
  );

  /// Remove splash after init
  FlutterNativeSplash.remove();
}
