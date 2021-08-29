import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({
    Key? key,
    required this.label,
    required this.info,
  }) : super(key: key);

  final String label;
  final String info;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width * .3,
            child: Text(
              '$label: ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                fontFamily: 'Google',
              ),
            ),
          ),
          Text(
            info,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Google',
            ),
          )
        ],
      ),
    );
  }
}
