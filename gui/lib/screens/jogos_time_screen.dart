import 'package:flutter/material.dart';

import '../model/time_model.dart';
import '../services/maria_service.dart';

class JogosTimeScreen extends StatefulWidget {
  final Time? time;

  const JogosTimeScreen({super.key, required this.time});

  @override
  State<JogosTimeScreen> createState() => _JogosTimeScreenState();
}

class _JogosTimeScreenState extends State<JogosTimeScreen> {
  @override
  Widget build(BuildContext context) {
    final Time? time = widget.time;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Jogos do ${widget.time!.nome}'),
        ),
        body: Center(
          child: Hero(
            tag: time!.nome,
            child: Image.network(
              '${MariaService.instance.dio.options.baseUrl}/times/proxy-image?link=${time.urlEscudo}',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => LayoutBuilder(
                builder: (context, constraints) => Icon(
                  Icons.error_outline,
                  size: constraints.biggest.height,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
