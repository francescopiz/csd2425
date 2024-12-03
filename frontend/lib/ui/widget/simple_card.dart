import 'package:flutter/material.dart';

class SimpleCard extends StatefulWidget {
  final String title;

  const SimpleCard({
    super.key,
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                const Icon(Icons.arrow_forward_ios_rounded, size: 15.0),
              ],
            )
          ),
        ),
      ),
    );
  }
}
