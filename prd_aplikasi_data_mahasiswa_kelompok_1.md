# Product Requirements Document (PRD)

## Aplikasi Data Mahasiswa — Kelompok 1

**Nama project:** Aplikasi Data Mahasiswa  
**Platform:** Flutter Web, dijalankan melalui Chrome  
**Target tugas:** Tugas Besar Mobile  
**Kelompok:** Kelompok 1  
**Tema:** Aplikasi Data Mahasiswa  
**Akun Firebase:** fakhriynugraha26@gmail.com  
**State management & navigation:** GetX  
**Backend:** Firebase Authentication + Cloud Firestore atau Firebase Realtime Database  
**Rekomendasi database:** Cloud Firestore  
**Logo aplikasi:** Logo Universitas Bengkulu yang dikirim oleh user, digunakan sebagai logo aplikasi dengan latar belakang transparan  
**Warna utama:** Biru navy dan kuning dengan aksen gradasi modern

---

## 1. Ringkasan Produk

Aplikasi Data Mahasiswa adalah aplikasi Flutter sederhana berbasis Firebase yang digunakan untuk mengelola data mahasiswa secara digital. Aplikasi ini menyediakan sistem autentikasi pengguna dan fitur manajemen data mahasiswa yang lengkap, mulai dari menambahkan data, melihat daftar data, melihat detail mahasiswa, mengubah data, hingga menghapus data.

Aplikasi dirancang dengan tampilan profesional, modern, responsif untuk dijalankan melalui Chrome, serta menggunakan kombinasi warna biru navy dan kuning sebagai identitas visual. Aplikasi juga menggunakan logo Universitas Bengkulu sebagai elemen branding utama.

Project ini dibuat untuk memenuhi ketentuan tugas besar, yaitu menggunakan Flutter, GetX, Firebase Authentication, serta Firebase Realtime Database atau Cloud Firestore. Fitur wajib yang harus tersedia adalah login, register, forget password, beranda, detail page, serta CRUD.

---

## 2. Tujuan Produk

Tujuan utama aplikasi ini adalah menyediakan sistem sederhana namun rapi untuk menyimpan, menampilkan, dan mengelola data mahasiswa.

Tujuan spesifik:

1. Membuat aplikasi Flutter yang dapat berjalan melalui Chrome.
2. Mengimplementasikan sistem login, register, dan lupa password menggunakan Firebase Authentication.
3. Mengimplementasikan manajemen data mahasiswa menggunakan Cloud Firestore atau Firebase Realtime Database.
4. Menggunakan GetX untuk state management, dependency management, dan navigation.
5. Menyediakan fitur CRUD lengkap untuk data mahasiswa.
6. Membuat UI/UX yang modern, profesional, konsisten, dan sesuai tema aplikasi data mahasiswa.
7. Membuat struktur kode yang rapi, modular, dan mudah dipahami.

---

## 3. Dasar Ketentuan Tugas Besar

Ketentuan utama dari tugas besar:

- Wajib menggunakan Flutter.
- Wajib menggunakan GetX untuk state management dan navigation.
- Wajib menggunakan Firebase Authentication.
- Wajib menggunakan Firebase Realtime Database atau Cloud Firestore.
- Fitur wajib meliputi login, register, forget password, beranda, detail page, serta create, read, update, dan delete.
- Kelompok 1 mendapatkan tema Aplikasi Data Mahasiswa.

Komponen penilaian:

| Komponen | Persentase |
|---|---:|
| UI/UX | 15% |
| Implementasi Firebase | 25% |
| Penggunaan GetX | 20% |
| Fitur CRUD | 30% |
| Kerapihan Kode | 10% |

Karena bobot terbesar ada pada CRUD, Firebase, dan GetX, maka prioritas teknis project harus difokuskan pada tiga aspek tersebut tanpa mengabaikan UI/UX dan kerapihan kode.

---

## 4. Scope Produk

### 4.1 In Scope

Fitur yang wajib dan direkomendasikan untuk dibuat:

1. Splash screen.
2. Login page.
3. Register page.
4. Forget password page.
5. Home page atau dashboard.
6. Daftar data mahasiswa.
7. Search data mahasiswa.
8. Filter sederhana berdasarkan program studi, angkatan, atau status.
9. Detail page mahasiswa.
10. Form tambah data mahasiswa.
11. Form edit data mahasiswa.
12. Delete data mahasiswa dengan dialog konfirmasi.
13. Logout.
14. Validasi form.
15. Loading state.
16. Empty state.
17. Error state.
18. Snackbar atau dialog notifikasi menggunakan GetX.
19. Responsive layout untuk Chrome.
20. Animasi profesional pada transisi halaman, card, button, dan loading.

### 4.2 Out of Scope

Fitur yang tidak wajib untuk tugas besar versi awal:

1. Role admin dan user biasa.
2. Upload foto mahasiswa ke Firebase Storage.
3. Export data ke PDF atau Excel.
4. Import data massal.
5. Dashboard statistik lanjutan.
6. Integrasi API eksternal.
7. Push notification.

Fitur-fitur tersebut dapat dijadikan pengembangan lanjutan jika waktu pengerjaan masih tersedia.

---

## 5. Target Pengguna

### 5.1 Pengguna Utama

Pengguna utama adalah admin atau operator akademik sederhana yang bertugas mengelola data mahasiswa.

### 5.2 Karakteristik Pengguna

