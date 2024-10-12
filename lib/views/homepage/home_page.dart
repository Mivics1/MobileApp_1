import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController? _mapController;
  LatLng _initialPosition = LatLng(37.4219999, -122.0840575); // Default position
  String _currentAddress = '';
  String _welcomeMessage = 'Welcome! Where would you like to go?';
  TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    Position position = await _determinePosition();
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
      _getAddressFromLatLng(_initialPosition);
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> _getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.locality}, ${place.country}';
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _getLatLngFromAddress() async {
    String address = _addressController.text;
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        setState(() {
          _initialPosition = LatLng(locations[0].latitude, locations[0].longitude);
          _mapController?.animateCamera(CameraUpdate.newLatLng(_initialPosition));
        });
        _getAddressFromLatLng(_initialPosition);
      } else {
        _showSnackBar('Address not found!');
      }
    } catch (e) {
      _showSnackBar('Error retrieving location: $e');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _welcomeMessage,
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _addressController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Address',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _getLatLngFromAddress,
                ),
              ),
            ),
          ),
          Expanded(
            child: GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: _initialPosition, zoom: 15),
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              markers: {
                Marker(
                  markerId: MarkerId('currentLocation'),
                  position: _initialPosition,
                  infoWindow: InfoWindow(title: 'You are here'),
                ),
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Current Address: $_currentAddress'),
          ),
        ],
      ),
    );
  }
}
