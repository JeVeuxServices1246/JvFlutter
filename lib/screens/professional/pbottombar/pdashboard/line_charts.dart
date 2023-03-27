import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(sideTitles: bottomTitles),
      topTitles: AxisTitles(),
      rightTitles: AxisTitles(),
      leftTitles: AxisTitles(sideTitles: leftTitles));

  static SideTitles get leftTitles => SideTitles(
        showTitles: true,
        reservedSize: 40,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 0:
              text = '500';
              break;
            case 1:
              text = '1000';
              break;
            case 2:
              text = '1500';
              break;
            case 3:
              text = '2000';
              break;
            case 4:
              text = '2500';
              break;
            case 5:
              text = '3000';
              break;
          }

          return Text(
            text,
            style: const TextStyle(color: Colors.black),
          );
        },
      );

  static SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 0:
              text = 'Jan';
              break;
            case 2:
              text = 'Mar';
              break;
            case 4:
              text = 'May';
              break;
            case 6:
              text = 'Jul';
              break;
            case 8:
              text = 'Sep';
              break;
            case 10:
              text = 'Nov';
              break;
          }

          return Text(
            text,
            style: TextStyle(color: Colors.black),
          );
        },
      );
}
