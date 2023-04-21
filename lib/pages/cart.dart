import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go('/account');
          },
          child: const Text('Go to next tab'),
        ),
      ),
    );
  }
}
