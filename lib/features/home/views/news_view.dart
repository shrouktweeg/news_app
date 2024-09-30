import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/data/models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {

    var theme=Theme.of(context);
    var mediaQuery=MediaQuery.of(context).size;
    var arg=ModalRoute.of(context)?.settings.arguments as Article;
    String urlImage=arg.urlToImage;
    Uri url=Uri.parse(arg.url);
    DateTime now = DateTime.parse(arg.publishedAt);
    String formattedDate = DateFormat('dd/MM/yyyy - HH:mm:ss').format(now);
    return Container(
        decoration: const BoxDecoration(
        color: Colors.white,
        image:
        DecorationImage(image: AssetImage('assets/images/pattern.png'))),
    child: Scaffold(
    backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
         arg.author
         , style: theme.textTheme.titleSmall!.copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 5),
        child: ListView(
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
           const SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(arg.author,style: theme.textTheme.titleMedium!.copyWith(fontSize: 12,color: const Color(0XFF79828B)),),
            ),
            const SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 17.0,right: 10),
              child: Text(arg.title,style: theme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500,fontSize: 15,color: const Color(0XFF42505C)),),
            ),
            const SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.only(right: 18.0,left: 18.0),
              child: Text(formattedDate,textAlign: TextAlign.end,style: theme.textTheme.titleMedium?.copyWith(color: const Color(0XFFA3A3A3)),),
            ),
            const SizedBox(height: 10,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 0,vertical: 20),
             padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white70,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(arg.description,style: theme.textTheme.titleMedium?.copyWith(fontSize: 16,color: const Color(0XFF42505C)),),
              const SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.only(right: 2.0,left: 2),
                    child: InkWell(
                      onTap:  () async{
                        await launchUrl(url,
                            mode: LaunchMode.inAppWebView);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('View Full Article',textAlign: TextAlign.end,style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),),

                                  const Icon(Icons.arrow_right,size: 25,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )

          ]
            ),
      ),
    ),
    );
  }


  }

