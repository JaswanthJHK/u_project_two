import 'package:flutter/material.dart';
import 'package:udemy_expense_tracker/presentation/pages/expenses_page_section/screens/expenses.dart';
import 'package:flutter/services.dart';

var kColor = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 130, 130, 130),
);
var kBgColor = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);
void main() {

// this is how setting up the app only show in protrait mode not landscape 

  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {
    runApp(const MyApp());
  
//------------------------------------------------------------------------ to set a certain screen orientation add the import 'package:flutter/services.dart';
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        // dark() no longer takes any arguments
        //  brightness: Brightness.dark,
        colorScheme: kBgColor,
        cardTheme: const CardTheme().copyWith(
          color: kBgColor.onSecondary,
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColor.inverseSurface,
              foregroundColor: kColor.inversePrimary),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: kColor.inversePrimary),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
          colorScheme: kColor,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColor.onPrimaryContainer,
            foregroundColor: kColor.onPrimary,
          ),
          scaffoldBackgroundColor: Colors.grey[200],
          cardTheme: CardTheme(
            color: kColor.onError,
            margin: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 12,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kColor.outlineVariant),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: kColor.onSecondary),
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: kColor.onErrorContainer))),
      home: const Expenses(),
    );
  }
}
