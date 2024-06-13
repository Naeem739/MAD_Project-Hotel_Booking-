import 'package:flutter/material.dart';

class RoomDetailsPage extends StatefulWidget {
  final String room;
  final String location;
  final double pricePerNight;

  RoomDetailsPage({
    required this.room,
    required this.location,
    required this.pricePerNight,
  });

  @override
  _RoomDetailsPageState createState() => _RoomDetailsPageState();
}

class _RoomDetailsPageState extends State<RoomDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.room} Details'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                // Handle Call action
              },
              icon: Icon(Icons.call),
              label: Text('Call'),
              style: ElevatedButton.styleFrom(
                //primary: Colors.cyan,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Handle Book Now action
              },
              icon: Icon(Icons.book),
              label: Text('Book Now'),
              style: ElevatedButton.styleFrom(
                //primary: Colors.orange,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              color: Colors.cyan[100],
              child: Container(
                height: 300,
                child: Stack(
                  children: <Widget>[
                    PageView.builder(
                      key: Key('roomImagesPageView'),
                      itemCount: 4, // Replace with your actual image count
                      itemBuilder: (context, index) {
                        return Image.asset(
                          'assets/${index + 1}.jpg', // Adjust as needed
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      right: 20,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.room,
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.location,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            Text(
                              '\$${widget.pricePerNight} / night',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text('Reviews and Ratings'),
                subtitle: Row(
                  children: List.generate(5, (index) {
                    return Icon(Icons.star, color: index < 4 ? Colors.amber : Colors.grey);
                  }),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(4, (index) {
                    return CircleAvatar(
                      backgroundImage: AssetImage('assets/user${index + 1}.jpg'), // Replace with your actual user images
                      radius: 15,
                    );
                  }),
                ),
                onTap: () {
                  // Handle navigation to detailed reviews page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReviewsPage()),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('What We Offer', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        _buildOfferIcon(Icons.bed, 'Twin Bed'),
                        _buildOfferIcon(Icons.local_parking, 'Parking'),
                        _buildOfferIcon(Icons.wifi, 'WiFi'),
                        _buildOfferIcon(Icons.pool, 'Pool'),
                        _buildOfferIcon(Icons.fastfood, 'Snack'),
                        _buildOfferIcon(Icons.free_breakfast, 'Breakfast'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'This is a spacious and luxurious room equipped with all the modern amenities. Perfect for a comfortable stay.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOfferIcon(IconData icon, String label) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: <Widget>[
          Icon(icon, size: 30, color: Colors.cyan),
          SizedBox(height: 5),
          Text(label, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

class ReviewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace this with the actual reviews and ratings page
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews and Ratings'),
      ),
      body: Center(
        child: Text('All reviews and ratings go here'),
      ),
    );
  }
}
