import 'package:flutter/material.dart';
class ProgramsScreen extends StatefulWidget{ @override _ProgramsScreenState createState()=>_ProgramsScreenState();}
class _ProgramsScreenState extends State<ProgramsScreen>{
  String selected='ACL';
  Map<String,List<Map>> templates={
    'ACL':[{'phase':'المرحلة 1: 0-2 أسبوع','ex':'تبريد + TENS + كاحل'},{'phase':'المرحلة 2: 2-6 أسبوع','ex':'مدى حركي 3x10 + دراجة'},{'phase':'المرحلة 3: 6-12 أسبوع','ex':'تقوية رباعية 3x12 + توازن'}],
    'انزلاق':[{'phase':'حاد','ex':'راحة + TENS + McKenzie'},{'phase':'تحت حاد','ex':'تقوية Core + تمديد'}],
  };
  List<String> files=['Xray_knee.jpg','MRI_report.pdf','before.jpg'];
  double vas=6;
  TextEditingController progCtrl=TextEditingController(text:'برنامج مخصص حسب حالة محمد أحمد: تركيز على استعادة ثني 120 درجة وتقوية عضلة vastus medialis مع تجنب القفز حتى الأسبوع 12.');
  @override Widget build(BuildContext c){
    return Scaffold(appBar:AppBar(title:Text('البرامج العلاجية والتوثيق'),backgroundColor:Color(0xFF0B1220)),body:ListView(padding:EdgeInsets.all(16),children:[
      Container(padding:EdgeInsets.all(8),decoration:BoxDecoration(color:Color(0xFF1E293B),borderRadius:BorderRadius.circular(12)),child:DropdownButton<String>(value:selected,isExpanded:true,items:['ACL','انزلاق','خشونة','كتف'].map((e)=>DropdownMenuItem(value:e,child:Text(e))).toList(),onChanged:(v)=>setState(()=>selected=v!))),
      SizedBox(height:12),
      Text('التشخيص',style:TextStyle(fontWeight:FontWeight.bold)),
      SizedBox(height:8),
      TextField(decoration:InputDecoration(labelText:'الشكوى الرئيسية',filled:true,fillColor:Color(0xFF1E293B),border:OutlineInputBorder(borderRadius:BorderRadius.circular(12))),maxLines:2),
      SizedBox(height:8),
      Container(padding:EdgeInsets.all(12),decoration:BoxDecoration(color:Color(0xFF1E293B),borderRadius:BorderRadius.circular(12)),child:Column(children:[Text('VAS ألم: ${vas.toInt()}'),Slider(value:vas,min:0,max:10,divisions:10,activeColor:Color(0xFF5FB49C),onChanged:(v)=>setState(()=>vas=v))])),
      SizedBox(height:12),
      Text('البرنامج العلاجي - $selected',style:TextStyle(fontWeight:FontWeight.bold)),
     ...?templates[selected]?.map((p)=>Container(margin:EdgeInsets.only(top:8),padding:EdgeInsets.all(12),decoration:BoxDecoration(color:Color(0xFF1E293B),borderRadius:BorderRadius.circular(12)),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(p['phase'] as String,style:TextStyle(color:Color(0xFF5FB49C),fontWeight:FontWeight.bold,fontSize:12)),Text(p['ex'] as String)]))),
      SizedBox(height:12),
      TextField(controller:progCtrl,decoration:InputDecoration(labelText:'اكتب البرنامج المخصص حسب الحالة',filled:true,fillColor:Color(0xFF1E293B),border:OutlineInputBorder(borderRadius:BorderRadius.circular(12))),maxLines:4),
      SizedBox(height:12),
      Text('إرفاق الصور والملفات',style:TextStyle(fontWeight:FontWeight.bold)),
      SizedBox(height:8),
      Wrap(spacing:8,children:files.map((f)=>Chip(label:Text(f,style:TextStyle(fontSize:11)),avatar:Icon(f.endsWith('.pdf')?Icons.picture_as_pdf:Icons.image,size:16),backgroundColor:Color(0xFF1E293B))).toList()),
      SizedBox(height:8),
      OutlinedButton.icon(onPressed:(){setState(()=>files.add('new_file_${files.length+1}.jpg'));},icon:Icon(Icons.attach_file),label:Text('إضافة ملف/صورة')),
      SizedBox(height:16),
      ElevatedButton.icon(onPressed:(){ScaffoldMessenger.of(c).showSnackBar(SnackBar(content:Text('تم الحفظ في ملف التوثيق ✅'),backgroundColor:Color(0xFF5FB49C)));},icon:Icon(Icons.save),label:Text('حفظ في ملف التوثيق'),style:ElevatedButton.styleFrom(backgroundColor:Color(0xFF5FB49C),minimumSize:Size(double.infinity,52))),
      SizedBox(height:8),
      Text('سيحفظ في: documentation/PT-2026-184.json + ملف PDF',style:TextStyle(fontSize:10,color:Colors.white38),textAlign:TextAlign.center),
    ]));
  }
}
