import 'package:flutter/material.dart';
import 'package:youtubebrasileirao/screens/jogos_time_screen.dart';
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
        leading: Hero(
          tag: time.nome,
          child: Image.network(
            '${mariaService.dio.options.baseUrl}/times/proxy-image?link=${time.urlEscudo}',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => LayoutBuilder(
              builder: (context, constraints) => Icon(
                  Icons.error_outline,
                  size: constraints.biggest.height,
                  color: Theme.of(context).colorScheme.primary,
                )
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(time.nome),
            Text(time.pontos.toString()),
          ],
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => JogosTimeScreen(time: time),));
        },
        minVerticalPadding: MyDefaultSettings.gutter * 2,
      ),
    );
  }
}
