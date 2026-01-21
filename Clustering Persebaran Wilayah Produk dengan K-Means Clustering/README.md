# Clustering Persebaran Wilayah Produk  
## Studi Kasus: Madurasa 120 ml & 200 ml

## 📌 Project Description
Project ini bertujuan untuk menganalisis persebaran penjualan produk **Madurasa 120 ml dan 200 ml** berdasarkan wilayah menggunakan metode **K-Means Clustering**. Analisis dilakukan untuk membantu perusahaan mengidentifikasi wilayah dengan potensi pertumbuhan tinggi serta wilayah yang membutuhkan strategi pemasaran berbeda, berdasarkan data penjualan periode **Juli–Oktober 2025**.

Dengan pendekatan segmentasi wilayah berbasis data, project ini mendukung pengambilan keputusan strategis dalam peningkatan performa produk dan optimalisasi alokasi sumber daya pemasaran.

---

## 🎯 Objectives
- Mengidentifikasi pola persebaran penjualan Madurasa 120 ml dan 200 ml per wilayah.
- Melakukan segmentasi wilayah berdasarkan karakteristik penjualan menggunakan K-Means Clustering.
- Menentukan wilayah prioritas utama dan wilayah pengembangan.
- Memberikan rekomendasi strategi pemasaran yang berbeda untuk setiap cluster wilayah.

---

## 📂 Data Sources
Data penjualan diperoleh dari database internal perusahaan dengan kriteria:
- Periode data: **Juli – Oktober 2025**
- Produk: Madurasa 120 ml dan Madurasa 200 ml
- Data transaksi valid (tanpa error resi)
- Exclude tim tertentu dan data kota tidak valid

Pengambilan data dilakukan menggunakan **SQL**, kemudian diproses lebih lanjut dengan Python.

---

## 🧹 Data Preparation
Tahapan data preparation meliputi:
- Normalisasi nama wilayah (penyeragaman istilah kota/kabupaten).
- Pembersihan data transaksi yang tidak valid.
- Agregasi data penjualan per wilayah dan per bulan.
- Pivot data untuk kebutuhan analisis dan clustering.

---

## 📊 Data Visualization
Visualisasi data digunakan untuk:
- Mengamati tren penjualan bulanan, yang menunjukkan **penurunan hingga ±70%** selama periode analisis.
- Mengidentifikasi wilayah dengan kontribusi penjualan tertinggi, di mana **Jawa Barat** (Bogor dan wilayah metropolitan sekitar Jakarta) mendominasi penjualan Madurasa 120 ml dan 200 ml.

---

## 🤖
