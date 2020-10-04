import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HargaEmas{
  harga( )async{
    DocumentSnapshot hargaEmas = await Firestore.instance.collection('HargaEmas').document('1').get();
  }
}