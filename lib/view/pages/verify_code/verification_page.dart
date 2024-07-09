import 'package:apricotspace_task/config/router.gr.dart';
import 'package:apricotspace_task/config/theme.dart';
import 'package:apricotspace_task/injector/injector.dart';
import 'package:apricotspace_task/view/pages/verify_code/cubit/verify_code_cubit.dart';
import 'package:apricotspace_task/view/widgets/countdown_timer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

@RoutePage()
class VerifyPage extends StatelessWidget {
  final String email;
  VerifyPage({super.key, required this.email});
  final controller = CountdownController(autoStart: true);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyCodeCubit(authProvider: sl(), localData: sl(), client: sl()),
      child: BlocBuilder<VerifyCodeCubit, VerifyCodeState>(
        builder: (context, state) {
          final color = switch (state) {
            VerifyCodeState.error => AppColors.error,
            VerifyCodeState.success => AppColors.green,
            VerifyCodeState.initial => AppColors.buttonBlack50,
            _ => AppColors.buttonBlack50
          };
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          context.read<VerifyCodeCubit>().changeIndex(2);
                        },
                        icon: const Icon(Icons.add)),
                    Text(state.currentIndex.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              context.router.pop();
                            },
                            icon: const Icon(Icons.arrow_back_ios)),
                        Text(
                          'Verify your account',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        const SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Please enter the 4 - digit verification code we sent via mail:',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  height: 21 / 15,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    PinCodeTextField(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      pinTheme: AppTheme.pinTheme(color: color),
                      appContext: context,
                      length: 4,
                      onCompleted: (code) {
                        context.read<VerifyCodeCubit>().verify(
                              email: email,
                              code: code,
                              onSuccess: () {
                                context.router.pushAndPopUntil(
                                  const HomeRoute(),
                                  predicate: (route) => false,
                                );
                              },
                            );
                      },
                    ),
                    UISize.mdVertical,
                    state == VerifyCodeState.error()
                        ? Text(
                            'Incorrect code',
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: const Color(0xFFD31510), fontWeight: FontWeight.w400),
                          )
                        : const SizedBox.shrink(),
                    UISize.lgVertical,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Countdown(
                          controller: controller,
                          interval: const Duration(seconds: 1),
                          seconds: 20,
                          build: (context, time) {
                            late String formattedNumber;
                            final seconds = time.round();
                            if (seconds < 10) {
                              formattedNumber = seconds.toString().padLeft(2, '0');
                            } else {
                              formattedNumber = seconds.toStringAsFixed(0);
                            }
                            return Text('Resend code in 00:$formattedNumber s');
                          },
                        ),
                        ValueListenableBuilder<int>(
                            valueListenable: controller.valueChanged,
                            builder: (context, value, __) {
                              bool disabled = value != 0;

                              return TextButton(
                                onPressed: disabled
                                    ? null
                                    : () {
                                        context.read<VerifyCodeCubit>().sendCod(email);
                                        controller.restart();
                                      },
                                style: TextButton.styleFrom(
                                    textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                                          color: Colors.red,
                                        )),
                                child: const Text('Resend code'),
                              );
                            }),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
