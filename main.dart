// Enum untuk tipe paket laundry
enum PaketLaundry { reguler, express }

// Fungsi untuk cek berat minimal
double hitungBerat(double kilo) {
  if (kilo < 2.0) {
    return 2.0;
  }
  return kilo;
}

// Fungsi untuk hitung total harga
double hitungHarga(double kilo, PaketLaundry tipe) {
  double beratAkhir = hitungBerat(kilo);
  double total = beratAkhir * 7000; // Rp7.000 / kg

  switch (tipe) {
    case PaketLaundry.express:
      return total + (total * 0.5); // Express +50%
    case PaketLaundry.reguler:
      return total;
  }
}

void main() {
  print('LAUNDRY: ');
  print('Skenario 1 (1.5 kg, Reguler) : Rp${hitungHarga(1.5, PaketLaundry.reguler).toStringAsFixed(0)}');
  print('Skenario 2 (2.0 kg, Reguler) : Rp${hitungHarga(2.0, PaketLaundry.reguler).toStringAsFixed(0)}');
  print('Skenario 3 (3.0 kg, Express) : Rp${hitungHarga(3.0, PaketLaundry.express).toStringAsFixed(0)}');
  print('Skenario 4 (1.0 kg, Express) : Rp${hitungHarga(1.0, PaketLaundry.express).toStringAsFixed(0)}');
  print('Skenario 5 (5.0 kg, Reguler) : Rp${hitungHarga(5.0, PaketLaundry.reguler).toStringAsFixed(0)}');
}