import 'package:client_app/theme/image_path_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final Color? background;
  const LoadingWidget({Key? key, this.background}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,
      child: Center(
        child: Image.asset(PathIcons.loading, width: 200),
      ),
    );
  }
}
