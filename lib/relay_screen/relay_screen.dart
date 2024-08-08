import 'package:flutter/material.dart';

//TODO: Import the Relay_service.dart file
import 'package:udemy_relay_gpio/relay_service/relay_service.dart';

class RelayScreen extends StatefulWidget {
  const RelayScreen({super.key});

  @override
  State<RelayScreen> createState() => _RelayScreenState();
}

class _RelayScreenState extends State<RelayScreen> {
  //TODO: Create an instance of the RelayService class
  final RelayService relayService = RelayService();
  //TODO: Call the initGpio16Output method in the initState method
  @override
  void initState() {
    relayService.initGpio16Output();
    super.initState();
  }

  //TODO: Call the disposeGpio method in the dispose method
  @override
  void dispose() {
    relayService.disposeGpio();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Create a Scaffold widget
    return Scaffold(
      //TODO: Add an AppBar widget
      appBar: AppBar(
        title: const Text('Udemy Relay GPIO'),
        centerTitle: true,
      ),
      //TODO: Add a Center widget
      body: Center(
        //TODO: Add a Column widget
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //TODO: Add the getElevatedButtonRelayOn method
            getElevatedButtonRelayOn(),
            const SizedBox(height: 20),
            //TODO: Add the getElevatedButtonRelayOff method
            getElevatedButtonRelayOff(),
          ],
        ),
      ),
    );
  }

//TODO: Create the getElevatedButtonRelayOn method
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

//TODO: Create the getElevatedButtonRelayOff method
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
}
