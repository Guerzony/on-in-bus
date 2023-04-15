import 'package:flutter/material.dart';
import 'package:on_in_bus/data/stop.dart';
import 'package:on_in_bus/data/stop_arguments.dart';
import 'package:on_in_bus/utils/user.dart';

class StopList extends StatefulWidget {
  const StopList({
    Key? key,
    required this.onSelect,
  }) : super(key: key);

  final void Function(MapEntry<String, Stop>) onSelect;

  @override
  State<StopList> createState() => _StopListState();
}

class _StopListState extends State<StopList> {
  final stopStream = stopsRef.snapshots();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return StreamBuilder<UserWithData?>(
      stream: userDataStream(),
      builder: (context, user) {
        final isAdmin = user.data?.second.isAdmin == true;

        return StreamBuilder<StopQuerySnapshot>(
          stream: stopStream,
          builder: (context, snapshot) {
            final Map<String, Stop> data = {
              for (final stop in snapshot.data?.docs ?? []) stop.id: stop.data,
            };

            return Material(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox.square(dimension: 48),
                          Text(
                            'Lista de Paradas',
                            style: textTheme.titleLarge,
                          ),
                          SizedBox(
                            width: 48,
                            child: !isAdmin
                                ? null
                                : IconButton(
                                    splashRadius: 20,
                                    icon: const Icon(Icons.add),
                                    onPressed: () => Navigator.pushNamed(context, '/stop'),
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
                        Text('Nenhuma parada foi encontrado!'),
                      ],
                    )
                  else
                    Expanded(
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final id = data.keys.elementAt(index);
                          final stop = data[id]!;
                          return ListTile(
                            title: Text(stop.name),
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
                                        '/stop',
                                        arguments: StopArguments(id, stop),
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
