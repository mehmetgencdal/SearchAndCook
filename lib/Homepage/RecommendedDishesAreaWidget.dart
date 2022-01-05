import 'package:flutter/material.dart';
import 'package:search_and_cook/RecipePage/recipe_page.dart';

import 'database.dart';

class RecommendedDishesArea extends StatefulWidget {
  const RecommendedDishesArea({
    Key? key,
  }) : super(key: key);

  @override
  State<RecommendedDishesArea> createState() => _RecommendedDishesAreaState();
}

class _RecommendedDishesAreaState extends State<RecommendedDishesArea> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          // Text widget recommended dishes
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 10.0),
            child: Text(
              "Recommended Dishes",
              style:
                  TextStyle(fontSize: MediaQuery.of(context).size.height / 40),
            ),
          ),
        ),
        Material(
          borderRadius: BorderRadius.circular(10.0),
          elevation: 10.0,
          child: Container(
            //Recommended Dishes area
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width - 30.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListView(scrollDirection: Axis.horizontal, children: const [
              RecommendedDishCard(
                dishImageUrl:
                    "https://cdn.yemek.com/mncrop/940/625/uploads/2014/06/soganli-menemen-yeni.jpg",
                dishName: "Menemen",
              ),
              RecommendedDishCard(
                dishImageUrl:
                    "https://cdn.yemek.com/mncrop/600/315/uploads/2019/03/kakaolu-kek6.jpg",
                dishName: "Kakaolu Kek",
              ),
              RecommendedDishCard(
                dishImageUrl: "https://cdn.bolgegundem.com/d/news/326326.jpg",
                dishName: "Kızarmış Ördek",
              ),
            ]),
          ),
        )
      ],
    );
  }
}

class RecommendedDishCard extends StatelessWidget {
  final String dishImageUrl;
  final String dishName;
  const RecommendedDishCard({
    Key? key,
    required this.dishImageUrl,
    required this.dishName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        query();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RecipePage(
                      dishName: dishName,
                      dishRecipe: '''4 adet sivri biber
1 adet kapya biber
4 adet domates
1 dal taze soğan
1/2 adet soğan
4 yemek kaşığı zeytinyağı
4 adet yumurta
1 çay kaşığı tuz
1 çay kaşığı karabiber

Zeytinyağını yapışmaz tabanlı, derince bir tavaya alın ve ince ince doğradığınız kuru soğanı pembeleşene dek kavurun.

1 - Ardından sivri biberleri ve kapya biberleri ekleyin ve kavurma işlemini sürdürün.
                      
2 - Biberler solmaya başlayınca doğradığınız domatesleri de ekleyin ve kapağını kapatıp, domatesler iyice yumuşayana dek pişirin, yaklaşık 10 dakika yeterli olacaktır.

3 - Son olarak incecik doğradığınız taze soğanı da ekleyin ve soğanların rengi solunca yumurtaları kırıp karıştırın.

4 - Yumurtalar pişene dek karıştırın ve ardından altını kapatıp, sıcak sıcak servis edin. Afiyetler olsun!''',
                      dishPicUrl: dishImageUrl,
                    )));
      },
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(20.0)),
            width: 250.0,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(dishImageUrl), fit: BoxFit.cover),
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(20.0)),
                  height: MediaQuery.of(context).size.height / 4,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 70),
                  child: Text(
                    dishName,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.height / 45),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
