import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
   NewsCard({super.key , required this.imgUrl , required this.title});
  String imgUrl;
  String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(17),
          child: Image.network(
            imgUrl, 
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
               
                return child;
              } git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/osammma53728/News-App-Flutter.git
git push -u origin main
              
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                      : null,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8), 
         Text(title, style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
