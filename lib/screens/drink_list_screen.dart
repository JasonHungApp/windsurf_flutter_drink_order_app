import 'package:flutter/material.dart';

class DrinkListScreen extends StatelessWidget {
  const DrinkListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 模擬飲料清單數據
    final drinks = [
      {'name': '珍珠奶茶', 'price': 60},
      {'name': '四季春茶', 'price': 45},
      {'name': '烏龍綠茶', 'price': 45},
      {'name': '檸檬綠茶', 'price': 50},
      {'name': '芋頭奶茶', 'price': 65},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('選擇飲料'),
      ),
      body: ListView.builder(
        itemCount: drinks.length,
        itemBuilder: (context, index) {
          final drink = drinks[index];
          return ListTile(
            title: Text(drink['name'] as String),
            subtitle: Text('NT\$ ${drink['price']}'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/drink-customize',
                arguments: drink,
              );
            },
          );
        },
      ),
    );
  }
}
