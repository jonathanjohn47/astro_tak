import 'package:flutter/material.dart';

class StandardAppBar extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  final Widget? bottom;

  const StandardAppBar({Key? key, this.leading, this.trailing, this.bottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ListTile(
          leading: leading,
          title: Center(
              child: SizedBox(
                  width: 64,
                  height: 64,
                  child: Image.asset('assets/images/icon.png'))),
          trailing: trailing ??
              SizedBox(
                height: 16,
                width: 16,
              ),
        ),
        bottom ??
            SizedBox(
              width: 0,
              height: 0,
            ),
      ],
    );
  }
}
