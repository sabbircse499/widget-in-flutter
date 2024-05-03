import 'package:flutter/material.dart';
import 'count.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=> count1()),
    ChangeNotifierProvider(create: (_)=>sabbir01())
  ],
  child : const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp()
  )
  ) );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 bool v=true;
 bool _switchValue=false ;
 String? _selectedRadio;
 bool _isChecked=false;
 String sabbir='';
 //list
 static const List<String> distric=<String>[
   'thakurgaon',
   'dinajpur',
   'rongpur',
 ];
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("visibility"),
        ),
      
        
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:  MainAxisAlignment.center,
            children: [
               Center(
                 child: ElevatedButton(onPressed: (){
                   setState(() {
                     v=!v;
                   });
                 }
                     , child: const Text("click visibility")),
               ),

              const SizedBox(height: 10,),

              // visibility
              Visibility(
                  visible: v,

                  child:
                  Center(child: Image.asset("image/log1.png")),
              ),


              //Switch
              Switch(
                value: _switchValue,
                onChanged: (bool value) {
                  setState(() {
                    _switchValue = value;
                  });
                },
              ),

              //Radio
              Column(
                children: [
                  Radio<String>(
                    value: 'Option 1',
                    groupValue: _selectedRadio,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedRadio = value!;
                        print(_selectedRadio);
                      });
                    },
                  ),
                  Radio<String>(
                    value: 'Option 2',
                    groupValue: _selectedRadio,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedRadio = value!;
                        print(_selectedRadio);
                      });
                    },
                  ),
                ],
              ),


             // Checkbox
              Checkbox(
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value!;
                        print(_isChecked);
                      });

                    },
                  ),


//Autocomplete
Autocomplete<String>(optionsBuilder: (TextEditingValue textEditingcvalue){

  if(textEditingcvalue == ''){
    return const Iterable<String>.empty();
  }
  return distric.where((String item){
    return item.contains(textEditingcvalue.text.toLowerCase());
  }
  );
},
    onSelected: (String? value) {
    sabbir = value ?? ''; // Set sabbir to the selected value, or empty string if nu


    },
  
  
),

              ElevatedButton(onPressed: (){

                  context.read<sabbir01>().chang(sabbir);

              }, child: const Text(" view text")),



              const SizedBox(height: 50,),
              Text("Clicked from text from field : ${context.watch<sabbir01>().c}"),


              //provider
              ElevatedButton(onPressed:(){ context.read<count1>().incre();}, child: Text('incre')),
              ElevatedButton(onPressed: (){context.read<count1>().decre();}, child: Text("decre")),
              ElevatedButton(onPressed: (){context.read<count1>().reset();}, child: Text("reset")),

              Text('value is ${context.watch<count1>().count}'),
              


            ],
          ),
        ),

      ),
    );
  }
}
