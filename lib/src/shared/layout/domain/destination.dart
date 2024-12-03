import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Destination {
  const Destination({required this.icon, required this.label});
  final Widget icon;
  final String label;
}

const List<Destination> destinations = [
  Destination(icon: Icon(PhosphorIconsFill.house), label: 'Home'),
  Destination(icon: Icon(PhosphorIconsFill.compass), label: 'Explore'),
  Destination(icon: Icon(PhosphorIconsFill.chartBar), label: 'Ranks'),
  Destination(icon: Icon(PhosphorIconsFill.userCircle), label: 'Profile'),
];
