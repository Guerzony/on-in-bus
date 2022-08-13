import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:on_in_bus/data/bus.dart';
import 'package:on_in_bus/utils/currency.dart';
import 'package:on_in_bus/utils/user.dart';

final _db = FirebaseFirestore.instance;

class InfoDialog extends StatefulWidget {
  const InfoDialog({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  State<InfoDialog> createState() => _InfoDialogState();
}

class _InfoDialogState extends State<InfoDialog> {
  bool loading = false;

  void changeSeats(int change) async {
    setState(() => loading = true);
    await _db.collection('buses').doc(widget.id).update({
      'seats': FieldValue.increment(change),
    });
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserWithData?>(
      stream: userDataStream(),
      builder: (context, snapshot) {
        final isAdmin = snapshot.data?.second.isAdmin == true;

        return StreamBuilder<BusDocumentSnapshot>(
          stream: busesRef.doc(widget.id).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data?.data == null) {
              return const Dialog(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            final bus = snapshot.data!.data!;

            return Dialog(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppBar(
                    primary: false,
                    title: Text(bus.name),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  ListTile(
                    title: const Text('Preço'),
                    subtitle: Text(
                      currencyFormatter.format(bus.price.toStringAsFixed(2)),
                    ),
                  ),
                  ListTile(
                    title: const Text('Assentos'),
                    subtitle: Text(
                      '${bus.seats}${bus.seats == 1 ? ' assento disponível' : ' assentos disponíveis'}',
                    ),
                  ),
                  if (isAdmin)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            splashRadius: 24,
                            onPressed: () => changeSeats(-1),
                          ),
                          Text('${bus.seats} assentos'),
                          IconButton(
                            icon: const Icon(Icons.add),
                            splashRadius: 24,
                            onPressed: () => changeSeats(1),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
