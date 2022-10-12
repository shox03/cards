import 'package:flutter/material.dart';
import 'package:sample_app_getx/ui/main/home/edit_page/widget/materila_picker.dart';

class MaterialColorPickerExample extends StatefulWidget {
  const MaterialColorPickerExample({
    Key? key,
    required this.pickerColor,
    required this.onColorChanged,
  }) : super(key: key);

  final Color pickerColor;
  final ValueChanged<Color> onColorChanged;

  @override
  State<MaterialColorPickerExample> createState() =>
      _MaterialColorPickerExampleState();
}

class _MaterialColorPickerExampleState
    extends State<MaterialColorPickerExample> {
  bool _enableLabel = true;
  bool _portraitOnly = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              titlePadding: const EdgeInsets.all(0),
              contentPadding: const EdgeInsets.all(0),
              content: SingleChildScrollView(
                child: MaterialPicker(
                  pickerColor: widget.pickerColor,
                  onColorChanged: widget.onColorChanged,
                  enableLabel: _enableLabel,
                  portraitOnly: _portraitOnly,
                ),
              ),
            );
          },
        );
      },
      icon: Icon(Icons.colorize),
      style: ElevatedButton.styleFrom(
        primary: widget.pickerColor,
        shadowColor: widget.pickerColor.withOpacity(1),
        elevation: 10,
      ),
    );
  }
}
