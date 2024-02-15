import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_discount/api.dart';
import 'package:project_discount/model.dart';
import 'package:intl/intl.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<DiscountModel> result = ref.watch(discountListProvider);
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => ref.refresh(discountListProvider.future),
          child: result.when(
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) => const Center(
              child: Text('Please check your connection'),
            ),
            data: (list) => ListView.builder(
              itemCount: list.totalItems,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Image.network(
                        "http://127.0.0.1:8090/api/files/${list.items![index].collectionId!}/${list.items![index].id!}/${list.items![index].previewImg!}"),
                    subtitle: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        children: [
                          Text(list.items![index].title!),
                          Text(DateFormat('dd-MM-yy')
                              .format(DateTime.now())
                              .toString())
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
