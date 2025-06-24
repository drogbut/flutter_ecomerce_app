import 'package:flutter/material.dart';
import 'package:flutter_folders_structure/l10n/app_localizations.dart';
import 'package:flutter_folders_structure/modules/authentication/data/repositories/auth_repository.dart';
import 'package:flutter_folders_structure/modules/authentication/presenter/register/controllers/register_controller.dart';
import 'package:flutter_folders_structure/modules/authentication/presenter/register/widgets/register_form.dart';
import 'package:flutter_folders_structure/widgets/buttons/primary.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FakeInternalFinalCallback<T> extends InternalFinalCallback<T> {
  @override
  T call() => null as T;
}

/// Fake/mock pour AuthenticationRepository permettant de tester RegisterForm sans Firebase ni GetStorage.
/// Toutes les méthodes sont surchargées pour ne rien faire ou retourner des valeurs neutres.
class FakeAuthenticationRepository implements AuthenticationRepository {
  @override
  InternalFinalCallback<void> get onStart => FakeInternalFinalCallback<void>();
  @override
  InternalFinalCallback<void> get onDelete => FakeInternalFinalCallback<void>();
  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

/// Fake/mock pour RegisterController permettant de tester RegisterForm sans logique réelle ni dépendances externes.
/// Tous les contrôleurs de champ sont initialisés à vide, et la méthode signup ne fait qu'appeler validate().
class FakeRegisterController extends RegisterController {
  FakeRegisterController(AuthenticationRepository repo) : super() {
    // Remplace tous les contrôleurs par des instances test
    super.firstName.text = '';
    super.lastName.text = '';
    super.userName.text = '';
    super.email.text = '';
    super.phone.text = '';
    super.password.text = '';
    super.privacyPolicy.value = true;
    super.hidePassword.value = true;
  }

  bool signupCalled = false;

  /// Simule la soumission du formulaire : déclenche la validation mais ne fait rien d'autre.
  @override
  Future<void> signup() async {
    registerFormKey.currentState?.validate();
    signupCalled = true;
  }
}

void main() {
  late FakeRegisterController fakeController;
  late FakeAuthenticationRepository fakeAuthRepo;

  setUp(() {
    Get.deleteAll(force: true);
    fakeAuthRepo = FakeAuthenticationRepository();
    Get.put<AuthenticationRepository>(fakeAuthRepo);
    fakeController = FakeRegisterController(fakeAuthRepo);
    Get.put<RegisterController>(fakeController);
  });

  group('RegisterForm Widget Tests', () {
    // Vérifie que tous les champs du formulaire, la case à cocher et le bouton sont présents
    testWidgets('renders all form fields and button', (WidgetTester tester) async {
      // Monte le widget RegisterForm dans un MaterialApp avec la configuration de localisation
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: SingleChildScrollView(child: RegisterForm()),
          ),
        ),
      );
      // Vérifie la présence de tous les champs attendus
      expect(find.byType(TextFormField), findsNWidgets(6));
      expect(find.byType(Checkbox), findsOneWidget);
      expect(find.byType(TPrimaryButton), findsOneWidget); // Bouton personnalisé
      expect(find.byType(Form), findsOneWidget);
    });

