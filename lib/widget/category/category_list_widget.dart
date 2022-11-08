import 'package:auto_animated/auto_animated.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_quiz/const/const.dart';
import 'package:online_quiz/model/category_model.dart';
import 'package:online_quiz/screen/questions_screen.dart';
import 'package:online_quiz/state/category_state.dart';
import 'package:online_quiz/widget/common/common_wigets.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget(
      {Key? key, required this.lst, required this.categoryStateController})
      : super(key: key);

  final List<CategoryModel> lst;
  final CategoryStateController categoryStateController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: LiveGrid(
            showItemInterval: Duration(milliseconds: 310),
            showItemDuration: Duration(milliseconds: 300),
            reAnimateOnVisibility: true,
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 1, mainAxisSpacing: 1),
            itemCount: lst.length,
            itemBuilder: animationItemBuilder(
              (index) => InkWell(
                onTap: () {
                  categoryStateController.selectedCategory.value = lst[index];
                  Get.to(() => QuestionsScreen());
                },
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CachedNetworkImage(
                        imageUrl: lst[index].image,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => Center(
                          child: Icon(Icons.image),
                        ),
                        progressIndicatorBuilder: (context, url, progress) =>
                            Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      Container(
                        color: Color(COLOR_OVERLAY),
                      ),
                      Center(
                        child: Text(
                          "${lst[index].name}",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.jetBrainsMono(
                              color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
