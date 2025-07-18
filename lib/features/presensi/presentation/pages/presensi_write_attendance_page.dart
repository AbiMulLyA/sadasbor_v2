import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class PresensiWriteAttendancePage extends HookWidget {
  const PresensiWriteAttendancePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Placeholder data - Anda akan menggantinya dengan data aktual
    const String nama = "Ahmad Abi Mulya, S.Kom.";
    const String id = "123456789";
    const String imageUrl =
        'https://fastly.picsum.photos/id/1/5000/3333.jpg?hmac=Asv2DU3rA_5D1xSe22xZK47WEAN0wjWeFOhzd13ujW4'; // Ganti dengan URL gambar yang valid
    const String alamatMaps =
        "M43R+VXC, Cintaraja, Kecamatan Singaparna, Kabupaten Tasikmalaya";
    const String jamValue = "07:28:23";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        // Hilangkan shadow AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            print("Tombol back ditekan");
            context.pop();
          },
        ),
        title: Text(
          "Catat Kehadiran",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // Konten utama rata tengah
          children: <Widget>[
            // User Info Section (Nama, ID, Avatar - Rata Tengah)
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  nama,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  "200109102025051002",
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                CachedNetworkImage(
                  imageUrl: imageUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => const CircleAvatar(
                    radius: 40,
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const CircleAvatar(
                    radius: 40,
                    child: Icon(Icons.person, size: 40),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 54),
      
            // Jam Section (Rata Tengah)
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Divider(color: Colors.grey, thickness: 1),
                ),
                const SizedBox(height: 4),
                Text(
                  jamValue,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 54),
      
            // Card Alamat Maps
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.grey[100],
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.blue[600],
                        size: 28,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          alamatMaps,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
      
            // Lokasi Tidak Tepat Section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Lokasi tidak tepat? ",
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                InkWell(
                  onTap: () {
                    // TODO: Logika untuk perbaharui lokasi
                    print("Perbaharui Lokasi diklik");
                  },
                  child: Text(
                    "Perbaharui Lokasi",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue[700],
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton.icon(
            icon: const Icon(Icons.login, color: Colors.white),
            label: Text(
              "Submit $title",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            onPressed: () {
              print("Submit Jam ditekan");
              context.pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[700],
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
      ),
    );
  }
}
