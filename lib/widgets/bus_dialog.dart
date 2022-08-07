import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:on_in_bus/data/bus.dart';
import 'package:on_in_bus/data/bus_arguments.dart';

class BusDialog extends StatefulWidget {
  const BusDialog({Key? key}) : super(key: key);

  @override
  State<BusDialog> createState() => _BusDialogState();
}

class _BusDialogState extends State<BusDialog> with AfterLayoutMixin<BusDialog> {
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final currencyFormatter = CurrencyTextInputFormatter(locale: 'pt', symbol: 'R\$ ');

  final mapCompleter = Completer<GoogleMapController>();

  bool isNew = false;
  String? id;

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as BusArguments?;
    setState(() {
      isNew = args == null;
    });

    if (args != null) {
      titleController.text = args.bus?.name ?? '';
      priceController.text = currencyFormatter.format(args.bus?.price.toString() ?? '0');
      id = args.id;
    }
  }

  final initialPosition = const CameraPosition(
    target: LatLng(-22.256018906737587, -45.697147763394405),
    zoom: 16,
  );

  void save(BuildContext context) async {
    if (!Form.of(context)!.validate()) return;

    await busesRef.doc(id).set(
          Bus(
            name: titleController.text,
            price: double.tryParse(priceController.text) ?? 0,
            points: [],
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
    final args = ModalRoute.of(context)!.settings.arguments as BusArguments?;

    final isNew = args == null;

    return Form(
      child: Builder(
        builder: (context) => Scaffold(
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
                        TextFormField(
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
                        const SizedBox(height: 16),
                        Expanded(
                          child: Material(
                            elevation: 4,
                            borderRadius: BorderRadius.circular(8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GoogleMap(
                                initialCameraPosition: initialPosition,
                                onMapCreated: (controller) => mapCompleter.complete(controller),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () => save(context),
                              child: const Text('Salvar'),
                            ),
                            if (!isNew) ...[
                              const SizedBox(width: 32),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.red),
                                  foregroundColor: MaterialStateProperty.all(Colors.white),
                                ),
                                onPressed: delete,
                                child: const Text('Excluir'),
                              ),
                            ],
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
