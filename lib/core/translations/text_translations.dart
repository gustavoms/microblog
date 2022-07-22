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
  'signup_title': 'Cadastro',
  'hint_input_password_second': 'Repita a senha',
  'text_btn_create': 'Cadastrar',
  'snackbar_success': 'Sucesso',
  'snackbar_error': 'Erro',
  'signup_successful': 'Cadastro realizado com sucesso!',
  'input_error_password_not_match': 'As senhas não conferem.',
  'email_already_exists': 'O e-mail já está cadastrado.',
  'user_already_exists': 'O usuário já está cadastrado.',
  'hint_input_email': 'E-mail',
  'input_error_invalid_email': 'Por favor, preencha um e-mail válido.',
};

final Map<String, String> enUS = {
  'hint_input_user': 'User',
  'hint_input_password': 'Password',
  'text_btn_login': 'Login',
  'text_btn_signup': 'Signup',
  'input_error_empty_user': 'Please, fill your user.',
  'input_error_empty_password': 'Please, fill your password.',
  'snackbar_error_title': 'Ooops! Something went wrong.',
  'signup_title': 'Signup',
  'hint_input_password_second': 'Repeat password',
  'text_btn_create': 'Create',
  'snackbar_success': 'Success',
  'snackbar_error': 'Error',
  'signup_successful': 'Signup successful!',
  'input_error_password_not_match': 'Passwords do not match.',
  'email_already_exists': 'The email already exists.',
  'user_already_exists': 'The user already exists.',
  'hint_input_email': 'Email',
  'input_error_invalid_email': 'Please, fill a valid email.',
};