1. Membutuhkan aplikasi yang mudah digunakan.
2. Ingin mencari data mahasiswa dengan cepat.
3. Perlu menambah, mengedit, dan menghapus data mahasiswa.
4. Tidak memerlukan proses teknis yang rumit.
5. Menggunakan aplikasi dari browser Chrome.

---

## 6. User Persona

### Persona 1 — Admin Data Mahasiswa

**Nama:** Admin Akademik  
**Kebutuhan:** Mengelola data mahasiswa dengan cepat dan rapi.  
**Masalah:** Data mahasiswa sulit dicari jika hanya disimpan manual.  
**Tujuan:** Dapat login, melihat daftar mahasiswa, menambahkan data baru, mengubah data yang salah, dan menghapus data yang tidak diperlukan.

### Persona 2 — Mahasiswa Pengelola Tugas Besar

**Nama:** Anggota Kelompok 1  
**Kebutuhan:** Membuat aplikasi sesuai ketentuan tugas besar.  
**Masalah:** Harus memastikan semua fitur wajib terpenuhi.  
**Tujuan:** Mendapat nilai optimal pada aspek UI/UX, Firebase, GetX, CRUD, dan kerapihan kode.

---

## 7. User Journey

### 7.1 Journey Login Pengguna

1. Pengguna membuka aplikasi melalui Chrome.
2. Aplikasi menampilkan splash screen dengan logo Universitas Bengkulu.
3. Sistem mengecek status login pengguna.
4. Jika belum login, pengguna diarahkan ke halaman login.
5. Pengguna memasukkan email dan password.
6. Sistem memvalidasi input.
7. Firebase Authentication memproses login.
8. Jika berhasil, pengguna masuk ke dashboard.
9. Jika gagal, sistem menampilkan pesan error.

### 7.2 Journey Register

1. Pengguna membuka halaman register.
2. Pengguna mengisi nama, email, password, dan konfirmasi password.
3. Sistem memvalidasi form.
4. Firebase Authentication membuat akun baru.
5. Jika berhasil, pengguna diarahkan ke halaman login atau langsung ke dashboard.
6. Jika gagal, sistem menampilkan pesan error.

### 7.3 Journey Forget Password

1. Pengguna membuka halaman forget password.
2. Pengguna memasukkan email.
3. Sistem memvalidasi email.
4. Firebase Authentication mengirim email reset password.
5. Sistem menampilkan notifikasi bahwa email reset password telah dikirim.

### 7.4 Journey CRUD Data Mahasiswa

1. Pengguna login.
2. Pengguna masuk ke dashboard.
3. Pengguna melihat daftar data mahasiswa.
4. Pengguna dapat mencari mahasiswa berdasarkan nama, NPM, jurusan, atau program studi.
5. Pengguna dapat membuka detail mahasiswa.
6. Pengguna dapat menambah data mahasiswa baru.
7. Pengguna dapat mengedit data mahasiswa.
8. Pengguna dapat menghapus data mahasiswa setelah konfirmasi.
9. Sistem menyimpan perubahan ke Firebase.

---

## 8. Fitur Produk

## 8.1 Splash Screen

### Deskripsi

Splash screen adalah halaman pembuka aplikasi yang menampilkan logo Universitas Bengkulu dan nama aplikasi.

### Tujuan

1. Memberikan kesan profesional.
2. Menampilkan identitas aplikasi.
3. Memberikan waktu untuk mengecek status autentikasi pengguna.

### Elemen UI

1. Logo Universitas Bengkulu dengan background transparan.
2. Nama aplikasi: “Data Mahasiswa”.
3. Subtitle: “Kelola Data Mahasiswa Secara Modern”.
4. Loading animation.
5. Background gradasi biru navy ke biru gelap dengan aksen kuning.

### Behavior

1. Jika user sudah login, arahkan ke Home Page.
2. Jika user belum login, arahkan ke Login Page.
3. Durasi splash sekitar 2 detik.

---

## 8.2 Login Page

### Deskripsi

Halaman login digunakan oleh pengguna untuk masuk ke aplikasi menggunakan email dan password.

### Elemen UI

1. Logo aplikasi.
2. Judul: “Selamat Datang Kembali”.
3. Input email.
4. Input password.
5. Tombol show/hide password.
6. Tombol Login.
7. Link Forget Password.
8. Link Register.
9. Loading indicator saat proses login.
10. Snackbar error jika login gagal.

### Validasi

1. Email tidak boleh kosong.
2. Format email harus valid.
3. Password tidak boleh kosong.
4. Password minimal 6 karakter.

### Behavior

1. Ketika tombol Login ditekan, sistem melakukan validasi form.
2. Jika valid, AuthController memanggil Firebase Authentication.
3. Jika login berhasil, user diarahkan ke Home Page menggunakan Get.offAllNamed().
4. Jika login gagal, tampilkan Get.snackbar() dengan pesan error.

### Acceptance Criteria

1. User dapat login menggunakan akun yang sudah terdaftar.
2. User tidak dapat login jika email atau password salah.
3. User mendapatkan pesan error yang jelas.
4. User diarahkan ke dashboard setelah login berhasil.

---

## 8.3 Register Page

### Deskripsi

Halaman register digunakan untuk membuat akun baru.

### Elemen UI

1. Logo aplikasi.
2. Judul: “Buat Akun Baru”.
3. Input nama lengkap.
4. Input email.
5. Input password.
6. Input konfirmasi password.
7. Tombol Register.
8. Link menuju Login Page.
9. Loading indicator.

