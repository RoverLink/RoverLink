import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'fr', 'de', 'zh_Hans'];

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
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? frText = '',
    String? deText = '',
    String? zh_HansText = '',
  }) =>
      [enText, esText, frText, deText, zh_HansText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
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
  // ReportAbsence
  {
    'jwwhxy1w': {
      'en': 'Student\'s Full Name',
      'de': 'Vollständiger Name des Schülers',
      'es': 'Nombre completo del estudiante',
      'fr': 'Nom complet de l\'étudiant',
      'zh_Hans': '学生全名',
    },
    'hj5u572u': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'u546gkcb': {
      'en': 'Easton Area High School',
      'de': 'Easton Area Highschool',
      'es': 'Escuela secundaria del área de Easton',
      'fr': 'École secondaire de la région d\'Easton',
      'zh_Hans': '伊斯顿地区高中',
    },
    'td3ko32x': {
      'en': 'Easton Area Middle School',
      'de': 'Easton Area Mittelschule',
      'es': 'Escuela secundaria del área de Easton',
      'fr': 'École intermédiaire de la région d\'Easton',
      'zh_Hans': '伊斯顿地区中学',
    },
    'ezn4z6q4': {
      'en': 'Palmer Elementary School',
      'de': 'Palmer Grundschule',
      'es': 'Escuela Primaria Palmer',
      'fr': 'École primaire Palmer',
      'zh_Hans': '帕默小学',
    },
    '95odp2s9': {
      'en': 'Forks Elementary School',
      'de': 'Forks Grundschule',
      'es': 'Escuela Primaria Forks',
      'fr': 'École primaire de la fourche',
      'zh_Hans': '福克斯小学',
    },
    'wttpv6mg': {
      'en': 'Tracy Elementary School',
      'de': 'Tracy Grundschule',
      'es': 'Escuela Primaria Tracy',
      'fr': 'École primaire Tracy',
      'zh_Hans': '特雷西小学',
    },
    'ye394v5i': {
      'en': 'Cheston Elementary School',
      'de': 'Cheston Grundschule',
      'es': 'Escuela Primaria Cheston',
      'fr': 'École primaire de Cheston',
      'zh_Hans': '切斯顿小学',
    },
    'c663xwra': {
      'en': 'Paxinosa Elementary School',
      'de': 'Paxinosa-Grundschule',
      'es': 'Escuela Primaria Paxinosa',
      'fr': 'École primaire Paxinosa',
      'zh_Hans': '帕西诺萨小学',
    },
    'slco59yt': {
      'en': 'Shawnee Elementary School',
      'de': 'Shawnee-Grundschule',
      'es': 'Escuela Primaria Shawnee',
      'fr': 'École primaire Shawnee',
      'zh_Hans': '肖尼小学',
    },
    'hadultzj': {
      'en': 'March Elementary School',
      'de': 'März Grundschule',
      'es': 'Escuela primaria de marzo',
      'fr': 'École primaire de mars',
      'zh_Hans': '三月小学',
    },
    '2lrlcmws': {
      'en': 'Easton Cyber Academy',
      'de': 'Easton Cyber-Akademie',
      'es': 'Academia cibernética de Easton',
      'fr': 'CyberAcadémie d\'Easton',
      'zh_Hans': '伊斯顿网络学院',
    },
    'k5ogbgzy': {
      'en': 'Please select a School',
      'de': 'Bitte wählen Sie eine Schule aus',
      'es': 'Por favor seleccione una Escuela',
      'fr': 'Veuillez sélectionner une école',
      'zh_Hans': '请选择学校',
    },
    'a472bdc8': {
      'en': 'Teacher',
      'de': 'Lehrer',
      'es': 'Maestro',
      'fr': 'Professeur',
      'zh_Hans': '老师',
    },
    '35ht5wfx': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'qfkjpxyg': {
      'en': 'Kindergarten',
      'de': 'Kindergarten',
      'es': 'Jardín de infancia',
      'fr': 'Jardin d\'enfants',
      'zh_Hans': '幼儿园',
    },
    'ku0m2sig': {
      'en': '1st Grade',
      'de': '1. Klasse',
      'es': '1er grado',
      'fr': '1ère année',
      'zh_Hans': '一年级',
    },
    'e7gxn2u3': {
      'en': '2nd Grade',
      'de': '2. Klasse',
      'es': '2do. grado',
      'fr': '2e année',
      'zh_Hans': '二年级',
    },
    'm38xj8c2': {
      'en': '3rd Grade',
      'de': '3. Klasse',
      'es': '3er grado',
      'fr': '3e année',
      'zh_Hans': '三年级',
    },
    'vg2qkos0': {
      'en': '4th Grade',
      'de': '4. Klasse',
      'es': 'Cuarto grado',
      'fr': '4e année',
      'zh_Hans': '四年级',
    },
    'qxqlbsfh': {
      'en': '5th Grade',
      'de': '5. Klasse',
      'es': '5to grado',
      'fr': '5e année',
      'zh_Hans': '五年级',
    },
    'r9nul7lr': {
      'en': '6th Grade',
      'de': '6. Klasse',
      'es': '6to grado',
      'fr': '6ème année',
      'zh_Hans': '六年级',
    },
    'cs5gm7aa': {
      'en': '7th Grade',
      'de': '7. Klasse',
      'es': 'Séptimo grado',
      'fr': '7e année',
      'zh_Hans': '7年级',
    },
    '7kk549v5': {
      'en': '8th Grade',
      'de': '8. Klasse',
      'es': 'Octavo grado',
      'fr': '8e année',
      'zh_Hans': '8年级',
    },
    'qbhk3f34': {
      'en': '9th Grade',
      'de': '9.Klasse',
      'es': 'Noveno grado',
      'fr': '9e année',
      'zh_Hans': '9年级',
    },
    'pyq64fdx': {
      'en': '10th Grade',
      'de': '10. Klasse',
      'es': '10 ° grado',
      'fr': '10ème année',
      'zh_Hans': '十年级',
    },
    'nkzzxbye': {
      'en': '11th Grade',
      'de': '11. Klasse',
      'es': 'Grado 11',
      'fr': '11e année',
      'zh_Hans': '11年级',
    },
    '730k1onl': {
      'en': '12th Grade',
      'de': '12. Klasse',
      'es': '12 ° grado',
      'fr': '12e année',
      'zh_Hans': '12年级',
    },
    'cibsn1fo': {
      'en': 'Please select a grade level',
      'de': 'Bitte wählen Sie eine Klassenstufe aus',
      'es': 'Seleccione un nivel de grado',
      'fr': 'Veuillez sélectionner un niveau scolaire',
      'zh_Hans': '请选择年级',
    },
    'on1dkp4r': {
      'en': 'Easton Area High School',
      'de': 'Easton Area Highschool',
      'es': 'Escuela secundaria del área de Easton',
      'fr': 'École secondaire de la région d\'Easton',
      'zh_Hans': '伊斯顿地区高中',
    },
    'yb7dpl97': {
      'en': 'Easton Area Middle School',
      'de': 'Easton Area Mittelschule',
      'es': 'Escuela secundaria del área de Easton',
      'fr': 'École intermédiaire de la région d\'Easton',
      'zh_Hans': '伊斯顿地区中学',
    },
    'nzbljogx': {
      'en': 'Palmer Elementary School',
      'de': 'Palmer Grundschule',
      'es': 'Escuela Primaria Palmer',
      'fr': 'École primaire Palmer',
      'zh_Hans': '帕默小学',
    },
    'kgv9lkeb': {
      'en': 'Forks Elementary School',
      'de': 'Forks Grundschule',
      'es': 'Escuela Primaria Forks',
      'fr': 'École primaire de la fourche',
      'zh_Hans': '福克斯小学',
    },
    'jhwjdhd3': {
      'en': 'Tracy Elementary School',
      'de': 'Tracy Grundschule',
      'es': 'Escuela Primaria Tracy',
      'fr': 'École primaire Tracy',
      'zh_Hans': '特雷西小学',
    },
    'dy4gylei': {
      'en': 'Cheston Elementary School',
      'de': 'Cheston Grundschule',
      'es': 'Escuela Primaria Cheston',
      'fr': 'École primaire de Cheston',
      'zh_Hans': '切斯顿小学',
    },
    'ge3sybgh': {
      'en': 'Paxinosa Elementary School',
      'de': 'Paxinosa-Grundschule',
      'es': 'Escuela Primaria Paxinosa',
      'fr': 'École primaire Paxinosa',
      'zh_Hans': '帕西诺萨小学',
    },
    'btty1ymk': {
      'en': 'Shawnee Elementary School',
      'de': 'Shawnee-Grundschule',
      'es': 'Escuela Primaria Shawnee',
      'fr': 'École primaire Shawnee',
      'zh_Hans': '肖尼小学',
    },
    '3bpnqrgn': {
      'en': 'March Elementary School',
      'de': 'März Grundschule',
      'es': 'Escuela primaria de marzo',
      'fr': 'École primaire de mars',
      'zh_Hans': '三月小学',
    },
    '3vdgfxt3': {
      'en': 'Easton Cyber Academy',
      'de': 'Easton Cyber-Akademie',
      'es': 'Academia cibernética de Easton',
      'fr': 'CyberAcadémie d\'Easton',
      'zh_Hans': '伊斯顿网络学院',
    },
    'r2rf8lbi': {
      'en': 'Please select a Reason',
      'de': 'Bitte wählen Sie einen Grund aus',
      'es': 'Por favor seleccione una razón',
      'fr': 'Veuillez sélectionner une raison',
      'zh_Hans': '请选择原因',
    },
    'xrqv4ouh': {
      'en': 'Reason for Absence',
      'de': 'Grund für die Abwesenheit',
      'es': 'Motivo de la ausencia',
      'fr': 'Motif de l\'absence',
      'zh_Hans': '缺席原因',
    },
    'rmbtcthh': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '2cpyhjt3': {
      'en': 'Optional: Add Doctor\'s Note Photo',
      'de': 'Optional: Fügen Sie ein Arztbrieffoto hinzu',
      'es': 'Opcional: agregue la foto de la nota del médico',
      'fr': 'Facultatif : ajouter une photo de note du médecin',
      'zh_Hans': '可选：添加医生的笔记照片',
    },
    '3c4nk704': {
      'en': 'Parent or Guardian Signature',
      'de': 'Unterschrift der Eltern oder Erziehungsberechtigten',
      'es': 'Firma del padre o tutor',
      'fr': 'Signature du parent ou du tuteur',
      'zh_Hans': '家长或监护人签名',
    },
    'lqihzcox': {
      'en': 'Sign your name in the box below',
      'de': 'Tragen Sie Ihren Namen in das unten stehende Feld ein',
      'es': 'Firme su nombre en el cuadro de abajo',
      'fr': 'Signez votre nom dans la case ci-dessous',
      'zh_Hans': '在下面的框中签上您的名字',
    },
    'bdsydx61': {
      'en': 'Submit',
      'de': 'Einreichen',
      'es': 'Entregar',
      'fr': 'Soumettre',
      'zh_Hans': '提交',
    },
    '6qrnuoul': {
      'en': 'Please enter full name of student',
      'de': 'Bitte geben Sie den vollständigen Namen des Schülers ein',
      'es': 'Por favor ingrese el nombre completo del estudiante',
      'fr': 'Veuillez entrer le nom complet de l\'étudiant',
      'zh_Hans': '请输入学生全名',
    },
    'yl7jmd83': {
      'en': 'Please enter full name of student',
      'de': 'Bitte geben Sie den vollständigen Namen des Schülers ein',
      'es': 'Por favor ingrese el nombre completo del estudiante',
      'fr': 'Veuillez entrer le nom complet de l\'étudiant',
      'zh_Hans': '请输入学生全名',
    },
    '5qf83f4u': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'a05ebpc4': {
      'en': 'Please enter the name of the student\'s homeroom teacher',
      'de': 'Bitte geben Sie den Namen des Klassenlehrers des Schülers ein',
      'es': 'Ingrese el nombre del maestro de salón del estudiante',
      'fr': 'Veuillez entrer le nom du professeur principal de l\'élève',
      'zh_Hans': '请输入学生的班主任姓名',
    },
    'vy8t6bt5': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'mlgmzzoo': {
      'en': 'A reason for student\'s absence must be provided',
      'de': 'Das Fernbleiben des Studierenden muss begründet werden',
      'es': 'Se debe proporcionar una razón para la ausencia del estudiante.',
      'fr': 'Un motif d\'absence de l\'élève doit être fourni',
      'zh_Hans': '必须提供学生缺勤的原因',
    },
    'zxot1wum': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'ig4pe40x': {
      'en': 'Report Absence ',
      'de': 'Abwesenheit melden',
      'es': 'Reportar Ausencia',
      'fr': 'Signaler une absence',
      'zh_Hans': '报告缺勤',
    },
    'gj776w48': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // HomePage
  {
    'k73poz8k': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // Events
  {
    'vqrob0gm': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // AbsenceExpandedOld
  {
    '87jd2exx': {
      'en': 'Child',
      'de': 'Kind',
      'es': 'Niño',
      'fr': 'Enfant',
      'zh_Hans': '孩子',
    },
    'vbh6sgce': {
      'en': 'Alexander Harrison',
      'de': 'Alexander Harrison',
      'es': 'alexander harrison',
      'fr': 'Alexandre Harrisson',
      'zh_Hans': '亚历山大·哈里森',
    },
    'o56z8dlq': {
      'en': 'School',
      'de': 'Schule',
      'es': 'Escuela',
      'fr': 'École',
      'zh_Hans': '学校',
    },
    'oyqitgtw': {
      'en': 'Easton Area High School',
      'de': 'Easton Area Highschool',
      'es': 'Escuela secundaria del área de Easton',
      'fr': 'École secondaire de la région d\'Easton',
      'zh_Hans': '伊斯顿地区高中',
    },
    'aedhtyol': {
      'en': 'Teacher',
      'de': 'Lehrer',
      'es': 'Maestro',
      'fr': 'Professeur',
      'zh_Hans': '老师',
    },
    '3cnbify0': {
      'en': 'Mr. Tanczos',
      'de': 'Herr Tanczos',
      'es': 'Sr. Tanczos',
      'fr': 'M. Tanczos',
      'zh_Hans': '坦佐斯先生',
    },
    'od06e5o6': {
      'en': 'Grade',
      'de': 'Grad',
      'es': 'Calificación',
      'fr': 'Grade',
      'zh_Hans': '年级',
    },
    '2cevenmh': {
      'en': '11',
      'de': '11',
      'es': '11',
      'fr': '11',
      'zh_Hans': '11',
    },
    '0x4losxl': {
      'en': 'Absent On',
      'de': 'Abwesend an',
      'es': 'Ausente en',
      'fr': 'Absent le',
      'zh_Hans': '缺席',
    },
    'f842qj6j': {
      'en': '11-18-2006',
      'de': '18.11.2006',
      'es': '18-11-2006',
      'fr': '18-11-2006',
      'zh_Hans': '11-18-2006',
    },
    'l3wz0i3v': {
      'en': 'Submitted On',
      'de': 'Eingereicht am',
      'es': 'Enviado el',
      'fr': 'Soumis le',
      'zh_Hans': '提交于',
    },
    'i4zza49r': {
      'en': '11-16-2006',
      'de': '16.11.2006',
      'es': '16-11-2006',
      'fr': '16-11-2006',
      'zh_Hans': '11-16-2006',
    },
    'e0svq97e': {
      'en': 'Reason',
      'de': 'Grund',
      'es': 'Razón',
      'fr': 'Raison',
      'zh_Hans': '原因',
    },
    'ea2932mk': {
      'en':
          'He has a scheduled appointment with his dentist that day and will need to miss his classes. He had been suffering from a severe toothache for a week and could not bear it any longer. He hoped that he would not miss anything important in his classes and that he would recover soon.',
      'de':
          'Er hat an diesem Tag einen Termin bei seinem Zahnarzt und muss seinen Unterricht verpassen. Er litt seit einer Woche unter starken Zahnschmerzen und konnte es nicht länger ertragen. Er hoffte, dass er in seinem Unterricht nichts Wichtiges verpassen würde und dass er sich bald erholen würde.',
      'es':
          'Tiene una cita programada con su dentista ese día y tendrá que faltar a sus clases. Llevaba una semana sufriendo de un fuerte dolor de muelas y no podía soportarlo más. Esperaba no perderse nada importante en sus clases y recuperarse pronto.',
      'fr':
          'Il a un rendez-vous avec son dentiste ce jour-là et devra manquer ses cours. Il souffrait d\'un mal de dents sévère depuis une semaine et ne pouvait plus le supporter. Il espérait qu\'il ne manquerait rien d\'important dans ses cours et qu\'il se remettrait bientôt.',
      'zh_Hans':
          '那天他和牙医有预约，需要缺课。他牙痛得厉害已经一个星期了，再也忍不住了。他希望他不会错过课堂上任何重要的事情，并希望他能尽快康复。',
    },
    'cqsofh01': {
      'en': 'Doctor\'s Note',
      'de': 'Arztbrief',
      'es': 'Nota del doctor',
      'fr': 'Note du médecin',
      'zh_Hans': '医生的笔记',
    },
    '0wmlh8q8': {
      'en': 'Approved',
      'de': 'Genehmigt',
      'es': 'Aprobado',
      'fr': 'Approuvé',
      'zh_Hans': '得到正式认可的',
    },
    'aayi2oyc': {
      'en': 'View Absence',
      'de': 'Abwesenheit anzeigen',
      'es': 'Ver Ausencia',
      'fr': 'Voir les absences',
      'zh_Hans': '查看缺席',
    },
    '1xq41fsl': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // CreatePost
  {
    'dcie39sd': {
      'en': 'Create Post',
      'de': 'Beitrag erstellen',
      'es': 'Crear publicación',
      'fr': 'Créer une publication',
      'zh_Hans': '创建帖子',
    },
    'lu1w8fti': {
      'en': 'Type here...',
      'de': 'Geben Sie hier ein ...',
      'es': 'Escriba aquí...',
      'fr': 'Écrivez ici...',
      'zh_Hans': '在此输入...',
    },
    'c4kuko6g': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
      'zh_Hans': '字段是必需的',
    },
    'usxnx0h5': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'pvh8cex1': {
      'en': 'Post',
      'de': 'Post',
      'es': 'Correo',
      'fr': 'Poste',
      'zh_Hans': '邮政',
    },
    'zw170fdi': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // Absences
  {
    '252c3uhe': {
      'en': 'Submit New Absence',
      'de': 'Neue Abwesenheit übermitteln',
      'es': 'Enviar nueva ausencia',
      'fr': 'Soumettre une nouvelle absence',
      'zh_Hans': '提交新的缺席',
    },
    'wbm7jlpz': {
      'en': 'Absences',
      'de': 'Abwesenheiten',
      'es': 'Ausencias',
      'fr': 'Absences',
      'zh_Hans': '缺席',
    },
    'pm3x1pyf': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // Explore
  {
    'estbh1xm': {
      'en': 'People',
      'de': 'Menschen',
      'es': 'Gente',
      'fr': 'Personnes',
      'zh_Hans': '人们',
    },
    '7tw0nthw': {
      'en': 'View All',
      'de': 'Alle ansehen',
      'es': 'Ver todo',
      'fr': 'Voir tout',
      'zh_Hans': '查看全部',
    },
    'v05eekcn': {
      'en': 'Posts',
      'de': 'Beiträge',
      'es': 'Publicaciones',
      'fr': 'Des postes',
      'zh_Hans': '帖子',
    },
    'wu407zmm': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // ExplorePeople
  {
    'sn20mup7': {
      'en': 'matty',
      'de': 'matt',
      'es': 'matty',
      'fr': 'matty',
      'zh_Hans': '马蒂',
    },
    'hthcgg9m': {
      'en': '@matty',
      'de': '@matte',
      'es': '@matty',
      'fr': '@matty',
      'zh_Hans': '@马蒂',
    },
    'gqf175w3': {
      'en': 'matty',
      'de': 'matt',
      'es': 'matty',
      'fr': 'matty',
      'zh_Hans': '马蒂',
    },
    'juyaflnw': {
      'en': '@matty',
      'de': '@matte',
      'es': '@matty',
      'fr': '@matty',
      'zh_Hans': '@马蒂',
    },
    'xbyv8ei6': {
      'en': 'matty',
      'de': 'matt',
      'es': 'matty',
      'fr': 'matty',
      'zh_Hans': '马蒂',
    },
    '4pdxin49': {
      'en': '@matty',
      'de': '@matte',
      'es': '@matty',
      'fr': '@matty',
      'zh_Hans': '@马蒂',
    },
    '2v7rtcz9': {
      'en': 'matty',
      'de': 'matt',
      'es': 'matty',
      'fr': 'matty',
      'zh_Hans': '马蒂',
    },
    'seyclgd2': {
      'en': '@matty',
      'de': '@matte',
      'es': '@matty',
      'fr': '@matty',
      'zh_Hans': '@马蒂',
    },
    'z6ulj8yo': {
      'en': 'matty',
      'de': 'matt',
      'es': 'matty',
      'fr': 'matty',
      'zh_Hans': '马蒂',
    },
    'dkopqkoh': {
      'en': '@matty',
      'de': '@matte',
      'es': '@matty',
      'fr': '@matty',
      'zh_Hans': '@马蒂',
    },
    'jw8tsx2p': {
      'en': 'People',
      'de': 'Menschen',
      'es': 'Gente',
      'fr': 'Personnes',
      'zh_Hans': '人们',
    },
    'mvvitfqy': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // Schools
  {
    'b2z1lt2q': {
      'en': 'Easton Area High School',
      'de': 'Easton Area Highschool',
      'es': 'Escuela secundaria del área de Easton',
      'fr': 'École secondaire de la région d\'Easton',
      'zh_Hans': '伊斯顿地区高中',
    },
    '2wcub7za': {
      'en': 'Easton Area Middle School',
      'de': 'Easton Area Mittelschule',
      'es': 'Escuela secundaria del área de Easton',
      'fr': 'École intermédiaire de la région d\'Easton',
      'zh_Hans': '伊斯顿地区中学',
    },
    'b5hul5cu': {
      'en': 'Palmer Elementary School',
      'de': 'Palmer Grundschule',
      'es': 'Escuela Primaria Palmer',
      'fr': 'École primaire Palmer',
      'zh_Hans': '帕默小学',
    },
    't4jfdxu5': {
      'en': 'Forks Elementary School',
      'de': 'Forks Grundschule',
      'es': 'Escuela Primaria Forks',
      'fr': 'École primaire de la fourche',
      'zh_Hans': '福克斯小学',
    },
    'y043ys9o': {
      'en': 'Tracy Elementary School',
      'de': 'Tracy Grundschule',
      'es': 'Escuela Primaria Tracy',
      'fr': 'École primaire Tracy',
      'zh_Hans': '特雷西小学',
    },
    'vv6u4bob': {
      'en': 'Cheston Elementary School',
      'de': 'Cheston Grundschule',
      'es': 'Escuela Primaria Cheston',
      'fr': 'École primaire de Cheston',
      'zh_Hans': '切斯顿小学',
    },
    '2szsr0t6': {
      'en': 'Paxinosa Elementary School',
      'de': 'Paxinosa-Grundschule',
      'es': 'Escuela Primaria Paxinosa',
      'fr': 'École primaire Paxinosa',
      'zh_Hans': '帕西诺萨小学',
    },
    '21cxw6j7': {
      'en': 'Shawnee Elementary School',
      'de': 'Shawnee-Grundschule',
      'es': 'Escuela Primaria Shawnee',
      'fr': 'École primaire Shawnee',
      'zh_Hans': '肖尼小学',
    },
    '601gv7lh': {
      'en': 'March Elementary School',
      'de': 'März Grundschule',
      'es': 'Escuela primaria de marzo',
      'fr': 'École primaire de mars',
      'zh_Hans': '三月小学',
    },
    'ri0pi2zq': {
      'en': 'Easton Cyber Academy',
      'de': 'Easton Cyber-Akademie',
      'es': 'Academia cibernética de Easton',
      'fr': 'CyberAcadémie d\'Easton',
      'zh_Hans': '伊斯顿网络学院',
    },
    'jmemrulo': {
      'en': 'Followed Schools',
      'de': 'Gefolgte Schulen',
      'es': 'Escuelas seguidas',
      'fr': 'Ecoles suivies',
      'zh_Hans': '关注的学校',
    },
    'ixtn3qo3': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // ShowEvent
  {
    'z2rye3bx': {
      'en': 'Announcement',
      'de': 'Bekanntmachung',
      'es': 'Anuncio',
      'fr': 'Annonce',
      'zh_Hans': '公告',
    },
    'i3nqql9w': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // Menu
  {
    'xys770o4': {
      'en': 'Absences',
      'de': 'Abwesenheiten',
      'es': 'Ausencias',
      'fr': 'Absences',
      'zh_Hans': '缺席',
    },
    'ih610p99': {
      'en': 'Important Links',
      'de': 'Wichtige Links',
      'es': 'Links importantes',
      'fr': 'Liens importants',
      'zh_Hans': '重要链接',
    },
    '5hcqf119': {
      'en': 'Settings',
      'de': 'Einstellungen',
      'es': 'Ajustes',
      'fr': 'Paramètres',
      'zh_Hans': '设置',
    },
    'to2drrnx': {
      'en': 'Report a Bug',
      'de': 'Melde einen technischen Fehler',
      'es': 'Reportar un error',
      'fr': 'Signaler un bug',
      'zh_Hans': '报告错误',
    },
    'rtdossum': {
      'en': 'About',
      'de': 'Um',
      'es': 'Acerca de',
      'fr': 'À propos',
      'zh_Hans': '关于',
    },
    'cubss1bv': {
      'en': 'Log Out',
      'de': 'Ausloggen',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
      'zh_Hans': '登出',
    },
    'jk2shv6o': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // YourProfile
  {
    'f3lrbddq': {
      'en': 'Student',
      'de': 'Student',
      'es': 'Alumno',
      'fr': 'Étudiant',
      'zh_Hans': '学生',
    },
    'h2m279q1': {
      'en': 'Your Posts',
      'de': 'Deine Posts',
      'es': 'Tus publicaciones',
      'fr': 'Vos publications',
      'zh_Hans': '你的帖子',
    },
    'c6d9mukv': {
      'en': 'You haven\'t posted anything yet.',
      'de': 'Du hast noch nichts gepostet.',
      'es': 'Aún no has publicado nada.',
      'fr': 'Vous n\'avez encore rien posté.',
      'zh_Hans': '您还没有发布任何内容。',
    },
    '3eryex94': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // YourProfileWithPosts
  {
    '27y4wq9u': {
      'en': 'Student',
      'de': 'Student',
      'es': 'Alumno',
      'fr': 'Étudiant',
      'zh_Hans': '学生',
    },
    '8crp5dhl': {
      'en': 'Developer',
      'de': 'Entwickler',
      'es': 'Desarrollador',
      'fr': 'Développeur',
      'zh_Hans': '开发商',
    },
    '0l3jeb0s': {
      'en': 'Your Posts',
      'de': 'Deine Posts',
      'es': 'Tus publicaciones',
      'fr': 'Vos publications',
      'zh_Hans': '你的帖子',
    },
    'lr0gyjii': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // Links
  {
    'oloia419': {
      'en': 'EASD Website',
      'de': 'EASD-Website',
      'es': 'Sitio web de la EASD',
      'fr': 'Site Web de l\'EASD',
      'zh_Hans': '东亚可持续发展网站',
    },
    'g1jn5uak': {
      'en': 'Safe 2 Say (Reporting)',
      'de': 'Safe 2 Say (Berichterstellung)',
      'es': 'Safe 2 Say (informes)',
      'fr': 'Safe 2 Say (rapport)',
      'zh_Hans': '安全 2 说（报告）',
    },
    '6feru26r': {
      'en': 'Powerschool (Grades)',
      'de': 'Powerschool (Noten)',
      'es': 'Powerschool (Grados)',
      'fr': 'Powerschool (niveaux)',
      'zh_Hans': 'Powerschool（等级）',
    },
    'tjanqjqr': {
      'en': 'Schoology (Assignments)',
      'de': 'Schoologie (Aufgaben)',
      'es': 'Schoology (tareas)',
      'fr': 'Schoologie (Affectations)',
      'zh_Hans': '学校学（作业）',
    },
    'xzv3424f': {
      'en': 'E-hallpass',
      'de': 'E-Pass',
      'es': 'E-pasillo',
      'fr': 'E-hall pass',
      'zh_Hans': '电子通行证',
    },
    'i4pl95fa': {
      'en': 'Google Drive',
      'de': 'Google Drive',
      'es': 'Google Drive',
      'fr': 'Google Drive',
      'zh_Hans': '谷歌云端硬盘',
    },
    'n6ghu275': {
      'en': 'FD MealPlanner (Cafeteria Menus)',
      'de': 'FD MealPlanner (Cafeteria-Menüs)',
      'es': 'FD MealPlanner (menús de cafetería)',
      'fr': 'Planificateur de repas FD (menus de cafétéria)',
      'zh_Hans': 'FD MealPlanner（自助餐厅菜单）',
    },
    'q0tcbl2n': {
      'en': 'SchoolCafé (Cafeteria Info)',
      'de': 'SchulCafé (Cafeteria Info)',
      'es': 'SchoolCafé (Información de cafetería)',
      'fr': 'SchoolCafé (Infos cafétéria)',
      'zh_Hans': 'SchoolCafé（食堂信息）',
    },
    '6286tnv1': {
      'en': 'Library Catalog',
      'de': 'Katalog der Bibliothek',
      'es': 'Catálogo de la biblioteca',
      'fr': 'Catalogue de la bibliothèque',
      'zh_Hans': '图书馆目录',
    },
    'qs7rdxvy': {
      'en': 'EASD Board Meetings',
      'de': 'Sitzungen des EASD-Vorstands',
      'es': 'Reuniones de la Junta Directiva de la EASD',
      'fr': 'Réunions du conseil d\'administration de l\'EASD',
      'zh_Hans': 'EASD 董事会会议',
    },
    'ouwg0nnr': {
      'en': 'More Links (EASD Website)',
      'de': 'Weitere Links (EASD-Website)',
      'es': 'Más enlaces (sitio web de EASD)',
      'fr': 'Plus de liens (site Web EASD)',
      'zh_Hans': '更多链接（EASD 网站）',
    },
    'tkzxsjla': {
      'en': 'More Links (Clever)',
      'de': 'Weitere Links (Clever)',
      'es': 'Más enlaces (inteligente)',
      'fr': 'Plus de liens (intelligent)',
      'zh_Hans': '更多链接（聪明）',
    },
    'fty9hn99': {
      'en': 'Important Links',
      'de': 'Wichtige Links',
      'es': 'Links importantes',
      'fr': 'Liens importants',
      'zh_Hans': '重要链接',
    },
    'apdrlayk': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // EditProfile
  {
    '2rhr4how': {
      'en': 'Display Name',
      'de': 'Anzeigename',
      'es': 'Nombre para mostrar',
      'fr': 'Afficher un nom',
      'zh_Hans': '显示名称',
    },
    'hpd4j8lo': {
      'en': '@',
      'de': '@',
      'es': '@',
      'fr': '@',
      'zh_Hans': '@',
    },
    '0tn91lqy': {
      'en': 'Username',
      'de': 'Nutzername',
      'es': 'Nombre de usuario',
      'fr': 'Nom d\'utilisateur',
      'zh_Hans': '用户名',
    },
    'auqp7erv': {
      'en': 'This username already exists. Instead try',
      'de': 'Dieser Benutzername existiert schon. Versuchen Sie es stattdessen',
      'es': 'Este nombre de usuario ya existe. En su lugar, intente',
      'fr': 'Cet identifiant existe déjà. Essayez plutôt',
      'zh_Hans': '此用户名已存在。而是尝试',
    },
    '4eqfcqb2': {
      'en': 'Save',
      'de': 'Speichern',
      'es': 'Ahorrar',
      'fr': 'Sauvegarder',
      'zh_Hans': '节省',
    },
    'd19sztq6': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'es': 'Se requiere campo',
      'fr': 'Champ requis',
      'zh_Hans': '字段是必需的',
    },
    'hfxyy11j': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'zw001qap': {
      'en': 'Username is required',
      'de': 'Benutzername wird benötigt',
      'es': 'Se requiere nombre de usuario',
      'fr': 'Nom d\'utilisateur est nécessaire',
      'zh_Hans': '用户名是必需的',
    },
    'qz53miub': {
      'en': 'Username should be at least 5 characters',
      'de': 'Der Benutzername sollte mindestens 5 Zeichen lang sein',
      'es': 'El nombre de usuario debe tener al menos 5 caracteres',
      'fr': 'Le nom d\'utilisateur doit comporter au moins 5 caractères',
      'zh_Hans': '用户名应至少为 5 个字符',
    },
    'rqm8092b': {
      'en': 'Username can have at most 15 characters',
      'de': 'Der Benutzername darf höchstens 15 Zeichen lang sein',
      'es': 'El nombre de usuario puede tener como máximo 15 caracteres',
      'fr': 'Le nom d\'utilisateur peut comporter au maximum 15 caractères',
      'zh_Hans': '用户名最多可包含 15 个字符',
    },
    'oxx5e4zi': {
      'en': 'Usernames can only contain letters, numbers, and underscores',
      'de':
          'Benutzernamen dürfen nur Buchstaben, Zahlen und Unterstriche enthalten',
      'es':
          'Los nombres de usuario solo pueden contener letras, números y guiones bajos',
      'fr':
          'Les noms d\'utilisateur ne peuvent contenir que des lettres, des chiffres et des traits de soulignement',
      'zh_Hans': '用户名只能包含字母、数字和下划线',
    },
    '87tnyrpg': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'r9459w4x': {
      'en': 'Edit Profile',
      'de': 'Profil bearbeiten',
      'es': 'Editar perfil',
      'fr': 'Editer le profil',
      'zh_Hans': '编辑个人资料',
    },
    'd78m0wlx': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // ReportABug
  {
    'tgvlttpa': {
      'en': 'Report a Bug',
      'de': 'Melde einen technischen Fehler',
      'es': 'Reportar un error',
      'fr': 'Signaler un bug',
      'zh_Hans': '报告错误',
    },
    'i0842x48': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // Settings
  {
    'iib8bwfn': {
      'en': 'Following',
      'de': 'Folgend',
      'es': 'Siguiente',
      'fr': 'Suivant',
      'zh_Hans': '下列的',
    },
    'pfrajaiz': {
      'en': 'Followed Schools',
      'de': 'Gefolgte Schulen',
      'es': 'Escuelas seguidas',
      'fr': 'Ecoles suivies',
      'zh_Hans': '关注的学校',
    },
    'pz832rs4': {
      'en': 'Automatic',
      'de': 'Automatisch',
      'es': 'Automático',
      'fr': 'Automatique',
      'zh_Hans': '自动的',
    },
    '8je81vc8': {
      'en': 'Dark',
      'de': 'Dunkel',
      'es': 'Oscuro',
      'fr': 'Sombre',
      'zh_Hans': '黑暗的',
    },
    'v585efme': {
      'en': 'Light',
      'de': 'Licht',
      'es': 'Luz',
      'fr': 'Lumière',
      'zh_Hans': '光',
    },
    '9ju6f8ep': {
      'en': 'Theme',
      'de': 'Thema',
      'es': 'Tema',
      'fr': 'Thème',
      'zh_Hans': '主题',
    },
    'xyrn7olz': {
      'en': 'Settings',
      'de': 'Einstellungen',
      'es': 'Ajustes',
      'fr': 'Paramètres',
      'zh_Hans': '设置',
    },
    'vl0g7v2s': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // Following
  {
    'zn5h7pni': {
      'en': 'Profiles',
      'de': 'Profile',
      'es': 'Perfiles',
      'fr': 'Profils',
      'zh_Hans': '简介',
    },
    'vtnb76lz': {
      'en': 'matty',
      'de': 'matt',
      'es': 'matty',
      'fr': 'matty',
      'zh_Hans': '马蒂',
    },
    '6mpb1oa5': {
      'en': '@matty',
      'de': '@matte',
      'es': '@matty',
      'fr': '@matty',
      'zh_Hans': '@马蒂',
    },
    'rfrtigg1': {
      'en': 'matty',
      'de': 'matt',
      'es': 'matty',
      'fr': 'matty',
      'zh_Hans': '马蒂',
    },
    'pk330i40': {
      'en': '@matty',
      'de': '@matte',
      'es': '@matty',
      'fr': '@matty',
      'zh_Hans': '@马蒂',
    },
    'vurpoq4y': {
      'en': 'matty',
      'de': 'matt',
      'es': 'matty',
      'fr': 'matty',
      'zh_Hans': '马蒂',
    },
    'x9jle51k': {
      'en': '@matty',
      'de': '@matte',
      'es': '@matty',
      'fr': '@matty',
      'zh_Hans': '@马蒂',
    },
    'tsf7osq8': {
      'en': 'Groups',
      'de': 'Gruppen',
      'es': 'Grupos',
      'fr': 'Groupes',
      'zh_Hans': '团体',
    },
    '2w07z0ms': {
      'en': 'matty',
      'de': 'matt',
      'es': 'matty',
      'fr': 'matty',
      'zh_Hans': '马蒂',
    },
    'v2s2lsbo': {
      'en': '@matty',
      'de': '@matte',
      'es': '@matty',
      'fr': '@matty',
      'zh_Hans': '@马蒂',
    },
    'ucmmch4q': {
      'en': 'matty',
      'de': 'matt',
      'es': 'matty',
      'fr': 'matty',
      'zh_Hans': '马蒂',
    },
    '7wv6pzc1': {
      'en': '@matty',
      'de': '@matte',
      'es': '@matty',
      'fr': '@matty',
      'zh_Hans': '@马蒂',
    },
    'kqpfn8ot': {
      'en': 'matty',
      'de': 'matt',
      'es': 'matty',
      'fr': 'matty',
      'zh_Hans': '马蒂',
    },
    '5gs9sef2': {
      'en': '@matty',
      'de': '@matte',
      'es': '@matty',
      'fr': '@matty',
      'zh_Hans': '@马蒂',
    },
    '1kmx6ks8': {
      'en': 'Following',
      'de': 'Folgend',
      'es': 'Siguiente',
      'fr': 'Suivant',
      'zh_Hans': '下列的',
    },
    'ffea97fo': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // SchoolsFollowed
  {
    'm9qxt4fu': {
      'en': 'Easton Area High School',
      'de': 'Easton Area Highschool',
      'es': 'Escuela secundaria del área de Easton',
      'fr': 'École secondaire de la région d\'Easton',
      'zh_Hans': '伊斯顿地区高中',
    },
    'vlqitd1o': {
      'en': 'Easton Area Middle School',
      'de': 'Easton Area Mittelschule',
      'es': 'Escuela secundaria del área de Easton',
      'fr': 'École intermédiaire de la région d\'Easton',
      'zh_Hans': '伊斯顿地区中学',
    },
    'wc8rlbyt': {
      'en': 'Palmer Elementary School',
      'de': 'Palmer Grundschule',
      'es': 'Escuela Primaria Palmer',
      'fr': 'École primaire Palmer',
      'zh_Hans': '帕默小学',
    },
    '04c1x7v4': {
      'en': 'Forks Elementary School',
      'de': 'Forks Grundschule',
      'es': 'Escuela Primaria Forks',
      'fr': 'École primaire de la fourche',
      'zh_Hans': '福克斯小学',
    },
    '0bn319g5': {
      'en': 'Tracy Elementary School',
      'de': 'Tracy Grundschule',
      'es': 'Escuela Primaria Tracy',
      'fr': 'École primaire Tracy',
      'zh_Hans': '特雷西小学',
    },
    'hdkpi7im': {
      'en': 'Cheston Elementary School',
      'de': 'Cheston Grundschule',
      'es': 'Escuela Primaria Cheston',
      'fr': 'École primaire de Cheston',
      'zh_Hans': '切斯顿小学',
    },
    'jf9llyjv': {
      'en': 'Paxinosa Elementary School',
      'de': 'Paxinosa-Grundschule',
      'es': 'Escuela Primaria Paxinosa',
      'fr': 'École primaire Paxinosa',
      'zh_Hans': '帕西诺萨小学',
    },
    'aggkinoa': {
      'en': 'Shawnee Elementary School',
      'de': 'Shawnee-Grundschule',
      'es': 'Escuela Primaria Shawnee',
      'fr': 'École primaire Shawnee',
      'zh_Hans': '肖尼小学',
    },
    '5s7gnv81': {
      'en': 'March Elementary School',
      'de': 'März Grundschule',
      'es': 'Escuela primaria de marzo',
      'fr': 'École primaire de mars',
      'zh_Hans': '三月小学',
    },
    'dcfvvtq2': {
      'en': 'Easton Cyber Academy',
      'de': 'Easton Cyber-Akademie',
      'es': 'Academia cibernética de Easton',
      'fr': 'CyberAcadémie d\'Easton',
      'zh_Hans': '伊斯顿网络学院',
    },
    'fuyx7927': {
      'en': 'Schools',
      'de': 'Schulen',
      'es': 'Escuelas',
      'fr': 'Écoles',
      'zh_Hans': '学校',
    },
    'frd1d9ln': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // SigningOut
  {
    'k3xhf8py': {
      'en': 'Logging Out...',
      'de': 'Ausloggen...',
      'es': 'Saliendo de tu cuenta...',
      'fr': 'Déconnecter...',
      'zh_Hans': '注销...',
    },
    '4nwadicu': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // About
  {
    '489rrs9d': {
      'en': 'By Alexander Harrison, Andrew Xia, and Matthew You',
      'de': 'Von Alexander Harrison, Andrew Xia und Matthew You',
      'es': 'Por Alexander Harrison, Andrew Xia y Matthew You',
      'fr': 'Par Alexander Harrison, Andrew Xia et Matthew You',
      'zh_Hans': '作者：Alexander Harrison、Andrew Xia 和 Matthew You',
    },
    'd0tkfia3': {
      'en': 'About the App',
      'de': 'Über die App',
      'es': 'Acerca de la aplicación',
      'fr': 'À propos de l\'application',
      'zh_Hans': '关于应用程序',
    },
    'mag9q2g4': {
      'en':
          'RoverLink is a mobile application for Android and iOS devices. It was designed to help keep parents and the community up-to-date about EASD events and activities. Students can share photos, and parents can notify the school of student absences.',
      'de':
          'RoverLink ist eine mobile Anwendung für Android- und iOS-Geräte. Es wurde entwickelt, um Eltern und die Gemeinde über EASD-Veranstaltungen und -Aktivitäten auf dem Laufenden zu halten. Schüler können Fotos teilen und Eltern können die Schule über die Abwesenheit von Schülern informieren.',
      'es':
          'RoverLink es una aplicación móvil para dispositivos Android e iOS. Fue diseñado para ayudar a mantener a los padres y la comunidad actualizados sobre los eventos y actividades de EASD. Los estudiantes pueden compartir fotos y los padres pueden notificar a la escuela sobre las ausencias de los estudiantes.',
      'fr':
          'RoverLink est une application mobile pour les appareils Android et iOS. Il a été conçu pour aider à tenir les parents et la communauté au courant des événements et des activités de l\'EASD. Les élèves peuvent partager des photos et les parents peuvent informer l\'école des absences des élèves.',
      'zh_Hans':
          'RoverLink 是适用于 Android 和 iOS 设备的移动应用程序。它旨在帮助家长和社区了解 EASD 事件和活动的最新信息。学生可以分享照片，家长可以通知学校学生缺勤。',
    },
    '12k6y5w4': {
      'en': 'Copyright and Licensing',
      'de': 'Urheberrecht und Lizenzierung',
      'es': 'Derechos de autor y licencias',
      'fr': 'Droits d\'auteur et licences',
      'zh_Hans': '版权和许可',
    },
    'vsmag9zy': {
      'en': 'Terms of Use',
      'de': 'Nutzungsbedingungen',
      'es': 'Condiciones de uso',
      'fr': 'Conditions d\'utilisation',
      'zh_Hans': '使用条款',
    },
    'm53kjfoe': {
      'en': 'Privacy Policy',
      'de': 'Datenschutz-Bestimmungen',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
      'zh_Hans': '隐私政策',
    },
    '0igoc7rh': {
      'en': 'About',
      'de': 'Um',
      'es': 'Acerca de',
      'fr': 'À propos',
      'zh_Hans': '关于',
    },
    '2npc64dd': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // TermsOfUse
  {
    'ciag688w': {
      'en': 'Terms Of Use',
      'de': 'Nutzungsbedingungen',
      'es': 'Condiciones de uso',
      'fr': 'Conditions d\'utilisation',
      'zh_Hans': '使用条款',
    },
    '8jsw7lwr': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // Login
  {
    'fw22h2r7': {
      'en': 'Sign In',
      'de': 'Anmelden',
      'es': 'Iniciar sesión',
      'fr': 'S\'identifier',
      'zh_Hans': '登入',
    },
    '5uknzhia': {
      'en': 'Email Address',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
      'fr': 'Adresse e-mail',
      'zh_Hans': '电子邮件地址',
    },
    't3a5dj0t': {
      'en': 'Password',
      'de': 'Passwort',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
      'zh_Hans': '密码',
    },
    'hy0koxex': {
      'en': 'Login',
      'de': 'Anmeldung',
      'es': 'Acceso',
      'fr': 'Connexion',
      'zh_Hans': '登录',
    },
    'ldepbzep': {
      'en': 'Login as Guest',
      'de': 'Melden Sie sich als Gast an',
      'es': 'Iniciar sesión como invitado',
      'fr': 'Connectez-vous en tant qu\'invité',
      'zh_Hans': '以访客身份登录',
    },
    'd59ena4o': {
      'en': 'Forgot Password?',
      'de': 'Passwort vergessen?',
      'es': '¿Has olvidado tu contraseña?',
      'fr': 'Mot de passe oublié?',
      'zh_Hans': '忘记密码？',
    },
    '0vvoynsh': {
      'en': 'Or use a social account to login',
      'de': 'Oder verwenden Sie ein soziales Konto, um sich anzumelden',
      'es': 'O use una cuenta social para iniciar sesión',
      'fr': 'Ou utilisez un compte social pour vous connecter',
      'zh_Hans': '或使用社交账号登录',
    },
    '432nyxa1': {
      'en': 'Sign Up',
      'de': 'Anmeldung',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
      'zh_Hans': '报名',
    },
    '46p8zoxf': {
      'en': 'Email Address',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
      'fr': 'Adresse e-mail',
      'zh_Hans': '电子邮件地址',
    },
    'uvpchzqb': {
      'en': 'Password',
      'de': 'Passwort',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
      'zh_Hans': '密码',
    },
    'cuwd3isk': {
      'en': 'Confirm Password',
      'de': 'Bestätige das Passwort',
      'es': 'confirmar Contraseña',
      'fr': 'Confirmez le mot de passe',
      'zh_Hans': '确认密码',
    },
    'vlydnlyl': {
      'en': 'Create Account',
      'de': 'Benutzerkonto erstellen',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
      'zh_Hans': '创建账户',
    },
    'e0v4b1we': {
      'en': 'Or use a social account to create account',
      'de': 'Oder verwenden Sie ein soziales Konto, um ein Konto zu erstellen',
      'es': 'O use una cuenta social para crear una cuenta',
      'fr': 'Ou utilisez un compte social pour créer un compte',
      'zh_Hans': '或者使用社交账号创建账号',
    },
    'zquwm76t': {
      'en': 'By clicking \"Create Account\" you agree to our ',
      'de': 'Indem Sie auf „Konto erstellen“ klicken, stimmen Sie unseren zu',
      'es': 'Al hacer clic en \"Crear cuenta\", aceptas nuestros',
      'fr': 'En cliquant sur \"Créer un compte\", vous acceptez nos',
      'zh_Hans': '单击“创建帐户”即表示您同意我们的',
    },
    '7q7e9rd3': {
      'en': 'Terms of Use',
      'de': 'Nutzungsbedingungen',
      'es': 'Condiciones de uso',
      'fr': 'Conditions d\'utilisation',
      'zh_Hans': '使用条款',
    },
    '7r5t8rbc': {
      'en': 'and',
      'de': 'Und',
      'es': 'y',
      'fr': 'et',
      'zh_Hans': '和',
    },
    '2s8cej1h': {
      'en': 'Privacy Policy',
      'de': 'Datenschutz-Bestimmungen',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
      'zh_Hans': '隐私政策',
    },
    '1htdiqyk': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // ForgotPassword
  {
    'r9qondpm': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'de':
          'Wir senden Ihnen eine E-Mail mit einem Link zum Zurücksetzen Ihres Passworts. Bitte geben Sie unten die mit Ihrem Konto verknüpfte E-Mail-Adresse ein.',
      'es':
          'Le enviaremos un correo electrónico con un enlace para restablecer su contraseña, ingrese el correo electrónico asociado con su cuenta a continuación.',
      'fr':
          'Nous vous enverrons un e-mail avec un lien pour réinitialiser votre mot de passe, veuillez entrer l\'e-mail associé à votre compte ci-dessous.',
      'zh_Hans': '我们将向您发送一封电子邮件，其中包含重置密码的链接，请在下方输入与您的帐户关联的电子邮件。',
    },
    'c86nuu8p': {
      'en': 'Email Address',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
      'fr': 'Adresse e-mail',
      'zh_Hans': '电子邮件地址',
    },
    'wt8fom27': {
      'en': 'Send Link',
      'de': 'Link senden',
      'es': 'Enviar enlace',
      'fr': 'Envoyer un lien',
      'zh_Hans': '发送链接',
    },
    'ngmn4z29': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // Onboarding
  {
    'nwm3x2ci': {
      'en': 'Connect With Peers',
      'de': 'Verbinde dich mit Gleichgesinnten',
      'es': 'Conectar con compañeros',
      'fr': 'Connectez-vous avec vos pairs',
      'zh_Hans': '与同行联系',
    },
    'mbvv5wuj': {
      'en':
          'Our platform creates a safe, friendly environment for students to form a shared sense of community.',
      'de':
          'Unsere Plattform schafft eine sichere, freundliche Umgebung für Studenten, um ein gemeinsames Gemeinschaftsgefühl zu bilden.',
      'es':
          'Nuestra plataforma crea un ambiente seguro y amigable para que los estudiantes formen un sentido compartido de comunidad.',
      'fr':
          'Notre plate-forme crée un environnement sûr et convivial pour les étudiants afin de former un sentiment partagé de communauté.',
      'zh_Hans': '我们的平台为学生创造了一个安全、友好的环境，以形成共同的社区意识。',
    },
    '0vkk9jb4': {
      'en': 'Stay Up to Date',
      'de': 'Auf dem Laufenden bleiben',
      'es': 'Estar al día',
      'fr': 'Tiens-toi à jour',
      'zh_Hans': '保持最新',
    },
    'lgulcrc0': {
      'en':
          'Keep up with the latest announcements and events from our district.',
      'de':
          'Bleiben Sie über die neuesten Ankündigungen und Veranstaltungen aus unserem Bezirk auf dem Laufenden.',
      'es':
          'Manténgase al día con los últimos anuncios y eventos de nuestro distrito.',
      'fr':
          'Tenez-vous au courant des dernières annonces et événements de notre district.',
      'zh_Hans': '了解我们学区的最新公告和活动。',
    },
    'if1zlxpq': {
      'en': 'Report Absences',
      'de': 'Abwesenheit melden',
      'es': 'Reportar Ausencias',
      'fr': 'Signaler les absences',
      'zh_Hans': '报告缺席',
    },
    'tn2qltve': {
      'en':
          'Roverlink makes it easy for you to submit absences to your local school office.',
      'de':
          'Roverlink macht es Ihnen leicht, Abwesenheiten bei Ihrem örtlichen Schulamt einzureichen.',
      'es':
          'Roverlink le facilita el envío de ausencias a la oficina de su escuela local.',
      'fr':
          'Roverlink vous permet de soumettre facilement les absences au bureau de votre école locale.',
      'zh_Hans': 'Roverlink 使您可以轻松地向当地学校办公室提交缺勤。',
    },
    '9y5crtlg': {
      'en': 'Continue',
      'de': 'Weitermachen',
      'es': 'Continuar',
      'fr': 'Continuer',
      'zh_Hans': '继续',
    },
  },
  // PrivacyPolicy
  {
    'yjmnhfal': {
      'en': 'Privacy Policy',
      'de': 'Datenschutz-Bestimmungen',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
      'zh_Hans': '隐私政策',
    },
    'd9hd9ruv': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // Notifications
  {
    '7wicg251': {
      'en': 'Notifications',
      'de': 'Benachrichtigungen',
      'es': 'Notificaciones',
      'fr': 'Avis',
      'zh_Hans': '通知',
    },
    '2hest3cb': {
      'en': 'You haven\'t recived any notifications yet.',
      'de': 'Du hast noch keine Benachrichtigungen erhalten.',
      'es': 'Aún no has recibido ninguna notificación.',
      'fr': 'Vous n\'avez pas encore reçu de notifications.',
      'zh_Hans': '您还没有收到任何通知。',
    },
    'itr8nwq2': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // Copyrights
  {
    'dl3iivct': {
      'en': 'Copyright and Licensing',
      'de': 'Urheberrecht und Lizenzierung',
      'es': 'Derechos de autor y licencias',
      'fr': 'Droits d\'auteur et licences',
      'zh_Hans': '版权和许可',
    },
    'pdd9sz49': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // NotificationsWithStuff
  {
    'ic7yfb2d': {
      'en': 'Notifications',
      'de': 'Benachrichtigungen',
      'es': 'Notificaciones',
      'fr': 'Avis',
      'zh_Hans': '通知',
    },
    'ovaggf7w': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // Announcements
  {
    '8ik7jrgg': {
      'en': 'Announcements',
      'de': 'Ankündigungen',
      'es': 'Anuncios',
      'fr': 'Annonces',
      'zh_Hans': '公告',
    },
    'lczjz5cm': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // EAHS
  {
    'bct7slbk': {
      'en': 'Easton Area High School',
      'de': 'Easton Area Highschool',
      'es': 'Escuela secundaria del área de Easton',
      'fr': 'École secondaire de la région d\'Easton',
      'zh_Hans': '伊斯顿地区高中',
    },
    'kew24zs0': {
      'en': '#eahs',
      'de': '#eahs',
      'es': '#eahs',
      'fr': '#eahs',
      'zh_Hans': '#eahs',
    },
    'yw0df01t': {
      'en': 'Follow',
      'de': 'Folgen',
      'es': 'Seguir',
      'fr': 'Suivre',
      'zh_Hans': '跟随',
    },
    '313i98wx': {
      'en': 'Information',
      'de': 'Information',
      'es': 'Información',
      'fr': 'Information',
      'zh_Hans': '信息',
    },
    'z2acb03f': {
      'en':
          'Easton Area High School\n2601 William Penn Hwy, Easton, PA 18045\n(610) 250-2481',
      'de':
          'Easton Area Highschool\n2601 William Penn Highway, Easton, PA 18045\n(610) 250-2481',
      'es':
          'Escuela secundaria del área de Easton\n2601 William Penn Hwy, Easton, PA 18045\n(610) 250-2481',
      'fr':
          'École secondaire de la région d\'Easton\n2601 William Penn Highway, Easton, PA 18045\n(610) 250-2481',
      'zh_Hans':
          '伊斯顿地区高中\n2601 William Penn Hwy, 伊斯顿, PA 18045\n(610) 250-2481',
    },
    'ze5elsd7': {
      'en': 'Announcements',
      'de': 'Ankündigungen',
      'es': 'Anuncios',
      'fr': 'Annonces',
      'zh_Hans': '公告',
    },
    'sxuum9rm': {
      'en': 'Posts',
      'de': 'Beiträge',
      'es': 'Publicaciones',
      'fr': 'Des postes',
      'zh_Hans': '帖子',
    },
    'gscnvrjq': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // EditAbsence
  {
    'mx0ft966': {
      'en': 'Student\'s Full Name',
      'de': 'Vollständiger Name des Schülers',
      'es': 'Nombre completo del estudiante',
      'fr': 'Nom complet de l\'étudiant',
      'zh_Hans': '学生全名',
    },
    '06b9aj3r': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'ulmdibb1': {
      'en': 'Easton Area High School',
      'de': 'Easton Area Highschool',
      'es': 'Escuela secundaria del área de Easton',
      'fr': 'École secondaire de la région d\'Easton',
      'zh_Hans': '伊斯顿地区高中',
    },
    '1c7i4bse': {
      'en': 'Easton Area Middle School',
      'de': 'Easton Area Mittelschule',
      'es': 'Escuela secundaria del área de Easton',
      'fr': 'École intermédiaire de la région d\'Easton',
      'zh_Hans': '伊斯顿地区中学',
    },
    '00uhy0zz': {
      'en': 'Palmer Elementary School',
      'de': 'Palmer Grundschule',
      'es': 'Escuela Primaria Palmer',
      'fr': 'École primaire Palmer',
      'zh_Hans': '帕默小学',
    },
    'tuf8dmg1': {
      'en': 'Forks Elementary School',
      'de': 'Forks Grundschule',
      'es': 'Escuela Primaria Forks',
      'fr': 'École primaire de la fourche',
      'zh_Hans': '福克斯小学',
    },
    '9a6xpkxf': {
      'en': 'Tracy Elementary School',
      'de': 'Tracy Grundschule',
      'es': 'Escuela Primaria Tracy',
      'fr': 'École primaire Tracy',
      'zh_Hans': '特雷西小学',
    },
    '5dj8zmvb': {
      'en': 'Cheston Elementary School',
      'de': 'Cheston Grundschule',
      'es': 'Escuela Primaria Cheston',
      'fr': 'École primaire de Cheston',
      'zh_Hans': '切斯顿小学',
    },
    'zmxhqv7y': {
      'en': 'Paxinosa Elementary School',
      'de': 'Paxinosa-Grundschule',
      'es': 'Escuela Primaria Paxinosa',
      'fr': 'École primaire Paxinosa',
      'zh_Hans': '帕西诺萨小学',
    },
    'poyp4kjw': {
      'en': 'Shawnee Elementary School',
      'de': 'Shawnee-Grundschule',
      'es': 'Escuela Primaria Shawnee',
      'fr': 'École primaire Shawnee',
      'zh_Hans': '肖尼小学',
    },
    'nax81w08': {
      'en': 'March Elementary School',
      'de': 'März Grundschule',
      'es': 'Escuela primaria de marzo',
      'fr': 'École primaire de mars',
      'zh_Hans': '三月小学',
    },
    'zfr5uri4': {
      'en': 'Easton Cyber Academy',
      'de': 'Easton Cyber-Akademie',
      'es': 'Academia cibernética de Easton',
      'fr': 'CyberAcadémie d\'Easton',
      'zh_Hans': '伊斯顿网络学院',
    },
    '45v6nmvr': {
      'en': 'Please select a School',
      'de': 'Bitte wählen Sie eine Schule aus',
      'es': 'Por favor seleccione una Escuela',
      'fr': 'Veuillez sélectionner une école',
      'zh_Hans': '请选择学校',
    },
    '4suk4vaz': {
      'en': 'Teacher',
      'de': 'Lehrer',
      'es': 'Maestro',
      'fr': 'Professeur',
      'zh_Hans': '老师',
    },
    '8ya7slfn': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'v7awjdj5': {
      'en': 'Kindergarten',
      'de': 'Kindergarten',
      'es': 'Jardín de infancia',
      'fr': 'Jardin d\'enfants',
      'zh_Hans': '幼儿园',
    },
    'ddzucuy0': {
      'en': '1st Grade',
      'de': '1. Klasse',
      'es': '1er grado',
      'fr': '1ère année',
      'zh_Hans': '一年级',
    },
    'rjgsl238': {
      'en': '2nd Grade',
      'de': '2. Klasse',
      'es': '2do. grado',
      'fr': '2e année',
      'zh_Hans': '二年级',
    },
    'pebmx7ql': {
      'en': '3rd Grade',
      'de': '3. Klasse',
      'es': '3er grado',
      'fr': '3e année',
      'zh_Hans': '三年级',
    },
    'y5fvsl9e': {
      'en': '4th Grade',
      'de': '4. Klasse',
      'es': 'Cuarto grado',
      'fr': '4e année',
      'zh_Hans': '四年级',
    },
    '09u5yfnj': {
      'en': '5th Grade',
      'de': '5. Klasse',
      'es': '5to grado',
      'fr': '5e année',
      'zh_Hans': '五年级',
    },
    '52psj84u': {
      'en': '6th Grade',
      'de': '6. Klasse',
      'es': '6to grado',
      'fr': '6ème année',
      'zh_Hans': '六年级',
    },
    'p6je1rmf': {
      'en': '7th Grade',
      'de': '7. Klasse',
      'es': 'Séptimo grado',
      'fr': '7e année',
      'zh_Hans': '7年级',
    },
    'mptmih9l': {
      'en': '8th Grade',
      'de': '8. Klasse',
      'es': 'Octavo grado',
      'fr': '8e année',
      'zh_Hans': '8年级',
    },
    'ddq1xobj': {
      'en': '9th Grade',
      'de': '9.Klasse',
      'es': 'Noveno grado',
      'fr': '9e année',
      'zh_Hans': '9年级',
    },
    'ijrk6vbx': {
      'en': '10th Grade',
      'de': '10. Klasse',
      'es': '10 ° grado',
      'fr': '10ème année',
      'zh_Hans': '十年级',
    },
    'tlg62173': {
      'en': '11th Grade',
      'de': '11. Klasse',
      'es': 'Grado 11',
      'fr': '11e année',
      'zh_Hans': '11年级',
    },
    'cy7gc7gv': {
      'en': '12th Grade',
      'de': '12. Klasse',
      'es': '12 ° grado',
      'fr': '12e année',
      'zh_Hans': '12年级',
    },
    'y70vu8xg': {
      'en': 'Please select a grade level',
      'de': 'Bitte wählen Sie eine Klassenstufe aus',
      'es': 'Seleccione un nivel de grado',
      'fr': 'Veuillez sélectionner un niveau scolaire',
      'zh_Hans': '请选择年级',
    },
    'ug29k1iv': {
      'en': 'Easton Area High School',
      'de': 'Easton Area Highschool',
      'es': 'Escuela secundaria del área de Easton',
      'fr': 'École secondaire de la région d\'Easton',
      'zh_Hans': '伊斯顿地区高中',
    },
    'gxlxurpr': {
      'en': 'Easton Area Middle School',
      'de': 'Easton Area Mittelschule',
      'es': 'Escuela secundaria del área de Easton',
      'fr': 'École intermédiaire de la région d\'Easton',
      'zh_Hans': '伊斯顿地区中学',
    },
    '9i9gpfzm': {
      'en': 'Palmer Elementary School',
      'de': 'Palmer Grundschule',
      'es': 'Escuela Primaria Palmer',
      'fr': 'École primaire Palmer',
      'zh_Hans': '帕默小学',
    },
    'jc50cra7': {
      'en': 'Forks Elementary School',
      'de': 'Forks Grundschule',
      'es': 'Escuela Primaria Forks',
      'fr': 'École primaire de la fourche',
      'zh_Hans': '福克斯小学',
    },
    '57npdm23': {
      'en': 'Tracy Elementary School',
      'de': 'Tracy Grundschule',
      'es': 'Escuela Primaria Tracy',
      'fr': 'École primaire Tracy',
      'zh_Hans': '特雷西小学',
    },
    'nmo0wfar': {
      'en': 'Cheston Elementary School',
      'de': 'Cheston Grundschule',
      'es': 'Escuela Primaria Cheston',
      'fr': 'École primaire de Cheston',
      'zh_Hans': '切斯顿小学',
    },
    'ek1su9zn': {
      'en': 'Paxinosa Elementary School',
      'de': 'Paxinosa-Grundschule',
      'es': 'Escuela Primaria Paxinosa',
      'fr': 'École primaire Paxinosa',
      'zh_Hans': '帕西诺萨小学',
    },
    'uqfysraf': {
      'en': 'Shawnee Elementary School',
      'de': 'Shawnee-Grundschule',
      'es': 'Escuela Primaria Shawnee',
      'fr': 'École primaire Shawnee',
      'zh_Hans': '肖尼小学',
    },
    'd3lqxvlb': {
      'en': 'March Elementary School',
      'de': 'März Grundschule',
      'es': 'Escuela primaria de marzo',
      'fr': 'École primaire de mars',
      'zh_Hans': '三月小学',
    },
    'r46ltbzw': {
      'en': 'Easton Cyber Academy',
      'de': 'Easton Cyber-Akademie',
      'es': 'Academia cibernética de Easton',
      'fr': 'CyberAcadémie d\'Easton',
      'zh_Hans': '伊斯顿网络学院',
    },
    'x80n1hiq': {
      'en': 'Please select a Reason',
      'de': 'Bitte wählen Sie einen Grund aus',
      'es': 'Por favor seleccione una razón',
      'fr': 'Veuillez sélectionner une raison',
      'zh_Hans': '请选择原因',
    },
    'y0ujfk7r': {
      'en': 'Reason for Absence',
      'de': 'Grund für die Abwesenheit',
      'es': 'Motivo de la ausencia',
      'fr': 'Motif de l\'absence',
      'zh_Hans': '缺席原因',
    },
    'vw0gyw7x': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'o4si7vip': {
      'en': 'Optional: Change Doctor\'s Note Photo',
      'de': 'Optional: Foto des Arztbriefes ändern',
      'es': 'Opcional: cambiar la foto de la nota del médico',
      'fr': 'Facultatif : modifier la photo de la note du médecin',
      'zh_Hans': '可选：更改医生的笔记照片',
    },
    'v9g58qvj': {
      'en': 'Parent or Guardian Signature',
      'de': 'Unterschrift der Eltern oder Erziehungsberechtigten',
      'es': 'Firma del padre o tutor',
      'fr': 'Signature du parent ou du tuteur',
      'zh_Hans': '家长或监护人签名',
    },
    'omoachi0': {
      'en': 'Sign your name in the box below',
      'de': 'Tragen Sie Ihren Namen in das unten stehende Feld ein',
      'es': 'Firme su nombre en el cuadro de abajo',
      'fr': 'Signez votre nom dans la case ci-dessous',
      'zh_Hans': '在下面的框中签上您的名字',
    },
    '6nctukma': {
      'en': 'Edit',
      'de': 'Bearbeiten',
      'es': 'Editar',
      'fr': 'Modifier',
      'zh_Hans': '编辑',
    },
    '5zc9n1mj': {
      'en': 'Please enter full name of student',
      'de': 'Bitte geben Sie den vollständigen Namen des Schülers ein',
      'es': 'Por favor ingrese el nombre completo del estudiante',
      'fr': 'Veuillez entrer le nom complet de l\'étudiant',
      'zh_Hans': '请输入学生全名',
    },
    'lbvp7qhu': {
      'en': 'Please enter full name of student',
      'de': 'Bitte geben Sie den vollständigen Namen des Schülers ein',
      'es': 'Por favor ingrese el nombre completo del estudiante',
      'fr': 'Veuillez entrer le nom complet de l\'étudiant',
      'zh_Hans': '请输入学生全名',
    },
    'znzmlykk': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'v16w67rb': {
      'en': 'Please enter the name of the student\'s homeroom teacher',
      'de': 'Bitte geben Sie den Namen des Klassenlehrers des Schülers ein',
      'es': 'Ingrese el nombre del maestro de salón del estudiante',
      'fr': 'Veuillez entrer le nom du professeur principal de l\'élève',
      'zh_Hans': '请输入学生的班主任姓名',
    },
    'vmyod6kp': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'ljx95clr': {
      'en': 'A reason for student\'s absence must be provided',
      'de': 'Das Fernbleiben des Studierenden muss begründet werden',
      'es': 'Se debe proporcionar una razón para la ausencia del estudiante.',
      'fr': 'Un motif d\'absence de l\'élève doit être fourni',
      'zh_Hans': '必须提供学生缺勤的原因',
    },
    '8xysxcjz': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'es': 'Por favor, elija una opción del menú desplegable',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'wske1xcm': {
      'en': 'Edit Absence ',
      'de': 'Abwesenheit bearbeiten',
      'es': 'Editar ausencia',
      'fr': 'Modifier l\'absence',
      'zh_Hans': '编辑缺席',
    },
    '9j5b9dej': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // AbsenceExpanded
  {
    'mblsx3de': {
      'en': 'Child',
      'de': 'Kind',
      'es': 'Niño',
      'fr': 'Enfant',
      'zh_Hans': '孩子',
    },
    'k1q8mp06': {
      'en': 'School',
      'de': 'Schule',
      'es': 'Escuela',
      'fr': 'École',
      'zh_Hans': '学校',
    },
    'qyj8c9a3': {
      'en': 'Teacher',
      'de': 'Lehrer',
      'es': 'Maestro',
      'fr': 'Professeur',
      'zh_Hans': '老师',
    },
    'zcdlcbo5': {
      'en': 'Grade',
      'de': 'Grad',
      'es': 'Calificación',
      'fr': 'Grade',
      'zh_Hans': '年级',
    },
    '8kek4ity': {
      'en': 'Absent On',
      'de': 'Abwesend an',
      'es': 'Ausente en',
      'fr': 'Absent le',
      'zh_Hans': '缺席',
    },
    'wkgzo3u8': {
      'en': 'Submitted On',
      'de': 'Eingereicht am',
      'es': 'Enviado el',
      'fr': 'Soumis le',
      'zh_Hans': '提交于',
    },
    'w5j5x0gp': {
      'en': 'Reason',
      'de': 'Grund',
      'es': 'Razón',
      'fr': 'Raison',
      'zh_Hans': '原因',
    },
    'v0tefyej': {
      'en': 'Doctor\'s Note',
      'de': 'Arztbrief',
      'es': 'Nota del doctor',
      'fr': 'Note du médecin',
      'zh_Hans': '医生的笔记',
    },
    '52pz6ge2': {
      'en': 'View',
      'de': 'Sicht',
      'es': 'Vista',
      'fr': 'Voir',
      'zh_Hans': '看法',
    },
    '2lfx0pk9': {
      'en': 'View Absence',
      'de': 'Abwesenheit anzeigen',
      'es': 'Ver Ausencia',
      'fr': 'Voir les absences',
      'zh_Hans': '查看缺席',
    },
    '1j9lbfcp': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // FormSubmitted
  {
    'sltw2h07': {
      'en': 'Thank You!',
      'de': 'Danke schön!',
      'es': '¡Gracias!',
      'fr': 'Merci!',
      'zh_Hans': '谢谢你！',
    },
    'bxeung14': {
      'en':
          'Your child\'s absence has been recorded and sent to the appropriate grade-level office. If this excuse is submitted more than 72 hours past the date of absence it may be rejected as a valid excuse. Please contact your child\'s school if you have any additional concerns.',
      'de':
          'Die Abwesenheit Ihres Kindes wurde erfasst und an das zuständige Klassenbüro weitergeleitet. Wenn diese Entschuldigung mehr als 72 Stunden nach dem Datum der Abwesenheit eingereicht wird, kann sie als gültige Entschuldigung zurückgewiesen werden. Bitte kontaktieren Sie die Schule Ihres Kindes, wenn Sie weitere Bedenken haben.',
      'es':
          'La ausencia de su hijo ha sido registrada y enviada a la oficina del nivel de grado correspondiente. Si esta excusa se presenta más de 72 horas después de la fecha de ausencia, puede ser rechazada como una excusa válida. Comuníquese con la escuela de su hijo si tiene alguna inquietud adicional.',
      'fr':
          'L\'absence de votre enfant a été enregistrée et envoyée au bureau du niveau scolaire approprié. Si cette excuse est soumise plus de 72 heures après la date d\'absence, elle peut être rejetée comme excuse valable. Veuillez contacter l\'école de votre enfant si vous avez d\'autres préoccupations.',
      'zh_Hans':
          '您孩子的缺勤已被记录并发送到相应的年级办公室。如果此借口在缺席日期后超过 72 小时提交，则可能会被拒绝作为有效借口。如果您有任何其他疑虑，请联系您孩子的学校。',
    },
    'eyutm0ou': {
      'en': 'Continue',
      'de': 'Weitermachen',
      'es': 'Continuar',
      'fr': 'Continuer',
      'zh_Hans': '继续',
    },
    'kp0pbrdb': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
      'zh_Hans': '家',
    },
  },
  // AddContentSelector
  {
    't7nb2xmc': {
      'en': 'Add Post',
      'de': 'Beitrag hinzufügen',
      'es': 'Añadir publicación',
      'fr': 'Ajouter un article',
      'zh_Hans': '添加帖子',
    },
  },
  // SocialPost
  {
    '7hjo81wt': {
      'en': '•',
      'de': '•',
      'es': '•',
      'fr': '•',
      'zh_Hans': '•',
    },
  },
  // CustomAppBar
  {
    'd6o0mmr4': {
      'en': '2',
      'de': '2',
      'es': '2',
      'fr': '2',
      'zh_Hans': '2个',
    },
    'avox4qrx': {
      'en': '6',
      'de': '6',
      'es': '6',
      'fr': '6',
      'zh_Hans': '6个',
    },
  },
  // ExploreAppBar
  {
    '9thtv05f': {
      'en': '2',
      'de': '2',
      'es': '2',
      'fr': '2',
      'zh_Hans': '2个',
    },
    'em6rbqio': {
      'en': '6',
      'de': '6',
      'es': '6',
      'fr': '6',
      'zh_Hans': '6个',
    },
    'l2x6bulk': {
      'en': '',
      'de': 'Anzeigename',
      'es': 'Nombre para mostrar',
      'fr': 'Afficher un nom',
      'zh_Hans': '显示名称',
    },
    'f87s9ke8': {
      'en': 'Search...',
      'de': 'Suchen...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
      'zh_Hans': '搜索...',
    },
  },
  // CustomAppBarCopy
  {
    'm6x8ui7t': {
      'en': '6',
      'de': '6',
      'es': '6',
      'fr': '6',
      'zh_Hans': '6个',
    },
    'i9hhqjo1': {
      'en': '6',
      'de': '6',
      'es': '6',
      'fr': '6',
      'zh_Hans': '6个',
    },
  },
  // SocialPostCopy
  {
    'l8uxyhmh': {
      'en': '•',
      'de': '•',
      'es': '•',
      'fr': '•',
      'zh_Hans': '•',
    },
  },
  // CustomAppBarCopy2
  {
    '558saoxe': {
      'en': '12',
      'de': '12',
      'es': '12',
      'fr': '12',
      'zh_Hans': '12',
    },
    'k1s3mbjb': {
      'en': '6',
      'de': '6',
      'es': '6',
      'fr': '6',
      'zh_Hans': '6个',
    },
  },
  // SocialPostCopy2
  {
    '01oc5sv9': {
      'en': '•',
      'de': '•',
      'es': '•',
      'fr': '•',
      'zh_Hans': '•',
    },
  },
  // PeopleChip
  {
    '0trp5c09': {
      'en': 'Follow',
      'de': 'Folgen',
      'es': 'Seguir',
      'fr': 'Suivre',
      'zh_Hans': '跟随',
    },
  },
  // Absense
  {
    'huqkgg8e': {
      'en': 'Alexander Harrison',
      'de': 'Alexander Harrison',
      'es': 'alexander harrison',
      'fr': 'Alexandre Harrisson',
      'zh_Hans': '亚历山大·哈里森',
    },
    '7z38tr1g': {
      'en':
          'He has a scheduled appointment with his dentist that day and will need to miss his classes. He had been suffering from a severe toothache for a week and could not bear it any longer. He hoped that he would not miss anything important in his classes and that he would recover soon.',
      'de':
          'Er hat an diesem Tag einen Termin bei seinem Zahnarzt und muss seinen Unterricht verpassen. Er litt seit einer Woche unter starken Zahnschmerzen und konnte es nicht länger ertragen. Er hoffte, dass er in seinem Unterricht nichts Wichtiges verpassen würde und dass er sich bald erholen würde.',
      'es':
          'Tiene una cita programada con su dentista ese día y tendrá que faltar a sus clases. Llevaba una semana sufriendo de un fuerte dolor de muelas y no podía soportarlo más. Esperaba no perderse nada importante en sus clases y recuperarse pronto.',
      'fr':
          'Il a un rendez-vous avec son dentiste ce jour-là et devra manquer ses cours. Il souffrait d\'un mal de dents sévère depuis une semaine et ne pouvait plus le supporter. Il espérait qu\'il ne manquerait rien d\'important dans ses cours et qu\'il se remettrait bientôt.',
      'zh_Hans':
          '那天他和牙医有预约，需要缺课。他牙痛得厉害已经一个星期了，再也忍不住了。他希望他不会错过课堂上任何重要的事情，并希望他能尽快康复。',
    },
    'gp1rxbi5': {
      'en': 'For: 11-18-2006',
      'de': 'Für: 18.11.2006',
      'es': 'Para: 18-11-2006',
      'fr': 'Pour : 18-11-2006',
      'zh_Hans': '对于：2006 年 11 月 18 日',
    },
    'jsk6dcdx': {
      'en': 'Approved',
      'de': 'Genehmigt',
      'es': 'Aprobado',
      'fr': 'Approuvé',
      'zh_Hans': '得到正式认可的',
    },
  },
  // NoAbsences
  {
    'c9tfy1xl': {
      'en': 'You haven\'t submitted any absences yet.',
      'de': 'Sie haben noch keine Abwesenheiten eingereicht.',
      'es': 'Todavía no ha enviado ninguna ausencia.',
      'fr': 'Vous n\'avez pas encore soumis d\'absences.',
      'zh_Hans': '您还没有提交任何缺勤。',
    },
  },
  // Miscellaneous
  {
    '3572m3oi': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '2orputwt': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '27uisxge': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '7cd0q1oi': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'tnoj489c': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'af1r9e4f': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'ord8iu06': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'ledzzqxl': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '9lc86xlj': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '55bzymjq': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'xzjcgl5m': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'k5cd3sc5': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'hl4mynpz': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'dda570ya': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '0w6cdejq': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '94y8vwx2': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'lhsh4feb': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '3h9uz7mu': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'yfl28dcy': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '880yr452': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    'zpq5nh8r': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
    '1kguvq3s': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
      'zh_Hans': '',
    },
  },
].reduce((a, b) => a..addAll(b));
