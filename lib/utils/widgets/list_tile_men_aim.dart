// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class MensAimPage extends StatefulWidget {
  final IconData leadingIcon;
  final String title;
  final bool isSelected;
  final Function(bool)? onChanged;

  const MensAimPage({
    super.key,
    required this.leadingIcon,
    required this.title,
    this.isSelected = false,
    this.onChanged,
  });

  @override
  _MensAimPageState createState() => _MensAimPageState();
}

class _MensAimPageState extends State<MensAimPage> {
  bool? _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 380,
      decoration: BoxDecoration(
          color: const Color(0xffEDEDED),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: ListTile(
          leading: Icon(size: 30, widget.leadingIcon),
          title: Text(
            widget.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          trailing: Radio(
            value: true,
            groupValue: _isSelected,
            onChanged: (value) {
              setState(() {
                _isSelected = value;
                widget.onChanged!(value!);
              });
            },
          ),
        ),
      ),
    );
  }
}