### Validasi

1. Nama tidak boleh kosong.
2. Email tidak boleh kosong.
3. Format email harus valid.
4. Password minimal 6 karakter.
5. Konfirmasi password harus sama dengan password.

### Behavior

1. User mengisi form register.
2. Sistem memvalidasi input.
3. Firebase Authentication membuat akun baru.
4. Data profil sederhana user dapat disimpan ke collection `users`.
5. Jika berhasil, tampilkan snackbar sukses dan arahkan ke Home Page atau Login Page.

### Acceptance Criteria

1. User dapat membuat akun baru.
2. Email yang sudah terdaftar tidak dapat digunakan kembali.
3. Password kurang dari 6 karakter ditolak.
4. User mendapat feedback jika proses berhasil atau gagal.

---

## 8.4 Forget Password Page

### Deskripsi

Halaman ini digunakan untuk mengirim email reset password.

### Elemen UI

1. Judul: “Lupa Password”.
2. Deskripsi singkat.
3. Input email.
4. Tombol Kirim Link Reset.
5. Tombol kembali ke Login.

### Behavior

1. User memasukkan email.
2. Sistem memvalidasi email.
3. Firebase Authentication mengirim email reset password.
4. Sistem menampilkan snackbar sukses.

### Acceptance Criteria

1. User dapat meminta reset password menggunakan email terdaftar.
2. Sistem menampilkan pesan sukses setelah email dikirim.
3. Sistem menampilkan pesan error jika email tidak valid.

---

## 8.5 Home Page / Dashboard

### Deskripsi

Home Page adalah halaman utama setelah user login. Halaman ini menampilkan ringkasan data mahasiswa, daftar mahasiswa terbaru, dan akses cepat ke fitur tambah data.

### Elemen UI

1. AppBar custom dengan logo dan nama aplikasi.
2. Greeting user.
3. Tombol logout.
4. Statistic cards:
   - Total mahasiswa.
   - Total program studi.
   - Total mahasiswa aktif.
   - Total mahasiswa nonaktif.
5. Search bar.
6. Filter dropdown.
7. List/grid card mahasiswa.
8. Floating Action Button atau tombol “Tambah Mahasiswa”.
9. Empty state jika data belum ada.
10. Loading state saat data sedang dimuat.

### Behavior

1. Data mahasiswa diambil secara realtime dari Firestore.
2. Ketika data berubah, UI ikut diperbarui melalui GetX observable state.
3. Search memfilter data berdasarkan nama, NPM, jurusan, atau program studi.
4. Klik card mahasiswa membuka Detail Page.
5. Tombol tambah membuka Create Mahasiswa Page.

### Acceptance Criteria

1. User dapat melihat daftar mahasiswa.
2. User dapat mencari mahasiswa.
3. User dapat membuka detail mahasiswa.
4. User dapat menuju halaman tambah data.
5. Data yang tampil sesuai isi database Firebase.

---

## 8.6 Detail Page Mahasiswa

### Deskripsi

Detail Page menampilkan informasi lengkap mahasiswa yang dipilih.

### Data yang Ditampilkan

1. Nama lengkap.
2. NPM atau NIM.
3. Email mahasiswa.
4. Nomor telepon.
5. Fakultas.
6. Jurusan.
7. Program studi.
8. Angkatan.
9. Semester.
10. IPK.
11. Status mahasiswa.
12. Alamat.
13. Tanggal dibuat.
14. Tanggal diperbarui.

### Elemen UI

1. Header profile mahasiswa.
2. Avatar inisial nama atau ikon mahasiswa.
3. Informasi akademik.
4. Informasi kontak.
5. Informasi alamat.
6. Tombol Edit.
7. Tombol Delete.
8. Dialog konfirmasi hapus.

### Behavior

1. User membuka detail dari list mahasiswa.
2. Sistem menampilkan data lengkap mahasiswa.
3. User dapat klik Edit untuk mengubah data.
4. User dapat klik Delete untuk menghapus data.
5. Setelah delete berhasil, user diarahkan kembali ke Home Page.

### Acceptance Criteria

1. Detail mahasiswa tampil lengkap.
2. Tombol edit berfungsi.
3. Tombol delete menampilkan dialog konfirmasi.
4. Data terhapus dari Firebase setelah konfirmasi.

---

## 8.7 Create Mahasiswa Page

### Deskripsi

Halaman untuk menambahkan data mahasiswa baru.

### Field Form

1. Nama lengkap.
2. NPM atau NIM.
3. Email.
4. Nomor telepon.
5. Fakultas.
6. Jurusan.
7. Program studi.
8. Angkatan.
9. Semester.
10. IPK.
11. Status mahasiswa.
12. Alamat.

### Validasi

1. Nama lengkap wajib diisi.
2. NPM/NIM wajib diisi dan harus unik.
3. Email wajib valid.
4. Nomor telepon hanya angka dan minimal 10 digit.
5. Fakultas wajib diisi.
6. Jurusan wajib diisi.
7. Program studi wajib diisi.
8. Angkatan wajib diisi dan harus berupa tahun valid.
9. Semester wajib berupa angka 1–14.
10. IPK wajib berupa angka 0.00–4.00.
11. Status wajib dipilih.
12. Alamat wajib diisi.

### Behavior

