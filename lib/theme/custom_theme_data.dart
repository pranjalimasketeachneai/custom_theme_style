import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resource/app_colors.dart';

/*
* Name : Pranjali M.
* Date : 05-06-2024
* Purpose : Generate the custom theme for defining AppBar, Text, Radio Button ,CheckBox,Bottom Navigation, Drawer etc . Define Sizes - large ,medium & small
* */

class CustomThemeData {
  // Define size configurations for buttons, checkboxes, and radios
  static const double buttonLargeSize = 60.0;
  static const double buttonMediumSize = 48.0;
  static const double buttonSmallSize = 36.0;

  static const double checkboxLargeSize = 40.0;
  static const double checkboxMediumSize = 30.0;
  static const double checkboxSmallSize = 20.0;

  static const double radioLargeSize = 40.0;
  static const double radioMediumSize = 30.0;
  static const double radioSmallSize = 20.0;

  static ThemeData lightThemeData({dynamic data, required bool isTablet}) {
    double buttonSize = selectSize(isTablet, buttonLargeSize, buttonMediumSize);
    double checkboxSize = selectSize(isTablet, checkboxLargeSize, checkboxMediumSize);
    double radioSize = selectSize(isTablet, radioLargeSize, radioMediumSize);

    return ThemeData(
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: getPrimaryColor(data)),
        titleTextStyle: _appBarTextStyle(AppColors.primary),
      ),
      textTheme: _textTheme(isDark: false, isTablet: isTablet),
      iconTheme: IconThemeData(color: getPrimaryColor(data)),
      buttonTheme: ButtonThemeData(
        buttonColor: getPrimaryColor(data),
        textTheme: ButtonTextTheme.primary,
        minWidth: buttonSize,
        height: buttonSize,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return getPrimaryColor(data);
          }
          return Colors.black;
        }),
        checkColor: MaterialStateProperty.all(Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(checkboxSize / 2),
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return getPrimaryColor(data);
          }
          return Colors.black;
        }),
        splashRadius: radioSize / 2, // Ensure adequate splash radius for accessibility
      ),
      colorScheme: _colorScheme(data, Brightness.light),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: getPrimaryColor(data),
        unselectedItemColor: Colors.grey,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: _elevatedButtonStyle(buttonSize, data, Brightness.light),
      ),
    ).copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(style: _elevatedButtonStyle(buttonSize, data, Brightness.light)),
      checkboxTheme: _checkboxTheme(checkboxSize, data),
      radioTheme: _radioTheme(radioSize, data),
    );
  }

  static ThemeData darkThemeData({dynamic data, required bool isTablet}) {
    double buttonSize = selectSize(isTablet, buttonLargeSize, buttonMediumSize);
    double checkboxSize = selectSize(isTablet, checkboxLargeSize, checkboxMediumSize);
    double radioSize = selectSize(isTablet, radioLargeSize, radioMediumSize);

    return ThemeData(
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: AppColors.primary),
        titleTextStyle: _appBarTextStyle(AppColors.primary),
      ),
      textTheme: _textTheme(isDark: true, isTablet: isTablet),
      iconTheme: const IconThemeData(color: AppColors.primary),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.primary,
        textTheme: ButtonTextTheme.primary,
        minWidth: buttonMediumSize,
        height: buttonMediumSize,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.primary;
          }
          return Colors.grey;
        }),
        checkColor: MaterialStateProperty.all(Colors.black),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(checkboxMediumSize / 2),
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.primary;
          }
          return Colors.grey;
        }),
        splashRadius: radioMediumSize / 2, // Ensure adequate splash radius for accessibility
      ),
      colorScheme: _colorScheme(data, Brightness.dark),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.black,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: _elevatedButtonStyle(buttonSize, data, Brightness.dark),
      ),
    ).copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(style: _elevatedButtonStyle(buttonSize, data, Brightness.dark)),
      checkboxTheme: _checkboxTheme(checkboxSize, data),
      radioTheme: _radioTheme(radioSize, data),
    );
  }

  static TextStyle _appBarTextStyle(Color color) {
    return GoogleFonts.robotoSlab(
      color: color,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    );
  }

  static TextTheme _textTheme({bool isDark = false, bool isTablet = false}) {
    final Color primaryTextColor = isDark ? Colors.white : Colors.black;
    return TextTheme(
      displayLarge: GoogleFonts.robotoSlab(
          fontSize: isTablet ? 40.0 : 32.0, color: primaryTextColor),
      displayMedium: GoogleFonts.robotoSlab(
          fontSize: isTablet ? 30.0 : 24.0, color: primaryTextColor),
      displaySmall: GoogleFonts.robotoSlab(
          fontSize: isTablet ? 24.0 : 20.0, color: primaryTextColor),
      bodyLarge: GoogleFonts.robotoSlab(
          fontSize: isTablet ? 20.0 : 16.0, color: primaryTextColor),
      bodyMedium: GoogleFonts.robotoSlab(
          fontSize: isTablet ? 18.0 : 14.0, color: primaryTextColor),
      bodySmall: GoogleFonts.robotoSlab(
          fontSize: isTablet ? 16.0 : 12.0, color: primaryTextColor),
      labelLarge: GoogleFonts.robotoSlab(
          fontSize: isTablet ? 22.0 : 18.0, color: primaryTextColor),
      labelMedium: GoogleFonts.robotoSlab(
          fontSize: isTablet ? 20.0 : 16.0, color: primaryTextColor),
      labelSmall: GoogleFonts.robotoSlab(
          fontSize: isTablet ? 18.0 : 14.0, color: primaryTextColor),
    );
  }

  static ColorScheme _colorScheme(dynamic data, Brightness brightness) {
    bool isDark = brightness == Brightness.dark;

    return ColorScheme(
      // Primary Colors
      primary: getPrimaryColor(data),
      onPrimary: isDark ? Colors.black : Colors.white,
      primaryContainer: isDark ? Colors.grey[800]! : Colors.grey[300]!,
      onPrimaryContainer: isDark ? Colors.white : Colors.black,

      // Secondary Colors
      secondary: getSecondaryColor(data),
      onSecondary: isDark ? Colors.black : Colors.white,
      secondaryContainer: isDark ? Colors.grey[700]! : Colors.grey[200]!,
      onSecondaryContainer: isDark ? Colors.white : Colors.black,

      // Tertiary Colors
      tertiary: Colors.teal,
      onTertiary: Colors.white,
      tertiaryContainer: isDark ? Colors.teal[700]! : Colors.teal[200]!,
      onTertiaryContainer: isDark ? Colors.white : Colors.black,


      // Error Colors
      error: AppColors.red,
      onError: Colors.white,
      errorContainer: AppColors.red.withOpacity(0.8),
      onErrorContainer: Colors.white,

      // Background and Surface Colors
      background: isDark ? Colors.black : Colors.white,
      onBackground: isDark ? Colors.white : Colors.black,
      surface: isDark ? Colors.grey[900]! : Colors.white,
      onSurface: isDark ? Colors.white : Colors.black,
      surfaceVariant: isDark ? Colors.grey[700]! : Colors.grey[300]!,
      onSurfaceVariant: isDark ? Colors.white : Colors.black,

      // Other Colors
      outline: AppColors.borderColor,
      shadow: Colors.black,
      inverseSurface: isDark ? Colors.white : Colors.black,
      onInverseSurface: isDark ? Colors.black : Colors.white,
      inversePrimary: getPrimaryColor(data).withOpacity(0.8),
      surfaceTint: getPrimaryColor(data),
      // Brightness
      brightness: brightness,
    );
  }

  static ButtonStyle _elevatedButtonStyle(double size, dynamic data, Brightness brightness) {
    return ElevatedButton.styleFrom(
      minimumSize: Size(size, size),
      backgroundColor: getPrimaryColor(data),
      foregroundColor: Colors.white,
      textStyle: GoogleFonts.robotoSlab(
        fontSize: size * 0.4,
        fontWeight: FontWeight.bold,
      ),
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(8.0),
      // ),
    );
  }

  static CheckboxThemeData _checkboxTheme(double size, dynamic data) {
    return CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return getPrimaryColor(data);
        }
        return Colors.grey;
      }),
      checkColor: MaterialStateProperty.all(Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(size / 2),
      ),
    );
  }

  static RadioThemeData _radioTheme(double size, dynamic data) {
    return RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return getPrimaryColor(data);
        }
        return Colors.grey;
      }),
      splashRadius: size / 2, // Ensure adequate splash radius for accessibility
    );
  }

  static Color getPrimaryColor(dynamic data) {
    if (data == null) return AppColors.primary;
    List<dynamic>? list = List.from(data)
        .where((element) => element['fore_color'] is String)
        .toList();

    if (list.isNotEmpty) {
      String? foreColor = list.first['fore_color'];
      return HexColor.fromHex(foreColor ?? "#FFE79223");
    } else {
      return AppColors.primary;
    }
  }

  static Color getSecondaryColor(dynamic data) {
    try {
      if (data == null) return Colors.grey[600]!;
      var filterList = List.from(data)
          .where((element) => element['light_fore_color'] is String)
          .toList();
      if (filterList.isEmpty) return Colors.grey[600]!;
      String? colorString = filterList.first['light_fore_color'];
      return HexColor.fromHex(colorString ?? "#FF443F38");
    } catch (ex) {
      return Colors.grey[600]!;
    }
  }

  static double selectSize(bool isLarge, double largeSize, double mediumSize) {
    return isLarge ? largeSize : mediumSize;
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static Color fromHex(String hexColor) {
    return HexColor(hexColor);
  }
}
