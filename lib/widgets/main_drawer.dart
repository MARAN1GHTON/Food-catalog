import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.1),
                //Colors.black, Color.fromARGB(255, 255, 255, 255)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Color.fromARGB(255, 255, 255, 255)
                  //Theme.of(context).colorScheme.primary
                  ,
                ),
                const SizedBox(
                  width: 18,
                ),
                Text(
                  'Давай готовить!',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: const Color.fromARGB(255, 255, 255, 255)
                          //Theme.of(context).colorScheme.primary
                          ),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.restaurant,
              size: 26,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            title: Text(
              'Блюда',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 24,
                  ),
            ),
            onTap: () {
              onSelectScreen('meals');
              // Navigator.of(context).push(route)
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              size: 26,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            title: Text(
              'Фильтры',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 24,
                  ),
            ),
            onTap: () {
              onSelectScreen('filtres');
            },
          )
        ],
      ),
    );
  }
}
