import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
  }) =>
      [enText, esText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'vgo6xkl0': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Events
  {
    '9rwtk0cd': {
      'en': 'asdfasdfasdf idk',
      'es': 'asdfasdfasdf no sé',
    },
    'vqrob0gm': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Announcements
  {
    'lznq1wwo': {
      'en': 'Announcements',
      'es': 'Anuncios',
    },
    '0qzj91xg': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Notifications
  {
    'ic7yfb2d': {
      'en': 'Notifications',
      'es': 'Notificaciones',
    },
    'ovaggf7w': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Menu
  {
    'xgffaaiy': {
      'en': 'John Smith',
      'es': 'John Smith',
    },
    'f9z95o0u': {
      'en': '@johnsmth',
      'es': '@johnsmth',
    },
    'wgfuph64': {
      'en': 'smithj@roverkids.org',
      'es': 'smithj@roverkids.org',
    },
    'orx17zzf': {
      'en': 'Schools',
      'es': 'Escuelas',
    },
    'rr1addua': {
      'en': 'Report a Bug',
      'es': 'Reportar un error',
    },
    'qosbnseh': {
      'en': 'Settings',
      'es': 'Ajustes',
    },
    'xrjugmt1': {
      'en': 'About',
      'es': 'Sobre',
    },
    '7vefdhpd': {
      'en': 'Log Out',
      'es': 'Cerrar sesión',
    },
    '4mkevc6b': {
      'en': 'RoverLink',
      'es': 'RoverLink',
    },
    '99jh2zy8': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // YourProfile
  {
    'pvml1uvt': {
      'en': '@johnsmth',
      'es': '@johnsmth',
    },
    '4m7glwx6': {
      'en': 'smithj@roverkids.org',
      'es': 'smithj@roverkids.org',
    },
    'f3lrbddq': {
      'en': 'Student',
      'es': 'Alumno',
    },
    'g5djk00i': {
      'en': 'Developer',
      'es': 'Desarrollador',
    },
    'h2m279q1': {
      'en': 'Your Posts',
      'es': 'Tus publicaciones',
    },
    '128bjwio': {
      'en': 'John Smith',
      'es': 'John Smith',
    },
    '3eryex94': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // ReportABug
  {
    'tgvlttpa': {
      'en': 'Report a Bug',
      'es': 'Reportar un error',
    },
    'i0842x48': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // About
  {
    '71leui0d': {
      'en': 'Terms of  Use >',
      'es': 'Condiciones de uso >',
    },
    'nxi85yjz': {
      'en': 'Privacy Policy >',
      'es': 'Política de privacidad >',
    },
    '0igoc7rh': {
      'en': 'About',
      'es': 'Sobre',
    },
    '2npc64dd': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // PrivacyPolicy
  {
    'yjmnhfal': {
      'en': 'Privacy Policy',
      'es': 'Política de privacidad',
    },
    'd9hd9ruv': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // TermsOfUse
  {
    'ciag688w': {
      'en': 'Terms Of Use',
      'es': 'Términos de Uso',
    },
    '8jsw7lwr': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Onboarding
  {
    'spquv07m': {
      'en': 'RoverLink',
      'es': 'RoverLink',
    },
    'nwm3x2ci': {
      'en': 'Connect With Peers',
      'es': 'Conectar con compañeros',
    },
    'mbvv5wuj': {
      'en':
          'Our platform creates a safe, friendly environment for students to form a shared sense of community.',
      'es':
          'Nuestra plataforma crea un ambiente seguro y amigable para que los estudiantes formen un sentido compartido de comunidad.',
    },
    '0vkk9jb4': {
      'en': 'Stay Up to Date',
      'es': 'Estar al día',
    },
    'lgulcrc0': {
      'en': 'Keep up with the latest announcements from our district.',
      'es': 'Manténgase al día con los últimos anuncios de nuestro distrito.',
    },
    'if1zlxpq': {
      'en': 'Report Absences',
      'es': 'Reportar Ausencias',
    },
    'tn2qltve': {
      'en': 'Easily submit absences to your school office',
      'es': 'Envíe fácilmente las ausencias a la oficina de su escuela',
    },
    '9y5crtlg': {
      'en': 'Continue',
      'es': 'Continuar',
    },
  },
  // Login
  {
    'fw22h2r7': {
      'en': 'Sign In',
      'es': 'Registrarse',
    },
    '5uknzhia': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
    },
    't3a5dj0t': {
      'en': 'Password',
      'es': 'Clave',
    },
    'hy0koxex': {
      'en': 'Login',
      'es': 'Acceso',
    },
    'ldepbzep': {
      'en': 'Login as Guest',
      'es': 'Iniciar sesión como invitado',
    },
    'd59ena4o': {
      'en': 'Forgot Password?',
      'es': '¿Has olvidado tu contraseña?',
    },
    '0vvoynsh': {
      'en': 'Or use a social account to login',
      'es': 'O use una cuenta social para iniciar sesión',
    },
    '432nyxa1': {
      'en': 'Sign Up',
      'es': 'Inscribirse',
    },
    '46p8zoxf': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
    },
    'uvpchzqb': {
      'en': 'Password',
      'es': 'Clave',
    },
    'cuwd3isk': {
      'en': 'Confirm Password',
      'es': 'Confirmar contraseña',
    },
    'vlydnlyl': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
    },
    'e0v4b1we': {
      'en': 'Or use a social account to create account',
      'es': 'O use una cuenta social para crear una cuenta',
    },
    'zquwm76t': {
      'en': 'By clicking \"Create Account\" you agree to our ',
      'es': 'Al hacer clic en \"Crear cuenta\", aceptas nuestros',
    },
    '7q7e9rd3': {
      'en': 'Terms of Use',
      'es': 'Términos de Uso',
    },
    '7r5t8rbc': {
      'en': 'and',
      'es': 'y',
    },
    '2s8cej1h': {
      'en': 'Privacy Policy',
      'es': 'Política de privacidad',
    },
    '1htdiqyk': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // ForgotPassword
  {
    'r9qondpm': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'es':
          'Le enviaremos un correo electrónico con un enlace para restablecer su contraseña, ingrese el correo electrónico asociado con su cuenta a continuación.',
    },
    'c86nuu8p': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
    },
    'wt8fom27': {
      'en': 'Send Link',
      'es': 'Enviar enlace',
    },
    'ngmn4z29': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // AboutCopy
  {
    '0jf66ulq': {
      'en': 'About',
      'es': 'Sobre',
    },
    'x6ktc8nw': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // SigningOut
  {
    'k3xhf8py': {
      'en': 'Come back soon!',
      'es': '',
    },
    '4nwadicu': {
      'en': 'Home',
      'es': '',
    },
  },
  // AddContentSelector
  {
    'f25z3d1z': {
      'en': 'Share',
      'es': 'Cuota',
    },
    '5tk1ocrh': {
      'en': 'Phone a Friend',
      'es': 'Llamar a un amigo',
    },
    'xcdyw8hv': {
      'en': 'Turn in Absence Excuse',
      'es': 'Entregar excusa de ausencia',
    },
    't7nb2xmc': {
      'en': 'Add Post',
      'es': 'Añadir publicación',
    },
  },
  // SocialPost
  {
    'jqn6iwma': {
      'en': '•',
      'es': '•',
    },
    'iklzch53': {
      'en': '4',
      'es': '4',
    },
    '8xg00nve': {
      'en': '4',
      'es': '4',
    },
  },
  // CustomAppBar
  {
    'z9j9w26h': {
      'en': '6',
      'es': '6',
    },
    'y0g4iir5': {
      'en': '6',
      'es': '6',
    },
  },
  // CustomAppBarCopy
  {
    'm6x8ui7t': {
      'en': '6',
      'es': '6',
    },
    'i9hhqjo1': {
      'en': '6',
      'es': '6',
    },
  },
  // Announcement
  {
    '9uhbwmcj': {
      'en': 'Title',
      'es': 'Título',
    },
  },
  // Miscellaneous
  {
    '27uisxge': {
      'en': '',
      'es': '',
    },
    '7cd0q1oi': {
      'en': '',
      'es': '',
    },
    'tnoj489c': {
      'en': '',
      'es': '',
    },
    'af1r9e4f': {
      'en': '',
      'es': '',
    },
    'ord8iu06': {
      'en': '',
      'es': '',
    },
    'ledzzqxl': {
      'en': '',
      'es': '',
    },
    '9lc86xlj': {
      'en': '',
      'es': '',
    },
    '55bzymjq': {
      'en': '',
      'es': '',
    },
    'xzjcgl5m': {
      'en': '',
      'es': '',
    },
    'k5cd3sc5': {
      'en': '',
      'es': '',
    },
    'hl4mynpz': {
      'en': '',
      'es': '',
    },
    'dda570ya': {
      'en': '',
      'es': '',
    },
    '0w6cdejq': {
      'en': '',
      'es': '',
    },
    '94y8vwx2': {
      'en': '',
      'es': '',
    },
    'lhsh4feb': {
      'en': '',
      'es': '',
    },
    '3h9uz7mu': {
      'en': '',
      'es': '',
    },
    'yfl28dcy': {
      'en': '',
      'es': '',
    },
    '880yr452': {
      'en': '',
      'es': '',
    },
    'zpq5nh8r': {
      'en': '',
      'es': '',
    },
    '1kguvq3s': {
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