1. User mengisi form.
2. Sistem memvalidasi semua input.
3. Sistem menyimpan data ke Firestore.
4. Jika berhasil, tampilkan snackbar sukses dan kembali ke Home Page.
5. Jika gagal, tampilkan snackbar error.

### Acceptance Criteria

1. User dapat menambah data mahasiswa baru.
2. Data tersimpan di Firebase.
3. Data baru muncul di daftar mahasiswa.
4. Form tidak dapat disubmit jika data wajib belum lengkap.

---

## 8.8 Update Mahasiswa Page

### Deskripsi

Halaman untuk mengubah data mahasiswa yang sudah ada.

### Behavior

1. Form otomatis terisi dengan data mahasiswa lama.
2. User mengubah data yang diperlukan.
3. Sistem memvalidasi input.
4. Sistem memperbarui data di Firestore.
5. Field `updatedAt` diperbarui otomatis.
6. Setelah berhasil, user diarahkan ke Detail Page atau Home Page.

### Acceptance Criteria

1. User dapat mengedit data mahasiswa.
2. Data yang berubah tersimpan di Firebase.
3. UI menampilkan data terbaru.
4. User mendapat feedback sukses atau gagal.

---

## 8.9 Delete Mahasiswa

### Deskripsi

Fitur untuk menghapus data mahasiswa dari database.

### Behavior

1. User menekan tombol Delete.
2. Sistem menampilkan dialog konfirmasi.
3. Jika user membatalkan, data tidak berubah.
4. Jika user mengonfirmasi, data dihapus dari Firestore.
5. Sistem menampilkan snackbar sukses.
6. User diarahkan kembali ke Home Page.

### Acceptance Criteria

1. Data tidak langsung terhapus tanpa konfirmasi.
2. Data benar-benar hilang dari daftar setelah dihapus.
3. User mendapat feedback setelah proses selesai.

---

## 8.10 Logout

### Deskripsi

Fitur untuk keluar dari akun pengguna.

### Behavior

1. User menekan tombol logout.
2. Sistem menampilkan dialog konfirmasi.
3. Firebase Authentication menjalankan sign out.
4. User diarahkan ke Login Page.

### Acceptance Criteria

1. User dapat logout.
2. Setelah logout, user tidak bisa membuka dashboard tanpa login ulang.

---

## 9. Data Mahasiswa

### 9.1 Struktur Data Utama

Collection Firestore yang direkomendasikan:

```text
students
```

Contoh struktur dokumen:

```json
{
  "id": "auto_generated_document_id",
  "name": "Fakhriy Nugraha",
  "npm": "G1A023001",
  "email": "mahasiswa@email.com",
  "phone": "081234567890",
  "faculty": "Teknik",
  "department": "Informatika",
  "studyProgram": "Informatika",
  "batchYear": 2023,
  "semester": 4,
  "gpa": 3.75,
  "status": "Aktif",
  "address": "Bengkulu",
  "createdAt": "Timestamp",
  "updatedAt": "Timestamp",
  "createdBy": "uid_user"
}
```

### 9.2 Collection Users

Collection opsional untuk menyimpan data user aplikasi:

```text
users
```

Contoh struktur dokumen:

```json
{
  "uid": "firebase_auth_uid",
  "name": "Admin Kelompok 1",
  "email": "fakhriynugraha26@gmail.com",
  "createdAt": "Timestamp"
}
```

### 9.3 Status Mahasiswa

Pilihan status mahasiswa:

1. Aktif.
2. Cuti.
3. Lulus.
4. Nonaktif.

---

## 10. Firebase Requirements

## 10.1 Firebase Authentication

Metode autentikasi yang digunakan:

1. Email/password login.
2. Register dengan email/password.
3. Reset password melalui email.
4. Sign out.
5. Auth state listener untuk mengecek apakah user sudah login.

### Firebase Auth Flow

1. User register.
2. Firebase membuat akun user.
3. UID user digunakan sebagai identitas pengguna.
4. User login.
5. Sistem mendapatkan currentUser.
6. Jika currentUser tidak null, user masuk ke Home Page.
7. Jika null, user diarahkan ke Login Page.

## 10.2 Cloud Firestore

Firestore digunakan untuk menyimpan data mahasiswa.

Collection yang digunakan:

1. `students`
2. `users` opsional

Operasi yang wajib:

1. Create document.
2. Read collection.
3. Read document detail.
4. Update document.
5. Delete document.
6. Realtime stream atau fetch data.

### Rekomendasi Rules Saat Development

```text
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /students/{studentId} {
      allow read, write: if request.auth != null;
    }
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
  }
}
```

Rules ini memastikan hanya user yang sudah login yang bisa membaca dan mengubah data mahasiswa.

---

## 11. GetX Requirements

GetX wajib digunakan untuk state management dan navigation.

### 11.1 State Management

Controller yang direkomendasikan:

1. `AuthController`
2. `StudentController`
3. `ThemeController` opsional
4. `NavigationController` opsional

### 11.2 Navigation

Gunakan named routes:

```text
/splash
/login
/register
/forgot-password
/home
/student-detail
/student-form
```

### 11.3 Dependency Injection

Gunakan binding agar controller rapi:

1. `AuthBinding`
2. `StudentBinding`
3. `HomeBinding`

### 11.4 GetX Reactive State

Contoh state yang direkomendasikan:

