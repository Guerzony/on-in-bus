import 'package:flutter/material.dart';
import 'package:on_in_bus/data/bus.dart';
import 'package:on_in_bus/data/bus_arguments.dart';
import 'package:on_in_bus/utils/user.dart';

class BusList extends StatefulWidget {
  const BusList({
    Key? key,
    required this.onSelect,
  }) : super(key: key);

  final void Function(MapEntry<String, Bus>) onSelect;

  @override
  State<BusList> createState() => _BusListState();
}

class _BusListState extends State<BusList> {
  final busStream = busesRef.snapshots();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return StreamBuilder<UserWithData?>(
      stream: userDataStream(),
      builder: (context, user) {
        final isAdmin = user.data?.second.isAdmin == true;

        return StreamBuilder<BusQuerySnapshot>(
          stream: busStream,
          builder: (context, snapshot) {
            final Map<String, Bus> data = {
              for (final bus in snapshot.data?.docs ?? []) bus.id: bus.data,
            };

            return Material(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 48,
                          ),
                          Text(
                            'Lista de Ônibus',
                            style: textTheme.titleLarge,
                          ),
                          if (isAdmin)
                            SizedBox(
                              width: 48,
                              child: IconButton(
                                splashRadius: 20,
                                icon: const Icon(Icons.add),
                                onPressed: () => Navigator.pushNamed(context, '/bus'),
                              ),
                            ),
                        ],
                      ),
                      if (snapshot.connectionState == ConnectionState.waiting)
                        const Align(
                          alignment: Alignment.bottomCenter,
                          child: LinearProgressIndicator(),
                        ),
                    ],
                  ),
                  const Divider(height: 0),
                  if (data.isEmpty)
                    Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Icon(
                            Icons.help_outline,
                            size: 64,
                            color: Colors.black38,
                          ),
                        ),
                        Text('Nenhum ônibus foi encontrado!'),
                      ],
                    )
                  else
                    Expanded(
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final id = data.keys.elementAt(index);
                          final bus = data[id]!;
                          return ListTile(
                            title: Text(bus.name),
                            onTap: () => setState(() {
                              widget.onSelect(data.entries.elementAt(index));
                              Navigator.pop(context);
                            }),
                            trailing: !isAdmin
                                ? null
                                : IconButton(
                                    splashRadius: 20,
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/bus',
                                        arguments: BusArguments(id, bus),
                                      );
                                    },
                                  ),
                          );
                        },
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
