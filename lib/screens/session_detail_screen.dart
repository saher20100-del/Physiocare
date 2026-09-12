import 'package:flutter/material.dart';
class SessionDetailScreen extends StatefulWidget{final String patientName; SessionDetailScreen({this.patientName='محمد أحمد'}); @override _SessionDetailScreenState createState()=>_SessionDetailScreenState();}
class _SessionDetailScreenState extends State<SessionDetailScreen>{
  double b=6,a=3; List<Map> exs=[{'name':'مدى حركي','done':false},{'name':'TENS 15د','done':false},{'name':'تقوية 3x12','done':false}];
  @override Widget build(BuildContext c){return Scaffold(appBar:AppBar(title:Text('جلسة - ${widget.patientName}'),backgroundColor:Color(0xFF0B1220)),body:ListView(padding:EdgeInsets.all(16),children:[
    Row(children:[Expanded(child:Container(padding:EdgeInsets.all(12),decoration:BoxDecoration(color:Color(0xFF1E293B),borderRadius:BorderRadius.circular(12)),child:Column(children:[Text('قبل'),Text(b.toInt().toString(),style:TextStyle(fontSize:26,fontWeight:FontWeight.bold)),Slider(value:b,min:0,max:10,divisions:10,onChanged:(v)=>setState(()=>b=v))]))),SizedBox(width:10),Expanded(child:Container(padding:EdgeInsets.all(12),decoration:BoxDecoration(color:Color(0xFF1E293B),borderRadius:BorderRadius.circular(12)),child:Column(children:[Text('بعد'),Text(a.toInt().toString(),style:TextStyle(fontSize:26,fontWeight:FontWeight.bold,color:Color(0xFF5FB49C))),Slider(value:a,min:0,max:10,divisions:10,onChanged:(v)=>setState(()=>a=v))])))]),
    SizedBox(height:12),
    Text('تمارين اليوم'),...exs.asMap().entries.map((e)=>CheckboxListTile(value:e.value['done'],onChanged:(v)=>setState(()=>exs[e.key]['done']=v!),title:Text(e.value['name']),activeColor:Color(0xFF5FB49C),tileColor:Color(0xFF1E293B))),
    SizedBox(height:16),
    ElevatedButton(onPressed:(){showDialog(context:c,builder:(_)=>AlertDialog(backgroundColor:Color(0xFF1E293B),title:Text('تم الحفظ ✅'),content:Text('تحسن ${(b-a).toInt()} - تمت المزامنة مع ملف التوثيق'),actions:[TextButton(onPressed:(){Navigator.pop(context);Navigator.pop(context);},child:Text('ممتاز'))]));},child:Text('إنهاء وحفظ في التوثيق'),style:ElevatedButton.styleFrom(backgroundColor:Color(0xFF5FB49C),minimumSize:Size(double.infinity,50))),
  ]));}
}
