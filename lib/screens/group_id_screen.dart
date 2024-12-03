import 'package:flutter/material.dart';

class GroupIdScreen extends StatefulWidget {
  const GroupIdScreen({super.key});

  @override
  State<GroupIdScreen> createState() => _GroupIdScreenState();
}

class _GroupIdScreenState extends State<GroupIdScreen> {
  final _formKey = GlobalKey<FormState>();
  final _groupIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('輸入團購ID'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _groupIdController,
                decoration: const InputDecoration(
                  labelText: '團購ID',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '請輸入團購ID';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // TODO: 驗證團購ID
                    Navigator.pushNamed(context, '/group-detail');
                  }
                },
                child: const Text('進入團購'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _groupIdController.dispose();
    super.dispose();
  }
}
