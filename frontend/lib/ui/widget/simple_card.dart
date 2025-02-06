import 'package:flutter/material.dart';

class SimpleCard extends StatefulWidget {
  final String title;
  final String subtitle;

  const SimpleCard({
    super.key,
    this.subtitle = '',
    required this.title,
  });

  @override
  State<StatefulWidget> createState() {
    return _SimpleCardState();
  }
}

class _SimpleCardState extends State<SimpleCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(
              color: Colors.orange,
              width: 2.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (widget.subtitle != '')
                      Text(
                        widget.subtitle,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                  ],
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

