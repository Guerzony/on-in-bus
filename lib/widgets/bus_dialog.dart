import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:on_in_bus/data/bus.dart';
import 'package:on_in_bus/data/bus_arguments.dart';
import 'package:on_in_bus/data/constants.dart';
import 'package:on_in_bus/utils/color.dart';
import 'package:on_in_bus/utils/currency.dart';
import 'package:on_in_bus/utils/geopoint_latlng.dart';
import 'package:on_in_bus/utils/location.dart';
import 'package:on_in_bus/widgets/color_dialog.dart';

class BusDialog extends StatefulWidget {
  const BusDialog({Key? key}) : super(key: key);

  @override
  State<BusDialog> createState() => _BusDialogState();
}

class _BusDialogState extends State<BusDialog> with AfterLayoutMixin<BusDialog> {
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final points = <LatLng>[];
  LatLng? location;
  Color color = Colors.cyanAccent.shade700;

  final mapCompleter = Completer<GoogleMapController>();
  int? selectedPoint;

  bool? isNew;
  String? id;

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as BusArguments?;
    setState(() {
      isNew = args == null;
    });

    if (args != null) {
      id = args.id;
      titleController.text = args.bus?.name ?? '';
      priceController.text = currencyFormatter.format(args.bus?.price.toStringAsFixed(2) ?? '0');
      location = args.bus?.location?.latlng;
      color = args.bus?.colorValue ?? color;

      if (args.bus?.points.isNotEmpty == true) {
        points.addAll(args.bus!.points.map((point) => point.latlng));
      }
    }
  }

  void showColorPicker() async {
    final selectedColor = await showDialog<Color>(
      context: context,
      builder: (context) => ColorPickerDialog(color: color),
    );

    if (selectedColor != null) {
      setState(() {
        color = selectedColor;
      });
    }
  }

  void addPoint(LatLng point) {
    setState(() {
      points.add(point);

      if (points.length > 1 && location == null) {
        location = LatLngMidpoint.from(points[0], points[1]);
      }
    });
  }

  void save(BuildContext context) async {
    if (!Form.of(context)!.validate()) return;

    await busesRef.doc(id).set(
          Bus(
            name: titleController.text,
            price: currencyFormatter.getUnformattedValue().toDouble(),
            points: points.map((point) => point.geoPoint).toList(growable: false),
            color: color.toHex(leadingHashSign: true),
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
        content: const Text('Deseja realmente excluir este ônibus?'),
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
      await busesRef.doc(id).delete();
      if (!mounted) return;
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    mapCompleter.future.then((controller) => controller.dispose());
    titleController.dispose();
    priceController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: FutureBuilder<BitmapDescriptor>(
        future: BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'assets/images/bus.png'),
        builder: (context, busMarker) => Scaffold(
          floatingActionButton: selectedPoint == null || selectedPoint! < 0
              ? null
              : FloatingActionButton(
                  child: const Icon(Icons.delete),
                  onPressed: () => setState(() {
                    points.removeAt(selectedPoint!);
                    selectedPoint = null;
                  }),
                ),
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
                          controller: titleController,
                          decoration: const InputDecoration(
                            hintText: 'Nome do ônibus',
                            helperText: '',
                          ),
                          validator: (value) => value?.isNotEmpty == true ? null : 'Nome do ônibus é obrigatório',
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
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: priceController,
                                inputFormatters: [currencyFormatter],
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  label: Text('Preço'),
                                  border: OutlineInputBorder(),
                                  hintText: '',
                                ),
                                validator: (value) => value?.isNotEmpty == true ? null : 'Preço é obrigatório',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Material(
                                color: color,
                                type: MaterialType.circle,
                                elevation: 4,
                                child: InkWell(
                                  customBorder: const CircleBorder(),
                                  splashColor: color.splash(0.1),
                                  onTap: showColorPicker,
                                  child: const SizedBox.square(dimension: 40),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: isNew == null
                              ? const SizedBox.shrink()
                              : GoogleMap(
                                  initialCameraPosition: CameraPosition(target: location ?? inatelPosition, zoom: 15),
                                  onMapCreated: (controller) => mapCompleter.complete(controller),
                                  myLocationEnabled: true,
                                  myLocationButtonEnabled: true,
                                  polylines: {
                                    Polyline(
                                      polylineId: PolylineId('line-$id'),
                                      points: [...points, if (points.length > 2) points.first],
                                      width: 4,
                                      color: color,
                                    ),
                                  },
                                  markers: {
                                    if (location != null && busMarker.hasData)
                                      Marker(
                                        markerId: MarkerId('location-$id'),
                                        position: location!,
                                        icon: busMarker.data!,
                                        draggable: selectedPoint == -1,
                                        onDrag: (value) => setState(() => location = value),
                                        anchor: const Offset(0.5, 0.5),
                                        consumeTapEvents: true,
                                        onTap: () => setState(() => selectedPoint = -1),
                                      ),
                                    ...points.asMap().entries.map((item) {
                                      final index = item.key;
                                      final point = item.value;
                                      return Marker(
                                        markerId: MarkerId('point-$id-$index'),
                                        position: point,
                                        alpha: selectedPoint != null && selectedPoint != index ? 0.5 : 1,
                                        draggable: selectedPoint == index,
                                        onDrag: (pos) => setState(() => points[index] = pos),
                                        onDragEnd: (pos) => setState(() => points[index] = pos),
                                        consumeTapEvents: true,
                                        onTap: () => setState(() => selectedPoint = index),
                                      );
                                    }).toSet(),
                                  },
                                  onTap: (_) {
                                    setState(() => selectedPoint = null);
                                  },
                                  onLongPress: selectedPoint == null ? addPoint : null,
                                ),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (isNew == false) ...[
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.red),
                                  foregroundColor: MaterialStateProperty.all(Colors.white),
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
