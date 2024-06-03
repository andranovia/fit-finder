import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fit_finder/common/color_extension.dart';
import 'package:readmore/readmore.dart';

import 'img_button.dart';

class UserReviewRow extends StatelessWidget {
  final bool isBottomActionBar;
  final VoidCallback? onCommentPress;
  final VoidCallback? onLikePress;
  final VoidCallback? onSharePress;

  const UserReviewRow(
      {super.key,
      this.isBottomActionBar = false,
      this.onSharePress,
      this.onLikePress,
      this.onCommentPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  'assets/img/u1.png',
                  width: 50,
                  height: 50,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hibe Neted",
                      style: TextStyle(
                          color: TColor.text,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "45 Reviews, 210 Followers",
                      style: TextStyle(
                          color: TColor.gray,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Container(
                height: 30,
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: TColor.primary),
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  "Follow",
                  style: TextStyle(
                      color: TColor.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(children: [
            Text(
              "Rated",
              style: TextStyle(
                  color: TColor.gray,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
            IgnorePointer(
              ignoring: true,
              child: RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                unratedColor: Colors.transparent,
                itemCount: 5,
                itemSize: 20,
                itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: TColor.primary,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
            Text(
              "4.0",
              style: TextStyle(
                  color: TColor.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            Text(
              "2 Days ago",
              style: TextStyle(
                  color: TColor.gray,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
          ]),
          const SizedBox(
            height: 8,
          ),
          ReadMoreText(
            'This place really good! especially the machine, its a brand new and not found nowhere else in town.',
            trimLines: 4,
            colorClickableText: TColor.text,
            trimMode: TrimMode.Line,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: TColor.text),
            trimCollapsedText: 'Read more',
            trimExpandedText: 'Read less',
            moreStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: TColor.primary),
          ),
          const SizedBox(
            height: 14,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImgButton(
                  image:
                      "https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  onPressed: () {},
                ),
                ImgButton(
                  image:
                      "https://images.unsplash.com/photo-1598575435247-2572be03bf6d?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  onPressed: () {},
                ),
                ImgButton(
                  image:
                      "https://images.unsplash.com/photo-1626252346582-c7721d805e0d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  onPressed: () {},
                ),
                ImgButton(
                  image:
                      "https://images.unsplash.com/photo-1589579234096-25cb6b83e021?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  isMore: true,
                  moreImageCount: 8,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  if (onLikePress != null) {
                    onLikePress!();
                  }
                },
                icon: Image.asset(
                  "assets/img/like.png",
                  width: 22,
                  height: 22,
                  fit: BoxFit.fitWidth,
                ),
              ),
              IconButton(
                onPressed: () {
                  if (onCommentPress != null) {
                    onCommentPress!();
                  }
                },
                icon: Image.asset(
                  "assets/img/comments.png",
                  width: 22,
                  height: 22,
                  fit: BoxFit.fitWidth,
                ),
              ),
              IconButton(
                onPressed: () {
                  if (onSharePress != null) {
                    onSharePress!();
                  }
                },
                icon: Image.asset(
                  "assets/img/share.png",
                  width: 22,
                  height: 22,
                  fit: BoxFit.fitWidth,
                ),
              ),
              const Spacer(),
              Text(
                "4 Likes",
                style: TextStyle(
                    color: TColor.gray,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                "3 Comments",
                style: TextStyle(
                    color: TColor.gray,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ],
          )
        ],
      ),
    );
  }
}
