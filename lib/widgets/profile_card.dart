import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String kelas;
  final String absen;
  final String imageUrl;

  const ProfileCard({
    super.key,
    required this.name,
    required this.kelas,
    required this.absen,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    const double avatarRadius = 50;
    final textStyle = GoogleFonts.poppins(
      fontSize: 16,
      color: Colors.grey[800],
      fontWeight: FontWeight.w500,
    );

    return Container(
      width: 260,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FB),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300, width: 1),
        

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: avatarRadius,
            backgroundImage: NetworkImage(imageUrl),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: textStyle.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 4),
                Text(kelas, style: textStyle.copyWith(color: Colors.grey[600])),
                Text("Absen : $absen",
                    style: textStyle.copyWith(color: Colors.grey[600])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
