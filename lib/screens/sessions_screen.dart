import 'package:flutter/material.dart';
import 'session_detail_screen.dart';
class SessionsScreen extends StatelessWidget{
  final list=[{'time':'09:00','name':'سارة خالد','type':'تأهيل كتف','status':'مكتمل'},{'time':'09:45','name':'محمد أحمد','type':'تأهيل ACL','status':'في الانتظار'}];
  @override Widget build(BuildContext c){return Scaffold(appBar:AppBar(title:Text('جلساتي اليوم'),backgroundColor:Color(0xFF0B1220)),body:ListView.builder(padding:EdgeInsets.all(16),itemCount:list.length,itemBuilder:(_,i){final s=list[i]; return Container(margin:EdgeInsets.only(bottom:10),decoration:BoxDecoration(color:Color(0xFF1E293B),borderRadius:BorderRadius.circular(14)),child:ListTile(leading:CircleAvatar(backgroundColor:Color(0xFF5FB49C),child:Text(s['time'] as String,style:TextStyle(fontSize:10))),title:Text(s['name'] as String),subtitle:Text(s['type'] as String),trailing:Icon(Icons.chevron_left),onTap:()=>Navigator.push(c,MaterialPageRoute(builder:(_)=>SessionDetailScreen(patientName:s['name'] as String))))); }));}
}
