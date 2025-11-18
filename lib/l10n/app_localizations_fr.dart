// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get locale => 'Français';

  @override
  String get appName => 'DREAM TEAM';

  @override
  String get language => 'Français';

  @override
  String get onboardingTitle1 => 'Choisissez votre produit';

  @override
  String get onboardingTitle2 => 'Sélectionner le mode de paiement';

  @override
  String get onboardingTitle3 => 'Livraison à domicile';

  @override
  String get onboardingSubTitle1 =>
      'Bienvenue dans un monde de choix illimités - votre produit préféré vous attend !';

  @override
  String get onboardingSubTitle2 =>
      'Pour une transaction transparente, choisissez votre mode de paiement - votre confort, notre priorité !';

  @override
  String get onboardingSubTitle3 =>
      'De notre porte à la vôtre - livraison rapide, sécurisée et sans contact';

  @override
  String get btnSkip => 'Sauter';

  @override
  String get loginTitle => 'Bienvenue à nouveau,';

  @override
  String get loginSubTitle =>
      'Découvrez des choix limités et des commodités inégalées.';

  @override
  String get enterEmail => 'Entrez votre e-mail';

  @override
  String get enterPassword => 'Entrer votre mot de passe';

  @override
  String get rememberMe => 'Se souvenir de moi';

  @override
  String get forgotPassword => 'Mot de passe oublié ?';

  @override
  String get signIn => 'Se connecter';

  @override
  String get doYouHaveAnAccount => 'Create a Account';

  @override
  String get orSignInWith => 'Ou connectez-vous avec';

  @override
  String get createAAccount => 'Créez votre compte';

  @override
  String get firstname => 'Prénom';

  @override
  String get lastname => 'Nom';

  @override
  String get username => 'Nom d\'utilisateur';

  @override
  String get phoneNumber => 'Numéro de téléphone';

  @override
  String get iAgreeTo => 'J\'accepte de';

  @override
  String get privatePolice => 'police de confidentialité';

  @override
  String get abvAnd => 'et';

  @override
  String get abvOr => 'ou';

  @override
  String get termsOfUse => 'conditions d\'utilisation';

  @override
  String get createAccount => 'Créer un compte';

  @override
  String get orSignUpWith => 'Ou inscrivez-vous avec';

  @override
  String get confirmEmail => 'Vérifier votre adresse e-mail';

  @override
  String get confirmEmailSubTitle =>
      'Félicitations ! Votre compte attend : vérifiez votre Email pour commencer à faire des achats et des expériences.';

  @override
  String get emailNotReceivedMessage =>
      'Vous n\'avez pas reçu votre e-mail ? Vérifiez votre portée ou renvoyez-le.';

  @override
  String get btnContinue => 'Continuer';

  @override
  String get resendEmail => 'Renvoyer le mail';

  @override
  String get yourAccountCreatedTitle => 'Votre compte a été créé avec succès !';

  @override
  String get yourAccountCreatedSubTitle =>
      'Bienvenue dans votre destination shopping ultime. Votre compte est créé. Découvrez les joies du shopping en ligne en toute transparence !';

  @override
  String get forgotPasswordTitle => 'Mot de passe oublié ?';

  @override
  String get forgotPasswordSubtitle =>
      'Ne vous inquiétez pas, il arrive aussi que l\'on oublie. Saisissez votre adresse électronique et nous vous enverrons le lien de réinitialisation.';

  @override
  String get submit => 'Envoyer';

  @override
  String get passwordResetEmailSend => 'Password reset Email send';

  @override
  String get passwordResetEmailSendSubtitle =>
      'La sécurité de votre compte est notre priorité ! Nous vous avons envoyé un lien de sécurité pour changer votre mot de passe en toute sécurité et protéger votre compte.';

  @override
  String get done => 'terminee';

  @override
  String get home => 'Accueil';

  @override
  String get store => 'Magasin';

  @override
  String get favorite => 'Favoris';

  @override
  String get profile => 'Profil';

  @override
  String get homeAppBarTitle => 'Bonne journée pour le shopping';

  @override
  String get homeSearchTitle => 'Recherche en magasin';

  @override
  String get homeCategoriesTitle => 'Catégories populaires';

  @override
  String get storeTitle => 'Boutique';

  @override
  String get storeSearchTitle => 'Recherche en magasin';

  @override
  String get storeFeaturedBrandsTitle => 'Marques en vedette';

  @override
  String fieldRequired(Object field) {
    return '$field est requis.';
  }

  @override
  String get emailRequired => 'L\'email est requis.';

  @override
  String get invalidEmail => 'Adresse email invalide.';

  @override
  String get phoneRequired => 'Le numéro de téléphone est requis.';

  @override
  String get invalidPhone =>
      'Format de numéro de téléphone invalide (10 chiffres requis).';

  @override
  String get passwordRequired => 'Le mot de passe est requis.';

  @override
  String get passwordTooShort =>
      'Le mot de passe doit contenir au moins 6 caractères.';

  @override
  String get passwordNeedsUppercase =>
      'Le mot de passe doit contenir au moins une majuscule.';

  @override
  String get passwordNeedsNumber =>
      'Le mot de passe doit contenir au moins un chiffre.';

  @override
  String get passwordNeedsSpecial =>
      'Le mot de passe doit contenir au moins un caractère spécial.';
}
