import 'package:flutter/material.dart';

import '../model/time_model.dart';
import '../my_default_settings.dart';

class TimeItemWidget extends StatelessWidget {
  final Time time;
  const TimeItemWidget({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ListTile(
        leading: Image.network(
          'http://localhost:8181/api/times/proxy-image?link=${time.urlEscudo}',
          width: 50,
          height: 50,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => LayoutBuilder(
            builder: (context, constraints) => errorImage(
                size: constraints.biggest.height,
                color: Theme.of(context).colorScheme.primary),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(time.nome),
            Text(time.pontos.toString()),
          ],
        ),
        onTap: () {},
        minVerticalPadding: MyDefaultSettings.gutter * 2,
      ),
    );
  }

  errorImage({required double size, required Color color}) {
    return Icon(
      Icons.error_outline,
      size: size,
      color: color,
    );
  }}
