import 'package:cafty_bay/presentation/state_holder/add_product_review_controller.dart';
import 'package:cafty_bay/presentation/ui/screens/product_review_add_screen.dart';
import 'package:cafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../data/models/product_review_data.dart';
import '../../state_holder/product_review_controller.dart';

class ReviewInProductListScreen extends StatefulWidget {
  const ReviewInProductListScreen({
    super.key,
    required this.productId,
  });
  final int productId;

  @override
  State<ReviewInProductListScreen> createState() => _ReviewInProductListScreenState();
}

class _ReviewInProductListScreenState extends State<ReviewInProductListScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<ProdutReviewListController>().showReviewList(widget.productId);
  }

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          title: const Text("Reviews"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetBuilder<ProdutReviewListController>(
                  builder: (produtReviewListController) {
                    if (produtReviewListController.showReviewListInProgress) {
                      return const CenterCircularProgressIndicator();
                    }
                    return ListView.separated(
                      separatorBuilder: (context, index) => const Divider(
                        //height: 50,
                        //thickness: 1,
                        color: Colors.transparent,
                      ),
                      itemCount: produtReviewListController
                              .productReviewModel.reviewData?.length ??
                          0,
                      itemBuilder: (context, index) => Card(
                        child: ReviewListCard(
                            productReviewData: produtReviewListController
                                .productReviewModel.reviewData![index]),
                      ),
                    );
                  }
                ),
              ),
            ),
            GetBuilder<ProdutReviewListController>(
              builder: (produtReviewListController) {
                return Container(
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue.shade200,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Reviews: (${produtReviewListController.productReviewModel.reviewData?.length.toString()})",
                          style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => AddProductReviewScreen(
                                  productId:widget.productId));
                          },
                          child: Container(
                            height: 100,
                            width: 40,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.green),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
            )
          ],
        ),
      );
  }
}

class ReviewListCard extends StatelessWidget {
  const ReviewListCard({
    super.key,
    required this.productReviewData,
  });
  final ProductReviewData productReviewData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          const Icon(
            Icons.person,
            color: Colors.grey,
          ),
          SizedBox(width: 3),
          Text(
            productReviewData.profile?.cusName ?? "Undefine",
            style: const TextStyle(
                color: Colors.lightGreen,
                fontWeight: FontWeight.w600,
                fontSize: 20),
          ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          productReviewData.description ?? "Not Found",
          style: const TextStyle(fontSize: 15, color: Colors.black54),
        ),
      ),
    );
  }
}

