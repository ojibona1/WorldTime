import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String? location;
  String? flag;
  String? time;
  String? url;
  bool? isDayTime;

  WorldTime({this.flag, this.location, this.url});

  Future<void> getTime() async {
    try {
      http.Response response = await http
          .get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);

      String datetime = data['utc_datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //print('$datetime - $offset');
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //print(now);
      isDayTime = (now.hour > 6 && now.hour < 8) ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'Error';
    }
  }
}