1. `RxBool isLoading`
2. `RxList<StudentModel> students`
3. `RxString searchQuery`
4. `Rxn<User> firebaseUser`
5. `Rx<StudentModel?> selectedStudent`

### 11.5 GetX UI Feedback

Gunakan:

1. `Get.snackbar()` untuk sukses/error.
2. `Get.dialog()` untuk konfirmasi delete/logout.
3. `Get.toNamed()` untuk pindah halaman.
4. `Get.offAllNamed()` untuk mengganti seluruh stack setelah login/logout.

---

## 12. Rekomendasi Struktur Folder

```text
lib/
  app/
    bindings/
      auth_binding.dart
      student_binding.dart
    controllers/
      auth_controller.dart
      student_controller.dart
      theme_controller.dart
    data/
      models/
        student_model.dart
        user_model.dart
      repositories/
        auth_repository.dart
        student_repository.dart
    modules/
      splash/
        splash_page.dart
      auth/
        login_page.dart
        register_page.dart
        forgot_password_page.dart
      home/
        home_page.dart
      student/
        student_detail_page.dart
        student_form_page.dart
    routes/
      app_pages.dart
      app_routes.dart
    theme/
      app_colors.dart
      app_theme.dart
    widgets/
      custom_button.dart
      custom_text_field.dart
      student_card.dart
      statistic_card.dart
      confirm_dialog.dart
      loading_widget.dart
      empty_state_widget.dart
  firebase_options.dart
  main.dart
assets/
  images/
    logo_unib.png
```

---

## 13. UI/UX Requirements

## 13.1 Design Direction

Desain aplikasi harus terlihat:

1. Modern.
2. Profesional.
3. Akademik.
4. Bersih.
5. Responsif.
6. Konsisten.
7. Tidak terlalu ramai.
8. Menggunakan animasi secukupnya, bukan berlebihan.

## 13.2 Color Palette

Warna utama:

| Fungsi | Warna | Hex |
|---|---|---|
| Navy utama | Deep Navy | `#071A3D` |
| Navy sekunder | Royal Navy | `#0B2A5B` |
| Biru aksen | Academic Blue | `#114B9A` |
| Kuning utama | Golden Yellow | `#FFD529` |
| Kuning aksen | Warm Yellow | `#FFB800` |
| Putih | White | `#FFFFFF` |
| Abu background | Soft Gray | `#F5F7FB` |
| Teks utama | Dark Text | `#101828` |
| Teks sekunder | Muted Text | `#667085` |

### Rekomendasi Gradient

Gradient utama:

```text
#071A3D → #0B2A5B → #114B9A
```

Gradient kuning untuk aksen button:

```text
#FFD529 → #FFB800
```

Gradient hero card:

```text
#071A3D → #114B9A dengan aksen radial #FFD529 opacity 0.18
```

## 13.3 Typography

Rekomendasi font:

1. `Poppins` untuk heading.
2. `Inter` untuk body text.
3. Alternatif: `Plus Jakarta Sans` untuk seluruh aplikasi.

Rekomendasi package:

```yaml
google_fonts: ^6.2.1
```

## 13.4 Layout Web Chrome

Karena aplikasi dijalankan melalui Chrome, layout harus nyaman untuk ukuran web.

Rekomendasi:

1. Gunakan max width untuk form login sekitar 420–480 px.
2. Gunakan center layout untuk halaman auth.
3. Gunakan responsive grid pada dashboard.
4. Pada layar lebar, card mahasiswa dapat tampil dalam grid 2–3 kolom.
5. Pada layar kecil, card mahasiswa tampil satu kolom.
6. Gunakan padding minimal 24 px pada desktop.
7. Gunakan rounded corner 20–28 px.
8. Gunakan shadow lembut.

## 13.5 Komponen Visual Utama

### Auth Card

1. Background putih semi-transparan.
2. Border halus.
3. Shadow lembut.
4. Logo di atas.
5. Button gradasi kuning.
6. Link berwarna kuning atau biru terang.

### Dashboard Header

1. Card besar dengan gradient navy.
2. Logo transparan sebagai watermark opacity rendah.
3. Greeting user.
4. Statistik ringkas.
5. Tombol tambah data.

### Student Card

1. Avatar inisial mahasiswa.
2. Nama mahasiswa.
3. NPM/NIM.
4. Program studi.
5. Status badge.
6. Icon arrow/detail.
7. Hover animation untuk web.

### Form Page

1. Form dalam card putih.
2. Field dikelompokkan:
   - Identitas mahasiswa.
   - Akademik.
   - Kontak.
   - Alamat.
3. Tombol simpan sticky atau berada di bagian bawah form.

---

## 14. Animation Requirements

Animasi harus profesional, halus, dan tidak mengganggu.

### Animasi yang Direkomendasikan

1. Fade in pada splash screen.
2. Scale animation pada logo saat splash.
3. Slide fade pada auth card.
4. Hover elevation pada student card di Chrome.
5. Button press animation.
6. Smooth transition antar halaman.
7. Shimmer loading untuk daftar mahasiswa.
8. Animated empty state.

### Package Animasi yang Direkomendasikan

```yaml
animate_do: ^3.3.4
flutter_animate: ^4.5.0
lottie: ^3.1.2
shimmer: ^3.0.0
```

Rekomendasi utama:

1. `flutter_animate` untuk animasi sederhana dan modern.
2. `shimmer` untuk loading list.
3. `lottie` opsional untuk empty state atau success animation.

