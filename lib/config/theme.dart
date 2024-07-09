import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AppDecorations {
  static final cardRadius = BorderRadius.circular(10);
  static final fieldRadius = BorderRadius.circular(20);
  static final buttonRadius = BorderRadius.circular(5);

  static InputDecoration formDecoration({
    String? label,
    TextStyle? labelStyle,
  }) {
    return InputDecoration(
      labelText: label,
      labelStyle: labelStyle ??
          const TextStyle(
            fontFamily: AppTheme.fontfamily,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.buttonBlack,
          ),
      border: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.buttonBlack,
        ),
      ),
      focusedErrorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.buttonBlack50,
        ),
      ),
      disabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.buttonBlack50,
        ),
      ),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.buttonBlack,
        ),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.buttonBlack,
        ),
      ),
    );
  }
}

class AppColors {
  static const appWhite = Colors.white;
  static const appWhite50 = Color.fromRGBO(255, 255, 255, 0.529);
  static const buttonBlack = Color(0XFF161616);
  static const buttonBlack50 = Color.fromRGBO(22, 22, 22, 0.55);
  static const lightOrange = Color(0XFFE3AC9A);
  static const pinColor = Color(0xFFCFCFCF);
  static const green = Color(0xFF00A15D);
  static const error = Color(0xFFD70000);
  static const disabled = Color.fromRGBO(0, 0, 0, 0.45);
}

class AppTheme {
  static InputDecoration authFormDecoration(
    BuildContext context, {
    String? hintText,
  }) =>
      InputDecoration(
        filled: true,
        errorStyle: const TextStyle(height: 20, fontSize: 0),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: AppColors.appWhite.withOpacity(0.65),
            ),
        fillColor: AppColors.buttonBlack.withOpacity(0.2),
        border: InputBorder.none,
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: AppDecorations.buttonRadius,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: AppDecorations.buttonRadius,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: AppDecorations.buttonRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: AppDecorations.buttonRadius,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: AppDecorations.buttonRadius,
        ),
        contentPadding: const EdgeInsets.only(left: 25, right: 25),
      );
  static PinTheme pinTheme({
    required Color color,
  }) =>
      PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(4),
        fieldHeight: 50,
        fieldWidth: 50,
        fieldOuterPadding: const EdgeInsets.all(16),
        inactiveBorderWidth: 1,
        borderWidth: 1,
        activeBorderWidth: 1,
        disabledBorderWidth: 1,
        errorBorderWidth: 1,
        selectedBorderWidth: 1,
        disabledColor: color,
        selectedColor: AppColors.buttonBlack,
        activeColor: color,
        inactiveColor: color,
        activeFillColor: color,
        errorBorderColor: color,
        inactiveFillColor: color,
        selectedFillColor: color,
      );

  static const fontfamily = 'Roboto';
  static ThemeData of(BuildContext context) {
    final theme = Theme.of(context);

    const iconTheme = IconThemeData(
      color: AppColors.buttonBlack,
    );

    final textTheme = theme.textTheme
        .copyWith(
          bodyLarge: theme.textTheme.bodyLarge?.copyWith(
            color: AppColors.buttonBlack,
            fontSize: 14,
            height: 20 / 14,
            fontWeight: FontWeight.w400,
          ),
          bodySmall: theme.textTheme.bodySmall?.copyWith(
            height: 21 / 15,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.buttonBlack,
          ),
          titleSmall: theme.textTheme.bodyMedium?.copyWith(
            height: 15 / 12,
            fontSize: 12,
            color: AppColors.buttonBlack.withOpacity(0.55),
            fontWeight: FontWeight.w400,
          ),
          displayLarge: theme.textTheme.displayLarge?.copyWith(
              letterSpacing: 1,
              color: AppColors.buttonBlack,
              fontSize: 18,
              height: 26 / 18,
              fontWeight: FontWeight.w600),
          displayMedium: theme.textTheme.displayMedium?.copyWith(
            fontFamily: 'Montserrat',
            height: 26 / 18,
            color: AppColors.appWhite,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
          displaySmall: theme.textTheme.displaySmall?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColors.appWhite50,
          ),
          headlineMedium: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: AppColors.buttonBlack,
          ),
          headlineSmall: theme.textTheme.headlineSmall?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          titleLarge: theme.textTheme.titleLarge?.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.buttonBlack,
          ),
          titleMedium: theme.textTheme.titleMedium?.copyWith(
            fontSize: 16,
            height: 20 / 16,
            fontWeight: FontWeight.w400,
            color: AppColors.buttonBlack50,
          ),
          labelLarge: theme.textTheme.labelLarge?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        )
        .apply(
          fontFamily: fontfamily,
        );

    return theme.copyWith(
      // toggleableActiveColor: AppColors.blue,
      // primaryColor: AppColors.blue,

      hintColor: AppColors.appWhite50,

      inputDecorationTheme: theme.inputDecorationTheme.copyWith(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        hintStyle: const TextStyle(
          color: Color(0XFFCCCCCC),
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        errorStyle: const TextStyle(
          fontSize: 12,
          color: AppColors.error,
          fontWeight: FontWeight.w400,
          fontFamily: fontfamily,
        ),
        disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.buttonBlack50),
            borderRadius: BorderRadius.circular(5)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0XFFCCCCCC)),
            borderRadius: BorderRadius.circular(5)),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.buttonBlack50,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.error,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.buttonBlack),
            borderRadius: BorderRadius.circular(5)),
      ),
      // primaryColorLight: AppColors.lightGray,
      // accentColor: AppColors.red,
      // bottomAppBarColor: AppColors.lightGray,
      // backgroundColor: AppColors.background,
      // dialogBackgroundColor: AppColors.backgroundLight,
      // errorColor: AppColors.red,
      dividerColor: Colors.transparent,
      primaryIconTheme: iconTheme,
      iconTheme: iconTheme,
      // highlightColor: AppColors.purple.withOpacity(0.5),
      // splashColor: AppColors.purple.withOpacity(0.5),

      switchTheme: theme.switchTheme.copyWith(
        trackColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.appWhite;
          }
          return AppColors.buttonBlack;
        }),
        thumbColor: MaterialStateProperty.all(
          AppColors.appWhite,
        ),
      ),

      tabBarTheme: theme.tabBarTheme.copyWith(
        // labelColor: AppColors.mediumBlue,
        // unselectedLabelColor: AppColors.iconColor,
        labelStyle: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700, fontSize: 12),
        unselectedLabelStyle: textTheme.titleSmall!.copyWith(fontSize: 12),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            // backgroundColor: AppColors.blue,
            // foregroundColor: MaterialStateProperty.all(AppColors.blue),
            // overlayColor: MaterialStateProperty.all(AppColors.blue),
            ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.buttonBlack,
          textStyle: textTheme.bodySmall!.copyWith(
            decoration: TextDecoration.none,
          ),
        ),
      ),

      appBarTheme: theme.appBarTheme.copyWith(
        color: AppColors.appWhite,

        iconTheme: iconTheme,
        actionsIconTheme: iconTheme,
        titleTextStyle: const TextStyle(
          fontFamily: fontfamily,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          // color: AppColors.mediumBlue,
        ),
        // textTheme: theme.textTheme.copyWith(
        //   caption: TextStyle(
        //     color: AppColors.black,
        //     fontSize: 18,
        //     fontWeight: FontWeight.w400,
        //   ),
        // ),
      ),
      primaryTextTheme: theme.primaryTextTheme.apply(
        fontFamily: fontfamily,
      ),

      textTheme: textTheme,
      buttonTheme: theme.buttonTheme.copyWith(
        minWidth: 50,
        // buttonColor: AppColors.red,
      ),
      colorScheme: theme.colorScheme
          .copyWith(
            primary: AppColors.appWhite,
            // onPrimary: AppColors.mediumBlue,
            // secondary: AppColors.blue,
            // primaryVariant: AppColors.lightBlue,
            // surface: AppColors.darkGrey,
            // onSurface: AppColors.mediumGrey,
          )
          .copyWith(background: AppColors.appWhite)
          .copyWith(error: AppColors.error),
    );
  }
}

