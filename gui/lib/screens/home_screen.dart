import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/time_model.dart';
import '../notifiers/theme_notifier.dart';
import '../notifiers/time_notifier.dart';
import '../services/maria_service.dart';
import '../widgets/time_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    carregarTema();
    carregarDados();
  }

  carregarTema() async {
    ThemeNotifier tn = Provider.of<ThemeNotifier>(context, listen: false);
    await tn.loadThemeMode();
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

    dadosTimes.sort((a, b) => b.pontos.compareTo(a.pontos));

    TimeNotifier tn = Provider.of<TimeNotifier>(context, listen: false);
    tn.timeList = dadosTimes;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Brasileirão'),
          actions: [
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: ListTile(
                      leading: themeNotifier.isDark
                          ? Icon(Icons.brightness_7)
                          : Icon(Icons.brightness_2),
                      title: themeNotifier.isDark ? Text('Light') : Text('Dark'),
                      onTap: () => themeNotifier.changeTheme(),
                    ),
                ),
              ],
            ),
          ],
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
}