---

## 15. Library / Package Requirements

Package wajib:

```yaml
get: ^4.6.6
firebase_core: ^3.6.0
firebase_auth: ^5.3.1
cloud_firestore: ^5.4.4
```

Package UI/UX yang direkomendasikan:

```yaml
google_fonts: ^6.2.1
flutter_animate: ^4.5.0
shimmer: ^3.0.0
lottie: ^3.1.2
iconsax: ^0.0.8
intl: ^0.19.0
```

Package tambahan yang berguna:

```yaml
form_validator: ^2.1.1
```

Catatan:

- Gunakan package secukupnya agar project tetap ringan.
- Package utama yang paling penting adalah Firebase, GetX, Google Fonts, Flutter Animate, dan Shimmer.

---

## 16. Functional Requirements

| Kode | Requirement | Prioritas |
|---|---|---|
| FR-01 | User dapat register menggunakan email dan password | Must Have |
| FR-02 | User dapat login menggunakan email dan password | Must Have |
| FR-03 | User dapat reset password melalui email | Must Have |
| FR-04 | User dapat logout | Must Have |
| FR-05 | User dapat melihat daftar mahasiswa | Must Have |
| FR-06 | User dapat menambah data mahasiswa | Must Have |
| FR-07 | User dapat melihat detail mahasiswa | Must Have |
| FR-08 | User dapat mengedit data mahasiswa | Must Have |
| FR-09 | User dapat menghapus data mahasiswa | Must Have |
| FR-10 | User dapat mencari data mahasiswa | Should Have |
| FR-11 | User dapat memfilter data mahasiswa | Should Have |
| FR-12 | Sistem menampilkan loading, empty, dan error state | Should Have |
| FR-13 | Sistem menyimpan createdAt dan updatedAt | Should Have |
| FR-14 | Sistem menggunakan GetX untuk state dan routing | Must Have |
| FR-15 | Sistem menggunakan Firebase untuk auth dan database | Must Have |

---

## 17. Non-Functional Requirements

| Kode | Requirement | Deskripsi |
|---|---|---|
| NFR-01 | Responsiveness | Aplikasi harus nyaman digunakan di Chrome dengan ukuran layar desktop maupun mobile. |
| NFR-02 | Performance | Loading data tidak boleh terasa berat untuk jumlah data kecil hingga sedang. |
| NFR-03 | Maintainability | Struktur folder harus modular dan mudah dipahami. |
| NFR-04 | Usability | User harus dapat memahami alur aplikasi tanpa instruksi tambahan. |
| NFR-05 | Security | Data hanya dapat diakses oleh user yang sudah login. |
| NFR-06 | Consistency | Warna, spacing, typography, dan komponen harus konsisten. |
| NFR-07 | Reliability | Error Firebase harus ditangani dengan pesan yang jelas. |
| NFR-08 | Code Quality | Kode tidak menumpuk dalam satu file dan tidak mencampur UI dengan logic database secara berlebihan. |

---

## 18. Business Rules

1. User harus login sebelum mengakses data mahasiswa.
2. Data mahasiswa wajib memiliki NPM/NIM unik.
3. Data tidak boleh disimpan jika field wajib kosong.
4. IPK harus berada pada rentang 0.00 sampai 4.00.
5. Semester harus berada pada rentang 1 sampai 14.
6. Angkatan harus berupa tahun masuk yang valid.
7. Data yang dihapus tidak dapat dikembalikan melalui aplikasi versi awal.
8. Semua proses create, update, dan delete harus menampilkan feedback ke user.

---

## 19. Validation Rules

| Field | Rule | Pesan Error |
|---|---|---|
| Nama | Wajib diisi, minimal 3 karakter | Nama mahasiswa wajib diisi |
| NPM/NIM | Wajib diisi, unik | NPM/NIM wajib diisi |
| Email | Format email valid | Email tidak valid |
| Telepon | Minimal 10 digit | Nomor telepon tidak valid |
| Fakultas | Wajib diisi | Fakultas wajib diisi |
| Jurusan | Wajib diisi | Jurusan wajib diisi |
| Program Studi | Wajib diisi | Program studi wajib diisi |
| Angkatan | Tahun valid | Angkatan tidak valid |
| Semester | 1–14 | Semester harus 1 sampai 14 |
| IPK | 0.00–4.00 | IPK harus 0.00 sampai 4.00 |
| Status | Wajib dipilih | Status wajib dipilih |
| Alamat | Wajib diisi | Alamat wajib diisi |

---

## 20. Error Handling

### Firebase Auth Error

| Kondisi | Pesan User |
|---|---|
| Email tidak ditemukan | Email belum terdaftar |
| Password salah | Password yang dimasukkan salah |
| Email sudah digunakan | Email sudah digunakan oleh akun lain |
| Password lemah | Password minimal 6 karakter |
| Format email salah | Format email tidak valid |
| Network error | Koneksi bermasalah, coba lagi |

### Firestore Error

| Kondisi | Pesan User |
|---|---|
| Gagal mengambil data | Data mahasiswa gagal dimuat |
| Gagal menambah data | Data mahasiswa gagal ditambahkan |
| Gagal mengubah data | Data mahasiswa gagal diperbarui |
| Gagal menghapus data | Data mahasiswa gagal dihapus |
| Permission denied | Anda tidak memiliki akses |

---

## 21. Screen List

