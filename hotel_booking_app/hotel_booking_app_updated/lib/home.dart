import 'package:flutter/material.dart';
import 'room.dart'; // Import the Room class from room.dart
import 'room_details_page.dart';
import 'search_result_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  final List<Map<String, dynamic>> locations = [
    {'name': 'Location 1', 'icon': Icons.location_city},
    {'name': 'Location 2', 'icon': Icons.location_city},
    {'name': 'Location 3', 'icon': Icons.location_city},
    {'name': 'City 1', 'icon': Icons.help_outline}, // Custom icon for City 1
    {'name': 'City 2', 'icon': Icons.help_outline}, // Custom icon for City 2
    {'name': 'City 3', 'icon': Icons.help_outline}, // Custom icon for City 3
  ];
  String selectedLocation = 'Location 1';

  void changeLocation(String newLocation) {
    setState(() {
      selectedLocation = newLocation;
    });
    // Trigger search or update based on new location
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DropdownButtonHideUnderline(
          child: DropdownButton<Map<String, dynamic>>(
            value: locations.firstWhere((location) => location['name'] == selectedLocation),
            icon: Icon(Icons.arrow_drop_down),
            onChanged: (Map<String, dynamic>? newValue) {
              if (newValue != null) {
                changeLocation(newValue['name']);
              }
            },
            items: locations.map<DropdownMenuItem<Map<String, dynamic>>>((location) {
              return DropdownMenuItem<Map<String, dynamic>>(
                value: location,
                child: Row(
                  children: [
                    if (location['icon'] != null) Icon(location['icon']), // Display icon if present
                    SizedBox(width: location['icon'] != null ? 8 : 0), // Add spacing if icon is present
                    Text(location['name']),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: locations.map((location) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextButton(
                        onPressed: () {
                          changeLocation(location['name']);
                        },
                        child: Text(location['name']),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Featured Rooms',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              FeaturedRoomList(),
              SizedBox(height: 16.0),
              Text(
                'Recommended Rooms',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              RecommendedRoomList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (int index) {
          // Handle bottom navigation bar item taps
          if (index == 0) {
            // Navigate to home page or perform action
          } else if (index == 1) {
            // Navigate to search page or perform action
          } else if (index == 2) {
            // Navigate to profile page or perform action
          }
        },
      ),
    );
  }
}

class FeaturedRoomList extends StatelessWidget {
  final List<Room> rooms = [
    Room(name: 'Room A', location: 'New York', pricePerNight: 100, imageAsset: 'assets/A.jpg', type: 'Single'),
    Room(name: 'Room B', location: 'Los Angeles', pricePerNight: 200, imageAsset: 'assets/B.jpg', type: 'Double'),
    Room(name: 'Room C', location: 'Chicago', pricePerNight: 150, imageAsset: 'assets/C.jpg', type: 'Single'),
    Room(name: 'Room D', location: 'Houston', pricePerNight: 250, imageAsset: 'assets/D.jpg', type: 'Double'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          return RoomCard(room: rooms[index]);
        },
      ),
    );
  }
}

class RecommendedRoomList extends StatelessWidget {
  final List<Room> rooms = [
    Room(name: 'Room E', location: 'San Francisco', pricePerNight: 120, imageAsset: 'assets/E.jpg', type: 'Single'),
    Room(name: 'Room F', location: 'Seattle', pricePerNight: 220, imageAsset: 'assets/F.jpg', type: 'Double'),
    Room(name: 'Room G', location: 'Boston', pricePerNight: 170, imageAsset: 'assets/G.jpg', type: 'Single'),
    Room(name: 'Room H', location: 'Miami', pricePerNight: 270, imageAsset: 'assets/H.jpg', type: 'Double'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          return RoomCard(room: rooms[index]);
        },
      ),
    );
  }
}

class RoomCard extends StatefulWidget {
  final Room room;

  RoomCard({required this.room});

  @override
  _RoomCardState createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RoomDetailsPage(
              room: widget.room.name,
              location: widget.room.location,
              pricePerNight: widget.room.pricePerNight,
            ),
          ),
        );
      },
      child: Card(
        elevation: 2.0,
        margin: EdgeInsets.all(8.0),
        child: Container(
          width: 150.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Image.asset(
                  widget.room.imageAsset,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.room.name,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.room.type),
                    Text('\$${widget.room.pricePerNight}'),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          color: isLiked ? Colors.red : null,
                        ),
                        onPressed: () {
                          setState(() {
                            isLiked = !isLiked;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
