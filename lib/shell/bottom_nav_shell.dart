import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationShell extends StatelessWidget {
  final Widget child;
  const BottomNavigationShell({super.key, required this.child});

  static List<String> routes = ['/', '/cart', '/account'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: max(0, routes.indexOf(GoRouter.of(context).location)),
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: IconButton(
              onPressed: () {
                context.go('/');
              },
              icon: const Icon(Icons.home),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Cart',
            icon: IconButton(
              onPressed: () {
                context.go('/cart');
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: IconButton(
              onPressed: () {
                context.go('/account');
              },
              icon: const Icon(Icons.account_circle),
            ),
          ),
        ],
      ),
    );
  }
}
