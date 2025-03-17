import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String text; 

  const MenuItem({
    Key? key,
    required this.icon,
    required this.text, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 24),
          SizedBox(width: 15),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Raleway',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
