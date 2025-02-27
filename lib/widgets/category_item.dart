import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final int color;
  final int icon;

  const CategoryItem({
    Key? key,
    required this.name,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Color(color).withOpacity(0.2),
        child: Icon(
          IconData(icon, fontFamily: 'MaterialIcons'),
          color: Color(color),
        ),
      ),
      title: Text(name),
    );
  }
}