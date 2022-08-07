import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:on_in_bus/data/bus.dart';
import 'package:on_in_bus/widgets/bus_list.dart';

final firestore = FirebaseFirestore.instance;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final initialPosition = const CameraPosition(
    target: LatLng(-22.256018906737587, -45.697147763394405),
    zoom: 16,
  );

  final Completer<GoogleMapController> _controller = Completer();

  String? selectedId;

  final busStream = busesRef.snapshots();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return StreamBuilder<BusQuerySnapshot>(
      stream: busStream,
      builder: (context, snapshot) {
        final Map<String, Bus> buses = {
          for (final bus in (snapshot.data?.docs ?? [])) bus.id: bus.data,
        };

        final selectedBus = buses[selectedId];

        if (selectedId != null && selectedBus == null && snapshot.hasData) {
          selectedId = null;
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(selectedId != null ? buses[selectedId]!.name : 'ON IN BUS'),
            backgroundColor: selectedId != null ? Colors.black : null,
            foregroundColor: selectedId != null ? Colors.white : null,
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
            leading: selectedId != null
                ? IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => setState(() => selectedId = null),
                  )
                : null,
          ),
          body: GoogleMap(
            initialCameraPosition: initialPosition,
            onMapCreated: (controller) => _controller.complete(controller),
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
                          onSelect: (id) => setState(() => selectedId = id),
                        ),
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
