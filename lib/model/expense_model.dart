import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Catogory { food, travel, leisure, work }

const catogoryIcons = {
  Catogory.food: Icons.lunch_dining_outlined,
  Catogory.travel: Icons.flight_takeoff,
  Catogory.leisure: Icons.movie,
  Catogory.work: Icons.work,
};

class ExpenseModel {
  ExpenseModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.catogory,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Catogory catogory;

  String get formattedDate {
    return formatter.format(date); // here the date more readable 
  }
}
