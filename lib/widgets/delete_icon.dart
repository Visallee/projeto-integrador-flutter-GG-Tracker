import 'package:flutter/material.dart';
import 'package:gg_tracker_workspace/theme/app_colors.dart';

class DeleteIcon extends StatelessWidget {
  final VoidCallback onPressed;

  const DeleteIcon({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.delete_outline, color: AppColors.perigo),
    );
  }
}
