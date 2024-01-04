import 'package:flutter/material.dart';

class RadioGroups extends StatefulWidget {
  const RadioGroups({
    super.key,
    required this.title,
    required this.candidates,
  });

  final String title;
  final List<String> candidates;

  @override
  State<RadioGroups> createState() => _RadioGroupsState();
}

class _RadioGroupsState extends State<RadioGroups> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    var radioButtons = widget.candidates.map((cand) {
      return InkWell(
        onTap: () {
          setState(() {
            _selectedValue = cand;
          });
        },
        child: Row(
          children: [
            Radio<String>(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              groupValue: _selectedValue,
              onChanged: (String? cand) {
                setState(() {
                  _selectedValue = cand;
                });
              },
              value: cand,
            ),
            Text(cand),
          ],
        ),
      );

      /*
      return RadioListTile(
        title: Text(cand),
        value: cand,
        groupValue: _selectedValue,
        onChanged: (String? cand) {
          setState(() {
            _selectedValue = cand;
          });
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
      );
      */
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(widget.title), ...radioButtons],
    );
  }
}
