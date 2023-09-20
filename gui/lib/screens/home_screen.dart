import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtubebrasileirao/widgets/time_item_widget.dart';

import '../model/time_model.dart';
import '../my_default_settings.dart';
import '../notifiers/time_notifier.dart';
import '../services/maria_service.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    MariaService service = MariaService.instance;
    Response response = await service.dio.get('/times');
    List<dynamic> dados = response.data;
    List<Time> dadosTimes = [];
    int count = 0;
    do {
      Map<String, dynamic> e = dados[count];
      dadosTimes.add(
        Time(
          id: e['id'],
          nome: e['nome'],
          pontos: e['pontos'],
          urlEscudo: e['urlEscudo'],
        ),
      );
      count++;
    } while (count < dados.length);

    TimeNotifier tn = Provider.of<TimeNotifier>(context, listen: false);
    tn.timeList = dadosTimes;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Brasileirão'),
        ),
        body: Consumer<TimeNotifier>(
          builder: (context, timeNotifier, child) => ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return TimeItemWidget(time: timeNotifier.timeList[index],);
            },
            separatorBuilder: (_, __) => Divider(height: 0),
            itemCount: timeNotifier.timeList.length,
          ),
        ),
      ),
    );
  }

  errorImage({required double size, required Color color}) {
    return Icon(
      Icons.error_outline,
      size: size,
      color: color,
    );
  }
}
