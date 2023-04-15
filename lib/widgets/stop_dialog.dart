import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:on_in_bus/data/constants.dart';
import 'package:on_in_bus/data/stop.dart';
import 'package:on_in_bus/data/stop_arguments.dart';
import 'package:on_in_bus/utils/geopoint_latlng.dart';

class StopDialog extends StatefulWidget {
  const StopDialog({Key? key}) : super(key: key);

  @override
  State<StopDialog> createState() => _StopDialogState();
}

class _StopDialogState extends State<StopDialog>
    with AfterLayoutMixin<StopDialog> {
  final nameController = TextEditingController();
  LatLng? location;

  final mapCompleter = Completer<GoogleMapController>();

  bool? isNew;
  String? id;

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as StopArguments?;
    setState(() {
      isNew = args == null;
    });

    if (args != null) {
      id = args.id;
      nameController.text = args.stop?.name ?? '';
      location = args.stop?.location?.latlng;
    }
  }

  void save(BuildContext context) async {
    if (!Form.of(context).validate()) return;

    await stopsRef.doc(id).set(
          Stop(
            name: nameController.text,
            location: location?.geoPoint,
          ),
        );

    if (!mounted) return;
    Navigator.pop(context);
  }

  void delete() async {
    final confirm = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar exclusão'),
        content: const Text('Deseja realmente excluir esta parada?'),
        actions: [
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () => Navigator.pop(context, false),
          ),
          TextButton(
            child: const Text('Excluir'),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    );

    if (confirm) {
      await stopsRef.doc(id).delete();
      if (!mounted) return;
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    mapCompleter.future.then((controller) => controller.dispose());
    nameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: FutureBuilder<BitmapDescriptor>(
        future: BitmapDescriptor.fromAssetImage(
          ImageConfiguration.empty,
          'assets/images/signpost.png',
        ),
        builder: (context, stopMarker) => Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 64, 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        splashRadius: 24,
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            hintText: 'Nome da parada',
                            helperText: '',
                          ),
                          validator: (value) => value?.isNotEmpty == true
                              ? null
                              : 'Nome da parada é obrigatório',
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Column(
                      children: [
                        Expanded(
                          child: isNew == null
                              ? const SizedBox.shrink()
                              : GoogleMap(
                                  initialCameraPosition: CameraPosition(
                                      target: location ?? inatelPosition,
                                      zoom: 15),
                                  onMapCreated: (controller) =>
                                      mapCompleter.complete(controller),
                                  myLocationEnabled: true,
                                  myLocationButtonEnabled: true,
                                  markers: {
                                    if (location != null && stopMarker.hasData)
                                      Marker(
                                        markerId: MarkerId('location-$id'),
                                        position: location!,
                                        icon: stopMarker.data!,
                                        draggable: true,
                                        onDrag: (value) =>
                                            setState(() => location = value),
                                        anchor: const Offset(0.5, 1.0),
                                        consumeTapEvents: true,
                                      ),
                                  },
                                  onTap: (pos) => setState(() {
                                    location = pos;
                                  }),
                                ),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (isNew == false) ...[
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                ),
                                onPressed: delete,
                                child: const Text('Excluir'),
                              ),
                              const SizedBox(width: 32),
                            ],
                            ElevatedButton(
                              onPressed: () => save(context),
                              child: const Text('Salvar'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
