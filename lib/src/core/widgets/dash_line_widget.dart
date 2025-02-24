// import 'package:flutter/material.dart';
// import 'package:dotted_line/dotted_line.dart';

// class DashLineWidget extends StatelessWidget {
//   const DashLineWidget({
//     super.key,
//     this.isHorizontal = true,
//   });

//   final bool isHorizontal;

//   @override
//   Widget build(BuildContext context) {
//     return DottedLine(
//       dashLength: 4,
//       dashGapLength: 4,
//       lineThickness: 4,
//       direction: isHorizontal ? Axis.horizontal : Axis.vertical,
//       dashColor: Colors.redAccent,
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:dotted_border/dotted_border.dart';

// class DashBorderWidget extends StatelessWidget {
//   const DashBorderWidget({
//     super.key,
//     required this.child,
//   });

//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return DottedBorder(
//       borderPadding: const EdgeInsets.all(2),
//       borderType: BorderType.RRect,
//       radius: const Radius.circular(18),
//       dashPattern: const [4, 4],
//       strokeWidth: 4,
//       color: Colors.redAccent,
//       child: child,
//     );
//   }
// }
