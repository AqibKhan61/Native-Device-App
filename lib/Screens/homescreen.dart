import 'package:flutter/material.dart';
import 'package:newapp/Screens/add_place.dart';
import 'package:newapp/widgets/place_list.dart';
import 'package:newapp/providers/user_places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlaceProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const NewItems()),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body:  Padding(
        padding: const EdgeInsets.all(8),
        child: PlaceList(
          places: userPlaces ,
        ),
      ),
    );
  }
}
