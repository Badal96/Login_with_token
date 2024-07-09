import 'package:apricotspace_task/config/assets.dart';
import 'package:apricotspace_task/config/router.gr.dart';
import 'package:apricotspace_task/config/theme.dart';
import 'package:apricotspace_task/view/widgets/preview.dart';
import 'package:apricotspace_task/view/widgets/primary_button.dart';
import 'package:apricotspace_task/view/widgets/secondary_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int previewIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 617,
              child: Stack(children: [
                CarouselSlider(
                  options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 4),
                      onPageChanged: (index, reason) => setState(() => previewIndex = index),
                      viewportFraction: 1.01,
                      height: double.infinity,
                      enlargeCenterPage: true),
                  items: const [
                    Preview(
                      asset: Assets.clothes,
                      text: 'Find customers for your services',
                    ),
                    Preview(
                      asset: Assets.womanShopping,
                      text: 'Gain interested shoppers for your products',
                    ),
                    Preview(
                      asset: Assets.womanPosing,
                      text: 'Increase your awareness in style, fashion and beauty',
                    ),
                  ],
                ),
                Align(
                    alignment: const AlignmentDirectional(0, 0.98),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _pageViewIcon(previewIndex == 0),
                        const SizedBox(
                          width: 10,
                        ),
                        _pageViewIcon(previewIndex == 1),
                        const SizedBox(
                          width: 10,
                        ),
                        _pageViewIcon(previewIndex == 2),
                      ],
                    ))
              ])),
          Expanded(
              flex: 250,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: UISize.standard),
                color: AppColors.appWhite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryButton(
                      label: 'Sign in',
                      onPressed: () {
                        context.router.push(SignInRoute());
                      },
                    ),
                    UISize.mdVertical,
                    SecondaryButton(
                      label: 'Sign up',
                      onPressed: () {
                        context.router.push(SignUpRoute());
                      },
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget _pageViewIcon(bool selected) {
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
          color: selected ? AppColors.appWhite : AppColors.appWhite50, shape: BoxShape.circle),
    );
  }
}
