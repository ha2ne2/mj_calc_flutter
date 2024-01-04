import 'package:flutter/material.dart';

class RadioGroups extends StatefulWidget {
  const RadioGroups({
    super.key,
    required this.candidates,
  });

  final List<String> candidates;

  @override
  State<RadioGroups> createState() => _RadioGroupsState();
}

class _RadioGroupsState extends State<RadioGroups> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    var radioButtons = widget.candidates.map((cand) {
      return ListTile(
          title: Text(cand),
          leading: Radio(
            value: cand,
            groupValue: _selectedValue,
            onChanged: (String? cand) {
              setState(() {
                _selectedValue = cand;
              });
            },
          ));
    }).toList();

    return Column(
      children: radioButtons,
    );
  }
}
