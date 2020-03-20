// import 'package:flutter/material.dart';

class Event {
  final String imagePath,
      title,
      description,
      location,
      duration,
      punchLine1,
      punchLine2;
  final List<dynamic> categoryIds, galleryImages;

  Event({
    this.imagePath,
    this.title,
    this.description,
    this.location,
    this.duration,
    this.punchLine1,
    this.punchLine2,
    this.categoryIds,
    this.galleryImages,
  });
}

/*
├── event_images
│   ├── 5_km_downtown_run.jpeg
│   ├── cooking_1.jpeg
│   ├── cooking_2.jpeg
│   ├── cooking_3.jpeg
│   ├── golf_competition.jpeg
│   ├── granite_cooking_class.jpeg
│   └── musuic_concert.jpeg
└── guest_images
    ├── guest1.png
    ├── guest2.png
    ├── guest3.png
    ├── guest4.png
    ├── guest5.png
    └── guest6.png
*/

final fiveKmRunEvent = Event(
  imagePath: "assets/event_images/5_km_downtown_run.jpeg",
  title: "5 kilometers Downtown Run ",
  description: "",
  duration: "3h",
  location: "Pleasant Park",
  punchLine1: "Marathon!",
  punchLine2: "The lastest fad in foodology, get the inside scoup.",
  categoryIds: [0, 1],
);

final cookingEvent = Event(
    imagePath: "assets/event_images/granite_cooking_class.jpeg",
    title: "Granite cooking class",
    description:
        "Guest list fill up fast so be sure to apply before handto secure a soup",
    location: "Food Court Avenue",
    duration: "4h",
    punchLine1: "Granite cooking",
    punchLine2: "The lastest fad in foodology, get the inside scoup.",
    categoryIds: [
      0,
      2
    ],
    galleryImages: [
      "assets/event_images/cooking_1.jpeg",
      "assets/event_images/cooking_2.jpeg",
      "assets/event_images/cooking_3.jpeg"
    ]);

final musicConcertEvent = Event(
  imagePath: "assets/event_images/musuic_concert.jpeg",
  title: "Arijit Music Concert",
  description: "Listen to Arijit`s latest compositions.",
  location: "D.Y. Patil Standium, Mumbai",
  duration: "5h",
  punchLine1: "Music Lovers",
  punchLine2: "The lastest fad in foodology, get the inside scoup.",
  categoryIds: [0, 1],
);

final golfCompetitionEvent = Event(
  imagePath: "assets/event_images/golf_competition.jpeg",
  title: "Season 2 Golf Estate",
  description: "",
  location: "Music Ground Okhla",
  duration: "1d",
  punchLine1: "Golf!",
  punchLine2: "The lastest fad in foodology, get the inside scoup.",
  categoryIds: [0, 3],
);

final events = [
  fiveKmRunEvent,
  cookingEvent,
  musicConcertEvent,
  golfCompetitionEvent,
];
