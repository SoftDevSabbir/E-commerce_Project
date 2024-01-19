
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorSelector extends StatefulWidget {
  const ColorSelector(
      {super.key, required this.colors, required this.onChange});
  final List colors;
  final Function(Color) onChange;

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  late Color _selectedColor;
  @override
  void initState() {
    super.initState();
    _selectedColor = widget.colors.first;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: widget.colors
          .map((e) => InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          _selectedColor = e;
          widget.onChange(e);
          if (mounted) {
            setState(() {});
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            child: _selectedColor == e
                ? const Icon(
              Icons.done,
              color: Colors.white,
            )
                : null,
            backgroundColor: e,
            radius: 15,
          ),
        ),
      ))
          .toList(),
    );
  }
}