import 'package:flutter/material.dart';
import 'world_time.dart';

class ChooseLoc extends StatefulWidget {
  const ChooseLoc({super.key});

  @override
  State<ChooseLoc> createState() => _ChooseLocState();
}

class _ChooseLocState extends State<ChooseLoc> {
  int counter=0;
   List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  void UpdateTime(index) async{
    WorldTime instance=locations[index];
    await instance.getTime();
    Navigator.pop(context,{
     'location': instance.location,
    'flag':instance.flag,
    'time':instance.time,
    'Daytime':instance.isDaytime
    });
  }
  @override
  Widget build(BuildContext context) {
    print("build state function ran");
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
      title:Text("Change Location") ,
      centerTitle: true,
      backgroundColor:Colors.blue[600] ,
      elevation: 0.0,
      ),
      body:ListView.builder(
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(),
            child: Card(
              child: ListTile(
                onTap: (){
          UpdateTime(index);
                },
                title: Text(
                  locations[index].location
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/${locations[index].flag}"),),),
            ),
          );
        }
        ,itemCount: locations.length,),
    
    );
  }
}
//RaisedButton with ElevatedButton, FlatButton with TextButton and OutlineButton with OutlinedButton.