import 'package:flutter/material.dart';
import 'package:jv_app/resources/app_theme.dart';

class UploadDocumentWidget extends StatelessWidget {
  final Widget? innerWidget;
  final onTap;
  final String name;
  const UploadDocumentWidget(
      {Key? key, this.innerWidget, required this.name, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.greyColor),
            ),
            child:
                Center(child: innerWidget ?? const Icon(Icons.upload_outlined)),
          ),
        ),
        SizedBox(height: 6),
        Text(
          name,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
