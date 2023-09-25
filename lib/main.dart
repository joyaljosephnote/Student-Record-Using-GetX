import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:student_get_x/constants/colors.dart';
import 'package:student_get_x/constants/style.dart';
import 'package:student_get_x/controllers/database/db_functions.dart';
import 'package:student_get_x/view/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DB sql = DB();
  await sql.initialiseDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Studen DB Using GetX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: kblack,
          foregroundColor: kwhite,
        ),
        appBarTheme: AppBarTheme(
            backgroundColor: kgreenAccent,
            titleTextStyle: text20BlackBold,
            iconTheme: const IconThemeData(color: kblack),
            elevation: 0),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
