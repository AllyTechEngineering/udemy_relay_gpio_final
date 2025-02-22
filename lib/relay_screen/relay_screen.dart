import 'package:flutter/material.dart';
import 'package:udemy_relay_gpio/relay_service/relay_service.dart';

class RelayScreen extends StatefulWidget {
  const RelayScreen({super.key});

  @override
  State<RelayScreen> createState() => _RelayScreenState();
}

class _RelayScreenState extends State<RelayScreen> {
  final RelayService relayService = RelayService();

  Widget getElevatedButtonRelayOn() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          relayService.gpio16OutputLevel(true);
        });
      },
      child: const Text(
        'GPIO16 High Relay On',
        style: TextStyle(fontSize: 50.0),
      ),
    );
  }

  Widget getElevatedButtonRelayOff() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          relayService.gpio16OutputLevel(false);
        });
      },
      child: const Text(
        'GPIO16 Low Relay Off',
        style: TextStyle(fontSize: 50.0),
      ),
    );
  }

  @override
  void initState() {
    relayService.initGpio16Output();
    super.initState();
  }

  @override
  void dispose() {
    relayService.disposeGpio();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Udemy Relay GPIO'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            getElevatedButtonRelayOn(),
            const SizedBox(height: 20),
            getElevatedButtonRelayOff(),
          ],
        ),
      ),
    );
  }
}
