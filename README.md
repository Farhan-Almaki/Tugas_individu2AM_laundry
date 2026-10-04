# Tugas_individu2AM_laundry
**Use Case :** System Perhitungan Laundry  
**Nama :** Farhan Al Maki  (1124160203)

---

## Dokumen Analisis

### 1. Problem Statement
Banyak tempat laundry yang masih menghitung biaya secara manual, sehingga rentan salah hitung terutama saat ada aturan berat minimal maupun tambahan biaya untuk paket layanan tertentu (express). Program ini dibuat untuk menghitung total tarif transaksi laundry secara otomatis dan akurat.

---

### 2. Actor
- **Kasir atau Admin Laundry:** Orang yang memasukkan data transaksi (berat pakaian dan jenis layanannya) serta menyampaikan total harga ke pelanggan itu.

---

### 3. Input & Output
- **Input:** 
  - Berat pakaian dalam kilogram (contoh: `1.5`, `3.0`).
  - Jenis paket layanan (pilihan: `reguler` atau `express`).
- **Output:** 
  - Total harga yang harus dibayar oleh pelanggan (dalam Rupiah).

---

### 4. Functional Requirement
- **FR-01:** Sistem dapat memproses dan menyesuaikan berat pakaian berdasarkan aturan batas minimal.
- **FR-02:** Sistem dapat menghitung total tarif berdasarkan jenis paket layanan yang dipilih.
- **FR-03:** Sistem dapat menampilkan hasil akhir total pembayaran ke layar.

---

### 5. Business Rules
- **BR-01 (Batas Minimal Berat):** Jika berat pakaian di bawah 2 kg, maka otomatis tetap dihitung 2 kg.
- **BR-02 (Tarif Dasar):** Biaya dasar laundry adalah Rp7.000 per kg nya.
- **BR-03 (Layanan Express):** Jika menggunakan layanan express, dikenakan tambahan biaya sebesar 50% dari total tarif dasar itu.

---

### 6. Decomposition
Masalah perhitungan laundry dipecah menjadi fungsi-fungsi kecil:
- `hitungBerat(kilo)` ➔ Bertugas untuk memeriksa dan membulatkan berat minimal 2 kg.
- `hitungHarga(kilo, tipe)` ➔ Bertugas untuk menghitung harga dasar dan menentukan total biaya berdasarkan jenis paket.
- `main()` ➔ Bertugas untuk menjalankan skenario uji coba dan menampilkan hasilnya itu.

---

### 7. Pattern Recognition

Setiap transaksi laundry selalu mengikuti pola perhitungan berulang yang sama:

```text
Input (kilo & tipe)
        |
        v
Cek Berat Minimal (BR-01)
        |
        v
Hitung Harga Dasar (BR-02)
        |
        v
Cek Paket Express (BR-03)
        |
        v
Hitung Total
```

**Rumus Perhitungan:**

1. **Berat Fix:** Jika `kilo < 2.0`, maka `kilo = 2.0`.
2. **Harga Dasar:** `total = beratFix * 7000`.
3. **Tambahan Express:** Jika `express` dipilih, maka `total = total + (total * 0.5)`.

**Contoh Perhitungan (3.0 kg, Express):**

| Komponen               | Perhitungan         |        Hasil |
| ---------------------- | ------------------- | -----------: |
| Harga Dasar            | 3.0 kg × Rp7.000    |     Rp21.000 |
| Tambahan Express (50%) | Rp21.000 × 0.5      |     Rp10.500 |
| **Total Biaya**        | Rp21.000 + Rp10.500 | **Rp31.500** |

---

### 8. Abstraction

Abstraction diterapkan menggunakan **`enum`** untuk membatasi opsi pilihan paket laundry agar aman dari kesalahan input (*typo*).

**Implementasi `enum`:**

```dart
enum PaketLaundry { reguler, express }
```

Logika program juga dipecah ke dalam fungsi terpisah agar setiap bagian memiliki tugas yang spesifik (*decomposition*):

1. **`hitungBerat(double kilo)`**

   Berfokus menangani aturan batas berat minimal 2 kg (BR-01).

2. **`hitungHarga(double kilo, PaketLaundry tipe)`**

   Berfokus menghitung harga dasar (BR-02) dan mengaplikasikan biaya tambahan sebesar 50% jika memilih paket express (BR-03).

Dengan menggunakan `enum`, pemanggilan fungsi di dalam `main()` menjadi lebih mudah dibaca dan jelas maksudnya.

**Contoh Pemanggilan Fungsi:**

```dart
hitungHarga(3.0, PaketLaundry.express);
```

---

### 9. Algorithm
1. Menerima data masukan berupa berat pakaian (`kilo`) dan jenis layanan (`tipe`).
2. Cek apakah berat pakaian kurang dari 2.0 kg. Jika ya, ubah berat menjadi 2.0 kg.
3. Hitung harga dasar dengan mengalikan berat pakaian yang sudah disesuaikan dengan Rp7.000.
4. Cek jenis layanan yang dipilih:
   - Jika `express`, tambahkan biaya 50% ke harga dasar.
   - Jika `reguler`, harga tetap sama dengan harga dasar.
5. Kembalikan nilai total biaya dan cetak hasilnya.

---

### 10. Flowchart (Proses Utama)
```text
[START]
   │
   ▼
Input: kilo, tipe
   │
   ▼
Apakah kilo < 2.0? ── (Ya) ──► kilo = 2.0
   │
  (Tidak)
   │
   ▼
total = kilo * 7000
   │
   ▼
Apakah tipe == express? ── (Ya) ──► total = total + (total * 0.5)
   │
  (Tidak)
   │
   ▼
Cetak: total
   │
   ▼
 [END]