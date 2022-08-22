import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:truco_of_legends/Pages/Game/Providers/auth_controller.dart';

enum AuthMode { signup, login }

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  AuthMode _authMode = AuthMode.signup;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  bool _isSignup() => _authMode == AuthMode.signup;

  void _switchAuthMode() {
    setState(() {
      _isSignup() ? _authMode = AuthMode.login : _authMode = AuthMode.signup;
    });
  }

  void _showErrorDialog(String msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Ocorreu um Erro!'),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Fechar'),
          )
        ],
      ),
    );
  }

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    setState(() => _isLoading = true);

    _formKey.currentState?.save();
    AuthController authController = Provider.of(context, listen: false);

    try {
      if (_isSignup()) {
        await authController.signup(
          _authData['email']!,
          _authData['password']!,
        );
      } else {
        await authController.login(
          _authData['email']!,
          _authData['password']!,
        );
      }
    } on FirebaseAuthException catch (error) {
      _showErrorDialog(error.message ?? 'Ocorreu um erro na autenticação');
    } catch (error) {
      _showErrorDialog('Ocorreu um erro na autenticação');
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        height: _isSignup() ? 400 : 320,
        width: deviceSize.width * 0.75,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'E-mail',
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (email) => _authData['email'] = email ?? '',
                validator: (_email) {
                  final email = _email ?? '';

                  if (email.trim().isEmpty || !email.contains('@')) {
                    return 'Informe um e-mail válido!';
                  }

                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Senha',
                ),
                keyboardType: TextInputType.visiblePassword,
                controller: _passwordController,
                onSaved: (password) => _authData['password'] = password ?? '',
                validator: (_password) {
                  final password = _password ?? '';

                  if (password.isEmpty || password.length < 6) {
                    return 'Informe uma senha válida';
                  }

                  return null;
                },
                obscureText: true,
              ),
              if (_isSignup())
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Confirmar Senha',
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  validator: _isSignup()
                      ? (password) {
                          if (password != _passwordController.text) {
                            return 'Senhas informadas não conferem!';
                          }

                          return null;
                        }
                      : null,
                ),
              SizedBox(height: 15),
              if (_isLoading)
                CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 8,
                    ),
                  ),
                  child: Text(_isSignup() ? 'REGISTRAR' : 'ENTRAR'),
                ),
              Spacer(),
              TextButton(
                onPressed: _switchAuthMode,
                child: Text(
                  _isSignup() ? 'JÁ POSSUI CONTA?' : 'DESEJA REGISTRAR?',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
