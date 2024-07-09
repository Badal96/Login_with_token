import 'package:apricotspace_task/config/assets.dart';
import 'package:apricotspace_task/config/router.gr.dart';
import 'package:apricotspace_task/view/pages/login/cubit/login_cubit.dart';
import 'package:apricotspace_task/view/widgets/primary_button.dart';
import 'package:apricotspace_task/view/widgets/secondary_button.dart';
import 'package:apricotspace_task/view/widgets/text_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../config/theme.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final FormGroup _singUpForm = FormGroup({
    'email': FormControl<String>(validators: [Validators.required]),
    'password': FormControl<String>(validators: [Validators.required]),
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
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                final signInCubit = context.read<LoginCubit>();
                return CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UISize.mdVertical,
                            Center(
                              child: Text(
                                'Sign In',
                                style: theme.textTheme.displayLarge,
                              ),
                            ),
                            UISize.mdVertical,
                            UISize.mdVertical,
                            CustomTextField(
                              title: 'Email',
                              formControlName: 'email',
                              validationMessages: {
                                ValidationMessage.any: (control) => control.toString(),
                                ValidationMessage.email: (_) => 'Not valid email address',
                                ValidationMessage.required: (_) => 'Field is required',
                              },
                              decoration: const InputDecoration(hintText: 'user@gmail.com'),
                            ),
                            UISize.lgVertical,
                            CustomTextField(
                              obscure: state.obscure,
                              title: 'Password',
                              formControlName: 'password',
                              validationMessages: {
                                ValidationMessage.required: (_) => 'Field is required',
                                ValidationMessage.minLength: (_) => 'Min length is 6',
                                ValidationMessage.any: (control) => control.toString(),
                              },
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      style: IconButton.styleFrom(padding: EdgeInsets.zero),
                                      onPressed: signInCubit.toggleObscure,
                                      icon: state.obscure
                                          ? const Icon(Icons.remove_red_eye_outlined)
                                          : const Icon(Icons.visibility_off_outlined))),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  style:
                                      TextButton.styleFrom(padding: const EdgeInsets.only(left: 5)),
                                  onPressed: () {
                                    context.router.push(ForgotPasswordRoute());
                                  },
                                  child: Text(
                                    'Forgot Password',
                                    style: theme.textTheme.bodyLarge
                                        ?.copyWith(height: 16 / 14, color: AppColors.lightOrange),
                                  ),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      padding: const EdgeInsets.only(right: 5)),
                                  onPressed: () {},
                                  child: Text(
                                    'Privacy policy',
                                    style: theme.textTheme.bodyLarge
                                        ?.copyWith(height: 16 / 14, color: AppColors.lightOrange),
                                  ),
                                )
                              ],
                            ),
                            UISize.lgVertical,
                            const Spacer(),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                StreamBuilder(
                                    stream: _singUpForm.valueChanges,
                                    builder: (context, snapshot) {
                                      return PrimaryButton(
                                        label: 'Sign in',
                                        isLoading: state.isLoading,
                                        onPressed: _singUpForm.valid
                                            ? () {
                                                _onSignIn(context);
                                              }
                                            : null,
                                      );
                                    }),
                                UISize.mdVertical,
                                SecondaryButton(
                                  suffix: SvgPicture.asset(
                                    Assets.googleIcon,
                                  ),
                                  label: 'Continue with Google',
                                  onPressed: () {},
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Don’t have an account?',
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 0.525),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    TextButton(
                                        style: TextButton.styleFrom(
                                            padding: const EdgeInsets.only(left: 3),
                                            minimumSize: const Size(50, 30)),
                                        onPressed: () {
                                          context.router.replace(SignUpRoute());
                                        },
                                        child: const Text(
                                          'Sign up',
                                          style: TextStyle(
                                              color: AppColors.lightOrange,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

void _onSignIn(BuildContext context) async {
  final form = ReactiveForm.of(context) as FormGroup;
  final signInCubit = context.read<LoginCubit>();
  FocusScope.of(context).unfocus();
  form.markAllAsTouched();
  if (form.valid) {
    final value = form.value;
    final email = value['email'].toString();
    final password = value['password'].toString();

    final canLogin = await signInCubit.login(
      email: email,
      password: password,
      onError: (err) {
        final data = err.response?.data['message'];

        if (data == null) return;

        if (data is Map) {
          data.forEach((k, v) {
            form.control(k).setErrors({'any': v.first});
          });
        } else if (data is String) {
          form.control('password').setErrors({'any': 'Invalid credentials'});
          if (data.contains('email')) {
            form.control('email').setErrors({'any': data});
          } else if (data.contains('password')) {
            form.control(password).setErrors({'any': data});
          }

          Fluttertoast.showToast(
              msg: data,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: AppColors.buttonBlack,
              textColor: AppColors.appWhite,
              fontSize: 16.0);
        }
      },
    );

    if (context.mounted && canLogin) {
      context.router.pushAndPopUntil(
        const HomeRoute(),
        predicate: (route) => false,
      );
    }
  }
}
