import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCounter extends StatefulWidget {
  final int initialValue;
  final ValueChanged<int>? onChanged;

  const CustomCounter({super.key, this.initialValue = 1, this.onChanged});

  @override
  State<CustomCounter> createState() => _CustomCounterState();
}

class _CustomCounterState extends State<CustomCounter> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.initialValue;
  }

  void _updateCount(int newCount) {
    setState(() {
      count = newCount;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(count);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      height: 35.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.add, size: 22),
            onPressed: () => _updateCount(count + 1),
          ),
          Text(
            '$count',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: const Icon(Icons.remove, size: 22),
            onPressed: () {
              if (count > 1) {
                _updateCount(count - 1);
              }
            },
          ),
        ],
      ),
    );
  }
}
