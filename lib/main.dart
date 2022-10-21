import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:remote_article/firebase_remote_config.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  CustomRemoteConfig().initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

@override
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    CustomRemoteConfig().forceFetch();
    checkVersion();
  }

  checkVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    int versionApp = int.parse(packageInfo.version.replaceAll(".", ""));
    int minVersion = int.parse(CustomRemoteConfig()
        .getValueOrDefault(key: "minVersion", defaultValue: packageInfo.version)
        .replaceAll(".", ""));
    if (minVersion > versionApp) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Versão nova'),
          content: const Text(
              'Identificamos que há uma nova versão do seu aplicativo disponível na loja. Recomendamos que faça a atualização para uma melhor experiência.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Atualizar depois'),
            ),
            TextButton(
              onPressed: () {
                if (Platform.isAndroid) {
                  // REDIRECIONAR PARA PLAY STORE
                }
                if (Platform.isIOS) {
                  // REDIRECIONAR PARA APPLE STORE
                }
              },
              child: const Text('Atualizar agora'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(CustomRemoteConfig().getValueOrDefault(
                key: "international_text", defaultValue: "")),
            if (!CustomRemoteConfig().getValueOrDefault(
                    key: "show_buy_feature", defaultValue: true) &&
                CustomRemoteConfig()
                    .getValueOrDefault(
                        key: "system_maintenance", defaultValue: "")
                    .isNotEmpty) ...[
              Text(CustomRemoteConfig().getValueOrDefault(
                  key: "system_maintenance", defaultValue: ""))
            ],
            ElevatedButton(
                onPressed: CustomRemoteConfig().getValueOrDefault(
                        key: "show_buy_feature", defaultValue: true)
                    ? () {
                        // FAZER COMPRA
                      }
                    : null,
                child: const Text("Comprar"))
          ],
        ),
      ),
    );
  }
}
