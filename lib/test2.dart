import 'dart:convert';
import 'package:flutter/material.dart';



class Hospital {
  final String id;
  final String hospitalName;
  final String address;
  final String time;
  final String scopeOfServices;
  final String fee;
  final String contactNo;
  final List<SelectDay> selectDays;

  Hospital({
    required this.id,
    required this.hospitalName,
    required this.address,
    required this.time,
    required this.scopeOfServices,
    required this.fee,
    required this.contactNo,
    required this.selectDays,
  });
}

class SelectDay {
  final String day;
  final String morningStart;
  final String morningEnd;
  final String eveningStart;
  final String eveningEnd;

  SelectDay({
    required this.day,
    required this.morningStart,
    required this.morningEnd,
    required this.eveningStart,
    required this.eveningEnd,
  });
}

class MyApp extends StatelessWidget {
  final String jsonData = // Your JSON data here

  List<Hospital> parseData(String jsonStr) {
    final List<dynamic> parsedData = json.decode(jsonStr)['data'];
    return parsedData.map((data) {
      return Hospital(
        id: data['id'],
        hospitalName: data['hospital_name'],
        address: data['address1'],
        time: data['time'],
        scopeOfServices: data['Scopeofservices'],
        fee: data['fee'],
        contactNo: data['contact_no'],
        selectDays: (data['selectday'] as List<dynamic>).map((dayData) {
          return SelectDay(
            day: dayData['day'],
            morningStart: dayData['morningStart'],
            morningEnd: dayData['morningEnd'],
            eveningStart: dayData['eveningStart'],
            eveningEnd: dayData['eveningEnd'],
          );
        }).toList(),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final List<Hospital> hospitals = parseData(jsonData);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Hospital Data')),
        body: ListView.builder(
          itemCount: hospitals.length,
          itemBuilder: (context, index) {
            final Hospital hospital = hospitals[index];
            return ListTile(
              title: Text(hospital.hospitalName),
              subtitle: Text(hospital.address),
              // Add more widgets to display other hospital details
            );
          },
        ),
      ),
    );
  }
}
