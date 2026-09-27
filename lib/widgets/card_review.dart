import 'package:flutter/material.dart';

class CardReview extends StatelessWidget {
  final String name;
  final String date;
  final String review;

  const CardReview({
    super.key,
    required this.name,
    required this.date,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 150,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Text(
                review,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Text(name, style: TextStyle(fontWeight: FontWeight.w500)),
          Text(date, style: TextStyle(color: Colors.grey.shade600)),
        ],
      ),
    );
  }
}
