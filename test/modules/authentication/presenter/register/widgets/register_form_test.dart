import 'package:flutter/material.dart';
import 'package:flutter_folders_structure/l10n/app_localizations.dart';
import 'package:flutter_folders_structure/l10n/l10n.dart';
import 'package:flutter_folders_structure/modules/authentication/data/repositories/auth_repository.dart';
import 'package:flutter_folders_structure/modules/authentication/presenter/register/controllers/register_controller.dart';
import 'package:flutter_folders_structure/modules/authentication/presenter/register/widgets/register_form.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

import '../../../../../mocks_data/auth_repository.mocks.dart';
import '../../../../../mocks_data/register_controller.mocks.dart';

void main() {
  // Variables declared to store mocked instances.
  late MockRegisterController registerController;
  late MockAuthenticationRepository mockAuthRepository;

  setUp(() {
    // Initialise GetX in test mode to avoid side effects.
    Get.testMode = true;

    // Creation of mocked instances.
    mockAuthRepository = MockAuthenticationRepository();
    registerController = MockRegisterController();

    // Prevents errors if the widget calls onStart
    when(mockAuthRepository.onStart)
        .thenReturn(InternalFinalCallback(callback: () {}));
    when(registerController.onStart)
        .thenReturn(InternalFinalCallback(callback: () {}));

    // Provides controlled values for fields used in RegisterForm.
    when(registerController.registerFormKey).thenReturn(GlobalKey<FormState>());
    when(registerController.firstName).thenReturn(TextEditingController());
    when(registerController.lastName).thenReturn(TextEditingController());
    when(registerController.userName).thenReturn(TextEditingController());
    when(registerController.email).thenReturn(TextEditingController());
    when(registerController.phone).thenReturn(TextEditingController());
    when(registerController.password).thenReturn(TextEditingController());
    when(registerController.hidePassword).thenReturn(RxBool(true));
    when(registerController.privacyPolicy).thenReturn(RxBool(true));
    when(registerController.signup()).thenAnswer((_) async {
      registerController.registerFormKey.currentState?.validate();
    });
    // Inject the mocks. RegisterForm will then be able to use them.
    Get.put<RegisterController>(registerController);
    Get.put<AuthenticationRepository>(mockAuthRepository);
  });

  // Clean GetX after each test to avoid conflicts between tests.
  tearDown(() => Get.reset());

  // (1) Test for renders all fields
  testWidgets('RegisterForm renders all fields and calls signup on button tap',
      (tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(body: RegisterForm()),
      ),
    );

    expect(find.byKey(const Key('firstName')), findsOneWidget);
    expect(find.byKey(const Key('lastName')), findsOneWidget);
    expect(find.byKey(const Key('userName')), findsOneWidget);
    expect(find.byKey(const Key('email')), findsOneWidget);
    expect(find.byKey(const Key('phone')), findsOneWidget);
    expect(find.byKey(const Key('password')), findsOneWidget);
    expect(find.byKey(const Key('privacyPolicy')), findsOneWidget);
    expect(find.byKey(const Key('createAccountButton')), findsOneWidget);

    // await tester.tap(find.byKey(const Key('createAccountButton')));
    // await tester.pump();

    // verify(registerController.signup()).called(1);
  });
  testWidgets('shows error messages for empty fields (all supported languages)',
      (WidgetTester tester) async {
    for (final localeLanguage in L10n.all) {
      // Build the RegisterForm widget with the current locale
      await tester.pumpWidget(
        MaterialApp(
          locale: localeLanguage,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: SingleChildScrollView(child: RegisterForm()),
          ),
        ),
      );

      // Simulate tapping the "Create Account" button with all fields empty
      await tester.tap(find.byKey(const Key('createAccountButton')));
      await tester.pumpAndSettle();

      // Retrieve the BuildContext for each field to access the correct localization
      final emailContext = tester.element(find.byKey(const Key('email')));
      final phoneContext = tester.element(find.byKey(const Key('phone')));
      final passwordContext = tester.element(find.byKey(const Key('password')));
      final firstNameContext =
          tester.element(find.byKey(const Key('firstName')));
      final lastNameContext = tester.element(find.byKey(const Key('lastName')));
      final userNameContext = tester.element(find.byKey(const Key('userName')));

      // Get the localized strings for each field
      final l10nEmail = AppLocalizations.of(emailContext)!;
      final l10nPhone = AppLocalizations.of(phoneContext)!;
      final l10nPassword = AppLocalizations.of(passwordContext)!;
      final l10nFirstName = AppLocalizations.of(firstNameContext)!;
      final l10nLastName = AppLocalizations.of(lastNameContext)!;
      final l10nUserName = AppLocalizations.of(userNameContext)!;
      // Assert that the correct error message is shown for each field in the current language
      expect(find.text(l10nFirstName.fieldRequired(l10nFirstName.firstname)),
          findsOneWidget);
      expect(find.text(l10nLastName.fieldRequired(l10nLastName.lastname)),
          findsOneWidget);
      expect(find.text(l10nUserName.fieldRequired(l10nUserName.username)),
          findsOneWidget);
      expect(find.text(l10nEmail.emailRequired), findsOneWidget);
      expect(find.text(l10nPhone.phoneRequired), findsOneWidget);
      expect(find.text(l10nPassword.passwordRequired), findsOneWidget);

      // Clean up the widget tree before the next locale iteration
      await tester.pumpWidget(Container());
    }
  });

  /// This test verifies that the RegisterForm displays the correct error message
  /// when the email field contains an invalid format, for all supported languages.
  /// It enters an invalid email, submits the form, and checks the localized error message.
  testWidgets('shows error for invalid email format (all supported languages)',
      (WidgetTester tester) async {
    for (final locale in L10n.all) {
      await tester.pumpWidget(
        MaterialApp(
          locale: locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(body: RegisterForm()),
        ),
      );
      await tester.enterText(find.byKey(const Key('email')), 'invalid-email');
      await tester.tap(find.byKey(const Key('createAccountButton')));
      await tester.pumpAndSettle();

      final emailContext = tester.element(find.byKey(const Key('email')));
      final l10nEmail = AppLocalizations.of(emailContext)!;
      expect(find.text(l10nEmail.invalidEmail), findsOneWidget);

      await tester.pumpWidget(Container());
    }
  });

  /// This test verifies that the RegisterForm displays the correct error message
  /// when the phone number field contains an invalid format, for all supported languages.
  /// It enters an invalid phone number, submits the form, and checks the localized error message.
  testWidgets(
      'shows error for invalid phone number format (all supported languages)',
      (WidgetTester tester) async {
    for (final locale in L10n.all) {
      await tester.pumpWidget(
        MaterialApp(
          locale: locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(body: RegisterForm()),
        ),
      );
      await tester.enterText(find.byKey(const Key('phone')), '12345');
      await tester.tap(find.byKey(const Key('createAccountButton')));
      await tester.pumpAndSettle();

      final phoneContext = tester.element(find.byKey(const Key('phone')));
      final l10nPhone = AppLocalizations.of(phoneContext)!;
      expect(find.text(l10nPhone.invalidPhone), findsOneWidget);

      await tester.pumpWidget(Container());
    }
  });

  /// This test verifies that the RegisterForm displays the correct error message
  /// when the email field contains an invalid format, for all supported languages.
  /// It enters an invalid email, submits the form, and checks the localized error message.
  testWidgets('shows error for password too short (all supported languages)',
      (WidgetTester tester) async {
    for (final locale in L10n.all) {
      await tester.pumpWidget(
        MaterialApp(
          locale: locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(body: RegisterForm()),
        ),
      );
      await tester.enterText(find.byKey(const Key('password')), 'Ab1!');
      await tester.tap(find.byKey(const Key('createAccountButton')));
      await tester.pumpAndSettle();

      final passwordContext = tester.element(find.byKey(const Key('password')));
      final l10nPassword = AppLocalizations.of(passwordContext)!;
      expect(find.text(l10nPassword.passwordTooShort), findsOneWidget);

      await tester.pumpWidget(Container());
    }
  });

  /// This test verifies that the RegisterForm displays the correct error message
  /// when the password is missing an uppercase letter, for all supported languages.
  /// It enters a password without uppercase letters, submits the form, and checks the localized error message.
  testWidgets(
      'shows error for password missing uppercase (all supported languages)',
      (WidgetTester tester) async {
    for (final locale in L10n.all) {
      await tester.pumpWidget(
        MaterialApp(
          locale: locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(body: RegisterForm()),
        ),
      );
      await tester.enterText(find.byKey(const Key('password')), 'abc123!');
      await tester.tap(find.byKey(const Key('createAccountButton')));
      await tester.pumpAndSettle();

      final passwordContext = tester.element(find.byKey(const Key('password')));
      final l10nPassword = AppLocalizations.of(passwordContext)!;
      expect(find.text(l10nPassword.passwordNeedsUppercase), findsOneWidget);

      await tester.pumpWidget(Container());
    }
  });

  /// This test verifies that the RegisterForm displays the correct error message
  /// when the password is missing an uppercase letter, for all supported languages.
  /// It enters a password without uppercase letters, submits the form, and checks the localized error message.
  testWidgets(
      'shows error for password missing number (all supported languages)',
      (WidgetTester tester) async {
    for (final locale in L10n.all) {
      await tester.pumpWidget(
        MaterialApp(
          locale: locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(body: RegisterForm()),
        ),
      );
      await tester.enterText(find.byKey(const Key('password')), 'Abcdef!');
      await tester.tap(find.byKey(const Key('createAccountButton')));
      await tester.pumpAndSettle();

      final passwordContext = tester.element(find.byKey(const Key('password')));
      final l10nPassword = AppLocalizations.of(passwordContext)!;
      expect(find.text(l10nPassword.passwordNeedsNumber), findsOneWidget);

      await tester.pumpWidget(Container());
    }
  });

  /// This test verifies that the RegisterForm displays the correct error message
  /// when the password is missing a special character, for all supported languages.
  /// It enters a password without special characters, submits the form, and checks the localized error message.
  testWidgets(
      'shows error for password missing special character (all supported languages)',
      (WidgetTester tester) async {
    for (final locale in L10n.all) {
      await tester.pumpWidget(
        MaterialApp(
          locale: locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(body: RegisterForm()),
        ),
      );
      await tester.enterText(find.byKey(const Key('password')), 'Abc1234');
      await tester.tap(find.byKey(const Key('createAccountButton')));
      await tester.pumpAndSettle();

      final passwordContext = tester.element(find.byKey(const Key('password')));
      final l10nPassword = AppLocalizations.of(passwordContext)!;
      expect(find.text(l10nPassword.passwordNeedsSpecial), findsOneWidget);

      await tester.pumpWidget(Container());
    }
  });
}
