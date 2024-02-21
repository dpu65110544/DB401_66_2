import 'package:flutter/material.dart';
import 'forcast.dart';
import 'weather.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  Weather? _weather;

  void updateReport() {
    forecast().then((weather) {
      setState(() {
        _weather = weather;
      });
    }).catchError((error) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
      ));
    });
  }

  @override
  void initState() {
    super.initState();
    updateReport();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'สภาพอากาศวันนี้',
          style: TextStyle(
            fontSize: 36,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          constraints: _weather == null
              ? const BoxConstraints.tightFor(width: 150, height: 150)
              : null,
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
              color: Colors.blueAccent.shade700.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.symmetric(vertical: 30),
          child: _weather == null
              ? null
              : Column(children: [
                  Text(
                    _weather!.address,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${_weather!.temperature}℃',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    _weather!.condition,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    _weather!.symbol,
                    style: const TextStyle(fontSize: 72),
                  ),
                ]),
        ),
        ElevatedButton(onPressed: () {}, child: const Text('Refresh'))
      ],
    );
  }
}
