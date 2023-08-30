import 'dart:io';
import 'package:newapp/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  void addPlaces(String title, File image) {
    final newPlace = Place(title: title, image: image);
    state = [newPlace, ...state];
  }
}

final userPlaceProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
        (ref) => UserPlacesNotifier());
