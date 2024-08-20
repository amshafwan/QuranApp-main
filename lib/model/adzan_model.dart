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

  JadwalAdzan({
    this.tanggal,
    this.imsyak,
    this.shubuh,
    this.terbit,
    this.dhuha,
    this.dzuhur,
    this.ashr,
    this.magrib,
    this.isya,
  });

  // Factory constructor for creating a new JadwalAdzan instance from a map
  factory JadwalAdzan.fromJson(Map<String, dynamic> json) {
    final timings = json['timings'] as Map<String, dynamic>;
    final date = json['date'] as Map<String, dynamic>;

    return JadwalAdzan(
      tanggal: date['readable'],
      imsyak: timings['Imsak'],
      shubuh: timings['Fajr'],
      terbit: timings['Sunrise'],
      dhuha: null, // Data tidak tersedia dari API
      dzuhur: timings['Dhuhr'],
      ashr: timings['Asr'],
      magrib: timings['Maghrib'],
      isya: timings['Isha'],
    );
  }

  // Method for converting a JadwalAdzan instance to a map
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
