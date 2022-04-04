import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong2/latlong.dart" as latlng;
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
            return FlutterMap(
              options: MapOptions(
                center: latlng.LatLng(location.data!.latitude!, location.data!.longitude!),
                zoom: 15,
                screenSize: const Size(100, 100)
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                )
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
