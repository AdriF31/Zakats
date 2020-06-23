import 'package:flutter/material.dart';

class Muzaqi extends StatefulWidget {
  @override
  _MuzaqiState createState() => _MuzaqiState();
}

class _MuzaqiState extends State<Muzaqi> {
  var _index = 0;
  Widget _builderStep() => Container(
    margin: EdgeInsets.only(top: 10),
    color: Colors.white,
    child: Stepper(
      steps: [
        Step(
          title: Text("Miqat"),
          content: Text(
              'Miqat adalah tempat memakai ihram dan tempat berniat umroh. Bisa diartikan sebagai tempat start kegiatan ibadah umroh. Miqat bisa dilakukan di Madinah yaitu Masjid Bir Ali atau di Makkah dan Jeddah mulai dari Bandara Internasional King Abdul Aziz. Saat miqat, pria harus sudah memakai pakaian khusus untuk umroh dan haji yang bernama ihram. Pria sudah tidak boleh memakai alas kaki yang menutup mata kaki, tidak memakai pakaian yang dijahit dan tanpa penutup kepala. Wanita sudah harus menutup aurat dan hanya boleh menampakkan telapak tangan dan wajah. Kemudian, berniat mengerjakan ibadah umroh dengan membaca bacaan niat umroh berikut: "Labbaikallahumma'+"'"+'umratan".'),

        ),
        Step(
          title: Text("Menuju Masjidil Haram di Mekah"),
          content: Text(
              "Dalam perjalanan, memperbanyak bacaan kalimat talbiyah yang selalu diucapkan Rasulullah shallallahu ‘alaihi wa sallam ketika umroh dan haji."+'"Labbaik Allahumma Labbaik. Labbaik Laa Syarika Laka Labbaik. Innal Hamda Wan Nimata Laka Wal Mulk Laa Syarika Lak"'),
        ),
        Step(
          title: Text("Melakukan Thawaf"),
          content: Text(
              "Sebelum masuk Masjidil Haram, jamaah dianjurkan berwudhu terlebih dahulu. Jamaah boleh masuk Masjidil Haram lewat pintu mana saja, tapi dianjurkan mengikuti contoh Rasulullah SAW yang masuk melalui pintu Babus Salam atau Bani Syaibah. Setelah itu turun dan terus menuju tempat thawaf (mataf). Jamaah mulai thawaf dari garis lurus (area dekat Hajar Aswad) antara pintu Kabah dan tanda lampu hijau di lantai atas Masjidil Haram."),
        ),
        Step(
          title: Text("Sholat 2 rakaat di depan Maqom Ibrahim"),
          content: Text(
              "Maqom Ibrahim bukanlah kuburan dan tidak pula tempat yang terkait dengan kuburan lain. Namun di tempat itu Nabi Ibrahim pernah berdiri dalam rangka membangun Kabah. Rakaat pertama membaca surat Al-Fatihah dilanjutkan dengan membaca surat Al-Kaafiruun. Rakaat kedua membaca surat Al-Fatihah dilanjutkan dengan membaca surat Al-Ikhlas."),
        ),
        Step(
          title: Text("Beristirahat sejenak dan minum air zam-zam"),
          content: Text(
              "Sebelum minum air zam-zam, membaca doa ALLAHUMMA INNI ASALUKA ILMAN NAFI AN WA RISQON WAASIAN WA SYIFAAAN MIN KULLI DAAIN WA SAQOMIN BI ROMHATIKA YA ARHAMAR ROHIMIIN"),
        ),
        Step(
          title: Text("Melakukan Sai"),
          content: Text(
              "Sai dimulai dari Safa ke Marwah yang dihitung sebagai satu kali perjalanan. Jadi, Safa ke Marwah 1, Marwah ke Safa 2, dan seterusnya. Sai berakhir di Marwah. Sai dikerjakan dengan berjalan, tapi pada batas di antara 2 lampu hijau, berlari-lari kecil. Sai ini merupakan penghargaan Allah SWT kepada istri Nabi Ibrahim. Saat itu istri Nabi Ibrahim, Siti Hajar, bolak-balik antara Safa dan Marwah sebanyak 7 kali dalam rangka mencari  air untuk minum putra beliau yaitu Nabi Ismail."),
        ),
        Step(
          title: Text(" Melakukan Tahallul"),
          content: Text(
              "Tahallul adalah akhir dari pelaksanaan ibadah umroh yang ditandai dengan bercukur. Untuk laki-laki lebih baik dicukur sampai gundul, tapi jika tidak sampai gundul tak mengapa. Sedangkan untuk tata cara umroh wanita hanya dicukur ala kadarnya."),
        ),

      ],
      currentStep: _index,
      onStepTapped: (index) {
        setState(() {
          _index = index;
        });
      },
      controlsBuilder: (BuildContext context,
          {VoidCallback onStepContinue, VoidCallback onStepCancel}) =>
          Container(),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("MUZAQI", style: TextStyle(fontFamily: 'montserrat', fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[_builderStep(), SizedBox(height: 700)],
        ),
      ),
    );
  }
}
