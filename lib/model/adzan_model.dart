class JadwalAdzan {
  String? tanggal;
  String? imsyak;
  String? shubuh;
  String? terbit;
  String? dhuha;
  String? dzuhur;
  String? ashr;
  String? magrib;
  String? isya;

  JadwalAdzan(
      {this.tanggal,
      this.imsyak,
      this.shubuh,
      this.terbit,
      this.dhuha,
      this.dzuhur,
      this.ashr,
      this.magrib,
      this.isya});

  JadwalAdzan.fromJson(Map<String, dynamic> json) {
    tanggal = json['tanggal'];
    imsyak = json['imsyak'];
    shubuh = json['shubuh'];
    terbit = json['terbit'];
    dhuha = json['dhuha'];
    dzuhur = json['dzuhur'];
    ashr = json['ashr'];
    magrib = json['magrib'];
    isya = json['isya'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tanggal'] = this.tanggal;
    data['imsyak'] = this.imsyak;
    data['shubuh'] = this.shubuh;
    data['terbit'] = this.terbit;
    data['dhuha'] = this.dhuha;
    data['dzuhur'] = this.dzuhur;
    data['ashr'] = this.ashr;
    data['magrib'] = this.magrib;
    data['isya'] = this.isya;
    return data;
  }
}