class UISize {
  static const halfStandard = standard / 2;
  static const standard = 10.0;
  static const standardDoubled = standard * 2;
  static const standardTripled = standard * 3;
  static const standardQuadrupled = standard * 4;
  static const standardQuintupled = standard * 5;

  static const standardPlus2 = standard + 2;
  static const quarterStandard = standard / 4;
  static const tinyStandard = 1.0;

  // VERTICAL
  //-----------------------------------------------------------
  static const SizedBox xsmVertical = SizedBox(height: halfStandard);
  static const SizedBox smVertical = SizedBox(height: standard);
  static const SizedBox mdVertical = SizedBox(height: standardDoubled);
  static const SizedBox lgVertical = SizedBox(height: standardTripled);
  static const SizedBox xlVertical = SizedBox(height: standardQuadrupled);
  static const SizedBox xxlVertical = SizedBox(height: standardQuintupled);
  // HORIZONTAL
  //-----------------------------------------------------------
  static const SizedBox xsmHorizontal = SizedBox(width: halfStandard);
  static const SizedBox smHorizontal = SizedBox(width: standard);
  static const SizedBox mdHorizontal = SizedBox(width: standardDoubled);
  static const SizedBox lgHorizontal = SizedBox(width: standardTripled);
  static const SizedBox xlHorizontal = SizedBox(width: standardQuadrupled);
  static const SizedBox xxlHorizontal = SizedBox(width: standardQuintupled);
}
