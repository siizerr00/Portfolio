# Analisis Peluang Airbnb Pasca Pandemi (Studi Kasus: Singapura)

## 📌 Project Description
Project ini bertujuan untuk menganalisis peluang bisnis Airbnb di Singapura pasca pandemi COVID-19 dengan menggunakan data historis penyewaan Airbnb periode 2018 hingga September 2022. Analisis difokuskan pada tren permintaan, distribusi wilayah, tipe kamar, serta pola harga guna menghasilkan rekomendasi strategis bagi calon pelaku bisnis Airbnb.

Dengan pulihnya sektor pariwisata Singapura setelah pandemi, project ini diharapkan dapat membantu menentukan **wilayah terbaik**, **tipe properti paling diminati**, dan **rentang harga optimal** untuk memaksimalkan peluang keuntungan.

---

## ❓ Research Questions
Beberapa pertanyaan utama yang ingin dijawab melalui analisis ini antara lain:
1. Bagaimana tren penyewaan Airbnb di Singapura sebelum, saat, dan pasca pandemi?
2. Wilayah (region) mana yang memiliki tingkat penyewaan Airbnb tertinggi?
3. Bagaimana perbandingan harga rata-rata Airbnb di setiap wilayah?
4. Tipe kamar apa yang paling diminati oleh wisatawan?
5. Berapa rentang harga optimal (berdasarkan interquartile range) untuk setiap wilayah dan tipe kamar?
6. Rekomendasi strategi bisnis Airbnb apa yang paling potensial pasca pandemi?

---

## 🧹 Cleaning Procedures
Tahapan data cleaning dan preprocessing yang dilakukan meliputi:
- Menggabungkan beberapa dataset (listing, review history, dan mapping neighbourhood).
- Menghapus data duplikat dan data yang tidak memiliki informasi penting.
- Menyesuaikan format tanggal agar konsisten untuk analisis time series.
- Mengelompokkan data berdasarkan:
  - Tahun
  - Wilayah (Central, East, West, North, North-East)
  - Tipe kamar (Private Room, Entire Home/Apart, Hotel Room, Shared Room)
- Memastikan data harga berada dalam rentang wajar dan siap untuk analisis statistik.

---

## 📊 Plotly Dashboard
Hasil analisis divisualisasikan menggunakan **Plotly** untuk menghasilkan dashboard interaktif yang mencakup:
- Tren penyewaan Airbnb dari tahun 2018–2022.
- Distribusi penyewaan berdasarkan wilayah.
- Perbandingan ketersediaan listing di tiap region.
- Analisis harga rata-rata Airbnb per wilayah.
- Boxplot interquartile range harga berdasarkan wilayah dan tipe kamar.
- Perbandingan tingkat popularitas tipe kamar di setiap region.

Dashboard ini membantu mempermudah eksplorasi data dan pengambilan insight bisnis secara visual dan intuitif.

---

## ✅ Key Insights & Conclusion
Berdasarkan hasil analisis:
- **Central Region** merupakan wilayah paling potensial dengan tingkat penyewaan tertinggi.
- **Private Room** adalah tipe kamar paling diminati di seluruh wilayah Singapura.
- Private Room menawarkan keseimbangan terbaik antara **harga yang lebih terjangkau** dan **tingkat permintaan yang tinggi**.
- Rekomendasi harga optimal untuk **Private Room** berada pada kisaran **USD 68 – 98 per malam**.

Project ini menyimpulkan bahwa fokus pada **Private Room di Central Region** dengan strategi harga yang tepat merupakan pilihan terbaik untuk memasuki bisnis Airbnb pasca pandemi.

---

## 🔧 Tools & Technologies
- Python  
- Pandas & NumPy  
- Plotly  
- Google Colab  

---

## 📎 Reference
Dataset Airbnb Singapura (2018–2022)  
Sumber pendukung: Straitstimes.com, Cosmopolitan.com

---

📬 *Project ini merupakan bagian dari portfolio analisis data.*