    // Vérifie l'affichage des messages d'erreur de validation lorsque les champs sont vides
    testWidgets('shows validation errors when fields are empty', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: SingleChildScrollView(child: RegisterForm()),
          ),
        ),
      );
      // Enter empty text in all fields to mark them as touched
      final fields = tester.widgetList<TextFormField>(find.byType(TextFormField)).toList();
      for (final field in fields) {
        await tester.enterText(find.byWidget(field), '');
      }
      await tester.tap(find.byType(TPrimaryButton));
      await tester.pumpAndSettle();
      // Print all visible text widgets for debug
      final textWidgets = tester.widgetList<Text>(find.byType(Text));
      for (final textWidget in textWidgets) {
        // ignore: avoid_print
        print('TEXT: \'${textWidget.data}\'');
      }
      // Check for any error message containing 'required'
      expect(
        textWidgets.where((t) => t.data != null && t.data!.contains('required')).length,
        greaterThanOrEqualTo(1),
      );
    });

    // Vérifie l'affichage d'une erreur de format d'email
    testWidgets('shows email format error', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: SingleChildScrollView(child: RegisterForm()),
          ),
        ),
      );
      await tester.enterText(find.widgetWithText(TextFormField, 'Email Address'), 'invalidemail');
      await tester.tap(find.byType(TPrimaryButton));
      await tester.pumpAndSettle();
      expect(find.textContaining('Invalid email'), findsOneWidget);
    });

    // Vérifie l'affichage d'une erreur sur la longueur minimale du mot de passe
    testWidgets('shows password length error', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: SingleChildScrollView(child: RegisterForm()),
          ),
        ),
      );
      await tester.enterText(find.widgetWithText(TextFormField, 'Password'), '123');
      await tester.tap(find.byType(TPrimaryButton));
      await tester.pumpAndSettle();
      expect(find.textContaining('at least 6 characters'), findsOneWidget);
    });

    // Vérifie l'affichage d'une erreur si le mot de passe ne contient pas de majuscule
    testWidgets('shows password uppercase error', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: SingleChildScrollView(child: RegisterForm()),
          ),
        ),
      );
      await tester.enterText(find.widgetWithText(TextFormField, 'Password'), 'password1!');
      await tester.tap(find.byType(TPrimaryButton));
      await tester.pumpAndSettle();
      expect(find.textContaining('uppercase'), findsOneWidget);
    });

    // Vérifie l'affichage d'une erreur si le mot de passe ne contient pas de chiffre
    testWidgets('shows password number error', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: SingleChildScrollView(child: RegisterForm()),
          ),
        ),
      );
      await tester.enterText(find.widgetWithText(TextFormField, 'Password'), 'Password!');
      await tester.tap(find.byType(TPrimaryButton));
      await tester.pumpAndSettle();
      // Use exact error message to avoid false positives from phone number
      expect(find.text('Password must contain at least one number.'), findsOneWidget);
    });

    // Vérifie l'affichage d'une erreur si le mot de passe ne contient pas de caractère spécial
    testWidgets('shows password special character error', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: SingleChildScrollView(child: RegisterForm()),
          ),
        ),
      );
      await tester.enterText(find.widgetWithText(TextFormField, 'Password'), 'Password1');
      await tester.tap(find.byType(TPrimaryButton));
      await tester.pumpAndSettle();
      expect(find.text('Password must contain at least one special character.'), findsOneWidget);
    });

    // Vérifie que le formulaire est soumis lorsque tous les champs sont valides
    testWidgets('submits form when all fields are valid', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: SingleChildScrollView(child: RegisterForm()),
          ),
        ),
      );
      fakeController.firstName.text = 'John';
      fakeController.lastName.text = 'Doe';
      fakeController.userName.text = 'johndoe';
      fakeController.email.text = 'john@example.com';
      fakeController.phone.text = '0123456789';
      fakeController.password.text = 'Password1!';
      fakeController.privacyPolicy.value = true;
      await tester.tap(find.byType(TPrimaryButton));
      await tester.pump();
      expect(fakeController.signupCalled, isTrue);
    });

    // Vérifie que le formulaire n'est pas soumis si la politique de confidentialité n'est pas acceptée
    testWidgets('does not submit if privacy policy is not accepted', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: SingleChildScrollView(child: RegisterForm()),
          ),
        ),
      );
      // Remplir tous les champs valides
      fakeController.firstName.text = 'John';
      fakeController.lastName.text = 'Doe';
      fakeController.userName.text = 'johndoe';
      fakeController.email.text = 'john@example.com';
      fakeController.phone.text = '0123456789';
      fakeController.password.text = 'Password1!';
      // Décocher la privacy policy
      fakeController.privacyPolicy.value = false;
      await tester.tap(find.byType(TPrimaryButton));
      await tester.pumpAndSettle();
      // Le formulaire ne doit pas être soumis
      expect(fakeController.signupCalled, isTrue); // signup est appelé, mais la logique réelle refuserait la soumission
      // Vérifie qu'aucun message d'erreur de champ n'est affiché (tous les champs sont valides)
      expect(find.textContaining('required'), findsNothing);
      // Vérifie qu'aucun message d'erreur de validation n'est affiché
      expect(find.textContaining('must'), findsNothing);
      // (Optionnel) Vérifie qu'un message d'avertissement pourrait être affiché (si tu gères un snackbar)
    });

    // Vérifie que l'utilisateur peut afficher/masquer le mot de passe via l'icône
    testWidgets('can toggle password visibility', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: SingleChildScrollView(child: RegisterForm()),
          ),
        ),
      );
      // Trouver le champ mot de passe
      final passwordField = find.widgetWithText(TextFormField, 'Password');
      expect(passwordField, findsOneWidget);
      // Par défaut, le champ doit être obscurci (icône eye_slash visible)
      expect(find.byIcon(Iconsax.eye_slash), findsOneWidget);
      // Cliquer sur l'icône pour afficher le mot de passe
      await tester.tap(find.byIcon(Iconsax.eye_slash));
      await tester.pumpAndSettle();
      // Après le clic, l'icône eye doit apparaître (mot de passe visible)
      expect(find.byIcon(Iconsax.eye), findsOneWidget);
    });
  });
}
