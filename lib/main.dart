import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';
void main(){runApp(PhysioCareApp());}
class PhysioCareApp extends StatelessWidget{
  @override Widget build(BuildContext c){
    return MaterialApp(
      title:'PhysioCare V2',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        brightness:Brightness.dark,
        scaffoldBackgroundColor:Color(0xFF0B1220),
        primaryColor:Color(0xFF5FB49C),
        textTheme:GoogleFonts.tajawalTextTheme(ThemeData.dark().textTheme),
        useMaterial3:true,
      ),
      home: HomeScreen(),
    );
  }
}
