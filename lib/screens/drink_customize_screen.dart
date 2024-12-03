import 'package:flutter/material.dart';

class DrinkCustomizeScreen extends StatefulWidget {
  const DrinkCustomizeScreen({super.key});

  @override
  State<DrinkCustomizeScreen> createState() => _DrinkCustomizeScreenState();
}

class _DrinkCustomizeScreenState extends State<DrinkCustomizeScreen> {
  int quantity = 1;
  String sweetness = '正常糖';
  String temperature = '正常冰';
  String size = '中杯';

  final List<String> sweetnessOptions = ['無糖', '微糖', '半糖', '少糖', '正常糖'];
  final List<String> temperatureOptions = ['熱飲', '溫飲', '去冰', '微冰', '少冰', '正常冰'];
  final List<String> sizeOptions = ['小杯', '中杯', '大杯'];

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> drink =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(drink['name'] as String),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 數量選擇
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('數量'),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (quantity > 1) {
                              setState(() {
                                quantity--;
                              });
                            }
                          },
                          icon: const Icon(Icons.remove),
                        ),
                        Text('$quantity'),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 甜度選擇
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('甜度'),
                    Wrap(
                      spacing: 8.0,
                      children: sweetnessOptions
                          .map(
                            (option) => ChoiceChip(
                              label: Text(option),
                              selected: sweetness == option,
                              onSelected: (selected) {
                                if (selected) {
                                  setState(() {
                                    sweetness = option;
                                  });
                                }
                              },
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 溫度選擇
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('溫度'),
                    Wrap(
                      spacing: 8.0,
                      children: temperatureOptions
                          .map(
                            (option) => ChoiceChip(
                              label: Text(option),
                              selected: temperature == option,
                              onSelected: (selected) {
                                if (selected) {
                                  setState(() {
                                    temperature = option;
                                  });
                                }
                              },
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 容量選擇
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('容量'),
                    Wrap(
                      spacing: 8.0,
                      children: sizeOptions
                          .map(
                            (option) => ChoiceChip(
                              label: Text(option),
                              selected: size == option,
                              onSelected: (selected) {
                                if (selected) {
                                  setState(() {
                                    size = option;
                                  });
                                }
                              },
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              // TODO: 儲存訂單資訊
              Navigator.popUntil(
                context,
                ModalRoute.withName('/group-detail'),
              );
            },
            child: const Text('確認送出'),
          ),
        ),
      ),
    );
  }
}
