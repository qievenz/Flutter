import 'dart:async';

import 'package:app5_qr_scanner/models/scan_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatefulWidget {
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {

  Completer<GoogleMapController> _controller = Completer();
  MapType _mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    final CameraPosition _ubicacion = CameraPosition(
      target: scan.obtenerLatLng(),
      zoom: 17.4746,
    );

    Set<Marker> scanMarkers = Set<Marker>();
    scanMarkers.add(Marker(
      markerId: MarkerId('geo-location'), 
      position: scan.obtenerLatLng()
      )
    );


    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        actions: [
          IconButton(
            icon: Icon(Icons.location_on), 
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                CameraUpdate.newCameraPosition(_ubicacion)
              );
            },
          ),
        ],
      ),
      body: GoogleMap(
        markers: scanMarkers,
        mapType: _mapType,
        initialCameraPosition: _ubicacion,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        zoomControlsEnabled: false,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.layers),
        onPressed: () { 
          if (_mapType == MapType.normal){
            _mapType = MapType.satellite;
          } else {
            _mapType = MapType.normal;
          }
          setState(() {});
         },
      ),
    );
  }
}