| Screen | Route | Deskripsi |
|---|---|---|
| Splash Screen | `/splash` | Mengecek status login |
| Login Page | `/login` | Login user |
| Register Page | `/register` | Register user baru |
| Forgot Password Page | `/forgot-password` | Reset password |
| Home Page | `/home` | Dashboard dan daftar mahasiswa |
| Student Detail Page | `/student-detail` | Detail mahasiswa |
| Student Form Page | `/student-form` | Tambah dan edit mahasiswa |

---

## 22. Detail UI Per Halaman

## 22.1 Splash Screen UI

### Layout

1. Full screen gradient navy.
2. Logo di tengah.
3. Nama aplikasi di bawah logo.
4. Loading indicator kecil.

### Microcopy

- Title: “Data Mahasiswa”
- Subtitle: “Smart Academic Data Management”

---

## 22.2 Login Page UI

### Layout

1. Background gradient navy.
2. Auth card di tengah.
3. Logo di bagian atas card.
4. Input field dengan rounded corner.
5. Button login dengan gradient kuning.

### Microcopy

- Title: “Masuk ke Akun Anda”
- Subtitle: “Kelola data mahasiswa dengan mudah dan aman.”
- Button: “Masuk”
- Link: “Belum punya akun? Daftar”

---

## 22.3 Register Page UI

### Layout

1. Background gradient navy.
2. Auth card scrollable.
3. Field nama, email, password, konfirmasi password.
4. Button register.

### Microcopy

- Title: “Buat Akun Admin”
- Subtitle: “Daftar untuk mulai mengelola data mahasiswa.”
- Button: “Daftar Sekarang”

---

## 22.4 Forgot Password Page UI

### Layout

1. Background gradient navy.
2. Card kecil di tengah.
3. Icon mail atau lock.
4. Input email.
5. Button kirim reset link.

### Microcopy

- Title: “Lupa Password?”
- Subtitle: “Masukkan email Anda, kami akan mengirim link reset password.”
- Button: “Kirim Link Reset”

---

## 22.5 Home Page UI

### Layout Desktop Chrome

1. Top bar horizontal.
2. Logo dan nama aplikasi di kiri.
3. User email dan tombol logout di kanan.
4. Hero dashboard card.
5. Statistic cards dalam row.
6. Search dan filter di bawah statistik.
7. Grid/list card mahasiswa.
8. Floating action button di kanan bawah atau button utama di hero card.

### Microcopy

- Greeting: “Halo, Admin!”
- Heading: “Kelola Data Mahasiswa”
- Button: “Tambah Mahasiswa”
- Search placeholder: “Cari nama, NPM, prodi, atau jurusan...”

---

## 22.6 Detail Page UI

### Layout

1. Header gradient dengan nama mahasiswa.
2. Card informasi akademik.
3. Card informasi kontak.
4. Card alamat.
5. Tombol edit dan delete.

### Microcopy

- Button edit: “Edit Data”
- Button delete: “Hapus Data”
- Dialog title: “Hapus Data Mahasiswa?”
- Dialog message: “Data yang sudah dihapus tidak dapat dikembalikan.”

---

## 22.7 Student Form Page UI

### Layout

1. Header page.
2. Card form.
3. Section identitas.
4. Section akademik.
5. Section kontak.
6. Section alamat.
7. Button simpan.

### Microcopy

- Create title: “Tambah Mahasiswa”
- Update title: “Edit Data Mahasiswa”
- Create button: “Simpan Data”
- Update button: “Perbarui Data”

---

## 23. Route Flow

```text
Splash
  ├── user logged in → Home
  └── user not logged in → Login

Login
  ├── login success → Home
  ├── register link → Register
  └── forgot password link → Forgot Password

Register
  ├── register success → Home/Login
  └── login link → Login

Forgot Password
  └── back to login → Login

Home
  ├── tap student card → Student Detail
  ├── tap add button → Student Form Create
  └── logout → Login

Student Detail
  ├── tap edit → Student Form Update
  ├── delete success → Home
  └── back → Home

Student Form
  ├── save create success → Home
  └── save update success → Detail/Home
```

---

## 24. Recommended Implementation Plan

### Phase 1 — Setup Project

1. Buat project Flutter.
2. Jalankan project melalui Chrome.
3. Tambahkan Firebase ke project.
4. Generate `firebase_options.dart`.
5. Tambahkan dependency GetX dan Firebase.
6. Setup struktur folder.

### Phase 2 — Auth

1. Buat AuthController.
2. Buat Login Page.
3. Buat Register Page.
4. Buat Forgot Password Page.
5. Implement Firebase Authentication.
6. Implement auth state redirect.

### Phase 3 — Student CRUD

1. Buat StudentModel.
2. Buat StudentRepository.
3. Buat StudentController.
4. Implement read data dari Firestore.
5. Implement create data.
6. Implement detail data.
7. Implement update data.
8. Implement delete data.

### Phase 4 — UI/UX Enhancement

1. Buat tema warna.
2. Buat reusable widgets.
3. Tambahkan animasi.
4. Tambahkan shimmer loading.
5. Tambahkan empty state.
6. Optimalkan layout Chrome.

### Phase 5 — Testing & Finalization

1. Test login.
2. Test register.
3. Test forget password.
4. Test create mahasiswa.
5. Test read/list mahasiswa.
6. Test detail mahasiswa.
7. Test update mahasiswa.
8. Test delete mahasiswa.
9. Test logout.
10. Rapikan kode.
11. Buat dokumentasi singkat.

