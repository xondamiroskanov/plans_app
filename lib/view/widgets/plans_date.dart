import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PlansDate extends StatelessWidget {
  final Function dateChoos;
  final DateTime nowDateChoos;
  final Function() nextDay;
  final Function() previousDay;
  PlansDate(this.dateChoos, this.nowDateChoos,this.nextDay,this.previousDay);

  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            previousDay();
          },
          icon: const Icon(
            Icons.arrow_left,
            size: 36,
          ),
        ),
        TextButton(
          onPressed: () {
            dateChoos(context);
          },
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontFamily: GoogleFonts.montserrat().fontFamily),
              children: [
                TextSpan(
                  text: "${DateFormat.EEEE().format(nowDateChoos)} ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "${DateFormat('d MMM').format(nowDateChoos)}",
                  style: GoogleFonts.montserrat(),
                ),
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            nextDay();
          },
          icon: const Icon(
            Icons.arrow_right,
            size: 36,
          ),
        ),
      ],
    );
  }
}
