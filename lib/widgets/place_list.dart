import 'package:flutter/material.dart';
import 'package:newapp/models/place.dart';
import 'package:newapp/Screens/place_detail.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No Places Added Yet',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: ((context, index) => ListTile(
        leading: CircleAvatar(
          radius: 26,
          backgroundImage: FileImage(places[index].image),
        ),
            title: Text(places[index].title,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    )),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => PlaceDetailScreen(
                        place: places[index],
                      )),
                ),
              );
            },
          )),
    );
  }
}
