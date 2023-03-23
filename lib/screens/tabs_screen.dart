import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './favourites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String,dynamic>> _pages = const [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoritesScreen(),
      'title': 'Your Favorites',
    },
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer:const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
    // ----------------TabBar at bottom of appbar-----------------

    // return DefaultTabController(
    //     length: 2,
    //     child: Scaffold(
    //       appBar: AppBar(
    //         title: const Text('Meals'),
    //         bottom: const TabBar(
    //           tabs: [
    //             Tab(
    //               icon: Icon(Icons.category),
    //               text: 'Categories',
    //             ),
    //             Tab(
    //               icon: Icon(Icons.star),
    //               text: 'Favorites',
    //             ),
    //           ],
    //         ),
    //       ),
    //       body: const TabBarView(
    //         children: [
    //           CategoriesScreen(),
    //           FavoritesScreen(),
    //         ],
    //       ),
    //     ));
  }
}
