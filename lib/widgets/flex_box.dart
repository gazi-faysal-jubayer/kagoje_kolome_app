import 'package:flutter/material.dart';

class FlexBox extends StatelessWidget {
  final String text;
  final double progress;

  const FlexBox({
    required this.text,
    required this.progress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF7EDE3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  text,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Ador Noirrit',
                    fontSize: 16,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add your download button action here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF94DAB0),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(8),
                ),
                child: const Icon(Icons.download, color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[300],
            minHeight: 10,
            borderRadius: BorderRadius.circular(12),
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}