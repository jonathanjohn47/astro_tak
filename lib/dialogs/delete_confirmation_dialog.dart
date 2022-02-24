import 'package:astro_tak/widgets/standard_button.dart';
import 'package:flutter/material.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final Function() onDelete;
  final Function() onCancel;

  const DeleteConfirmationDialog(
      {Key? key, required this.onDelete, required this.onCancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Do you really want to delete?'),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: StandardButton(
                text: 'Yes',
                onPressed: () {
                  onDelete();
                  Navigator.of(context).pop();
                }),
          ),
          SizedBox(width: 16),
          Expanded(
            child: StandardButton(
                text: 'No',
                onPressed: () {
                  onCancel();
                  Navigator.of(context).pop();
                }),
          ),
        ],
      ),
    );
  }
}
