import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
class TambahCatatan extends StatefulWidget {
  @override
  _TambahCatatanState createState() => _TambahCatatanState();
}

class _TambahCatatanState extends State<TambahCatatan> {

  List<String> zakat = [
    "Zakat Emas",
    "Zakat Perak",
    "Zakat Hasil Tambang",
    "Zakat Harta Temuan",
    "Zakat Profesi",
    "Zakat Hasil Pertanian",
    "Zakat Hewan Ternak"
  ];

  final format = DateFormat("yyyy-MM-dd HH:mm");
  String jenisZakat;
  DateTime tanggalZakat;
  int jumlahZakat;
  TextEditingController controllerZakat = TextEditingController(text: '');

  getJenisZakat(value){
    this.jenisZakat = value;
  }
  getTanggalZakat(tanggal){
    this.tanggalZakat = tanggal;
  }
  getJumlahZakat(jumlah){
    this.jumlahZakat = jumlah;
  }

  createData(){
    DocumentReference documentReference = Firestore.instance.collection("CatatanZakat").document();

    Map<String, dynamic> Zakat = {
      "jenisZakat": jenisZakat,
      "tanggalZakat": tanggalZakat,
      "jumlahZakat": jumlahZakat,
    };
    documentReference.setData(Zakat).whenComplete((){
      print("$jenisZakat created");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catat Zakatmu", style: TextStyle(fontFamily: 'montserrat', fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body:Padding(
        padding: const EdgeInsets.fromLTRB(10,20,10,10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: DropDownField(
                  hintText: "Pilih Jenis Zakat",
                  hintStyle: TextStyle(fontFamily: 'montserrat', fontSize: 15),
                  labelText: "Zakat",
                  controller: controllerZakat,
                  itemsVisibleInDropdown: 8,
                  items: zakat,
                  enabled: true,
                  onValueChanged: (value){
                    setState(() {
                      getJenisZakat(value);
                    });
                  },
                ),
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: DateTimeField(
                  decoration: InputDecoration(
                    hintText: "Tanggal Zakat"
                  ),
                  resetIcon: Icon(Icons.close),
                  format: format,
                  onChanged: (DateTime tanggal){
                    getTanggalZakat(tanggal);
                  },
                  onShowPicker: (context, currentValue) async {
                    final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                    if (date != null) {
                      final time = await showTimePicker(
                        context: context,
                        initialTime:
                        TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                      );
                      return DateTimeField.combine(date, time);
                    } else {
                      return currentValue;
                    }
                  },
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                onChanged: (String jumlah){
                  getJumlahZakat(int.parse(jumlah));
                },
                decoration: InputDecoration(
                  labelText: "Jumlah Zakat",
                  fillColor: Colors.green,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2.0,
                    )
                  )
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 30,),
              Container(
                height: 50,
                width: 200,

                child: RaisedButton(
                  color: Color(0xFF56A74D),
                  onPressed: (){
                    setState(() {
                        createData();
                        showDialog(context: context,
                        child: AlertDialog(
                          content: Text('Data Berhasil Disimpan',textAlign: TextAlign.center,),
                        )
                        );
                    });
                  },
                  child: Text('Simpan',style: TextStyle(fontSize: 20,fontFamily: 'montserrat',color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ) ,
    );
  }
}
