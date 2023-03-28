import 'package:flutter/material.dart';
import 'package:flutter_auth/views/widgets/hero.dart';

const String imgDomaine = "https://profondesolution.online/storage";

const Color lightBlueColor = Color(0xFF54A0FF);
const Color darkBlueColor = Color(0xFF0046CE);
const Color menuColor = Color(0xFF6F35A5);
const Color menuHoverColor = Color(0xB3FFFFFF);
const Color drawerColor = lightBlueColor;
const List<Color> authLinarGrad = [Color(0xFFFFFFFF), Color(0xFFFFFFFF)];
final GlobalKey<ScaffoldState> homeScreenScaffold = GlobalKey<ScaffoldState>();
const darkGray = Color(0xFF4A4B4D);
const lightGray = Color(0xFF7C7D7E);

const String logoFloukaPrimary = "assets/images/logo.png";
const String logoFloukaSecondary = "";
/* --------------------------------- signup view --------------------------------- */
const String signupinputName = "Nom et prénom";
const String signupinputEmail = "E-mail";
const String signupinputPhone = "Téléphone";
const String signupButton = "S'inscrire";
const Color signupButtonColor = darkBlueColor;
const String signupBottomText = "Vous avez déja un compte ? ";
const TextStyle signupBottomTextStyle = TextStyle(color: Colors.black);
const String signupBottomButton = " Connectez-vous";
const TextStyle signupBottomButtomStyle = TextStyle(
  color: darkBlueColor,
  fontWeight: FontWeight.bold,
);
/* ---------------------------------- login view --------------------------------- */
const String loginLogo = "assets/images/logo.png";
const String logininputEmail = "E-mail ou Téléphone";
const String logininputPassword = "Mot de passe";
const String loginButton = "Se connecter";
const Color loginButtonColor = darkBlueColor;
const String loginBottomText = "Vous n'être pas encore inscrit sur Flouka ? ";
const TextStyle loginBottomTextStyle = TextStyle(color: Colors.black);
const String loginBottomButton = " Inscrivez-vous";
const TextStyle loginBottomButtomStyle = TextStyle(
  color: darkBlueColor,
  fontWeight: FontWeight.bold,
);

/* ------------------------------ Confirmation view ------------------------------ */
const String confirmationIcon = "assets/images/send.png";
const String topText = "Votre compte a été créé avec succès ";
const TextStyle topTextStyle = TextStyle(fontWeight: FontWeight.normal);
const String bottomText =
    "Consulter votre boite E-mail pour obtenir votre mot de passe ";
const TextStyle bottomTextStyle = TextStyle(fontWeight: FontWeight.normal);
const String buttonText = "Se connecter";
const Color buttonColor = darkBlueColor;

/* ---------------------------------- home view ---------------------------------- */
List customHeroList = [
  CustomHero(
    image: "images/fish3.jpg",
    text: "FLOUKA",
    desc: "blabla bla qdsdq qsd qde fqs dqs d",
  ),
  CustomHero(
    image: "images/fish5.jpg",
    text: "FLOUKA",
    desc: "blabla bla qdsdq qsd qde fqs dqs d",
  ),
  CustomHero(
    image: "images/fish4.jpg",
    text: "FLOUKA",
    desc: "blabla bla qdsdq qsd qde fqs dqs d",
  ),
  CustomHero(
    image: "images/fish1.jpeg",
    text: "FLOUKA",
    desc: "blabla bla qdsdq qsd qde fqs dqs d",
  )
];
const Color homeBgColor = Colors.white;

/* ----------------------------- product view ----------------------------- */
/* ------------------ appbar ------------------- */
const Color productAppBartopAreaColor = darkBlueColor;
const Color productAppBartopAreaVilleButtonfillColor = lightBlueColor;
const Color productAppBartopAreasplashVilleButtonColor = darkBlueColor;
