import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: "SysQube",
            style: TextStyle(
              fontFamily: 'Work Sans',
              fontSize: 34,
              fontWeight: FontWeight.w600,
              color: Color(0xFF3E3D3D),
            ),
          ),
          TextSpan(
            text: ".",
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.w600,
              color: Color(0xFF000000),
            ),
          ),
          TextSpan(
            text: "dev",
            style: TextStyle(
              fontFamily: 'Work Sans',
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1976CD),
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
