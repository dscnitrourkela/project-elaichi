class Env {
  static const String webMailBaseUrl = String.fromEnvironment(
    'ZIMRA_BASE_URL',
    defaultValue: 'https://mail.nitrkl.ac.in/home/~/?auth=sc',
  );

  static const String avenueWebMailBaseUrl = String.fromEnvironment(
    'ZIMRA_BASE_URL',
    defaultValue: 'https://avenue-webmail.netlify.app/?zauthtoken=',
  );
}
