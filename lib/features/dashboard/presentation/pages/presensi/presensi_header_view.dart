import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:cached_network_image/cached_network_image.dart'; // Import package
import 'package:sadasbor_v2/config/theme/theme.dart'; // Pastikan path ini benar

class PresensiHeaderView extends HookWidget {
  const PresensiHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    const double kDefLeftRight = 16.0;
    const String imageUrl = 'https://fastly.picsum.photos/id/1/5000/3333.jpg?hmac=Asv2DU3rA_5D1xSe22xZK47WEAN0wjWeFOhzd13ujW4'; // Ganti dengan URL gambar avatar Anda
    // Atau jika URL bisa null:
    // String? imageUrl;
    // imageUrl = null; // Contoh jika tidak ada URL

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(kDefLeftRight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar Lingkaran
          SizedBox(
            width: 50,
            height: 50, // Pastikan width dan height sama untuk lingkaran sempurna jika menggunakan ClipOval
            child: (imageUrl.isNotEmpty)
                ? ClipOval( // Menggunakan ClipOval untuk memastikan bentuk lingkaran
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover, // Agar gambar mengisi lingkaran
                placeholder: (context, url) => Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300], // Warna placeholder
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) {
                  print("CachedNetworkImage error: $error, URL: $url"); // <-- Tambahkan ini
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.grey[600],
                      size: 30,
                    ),
                  );
                },
              ),
            )
                : Container( // Tampilan jika tidak ada imageUrl (avatar default)
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.person,
                color: Colors.grey[600],
                size: 30,
              ),
            ),
          ),
          SizedBox(width: kDefLeftRight / 2),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Ahmad Abi Mulya, S.Kom.',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '200109102025051002',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Pranata Komputer Ahli Pertama',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Senin, 30 Juni 2025',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '07:28:23 WIB',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}