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

}