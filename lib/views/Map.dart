import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong2/latlong.dart" as latlng;
import 'package:location/location.dart';

class Map extends StatefulWidget { // 1
  const Map({Key? key}) : super(key: key); // 3

  @override // 1
  _MapState createState() => _MapState(); // 2
}

class _MapState extends State<Map> { // 1
  late Future<LocationData> locationData; // 0

  Future<LocationData> getLocation() async { // 1
    var location = Location(); // 2
    bool enabled = await location.serviceEnabled(); // 2
    if (!enabled) { // 2
      enabled = await location.requestService(); // 2
    }
    PermissionStatus permission = await location.hasPermission(); // 2
    if (permission == PermissionStatus.denied) { // 3
      permission = await location.requestPermission(); // 2
    }

    return location.getLocation(); // 2
  }

  @override // 1
  void initState() { // 1
    locationData = getLocation(); // 2
    super.initState(); // 1
  }

  @override // 1
  Widget build(BuildContext context) { // 1
    return Scaffold( // 2
      appBar: AppBar( // 2
        title: const Text("Umgebung"), // 2
        backgroundColor: Colors.white, // 2
        foregroundColor: Colors.black, // 2
      ),
      body: FutureBuilder<LocationData>( // 2
        future: locationData, // 1
        builder: (context, location) { // 1
          if (location.hasData) { // 2
            var newLat = location.data!.latitude! + 0.002; // 4
            var newLong = location.data!.longitude! - 0.003; // 4
            return FlutterMap( // 2
              options: MapOptions( // 2
                center: latlng.LatLng(location.data!.latitude!, location.data!.longitude!), // 6
                zoom: 15, // 1
                screenSize: const Size(100, 100) // 2
              ),
              layers: [ // 1
                TileLayerOptions( // 1
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", // 1
                  subdomains: ['a', 'b', 'c'], // 1
                ),
                MarkerLayerOptions( // 1
                  markers: [ // 1
                    Marker( // 1
                      point: latlng.LatLng(newLat, newLong), // 2
                      builder: (context) { // 1
                        return const Icon(Icons.pin_drop); // 3
                      }
                    ),
                    Marker( // 1
                        point: latlng.LatLng(location.data!.latitude!, location.data!.longitude!), // 6
                        builder: (context) { // 1
                          return const Icon(Icons.person); // 3
                        }
                    )
                  ]
                ),
              ],
            );
          } else if (location.hasError) { // 2
            return Text(location.error.toString()); // 4
          } else { // 1
            return const CircularProgressIndicator(); // 2
          }
        }
      )
    );
  }
}

// 103
