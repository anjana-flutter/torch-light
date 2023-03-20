import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';
class torch_light extends StatefulWidget {
  const torch_light({Key? key}) : super(key: key);

  @override
  State<torch_light> createState() => _torch_lightState();
}

class _torch_lightState extends State<torch_light> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Container(
            height: 350,
          ),
          ElevatedButton(
              onPressed: () {
                _turnOnFlash(context);
              },
              child: Text("ON")),
          ElevatedButton(
              onPressed: () {
                _turnOffFlash(context);
              },
              child: Text("OFF"))
        ]),
      ),
    );
  }

  void _showErrorMes(String mes, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mes)));
  }

  Future<void> _turnOnFlash(BuildContext context) async {
    try {
      await TorchLight.enableTorch();
    } on Exception catch (_) {
      _showErrorMes('NOT ABLE TO TURN ON FLASH', context);
    }
  }

  Future<void> _turnOffFlash(BuildContext context) async {
    try {
      await TorchLight.disableTorch();
    } on Exception catch (_) {
      _showErrorMes('NOT ABLE TO TURN ON FLASH', context);
    }
  }
}
