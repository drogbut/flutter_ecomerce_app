import 'package:flutter/material.dart';
import 'package:flutter_folders_structure/l10n/app_localizations.dart';
import 'package:flutter_folders_structure/modules/authentication/data/repositories/auth_repository.dart';
import 'package:flutter_folders_structure/modules/authentication/presenter/register/pages/register_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

import '../../../../../mocks_data/auth_repository.mocks.dart';

void main() {
  late MockAuthenticationRepository mockAuthRepository;

  setUp(() {
    // Initialise GetX in test mode to avoid side effects.
    Get.testMode = true;

    // Creation of mocked instances.
    mockAuthRepository = MockAuthenticationRepository();

    // Prevents errors if the widget calls onStart
    when(mockAuthRepository.onStart).thenReturn(InternalFinalCallback(callback: () {}));

    // Inject the mocks. RegisterForm will then be able to use them.
    Get.put<AuthenticationRepository>(mockAuthRepository);
  });

  // Clean GetX after each test to avoid conflicts between tests.
  tearDown(() => Get.reset());

  testWidgets('RegisterScreen renders title, divider, and social icons', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const RegisterScreen(),
      ),
    );

    // Checks that the title is displayed
    expect(find.byKey(const Key('titleText')), findsOneWidget);

    // Checks for the presence of RegisterForm (tested elsewhere)
    expect(find.byKey(const Key('fakeRegisterForm')), findsOneWidget);

    // Check the "or register with" divisor
    expect(find.byKey(const Key('dividerLine')), findsOneWidget);

    // Check for Google and Facebook icons
    expect(find.byKey(const Key('googleIcon')), findsOneWidget);
    expect(find.byKey(const Key('facebookIcon')), findsOneWidget);
  });
}
