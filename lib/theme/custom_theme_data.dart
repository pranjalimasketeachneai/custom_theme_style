import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    double checkboxSize =
        selectSize(isTablet, checkboxLargeSize, checkboxMediumSize);
    double radioSize = selectSize(isTablet, radioLargeSize, radioMediumSize);

    return ThemeData(
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: getPrimaryColor(data)),
        titleTextStyle: _appBarTextStyle(Colors.orangeAccent),
      ),
      textTheme: _textTheme(isDark: false, isTablet: isTablet),
      iconTheme: IconThemeData(color: getPrimaryColor(data)),
      buttonTheme: ButtonThemeData(
        buttonColor: getPrimaryColor(data),
        textTheme: ButtonTextTheme.primary,
        minWidth: buttonSize,
      ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return getPrimaryColor(data);
            }
            return Colors.grey;
          }),
          checkColor: MaterialStateProperty.all(Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(checkboxSize / 2),
          ),
        ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.orangeAccent;
          }
          return Colors.grey;
        }),
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
          style: _elevatedButtonStyle(buttonSize, data, Brightness.light)),
    ).copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(style: _elevatedButtonStyle(buttonSize, data, Brightness.light)),
      checkboxTheme: _checkboxTheme(checkboxSize,data),
      radioTheme: _radioTheme(radioSize,data),
    );
  }

  static ThemeData darkThemeData({dynamic data, required bool isTablet}) {
    double buttonSize = selectSize(isTablet, buttonLargeSize, buttonMediumSize);
    double checkboxSize =
        selectSize(isTablet, checkboxLargeSize, checkboxMediumSize);
    double radioSize = selectSize(isTablet, radioLargeSize, radioMediumSize);

    return ThemeData(
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.orangeAccent),
        titleTextStyle: _appBarTextStyle(Colors.orangeAccent),
      ),
      textTheme: _textTheme(isDark: true, isTablet: isTablet),
      iconTheme: const IconThemeData(color: Colors.orangeAccent),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.orangeAccent,
        textTheme: ButtonTextTheme.primary,
        minWidth: buttonMediumSize,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.orangeAccent;
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
            return Colors.orangeAccent;
          }
          return Colors.grey;
        }),
      ),
      colorScheme: _colorScheme(data, Brightness.dark),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: Colors.grey,
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.black,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: _elevatedButtonStyle(buttonSize, data, Brightness.dark)),
    ).copyWith(
     elevatedButtonTheme: ElevatedButtonThemeData(style:  _elevatedButtonStyle(buttonSize, data, Brightness.light)),
      checkboxTheme: _checkboxTheme(checkboxSize,data),
      radioTheme: _radioTheme(radioSize,data),
    );
  }

  static TextStyle _appBarTextStyle(Color color) {
    return GoogleFonts.robotoSlab(
      color: color,
      fontSize: 24.0,
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
    return ColorScheme(
      primary: getPrimaryColor(data),
      brightness: brightness,
      onPrimary: Colors.orangeAccent,
      primaryContainer: Colors.orangeAccent,
      onSecondary: getSecondaryColor(data),
      secondary: getSecondaryColor(data),
      error: Colors.red,
      secondaryContainer: Colors.black,
      onError: Colors.red,
      background: brightness == Brightness.dark ? Colors.black : Colors.white,
      onBackground: brightness == Brightness.dark ? Colors.white : Colors.black,
      onSurface: Colors.white,
      surface: Colors.white,
    ).copyWith(
        background:
            brightness == Brightness.dark ? Colors.black : Colors.white);
  }


  static ButtonStyle _elevatedButtonStyle(
      double size, dynamic data, Brightness brightness) {
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
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(size / 2),
      // ),
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
    );
  }

  static Color getPrimaryColor(dynamic data) {
    if (data == null) return Colors.orangeAccent;
    List<dynamic>? list = List.from(data)
        .where((element) => element['fore_color'] is String)
        .toList();

    if (list.isNotEmpty) {
      String? foreColor = list.first['fore_color'];
      return HexColor.fromHex(foreColor ?? "#FFE79223");
    } else {
      return Colors.orangeAccent;
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