---

## 25. Success Metrics

Aplikasi dianggap berhasil jika:

1. Semua fitur wajib dari tugas besar tersedia.
2. Aplikasi dapat dijalankan melalui Chrome.
3. User dapat register, login, reset password, dan logout.
4. User dapat melakukan create, read, update, dan delete data mahasiswa.
5. Data tersimpan di Firebase.
6. GetX digunakan untuk state management dan navigation.
7. UI terlihat modern dan profesional.
8. Struktur kode rapi dan modular.
9. Tidak ada error besar saat demo.
10. Alur aplikasi mudah dipahami dosen atau penguji.

---

## 26. Acceptance Criteria Global

| Area | Acceptance Criteria |
|---|---|
| Auth | Login, register, forget password, dan logout berjalan menggunakan Firebase Authentication. |
| Database | Data mahasiswa tersimpan dan terbaca dari Firebase. |
| CRUD | Create, read, update, dan delete berjalan lengkap. |
| Detail Page | Setiap data mahasiswa dapat dibuka ke halaman detail. |
| GetX | Controller, routing, snackbar/dialog, dan state menggunakan GetX. |
| UI/UX | Tampilan konsisten dengan warna navy-kuning, profesional, dan responsif. |
| Code Quality | Folder modular, logic dipisahkan dari UI, naming jelas. |
| Chrome Run | Aplikasi dapat dijalankan di Chrome tanpa Android Studio. |

---

## 27. Risiko dan Mitigasi

| Risiko | Dampak | Mitigasi |
|---|---|---|
| Firebase belum terkonfigurasi untuk web | Aplikasi gagal run di Chrome | Pastikan app web Firebase dibuat dan `firebase_options.dart` benar |
| Rules Firestore terlalu ketat | CRUD gagal | Gunakan rules development yang mengizinkan user login |
| GetX tidak digunakan konsisten | Nilai GetX berkurang | Semua state dan navigation utama harus lewat GetX |
| UI terlalu sederhana | Nilai UI/UX kurang maksimal | Gunakan gradient, spacing, card, icon, dan animasi halus |
| Validasi form kurang lengkap | Data tidak rapi | Terapkan validator di semua field wajib |
| Struktur kode berantakan | Nilai kerapihan kode berkurang | Gunakan folder modular dan reusable widgets |

---

## 28. Checklist Sesuai Penilaian

## UI/UX — 15%

- Menggunakan warna navy dan kuning secara konsisten.
- Memiliki desain modern dan profesional.
- Layout rapi dan responsif untuk Chrome.
- Ada loading, empty, dan error state.
- Ada animasi profesional.
- Komponen reusable dan konsisten.

## Firebase — 25%

- Firebase Core sudah diinisialisasi.
- Firebase Authentication digunakan untuk login.
- Firebase Authentication digunakan untuk register.
- Firebase Authentication digunakan untuk forget password.
- Firestore atau Realtime Database digunakan untuk data mahasiswa.
- Rules database aman untuk user login.

## GetX — 20%

- GetMaterialApp digunakan.
- Routing menggunakan GetX named routes.
- Controller menggunakan GetxController.
- State menggunakan Rx dan Obx/GetX widget.
- Snackbar/dialog menggunakan GetX.
- Binding digunakan untuk dependency injection.

## CRUD — 30%

- Create data mahasiswa berjalan.
- Read/list data mahasiswa berjalan.
- Detail data mahasiswa berjalan.
- Update data mahasiswa berjalan.
- Delete data mahasiswa berjalan dengan konfirmasi.
- Data tersimpan dan berubah langsung di Firebase.

## Kerapihan Kode — 10%

- Folder rapi.
- Penamaan file konsisten.
- Model dipisah dari controller.
- Repository dipisah dari controller.
- Widget reusable digunakan.
- Tidak ada kode duplikat berlebihan.

---

## 29. Rekomendasi Nama Aplikasi

Beberapa pilihan nama:

1. **UNIB StudentHub**
2. **Student Data Center**
3. **SIMA UNIB**
4. **MahasiswaKu**
5. **UNIB Academic Data**

Rekomendasi terbaik untuk tampilan profesional:

**UNIB StudentHub**

Alasan:

1. Modern.
2. Mudah diingat.
3. Sesuai tema data mahasiswa.
4. Cocok dengan logo Universitas Bengkulu.
5. Cocok untuk desain navy-kuning.

---

## 30. Final Recommendation

Project ini sebaiknya dibuat sebagai aplikasi Flutter Web bernama **UNIB StudentHub**. Aplikasi menggunakan Firebase Authentication untuk login, register, dan forget password, serta Cloud Firestore untuk menyimpan data mahasiswa. GetX digunakan sebagai pusat state management, routing, dialog, snackbar, dan dependency injection.

Fokus utama pengerjaan harus diarahkan pada CRUD data mahasiswa karena memiliki bobot penilaian terbesar. Setelah CRUD stabil, lanjutkan dengan memperkuat implementasi Firebase dan GetX. UI/UX dibuat dengan warna biru navy dan kuning, logo transparan, layout profesional, card modern, animasi halus, dan responsive design untuk Chrome.

Dengan mengikuti PRD ini, aplikasi akan memenuhi seluruh aturan tugas besar dan tetap terlihat profesional saat demo.

