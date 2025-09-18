TECH : 

| Aspek                         | Kenapa Bagus                                                                                            |
| ----------------------------- | ------------------------------------------------------------------------------------------------------- |
| **Multi-platform Frontend**   | Flutter mendukung desktop, mobile, dan web → satu codebase, lebih mudah maintenance                     |
| **Backend Go + Fiber**        | Ringan, performa tinggi, cocok untuk high-concurrency, mendukung REST & WebSocket                       |
| **Real-time update**          | WebSocket + RabbitMQ → broadcast event real-time ke semua client, cocok untuk dashboard atau notifikasi |
| **Message broker (RabbitMQ)** | Memisahkan task queue & broadcast event dari backend → scalable dan reliable                            |
| **Database MySQL**            | Relational DB yang stabil, cocok untuk data structured                                                  |
| **Optional caching (Redis)**  | Bisa mempercepat query berat seperti laporan tanpa menambah kompleksitas utama                          |
| **Load balancing (Nginx)**    | Membuat backend lebih scalable, bisa handle banyak client sekaligus                                     |
| **Deployment via Docker**     | Memudahkan scaling, CI/CD, isolasi environment → lebih mudah maintenance dan deployment                 |


| Lapisan          | Teknologi                        | Fungsi / Catatan                                                        |
| ---------------- | -------------------------------- | ----------------------------------------------------------------------- |
| Database         | MySQL                            | Penyimpanan data utama (user, transaksi, laporan, dsb.)                 |
| Cache (opsional) | Redis                            | Untuk cache data berat seperti laporan agar response lebih cepat        |
| Backend          | Go + Fiber                       | REST API & WebSocket server                                             |
| Load Balancer    | Nginx                            | Distribusi traffic REST & WebSocket, SSL termination, WebSocket upgrade |
| Message Broker   | RabbitMQ                         | Queue / pub-sub / broadcast event real-time antar service               |
| Realtime         | WebSocket                        | Push update real-time ke Flutter client                                 |
| Frontend         | Flutter (Web / Mobile / Desktop) | UI, konsumsi REST + WebSocket                                           |
| Deployment       | Docker                           | Containerize backend & frontend web, memudahkan scaling & CI/CD         |