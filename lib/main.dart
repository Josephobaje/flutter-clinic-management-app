
import 'package:flutter/material.dart';
import 'logic.dart';
void main()=>runApp(const MyApp());
class MyApp extends StatelessWidget{const MyApp({super.key});@override Widget build(BuildContext c)=>MaterialApp(debugShowCheckedModeBanner:false,title:'MediCare NG',theme:ThemeData(colorScheme:ColorScheme.fromSeed(seedColor:Color(0xFF00838F)),useMaterial3:true),home:const Home());}
String naira(num v)=>'₦${v.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\B)(?=(\d{3})+(?!\d))'),(m)=>',')}';

class Home extends StatefulWidget{const Home({super.key});@override State<Home> createState()=>_S();}
class _S extends State<Home>{int tab=0;
 @override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('MediCare NG')),body:[_dash(),_queue(),_pharmacy()][tab],bottomNavigationBar:NavigationBar(selectedIndex:tab,onDestinationSelected:(i)=>setState(()=>tab=i),destinations:const[NavigationDestination(icon:Icon(Icons.dashboard),label:'Dashboard'),NavigationDestination(icon:Icon(Icons.queue),label:'Queue'),NavigationDestination(icon:Icon(Icons.medication),label:'Pharmacy')]));
 Widget _dash()=>ListView(padding:const EdgeInsets.all(16),children:[Text('Patients today: ${patients.length}',style:const TextStyle(fontSize:20,fontWeight:FontWeight.bold)),Text('Waiting: ${queue.where((a)=>a.status=='Waiting').length}'),Text('Sample bill: ${naira(bill(drugs:3500,lab:2000))}')]);
 Widget _queue()=>ListView(children:queue.map((a)=>ListTile(title:Text(a.patient.name),subtitle:Text('${a.patient.ailment} · ${a.status}'),trailing:ElevatedButton(onPressed:()=>setState(()=>a.status=nextStatus(a.status)),child:Text(nextStatus(a.status))))).toList());
 Widget _pharmacy()=>ListView(children:meds.map((m)=>ListTile(title:Text(m.name),subtitle:Text('${m.stock} in stock · ${naira(m.price)}'),trailing:m.low?const Chip(label:Text('Low')):const Chip(label:Text('OK')))).toList());
}
