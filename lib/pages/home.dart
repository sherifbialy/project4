import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};
  
  @override
  Widget build(BuildContext context) {
    data=data.isNotEmpty?data:ModalRoute.of(context)!.settings.arguments as Map;
    String bgImage=data["Daytime"]?'day.png':'night.png';
    Color bgColor=data["Daytime"]?Colors.blue:Color.fromARGB(255, 5, 35, 59);
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child:
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover)
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0,120.0,0.0,0.0),
            child: Column(
              children:<Widget> [TextButton.icon(
                onPressed: () async{
                  dynamic result=await Navigator.pushNamed(context, "/location");
                  setState(() {
                    data={
                      'time':result['time'],
                      'location': result['location'],
                     'flag':result['flag'],
                     'Daytime':result['Daytime']
                    };
                  });
                }
                , 
                icon:const Icon(
                  Icons.edit_location,
                  color: Color.fromARGB(255, 159, 152, 152),
                  ), 
                label:const Text("Change Location"
                ,style: TextStyle(color: Color.fromRGBO(151, 144, 144, 1)),)),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget> [
                    Text(
                      data['location']
                      ,style:const TextStyle(
                        fontSize: 28.0,
                        color: Color.fromARGB(255, 206, 199, 199),
                        letterSpacing: 2.0
                      ),)
                  ],)
                  ,SizedBox(height: 20.0,)
                  ,Text(
                    data['time']
                    ,style: const TextStyle(
                  fontSize: 48.0,
                  letterSpacing: 3.0,
                  color: Color.fromRGBO(193, 185, 190, 1)    
                    ),)],
            ),
          ),
        )),);
  }
}