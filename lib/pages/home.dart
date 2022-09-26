import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                Center(
                  child: TextButton.icon(
                      onPressed: () async {
                        dynamic result =
                            await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'location': result['location'],
                            'time': result['time'],
                            'flag': result['flag'],
                            'isDayTime': result['isDayTime']
                          };
                        });
                      },
                      icon: Icon(
                        Icons.edit_location,
                        color: Colors.grey[200],
                      ),
                      label: Text(
                        'Edit Location',
                        style: TextStyle(color: Colors.grey[200]),
                      )),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        letterSpacing: 2.0,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  data['time'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 60.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
