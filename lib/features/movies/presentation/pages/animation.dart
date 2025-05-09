// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
//
// class AnimationPage extends StatefulWidget {
//   const AnimationPage({super.key});
//
//   @override
//   State<AnimationPage> createState() => _AnimationPageState();
// }
//
// class _AnimationPageState extends State<AnimationPage> {
//
//   double _opacity = 1;
//   double _margin = 0;
//   double _width = 200;
//   Color _color = Colors.deepPurple;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: AnimatedContainer(
//             duration: const Duration(seconds: 1),
//             margin: EdgeInsets.all(_margin),
//             width: _width,
//             color: _color,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton(
//                   onPressed: () => setState(() => _margin = 50,
//                   ),
//                   child: const Text('animate margin'),
//               ),
//               ElevatedButton(
//                 onPressed: () => setState(() => _color = Colors.pinkAccent,
//                 ),
//                 child: const Text('animate color'),
//               ),
//               ElevatedButton(
//                 onPressed: () => setState(() => _width = 500,
//                 ),
//                 child: const Text('animate width'),
//               ),
//               ElevatedButton(
//                 onPressed: () => setState(() => _opacity = 0,
//                 ),
//                 child: const Text('animate opacity'),
//               ),
//               AnimatedOpacity(
//                 opacity: _opacity,
//                 duration: const Duration(seconds: 2),
//                 child: const Text('hide me',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


class ScreenTitle extends StatelessWidget {
  final String text;
  const ScreenTitle({required Key key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(milliseconds: 1800),
        builder: (BuildContext context, double _val, Widget? child)
        {
          return Opacity
            (
            opacity: _val,
            child: Padding(
              padding: EdgeInsets.only(top: _val * 20),
              child: child,
            ),
          );
        },
      child: Center(
        child: Text(text, style: const TextStyle(
          fontSize: 36,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        ),
      ),
    );
  }
}

