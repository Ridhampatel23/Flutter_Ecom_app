 import 'package:ecom_store/common/widgets/shimmers/shimmer.dart';
import 'package:ecom_store/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';

class ecomCategoryShimmer extends StatelessWidget {
   const ecomCategoryShimmer({super.key,
   this.itemCount = 6,
   });

   final int itemCount;

   @override
   Widget build(BuildContext context) {
     return SizedBox(
       height: 80,
       child: ListView.separated( separatorBuilder: (_,__) => const SizedBox(width: ecomSizes.spaceBtwnItems), itemCount: itemCount,
       itemBuilder: (_,__){
         return const Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             /// Image
             ecomShimmerEffect(width: 55, height: 55,radius: 55),
             SizedBox(height: ecomSizes.spaceBtwnItems / 2),

             /// Text
             ecomShimmerEffect(width: 55, height: 8),

           ],
         );
       },)
     );
   }
 }
