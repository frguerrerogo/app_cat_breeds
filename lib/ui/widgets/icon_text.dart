import 'package:app_cat_breeds/config/theme/colors.dart';
import 'package:app_cat_breeds/config/theme/text_style.dart';
import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  const IconText({
    super.key,
    required this.textTitle,
    required this.text,
    required this.icon,
    this.width = double.infinity,
  });

  final String textTitle;
  final String text;
  final IconData icon;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.primaryColorWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: AppColors.primaryColorApp,
            size: 20,
          ),
          const SizedBox(width: 5.0),
          Text(
            textTitle,
            style: AppTextStyle.labelMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(width: 5.0),
          Expanded(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.labelMedium,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
