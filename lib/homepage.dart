import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_discount/api.dart';
import 'package:project_discount/model.list.dart';
import 'package:project_discount/singleitem.dart';
import 'package:project_discount/time.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  String dateHelper(String text, String startOrEnd) {
    String title = startOrEnd == "start" ? "Start from" : "Until";
    return "$title ${Converter().time(DateTime.parse(text))}";
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<ModelListDiscount> result =
        ref.watch(discountListProvider);
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
                return InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SingleItemPage(
                        model: result.value!,
                        index: index,
                      ),
                    ),
                  ),
                  child: Card(
                    child: ListTile(
                      title: Image.network(
                          "http://127.0.0.1:8090/api/files/${list.items![index].collectionId!}/${list.items![index].id!}/${list.items![index].previewImg![0]}"),
                      subtitle: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              list.items![index].title!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              dateHelper(list.items![index].dateFrom!, 'start'),
                            ),
                            Text(
                              dateHelper(list.items![index].dateTo!, 'end'),
                            ),
                          ],
                        ),
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
