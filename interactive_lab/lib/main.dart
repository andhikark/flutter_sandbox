import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ParentWidget manages the state for TapboxB.

//------------------------ ParentWidget --------------------------------

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TapboxA(
            active: _active,
            onChanged: _handleTapboxChanged,
          ),
          TapboxC(
            active: _active,
            onChanged: _handleTapboxChanged,
          ),
        ],
      ),
    );
  }
}

class TapboxA extends StatelessWidget {
  const TapboxA({
    super.key,
    this.active = false,
    required this.onChanged,
  });

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class TapboxC extends StatefulWidget {
  const TapboxC({
    super.key,
    this.active = false,
    required this.onChanged,
  });

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  State<TapboxC> createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // This example adds a green border on tap down.
    // On tap up, the square changes to the opposite state.
    return GestureDetector(
      onTapDown: _handleTapDown, // Handle the tap events in the order that
      onTapUp: _handleTapUp, // they occur: down, up, tap, cancel
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? Border.all(
                  color: Colors.teal[700]!,
                  width: 10,
                )
              : null,
        ),
        child: Center(
          child: Text(widget.active ? 'Active' : 'Inactive',
              style: const TextStyle(fontSize: 32, color: Colors.white)),
        ),
      ),
    );
  }
}

// //------------------------- TapboxB ----------------------------------

// class TapboxB extends StatelessWidget {
//   const TapboxB({
//     super.key,
//     this.active = false,
//     required this.onChanged,
//   });

//   final bool active;
//   final ValueChanged<bool> onChanged;

//   void _handleTap() {
//     onChanged(!active);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _handleTap,
//       child: Container(
//         width: 200,
//         height: 200,
//         decoration: BoxDecoration(
//           color: active ? Colors.lightGreen[700] : Colors.grey[600],
//         ),
//         child: Center(
//           child: Text(
//             active ? 'Active' : 'Inactive',
//             style: const TextStyle(fontSize: 32, color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }
// }
// // TapboxA manages its own state.

// //------------------------- TapboxA ----------------------------------

// class TapboxA extends StatefulWidget {
//   const TapboxA({super.key});

//   @override
//   State<TapboxA> createState() => _TapboxAState();
// }

// class _TapboxAState extends State<TapboxA> {
//   bool _active = false;
//   void _handleTap() {
//     setState(() {
//       _active = !_active;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _handleTap,
//       child: Container(
//         width: 200,
//         height: 200,
//         decoration: BoxDecoration(
//           color: _active ? Colors.lightGreen[700] : Colors.grey[600],
//         ),
//         child: Center(
//           child: Text(
//             _active ? 'Activate' : 'Inactivate',
//             style: const TextStyle(fontSize: 32, color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }
// }

//------------------------- MyApp ----------------------------------

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo'),
        ),
        body: const Center(
          child: ParentWidget(),
        ),
      ),
    );
  }
}
