import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class ColorPickerDialog extends StatefulWidget {
  const ColorPickerDialog({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  State<ColorPickerDialog> createState() => _ColorPickerDialogState();
}

class _ColorPickerDialogState extends State<ColorPickerDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: MaterialColorPicker(
        selectedColor: widget.color,
        onlyShadeSelection: true,
        onColorChange: (value) => Navigator.pop(context, value),
      ),
    );
  }
}
