import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;    
  final Color? color;       
  final Color? textColor;     

  const PrimaryButton({
    required this.text,
    required this.onPressed,
    this.icon,
    this.color,
    this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Theme.of(context).primaryColor, 
        foregroundColor: textColor ?? Colors.white,              
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: icon != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: Theme.of(context).textTheme.bodySmall?.fontSize ?? 16),
                SizedBox(width: 8),
                Text(text, style: Theme.of(context).textTheme.bodySmall),
              ],
            )
          : Text(text, style: Theme.of(context).textTheme.bodySmall),
    );
  }
}
