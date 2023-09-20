import 'package:flutter/material.dart';
import 'package:youtubebrasileirao/services/maria_service.dart';

import '../model/time_model.dart';
import '../my_default_settings.dart';

class TimeItemWidget extends StatelessWidget {
  final Time time;
  const TimeItemWidget({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    final MariaService mariaService = MariaService.instance;
    return Container(
      alignment: Alignment.center,
      child: ListTile(
        leading: Image.network(
          '${mariaService.dio.options.baseUrl}/times/proxy-image?link=${time.urlEscudo}',
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
