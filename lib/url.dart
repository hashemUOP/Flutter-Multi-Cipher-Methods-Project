import 'package:flutter/material.dart';

import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.urlPath});
  final String urlPath;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void>? _launched;

  Future<void> _launchInBrowser(String url) async {
    if (await UrlLauncherPlatform.instance.canLaunch(url)) {
      await UrlLauncherPlatform.instance.launch(
        url,
        useSafariVC: false,
        useWebView: false,
        enableJavaScript: false,
        enableDomStorage: false,
        universalLinksOnly: false,
        headers: <String, String>{},
      );
    } else {
      throw Exception('Could not launch $url');
    }
  }

  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    String toLaunch = widget.urlPath;
    return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => setState(() {
                      _launched = _launchInBrowser(toLaunch);
                    }),
                    child: const Text('Launch Video' , style: TextStyle(color: Colors.orange),),
                  ),
                  FutureBuilder<void>(future: _launched, builder: _launchStatus),
                ],
    );
  }
}

