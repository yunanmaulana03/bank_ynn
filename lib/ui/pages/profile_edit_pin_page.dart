import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../shared/shared_method.dart';
import '../../shared/theme.dart';
import '../widgets/button.dart';
import '../widgets/forms.dart';

class ProfileEditPinPage extends StatefulWidget {
  const ProfileEditPinPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditPinPage> createState() => _ProfileEditPinPageState();
}

class _ProfileEditPinPageState extends State<ProfileEditPinPage> {
  final oldPinController = TextEditingController(text: '');
  final newPinController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Pin',
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/profile-edit-success', (route) => false);
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
                    CustomFormField(
                      title: 'Old Pin',
                      obsecureText: true,
                      controller: oldPinController,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomFormField(
                        title: 'New Pin',
                        obsecureText: true,
                        controller: newPinController,
                        keyboardType: TextInputType.number),
                    SizedBox(
                      height: 30,
                    ),
                    CustomFilledButton(
                      title: 'Update Now',
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              AuthUpdatePin(
                                  oldPinController.text, newPinController.text),
                            );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
