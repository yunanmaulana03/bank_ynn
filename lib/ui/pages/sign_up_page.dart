import 'package:bank_ynn/blocs/auth/auth_bloc.dart';
import 'package:bank_ynn/models/sign_up_form_model.dart';
import 'package:bank_ynn/shared/shared_method.dart';
import 'package:bank_ynn/ui/pages/sign_up_set_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/theme.dart';
import '../widgets/button.dart';
import '../widgets/forms.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // variable
  final nameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  // function untuk mengecek apakah masih ada yang kosong pada controller
  bool validate() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
            // showCustomSnackbar(context, 'Email sudah ada!');
          }
          if (state is AuthCheckEmailSuccess) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SignUpSetProfilePage(
                        data: SignUpFormModel(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text))));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            children: [
              Container(
                width: 155,
                height: 50,
                margin: const EdgeInsets.only(
                  top: 100,
                  bottom: 100,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/img_logo_light.png',
                    ),
                  ),
                ),
              ),
              Text(
                'Join Us to Unlock\nYour Growth',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // NOTE : FULL NAME
                    CustomFormField(
                      title: 'Full Name',
                      controller: nameController,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    // NOTE : EMAIL ADDRESS
                    CustomFormField(
                      title: 'Email Address',
                      controller: emailController,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    // NOTE : PASSWORD
                    CustomFormField(
                      title: 'Password',
                      controller: passwordController,
                      obsecureText: true,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomFilledButton(
                      title: 'Continue',
                      onPressed: () {
                        if (validate()) {
                          context.read<AuthBloc>().add(
                                AuthCheckEmail(emailController.text),
                              );
                        } else {
                          showCustomSnackbar(
                              context, 'Semua field harus diiisi!');
                        }
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              CustomTextButton(
                title: 'Sign In',
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-in');
                },
              ),
              SizedBox(
                height: 30,
              ),
            ],
          );
        },
      ),
    );
  }
}
