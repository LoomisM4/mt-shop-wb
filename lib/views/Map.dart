import 'package:flutter/material.dart';
import 'package:location/location.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  late Future<LocationData> locationData;

  Future<LocationData> getLocation() async {
    var location = Location();
    bool enabled = await location.serviceEnabled();
    if (!enabled) {
      enabled = await location.requestService();
      if (!enabled) {
        // TODO
      }
    }
    PermissionStatus permission = await location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await location.requestPermission();
      if (permission == PermissionStatus.denied) {
        // TODO
      }
    }

    return location.getLocation();
  }

  @override
  void initState() {
    locationData = getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Umgebung"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: FutureBuilder<LocationData>(
        future: locationData,
        builder: (context, location) {
          if (location.hasData) {
            return Column(
              children: [
                Text("long " + location.data!.longitude.toString()),
                Text("lat " + location.data!.latitude.toString()),
              ],
            );
          } else if (location.hasError) {
            return Text(location.error.toString());
          } else {
            return const CircularProgressIndicator();
          }
        }
      )
    );
  }
}
