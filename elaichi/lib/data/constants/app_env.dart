class Env {
  static const String webMailBaseUrl = String.fromEnvironment(
    'ZIMRA_BASE_URL',
    defaultValue: 'https://mail.nitrkl.ac.in/home/~/?auth=sc',
  );

  static const String avenueWebMailBaseUrl = String.fromEnvironment(
    'AVENUE_MAIL_BASE_URL',
    defaultValue: 'https://avenue-webmail.netlify.app/?zauthtoken=',
  );

  static const String avenueServerUrl = String.fromEnvironment(
    'AVENUE_SERVER_URL',
    defaultValue: 'https://test.dscnitrourkela.org/graphql',
  );
  static const String mondayMorningUrl = String.fromEnvironment(
    'MM_SERVER_URL',
    defaultValue: 'https://mondaymorning.nitrkl.ac.in/api/v1/graph',
  );
}
