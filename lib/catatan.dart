class Catatan {
  String judul;
  String isi;
  DateTime? tanggal;

  Catatan({required this.judul, required this.isi}) {
    tanggal = DateTime.now();
  }
}
