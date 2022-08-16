import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url:'Asia/Kolkata' ,location: 'Kolkata' ,flag: 'India.png' ),
    WorldTime(url:'Europe/Moscow' ,location: 'Moscow' ,flag: 'Russia.png' ),
    WorldTime(url:'Asia/Tokyo' ,location: 'Tokyo' ,flag: 'Japan.png' ),
    WorldTime(url:'Europe/London' ,location: 'London' ,flag: 'Uk.png' ),
    WorldTime(url:'Europe/Berlin' ,location: 'Berlin' ,flag: 'Germany.png' ),
    WorldTime(url:'America/New_York' ,location: 'New York' ,flag: 'America.png' ),
    WorldTime(url:'Asia/Seoul' ,location: 'Seoul' ,flag: 'South_Korea.png' ),
    WorldTime(url:'Asia/Karachi',location: 'Karachi' ,flag: 'Pakistan.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDaytime' : instance.isDaytime,
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}

