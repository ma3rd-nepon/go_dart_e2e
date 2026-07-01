import "package:flutter/material.dart";
import 'package:go_dart_e2e/theme/app_theme.dart';

class CustomButton extends StatelessWidget {
  final Text text;
  final VoidCallback _onPress;
  const CustomButton({super.key, required this.text, required this._onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPress,
      style: Theme.of(context).elevatedButtonTheme.style,
      child: text,
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback _onPress;
  final double? iconSize;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this._onPress,
    this.iconSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      iconSize: iconSize,
      onPressed: _onPress,
      style: Theme.of(context).iconButtonTheme.style,
    );
  }
}

class WindowsButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const WindowsButton({super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: AppColors.surfaceHover,
      onTap: onTap,
      child: Container(
        width: 46,
        height: 32,
        color: AppColors.surfaceTransparent,
        child: Icon(icon, size: 32, color: AppColors.surfaceIcon),
      ),
    );
  }
}

class LogoButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPress;

  const LogoButton({super.key, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: Theme.of(context).elevatedButtonTheme.style,
      child: Text(text)
    );
  }
}
