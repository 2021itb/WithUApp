import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:with_u/ui/color_styles.dart';
import 'package:with_u/ui/text_styles.dart';

final class NameTextfield extends StatefulWidget {
  final String name;
  final String hintText;
  final ValueChanged<String>? onChanged;

  const NameTextfield({
    super.key,
    required this.name,
    required this.hintText,
    this.onChanged,
  });

  @override
  State<StatefulWidget> createState() => _NameTextFieldState();
}

final class _NameTextFieldState extends State<NameTextfield> {
  final TextEditingController _controller = TextEditingController();
  Color _borderColor = ColorStyles.darkLightest;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateBorderColor);
  }

  @override
  void dispose() {
    _controller.removeListener(_updateBorderColor);
    _controller.dispose();
    super.dispose();
  }

  void _updateBorderColor() {
    setState(() {
      _borderColor = _controller.text.isNotEmpty
          ? ColorStyles.primary100
          : ColorStyles.darkLightest;
    });

    widget.onChanged?.call(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.name,
          style: TextStyles.headingH5,
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _borderColor,
                width: 1.5,
              )),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyles.bodyM,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 16,
                )),
            onChanged: widget.onChanged,
          ),
        )
      ],
    );
  }
}
