import 'package:apricotspace_task/config/router.gr.dart';
import 'package:apricotspace_task/view/pages/sign_up/cubit/sign_up_cubit.dart';
import 'package:apricotspace_task/view/widgets/primary_button.dart';
import 'package:apricotspace_task/view/widgets/secondary_button.dart';
import 'package:apricotspace_task/view/widgets/text_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../config/assets.dart';
import '../../../config/theme.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final FormGroup _singUpForm = FormGroup({
    'username': FormControl<String>(validators: [Validators.required]),
    'email': FormControl<String>(validators: [Validators.email, Validators.required]),
    'password': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(6),
    ]),
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
            child: BlocBuilder<SignUpCubit, SignUpState>(
              builder: (context, state) {
                final signUpCubit = context.read<SignUpCubit>();
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
                                'Sign up',
                                style: theme.textTheme.displayLarge,
                              ),
                            ),
                            UISize.mdVertical,
                            CustomTextField(
                              title: 'Username',
                              formControlName: 'username',
                              validationMessages: {
                                ValidationMessage.any: (control) => control.toString(),
                                ValidationMessage.required: (_) => 'Field is required',
                              },
                            ),
                            UISize.smVertical,
                            Text('Please consider that you will not be able to change the username',
                                style: Theme.of(context).textTheme.titleSmall),
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
                                hintText: 'enter 6 digit code',
                                suffixIcon: IconButton(
                                  onPressed: signUpCubit.toggleObscure,
                                  icon: state.obscure
                                      ? const Icon(Icons.remove_red_eye_outlined)
                                      : const Icon(Icons.visibility_off_outlined),
                                ),
                              ),
                            ),
                            UISize.lgVertical,
                            RichText(
                              text: TextSpan(
                                style: theme.textTheme.bodyLarge,
                                children: [
                                  const TextSpan(text: 'By continuing, you agree to our '),
                                  TextSpan(
                                    text: 'Terms of Service ',
                                    style: theme.textTheme.bodyLarge?.copyWith(
                                      color: AppColors.lightOrange,
                                    ),
                                  ),
                                  const TextSpan(text: 'Acknowledge that you have our '),
                                  TextSpan(
                                    text: 'Privacy Policy ',
                                    style: theme.textTheme.bodyLarge?.copyWith(
                                      color: AppColors.lightOrange,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: 'and to learn how we collect, use, and share your data.',
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            UISize.lgVertical,
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                StreamBuilder(
                                    stream: _singUpForm.valueChanges,
                                    builder: (context, snapshot) {
                                      return PrimaryButton(
                                        label: 'Sign up',
                                        isLoading: state.isLoading,
                                        onPressed:
                                            _singUpForm.valid ? () => _onSignUp(context) : null,
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
                                      'Already have an account?',
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
                                          context.router.replace(SignInRoute());
                                        },
                                        child: const Text(
                                          'Sign in',
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

  void _onSignUp(BuildContext context) async {
    final form = ReactiveForm.of(context) as FormGroup;
    final signUpCubit = context.read<SignUpCubit>();
    FocusScope.of(context).unfocus();
    form.markAllAsTouched();
    if (form.valid) {
      final value = form.value;
      final email = value['email'].toString();
      final password = value['password'].toString();
      final username = value['username'].toString();

      final shouldPushToVerify = await signUpCubit.register(
        username: username,
        email: email,
        password: password,
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
            form.control('password').setErrors({'any': 'Invalid credentials'});
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
    }
  }
}
