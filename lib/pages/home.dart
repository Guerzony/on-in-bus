import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:on_in_bus/data/bus.dart';
import 'package:on_in_bus/data/bus_arguments.dart';
import 'package:on_in_bus/utils/currency.dart';
import 'package:on_in_bus/utils/geopoint_latlng.dart';
import 'package:on_in_bus/utils/location_latlng.dart';
import 'package:on_in_bus/widgets/bus_list.dart';
import 'package:on_in_bus/widgets/info_dialog.dart';
import 'package:on_in_bus/widgets/user_dialog.dart';

final _auth = FirebaseAuth.instance;
final _location = Location.instance;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin<HomePage> {
  final initialPosition = const CameraPosition(
    target: LatLng(-22.256018906737587, -45.697147763394405),
    zoom: 16,
  );

  final Completer<GoogleMapController> _controller = Completer();
  late StreamSubscription authSubscription;

  String? selectedId;

  final busStream = busesRef.snapshots();

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    final pos = (await _location.getLocation()).latlng;
    if (pos != null) {
      (await _controller.future).animateCamera(
        CameraUpdate.newLatLngZoom(pos, 15),
      );
    }
  }

  void selectBus(MapEntry<String, Bus> entry) async {
    setState(() => selectedId = entry.key);
    if (entry.value.location != null) {
      (await _controller.future).animateCamera(
        CameraUpdate.newLatLngZoom(entry.value.location!.latlng, 15),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    authSubscription = _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.popUntil(context, ModalRoute.withName('/'));
      }
    });
  }

  @override
  void dispose() {
    authSubscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final media = MediaQuery.of(context);

    return WillPopScope(
      onWillPop: () async => false,
      child: StreamBuilder<BusQuerySnapshot>(
        stream: busStream,
        builder: (context, snapshot) {
          final Map<String, Bus> buses = {
            for (final bus in (snapshot.data?.docs ?? [])) bus.id: bus.data,
          };

          final selectedBus = buses[selectedId];

          if (selectedId != null && selectedBus == null && snapshot.hasData) {
            selectedId = null;
          }

          return FutureBuilder<BitmapDescriptor>(
            future: BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'assets/images/bus.png'),
            builder: (context, busMarker) => Scaffold(
              appBar: AppBar(
                title: Text(selectedBus == null ? 'B - USER' : selectedBus.name),
                backgroundColor: selectedBus != null ? Colors.black : null,
                foregroundColor: selectedBus != null ? Colors.white : null,
                automaticallyImplyLeading: false,
                flexibleSpace: PreferredSize(
                  preferredSize: const Size(0, kToolbarHeight),
                  child: SafeArea(
                    child: SizedBox(
                      height: kToolbarHeight,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: snapshot.hasData ? const SizedBox.shrink() : const LinearProgressIndicator(),
                      ),
                    ),
                  ),
                ),
                leading: selectedBus != null
                    ? IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => setState(() => selectedId = null),
                      )
                    : null,
                actions: [
                  if (selectedId != null)
                    IconButton(
                      icon: const Icon(Icons.info_outline),
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) => InfoDialog(id: selectedId!),
                      ),
                    ),
                  IconButton(
                    icon: const Icon(Icons.person),
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => const UserDialog(),
                    ),
                  ),
                ],
              ),
              body: GoogleMap(
                initialCameraPosition: initialPosition,
                onMapCreated: (controller) => _controller.complete(controller),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                polylines: {
                  for (final bus in buses.entries)
                    if (selectedId == null || selectedId == bus.key)
                      Polyline(
                        polylineId: PolylineId('line-${bus.key}'),
                        width: 4,
                        color: bus.value.colorValue,
                        points: [
                          ...bus.value.points.map((point) => point.latlng),
                          if (bus.value.points.length > 2) bus.value.points.first.latlng,
                        ],
                      ),
                },
                markers: {
                  for (final bus in buses.entries)
                    if ((selectedId == null || selectedId == bus.key) && bus.value.location != null)
                      Marker(
                        markerId: MarkerId('location-${bus.key}'),
                        position: bus.value.location!.latlng,
                        icon: busMarker.data!,
                        anchor: const Offset(0.5, 0.5),
                        onTap: () => selectBus(bus),
                        consumeTapEvents: true,
                      ),
                },
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
              floatingActionButton: !snapshot.hasData
                  ? null
                  : Builder(
                      builder: (context) => FloatingActionButton(
                        child: const Icon(Icons.directions_bus),
                        onPressed: () => showModalBottomSheet(
                          context: context,
                          builder: (context) => SizedBox(
                            height: media.size.height * 0.5,
                            child: BusList(
                              onSelect: selectBus,
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
