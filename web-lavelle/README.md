# Studio Foto - Sistem Booking & Progres Client

## Alur Status Booking
booking -> dp -> pelunasan -> foto -> edit -> selesai (atau cancel)

## Setup

### 1. Google Sheets sebagai database
1. Buat Google Sheet baru, buat 3 tab: `Bookings`, `Photos`, `Schedule`.
2. Header row (baris 1) bebas, karena kode baca mulai baris 2. Urutan kolom:
   - Bookings: id | nama | email | tgl_foto | jam_foto | status | created_at | deadline_booking | deadline_pelunasan | deadline_edit | gdrive_link | catatan
   - Photos: booking_id | photo_no | deskripsi | done
   - Schedule: tanggal | jam | status
3. Buat Service Account di Google Cloud Console, aktifkan Google Sheets API, download JSON key.
4. Share Google Sheet ke email service account (client_email) dengan akses Editor.

### 2. Email (Resend, gratis 100 email/hari)
Daftar di resend.com, ambil API key, verifikasi domain pengirim.

### 3. Environment Variables (Vercel)
Copy `.env.example` -> isi semua value -> masukkan ke Vercel Project Settings > Environment Variables.

### 4. Deploy ke Vercel (gratis/Hobby)
```
npm install
vercel
```

### 5. Cron auto-cancel booking
`vercel.json` sudah diset jalan tiap hari jam 01:00. Vercel Hobby plan cron minimal 1x/hari.
Kalau butuh cek lebih sering (tiap jam), pakai cron gratis eksternal (cron-job.org) yang hit:
`GET https://yourapp.vercel.app/api/cron/check-deadlines` dengan header `Authorization: Bearer CRON_SECRET`.

## Catatan fitur sesuai request
- Reminder notifikasi pelunasan H-2 & keterlambatan edit: belum dikirim otomatis (menunggu instruksi lanjut) — data deadline sudah tersimpan di sheet, tinggal disambungkan ke email saat siap.
- Centang foto selesai edit: dilakukan manual lewat toggle di Photos (bisa ditambahkan UI khusus editor jika perlu).
- Akses client hanya lewat magic link email, tanpa password, token berlaku 15 menit untuk request, sesi login 7 hari.
- Akses admin pakai 1 password (ADMIN_PASSWORD) via cookie httpOnly.

## Struktur folder
- `app/page.tsx` - halaman client minta link
- `app/client/dashboard` - progres client
- `app/admin` - panel admin (booking, foto, gdrive, status)
- `app/api/*` - semua endpoint backend
- `lib/sheets.ts` - koneksi Google Sheets
- `lib/email.ts`, `lib/jwt.ts` - magic link
