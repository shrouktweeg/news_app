import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/config/page_routes_name.dart';
import 'package:news_app/data/models/article_model.dart';

class ArticleViewDetailsWidget extends StatelessWidget {
  final Article articleList;
  const ArticleViewDetailsWidget({super.key,required this.articleList});



  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.parse(articleList.publishedAt);
    String formattedDate = DateFormat('dd/MM/yyyy - HH:mm:ss').format(now);
  String urlImage=articleList.urlToImage;
    var mediaQuery=MediaQuery.of(context).size;
    var theme=Theme.of(context);
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, PageRoutesName.news,arguments: articleList);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: urlImage,
              child: Container(
                height: 230,
                width: mediaQuery.width,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(16),
                ),

                child: CachedNetworkImage(
                  imageUrl:urlImage,
                  imageBuilder: (context, imageProvioder) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(image: imageProvioder, fit: BoxFit.fill),
                      ),
                    );
                  },
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error,size: 45,color: Colors.grey,),
                ),
              ),
            ),
            Text(articleList.author,style: theme.textTheme.titleMedium!.copyWith(fontSize: 12,color: const Color(0XFF79828B)),),
            const SizedBox(height: 2,),
            Text(articleList.title,style: theme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500,fontSize: 14,color: const Color(0XFF42505C)),),
const SizedBox(height: 5,),
            Text(formattedDate,textAlign: TextAlign.end,style: theme.textTheme.titleMedium?.copyWith(color: const Color(0XFFA3A3A3)),)

          ],
        ),
      ),
    );

  }
}
