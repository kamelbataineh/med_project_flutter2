import 'package:flutter/material.dart';

class CardHousing extends StatefulWidget {
////////////////////////////////////////
  ///////
  String taskTitle;
  bool isCheck;
  Function changeFun;
  Function delete;
  int index;

  ///////
////////////////////////////////////////

////////////////////////////////////////
  ///////
  CardHousing(
      {required this.taskTitle,
        required this.isCheck,
        required this.index,
        required this.changeFun,
        required this.delete});

  ///////
////////////////////////////////////////

  @override
  State<CardHousing> createState() => _CardHousingState();
}

class _CardHousingState extends State<CardHousing> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 100,
        child: Card(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.taskTitle,
                style: TextStyle(
                    decoration:
                    widget.isCheck ? TextDecoration.lineThrough : null,
                    decorationThickness: 4, // سمك الخط المرسوم فوق النص
                    color: Colors.cyan),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: widget.isCheck
                          ? Icon(Icons.check_box)
                          : Icon(Icons.check_box_outline_blank),
                      onTap: () {
                        widget.changeFun(widget.index);
                      },
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        widget.delete(widget.index);
                      },
                      icon: Icon(Icons.delete))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
