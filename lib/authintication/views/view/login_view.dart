import 'package:chating_app/authintication/views/widget/custom_text_field.dart';
import 'package:chating_app/core/spacer.dart';
import 'package:chating_app/home/views/home_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  static const String id = 'login_view';

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;
  @override
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // Regex Reguler experission

  //on save method
  Future<void> onSave() async {
    final bool isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: ListView(
            children: [
              const SizedBox(
                height: 75,
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    'asset/image/logo2.png',
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'sign in to continue',
                ),
              ),
              spacerH20,
              CustomTextField(
                hint: 'email',
                prefixIcon: Icons.email_outlined,
                myController: emailController,
                onSaved: (String? value) {
                  print("onSaved value is : $value");
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? null
                      : 'Oops! end with @ char.com';
                },
              ),
              spacerH20,
              CustomTextField(
                hint: 'password',
                prefixIcon: Icons.lock,
                suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                myController: passwordController,
                validator: (String? value) {
                  return (value!.isEmpty || value.length <= 4)
                      ? 'should be less that 4 charachter'
                      : null;
                },
              ),
              spacerH20,
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, HomeView.id);
                  },
                  child: const Text(
                    "sign in ",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
