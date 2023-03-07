// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports, unused_local_variable, unnecessary_new
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Chartline extends StatelessWidget {
  final List<charts.Series> seriesList;
  const Chartline({Key? key, required this.seriesList})
      : super(key: key);
  List<charts.Series<Population, String>> _populationDataSet() {
    final data = [
      new Population('2018', 1352642280),
      new Population('2019', 1366417754),
      new Population('2020', 1380004385),
      new Population('2021', 1393409038),
    ];
    return [
      new charts.Series<Population, String>(
        id: 'Population of India',
        colorFn: (_, __) => charts.Color.fromHex(code: "#7DD0D7"),
        domainFn: (Population sales, _) => sales.year,
        measureFn: (Population sales, _) => sales.population,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    Chartline(seriesList: seriesList);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Bar Chart"),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.5,
          child: charts.BarChart(_populationDataSet()),
        ),
      ),
    );
  }
}

class Population {
  final String year;
  final int population;
  Population(this.year, this.population);
}
