class LanguageData {
  final String flag;
  final String name;
  final String languageCode;

  LanguageData(this.flag, this.name, this.languageCode);

  static List<LanguageData> languageList() {
    return <LanguageData>[
      LanguageData("assets/icons/us.svg", "En", 'en'),
      LanguageData("assets/icons/uae.svg", "Ar", "ar"),
      LanguageData("assets/icons/cn.svg", "Ch", "zh"),
      LanguageData("assets/icons/fr.svg", "Fr", "fr"),
      LanguageData("assets/icons/es.svg", "Es", "es"),
      LanguageData("assets/icons/pt.svg", "Pt", "pt"),
    ];
  }
}
