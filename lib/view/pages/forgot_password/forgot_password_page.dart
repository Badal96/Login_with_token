import 'package:apricotspace_task/config/router.gr.dart';
import 'package:apricotspace_task/view/pages/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:apricotspace_task/view/widgets/primary_button.dart';
import 'package:apricotspace_task/view/widgets/text_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../config/theme.dart';

@RoutePage()
class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final FormGroup _singUpForm = FormGroup({
    'email': FormControl<String>(validators: [Validators.email, Validators.required]),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ReactiveForm(
            formGroup: _singUpForm,
            child: BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
              builder: (context, state) {
                final forgotCubit = context.read<ForgotPasswordCubit>();

                return Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UISize.mdVertical,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                context.router.pop();
                              },
                              icon: const Icon(Icons.arrow_back_ios)),
                          Text(
                            'Forgot Password',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          const SizedBox(
                            width: 50,
                          )
                        ],
                      ),
                      UISize.mdVertical,
                      Center(
                        child: Text(
                          'Enter Email Address',
                          style: theme.textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      UISize.mdVertical,
                      CustomTextField(
                        title: 'Email',
                        formControlName: 'email',
                        validationMessages: {
                          ValidationMessage.any: (control) => control.toString(),
                          ValidationMessage.email: (_) => 'Not a valid email address',
                          ValidationMessage.required: (_) => 'Field is required',
                        },
                        decoration: const InputDecoration(hintText: 'user@gmail.com'),
                      ),
                      const Spacer(),
                      StreamBuilder(
                          stream: _singUpForm.valueChanges,
                          builder: (context, snapshot) {
                            return PrimaryButton(
                              label: 'Send',
                              isLoading: state.isLoading,
                              onPressed:
                                  _singUpForm.valid ? () => _onForgotPassword(context) : null,
                            );
                          }),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

void _onForgotPassword(BuildContext context) async {
  final form = ReactiveForm.of(context) as FormGroup;
  final signInCubit = context.read<ForgotPasswordCubit>();
  FocusScope.of(context).unfocus();
  form.markAllAsTouched();
  if (form.valid) {
    final value = form.value;
    final email = value['email'].toString();

    await signInCubit.sendForgotPassword(
      email: email,
      onSuccess: () {
        context.router.push(VerifyRoute(email: email));
      },
      onError: (err) {
        final data = err.response?.data['message'];
        if (data == null) return;

        if (data is Map) {
          data.forEach((k, v) {
            form.control(k).setErrors({'any': v.first});
          });
        } else if (data is String) {
          form.control('email').setErrors({'any': 'Invalid credentials'});
          Fluttertoast.showToast(
              msg: 'Invalid credentials',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: AppColors.buttonBlack,
              textColor: AppColors.appWhite,
              fontSize: 16.0);
        }
      },
    );
  }
}
