import 'package:flutter/material.dart';

class ReusableMaterialBtn extends StatelessWidget {
  final double width;
  final String text;
  final Function function;
  final Color color;
  const ReusableMaterialBtn({
     Key? key,
    required this.width,
    required this.text,
    required this.function,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(5.0),
      color: color,
      child: InkWell(
          borderRadius: BorderRadius.circular(5.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * width,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
          ),
          onTap: () => function(),
      ),
    );
  }
}
