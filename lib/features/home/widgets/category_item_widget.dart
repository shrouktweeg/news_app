import 'package:flutter/material.dart';
import 'package:news_app/data/models/category_data.dart';


class CategoryItemWidget extends StatelessWidget {
  final CategoryData category;
  final int index;
  final void Function(CategoryData) onCategoryClicked;
  const CategoryItemWidget({super.key,required this.category,required this.index,required this.onCategoryClicked});

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return   InkWell(
      onTap: (){onCategoryClicked(category);},

      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius:  BorderRadius.only(
            bottomLeft:index%2==0?const Radius.circular(25) :Radius.zero,
            bottomRight:index%2==0?Radius.zero :const Radius.circular(25),
            topLeft: const Radius.circular(25),
            topRight: const Radius.circular(25),

          ),
          color: category.categoryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Image.asset(category.categoryImage)),
            Text(category.categoryName,style: theme.textTheme.titleLarge,)
          ],
        ),
      ),
    );
  }
}
