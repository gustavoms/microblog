abstract class AppTranslation {
  static Map<String, Map<String, String>> translationsKeys = {
    "pt_BR": ptBR,
    "en_US": enUS,
  };
}

final Map<String, String> ptBR = {
  'hint_input_user': 'Usuário',
  'hint_input_password': 'Senha',
  'text_btn_login': 'Entrar',
  'text_btn_signup': 'Cadastrar',
  'input_error_empty_user': 'Por favor, preencha o seu usuário.',
  'input_error_empty_password': 'Por favor, preencha a sua senha.',
  'snackbar_error_title': 'Ooops! Algo deu errado.',
};

final Map<String, String> enUS = {
  'hint_input_user': 'User',
  'hint_input_password': 'Password',
  'text_btn_login': 'Login',
  'text_btn_signup': 'Signup',
  'input_error_empty_user': 'Please, fill your user.',
  'input_error_empty_password': 'Please, fill your password.',
  'snackbar_error_title': 'Ooops! Something went wrong.',
};
