import 'package:flutter/material.dart';

Future<T?> customBottomSheet<T>({
  required BuildContext context,
  required Widget child,
  bool isDismissible = true,
  bool enableDrag = true,
}) async {
  return await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (ctx) {
      return child;
    },
    isDismissible: isDismissible,
    enableDrag: enableDrag,
  );
}

// Future<T?> cupertinoSheet<T>({
//   required BuildContext context,
//   required Widget title,
//   required List<Widget> children,
// }) async {
//   final size = MediaQuery.of(context).size;
//   if (Platform.isIOS) {
//     return await showCupertinoModalPopup(
//       context: context,
//       builder: (ctx) {
//         return CupertinoActionSheet(
//           title: title,
//           actions: List.generate(
//             children.length,
//             (index) => CupertinoActionSheetAction(
//               onPressed: () {},
//               child: children[index],
//             ),
//           ),
//           cancelButton: CupertinoActionSheetAction(
//             child: Text(AppTranslations.of(context).cancel),
//             onPressed: () {
//               Navigator.of(context, rootNavigator: true).pop();
//             },
//           ),
//         );
//       },
//     );
//   } else {
//     return await showModalBottomSheet(
//       context: context,
//       builder: (ctx) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             title,
//             ...children,
//           ],
//         );
//       },
//     );
//   }
// }
