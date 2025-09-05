# client

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

📦 Penjelasan Package
1. cupertino_icons: ^1.0.8
    Ikon gaya iOS (Cupertino).
    Dipakai kalau bikin aplikasi Flutter dengan UI bergaya iOS (CupertinoApp, CupertinoButton, dll).
    Default bawaan hampir semua project Flutter.
2. flutter_lints: ^5.0.0
    Aturan linting untuk menjaga konsistensi kode.
    Membantu deteksi error kecil (misal variable nggak kepakai, typo).
    Hanya untuk development, tidak berpengaruh ke aplikasi.
3. provider: ^6.1.5
    State management dan dependency injection yang direkomendasikan tim Flutter.
    Contoh: simpan status login user, theme app, atau data cart e-commerce.
    Mudah dipakai dengan ChangeNotifier dan Consumer.
4. flutter_dotenv: ^5.2.1
    Load variabel environment dari file .env.
    Berguna untuk API key, URL backend, atau konfigurasi sensitif.
    Contoh .env:
        API_URL=https://api.example.com
        API_KEY=abcdef12345
5. image_picker: ^1.1.2
    Ambil gambar atau video dari kamera / galeri (Android & iOS).
    Sering dipakai untuk upload foto profil, scan dokumen, dll.
    ⚠️ Tidak bekerja penuh di Web (harus pakai image_picker_for_web).
6. http: ^1.5.0
    HTTP client simpel untuk request API (GET, POST, dll).
    Cocok untuk project kecil-menengah.
    Contoh: ambil data dari backend REST API.
    ⚠️ Kalau butuh fitur lebih (retry, interceptors) → lebih baik pakai dio.
7. fl_chart: ^1.0.0
    Library grafik/chart untuk Flutter.
    Bisa bikin line chart, bar chart, pie chart, radar chart.
    Bagus untuk dashboard, laporan data, atau statistik user.
8. intl: ^0.20.2
    Internationalization (i18n): format tanggal, angka, mata uang sesuai locale.
    Contoh:
    DateFormat.yMMMMd('id').format(DateTime.now());
    // 5 September 2025
9. flutter_secure_storage: ^9.2.4
    Simpan data secure (token, password, API key).
    Di Android pakai Keystore, di iOS pakai Keychain.
    Aman untuk data sensitif.
    ⚠️ Di Web fallback ke localStorage (tidak seaman mobile).
10. image_picker_for_web: ^3.1.0
    Plugin tambahan biar image_picker bisa jalan di Web.
    Implementasinya pakai file picker di browser.
    Jadi penting kalau target app kamu termasuk Flutter Web.
11. printing: ^5.14.2
    Print dokumen PDF di semua platform (Mobile, Web, Desktop).
    Bisa juga buat print preview atau share PDF.
    Biasanya dipakai bareng package pdf.
    Cocok untuk invoice, laporan, struk panjang.
12. blue_thermal_printer: ^1.2.3
    Untuk koneksi ke Bluetooth Thermal Printer (biasanya 58mm/80mm).
    Dipakai di aplikasi kasir / POS untuk cetak struk.
    ⚠️ Hanya support Android & iOS (belum ada Web/Desktop).
13. file_picker
14. responsive_framework