import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
class ScannerScreen extends StatefulWidget{ @override _ScannerScreenState createState()=>_ScannerScreenState();}
class _ScannerScreenState extends State<ScannerScreen>{
  bool scanned=false; String code='PT-2026-184';
  @override Widget build(BuildContext c){
    return Scaffold(appBar:AppBar(title:Text('ماسح باركود المريض'),backgroundColor:Color(0xFF0B1220)),body:Column(children:[
      Expanded(flex:3,child:Stack(children:[MobileScanner(onDetect:(cap){if(!scanned){setState((){scanned=true; code=cap.barcodes.first.rawValue??'PT-2026-184';}); ScaffoldMessenger.of(c).showSnackBar(SnackBar(content:Text('تم الدخول: $code'),backgroundColor:Color(0xFF5FB49C)));}}),Center(child:Container(width:220,height:220,decoration:BoxDecoration(border:Border.all(color:Color(0xFF5FB49C),width:3),borderRadius:BorderRadius.circular(18))))])),
      Expanded(flex:2,child:Container(width:double.infinity,padding:EdgeInsets.all(20),color:Color(0xFF151E32),child:scanned?Column(children:[Icon(Icons.check_circle,color:Color(0xFF5FB49C),size:40),Text('تم تسجيل: $code',style:TextStyle(fontWeight:FontWeight.bold)),SizedBox(height:12),ElevatedButton(onPressed:()=>setState(()=>scanned=false),child:Text('مسح آخر'),style:ElevatedButton.styleFrom(backgroundColor:Color(0xFF5FB49C),minimumSize:Size(double.infinity,45)))]):Column(children:[Icon(Icons.qr_code_2,size:60,color:Colors.white24),Text('وجه الكاميرا لباركود المريض'),OutlinedButton(onPressed:()=>setState(()=>scanned=true),child:Text('محاكاة مسح'))])))),
    ]));
  }
}
