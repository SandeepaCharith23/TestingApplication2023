import 'package:ecommerseapp2023/src/features/authentication/models/dashboard_categories_model.dart';
import 'package:flutter/material.dart';

class DashBoardCategories extends StatelessWidget {
  const DashBoardCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = DashboardCategoriesModel.categorieslist;
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: list[index].onPress,
          child: SizedBox(
            height: 200,
            width: 200,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber,
                  ),
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Text(
                      list[index].title,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.apply(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        list[index].heading,
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        list[index].subHeading,
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        // children: [
        //   SizedBox(
        //     height: 200,
        //     width: 200,
        //     child: Row(
        //       children: [
        //         Container(
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: Colors.amber,
        //           ),
        //           width: 50,
        //           height: 50,
        //           child: Center(
        //             child: Text(
        //               "AB",
        //               style: Theme.of(context)
        //                   .textTheme
        //                   .headline6
        //                   ?.apply(color: Colors.white),
        //             ),
        //           ),
        //         ),
        //         const SizedBox(
        //           width: 10,
        //         ),
        //         Flexible(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Text(
        //                 "ABC asdadadadada",
        //                 style: Theme.of(context).textTheme.subtitle1,
        //                 overflow: TextOverflow.ellipsis,
        //               ),
        //               Text(
        //                 "DEF",
        //                 style: Theme.of(context).textTheme.subtitle1,
        //                 overflow: TextOverflow.ellipsis,
        //               ),
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   ),

        //   ///////
        //   SizedBox(
        //     height: 200,
        //     width: 200,
        //     child: Row(
        //       children: [
        //         Container(
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: Colors.amber,
        //           ),
        //           width: 50,
        //           height: 50,
        //           child: Center(
        //             child: Text(
        //               "AB",
        //               style: Theme.of(context)
        //                   .textTheme
        //                   .headline6
        //                   ?.apply(color: Colors.white),
        //             ),
        //           ),
        //         ),
        //         const SizedBox(
        //           width: 10,
        //         ),
        //         Flexible(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Text(
        //                 "ABC asdadadadada",
        //                 style: Theme.of(context).textTheme.subtitle1,
        //                 overflow: TextOverflow.ellipsis,
        //               ),
        //               Text(
        //                 "DEF",
        //                 style: Theme.of(context).textTheme.subtitle1,
        //                 overflow: TextOverflow.ellipsis,
        //               ),
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ],
      ),
    );
  }
}
