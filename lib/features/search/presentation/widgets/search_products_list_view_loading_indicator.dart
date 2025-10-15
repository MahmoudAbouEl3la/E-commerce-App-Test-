import 'package:e_commerce_app_task/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

class SearchProductsListViewLoadingIndicator extends StatelessWidget {
  const SearchProductsListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: ListView.builder(
        itemCount: 8,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.17,
                  width: MediaQuery.of(context).size.height * 0.12,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 18,
                        width: double.infinity,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 14,
                        width: 150,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 18,
                            width: 40,
                            color: Colors.grey[300],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 18,
                                width: 18,
                                color: Colors.grey[300],
                              ),
                              const SizedBox(width: 8),
                              Container(
                                height: 14,
                                width: 30,
                                color: Colors.grey[300],
                              ),
                              const SizedBox(width: 12),
                              Container(
                                height: 14,
                                width: 40,
                                color: Colors.grey[300],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
