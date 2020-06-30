// Core packages.
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Extension packages.
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:google_fonts/google_fonts.dart';

// Couvee packages.
import 'package:couvee/company_colors.dart';
import 'package:couvee/screen_selector.dart';

void main() async {
  if (!kIsWeb) {
    WidgetsFlutterBinding.ensureInitialized();

    var dir = await getApplicationDocumentsDirectory();

    Hive.init(dir.path);
  }

  runApp(CouveeApp());
  Hive.close();
}

class CouveeApp extends StatelessWidget {
  void setupLanguage() {
    initializeDateFormatting('id', null);
    initializeDateFormatting('id_ID', null);

    Intl.defaultLocale = 'id_ID';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Couvee',
      theme: ThemeData(
        primarySwatch: CompanyColors.brown,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: CompanyColors.brown,
          height: 55.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: CompanyColors.lightInputColor,
          filled: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: 17,
            horizontal: 15,
          ),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
        ),
      ),
      home: ScreenSelector(),
    );
  }
}
