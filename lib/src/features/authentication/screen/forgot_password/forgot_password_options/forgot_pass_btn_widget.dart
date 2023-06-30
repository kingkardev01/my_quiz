import 'package:flutter/material.dart';

class ForgotPassBtnWidget extends StatelessWidget {
  final IconData icon;
  final String textTitle1;
  final String textTitle2;
  final VoidCallback onTap;

  const ForgotPassBtnWidget({
    super.key, required this.icon, required this.textTitle1, required this.textTitle2, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(15.0))
        ),
        child: Row(
          children: [
            Icon(icon,size: 60,),
            const SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(textTitle1,style: Theme.of(context).textTheme.titleLarge,),
                Text(textTitle2,style: Theme.of(context).textTheme.titleSmall,),
              ],
            )
          ],
        ),

      ),
    );
  }
}