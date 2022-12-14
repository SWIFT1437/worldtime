import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgcolor = data['isDaytime']  ? Colors.blue : Colors.black;
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(
                      context,
                      '/location'
                    );
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location' : result['location'],
                        'flag' : result['flag'],
                        'isDaytime' : result['isDaytime'],
                      };
                    });
                  },
                  icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey,
                  ),
                  label: Text(
                      'Edit Location',
                  style : TextStyle(
                    color: Colors.grey
                  )
                  ),
                ),
                SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      letterSpacing: 2.0
                    ),
                  )
                ],
              ),
                SizedBox(height: 20.0,),
              Text(
                data['time'],
                style: TextStyle(
                  color:Colors.white,
                fontSize: 60.0,
                letterSpacing: 2.0
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
