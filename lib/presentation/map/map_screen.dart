part of '../screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});
  static const name = 'map';
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _selectedLocation = const LatLng(4.5709, -74.2973);
  final MapController _mapController = MapController();

  void _selectLocationMap(LatLng location) {
    setState(() {
      _selectedLocation = location;
    });
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa de Colombia'),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _selectedLocation,
              initialZoom: 6.0,
              onTap: (tapPosition, point) {
                _selectLocationMap(point);
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
              MarkerLayer(
                markers: [
                  markerLocation(size, const LatLng(10.467321250664249, -73.25215547378319)),
                  markerLocation(size, const LatLng(6.250526222003454, -75.58401023232919))
                ],
              )
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                _mapController.move(_selectedLocation, 6.0);
              },
              child: const Icon(Icons.location_searching),
            ),
          ),
        ],
      ),
    );
  }

  Marker markerLocation(Size size, LatLng location) {
    return Marker(
      point: location,
      height: size.height * 0.05,
      width: size.width * 0.05,
      rotate: true,
      child: GestureDetector(
        onTap: () => _mapController.move(location, 15.0),
        child: Icon(
          Icons.location_on_sharp, 
          color: Colors.red,
          size: size.height * 0.05,
        ),
      )
    );
  }
}