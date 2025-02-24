import 'package:flutter/material.dart';

import 'imageclassification.dart';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 18),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF00796B), Color(0xFF004D40)], // Stylish greenish-blue gradient
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 32),
              Text(
                'Smart Waste Management',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              Text(
                'Identify and classify waste efficiently with AI-powered recognition.',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 28),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ImageClassificationPage()),
                  );                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 38, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 10,
                  backgroundColor: Color(0xFFFFC107), // Vibrant yellow
                  shadowColor: Colors.black.withOpacity(0.3),
                ),
                child: Text(
                  'Start Classifying Waste',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 28),
              Text(
                'Waste Categories',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: wasteTypes.length,
                itemBuilder: (context, index) {
                  return WasteFeatureCard(
                    wasteType: wasteTypes[index]['type'],
                    icon: wasteTypes[index]['icon'],
                    color: wasteTypes[index]['color'],
                    description: wasteTypes[index]['description'],
                    recycleInfo: wasteTypes[index]['recycleInfo'],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class WasteFeatureCard extends StatelessWidget {
  final String wasteType;
  final IconData icon;
  final Color color;
  final String description;
  final String recycleInfo;

  const WasteFeatureCard({
    required this.wasteType,
    required this.icon,
    required this.color,
    required this.description,
    required this.recycleInfo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('How to Recycle $wasteType'),
              content: Text(recycleInfo),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        shadowColor: Colors.black.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  icon,
                  size: 32,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      wasteType,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF666666),
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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

// Updated waste categories with better colors
final List<Map<String, dynamic>> wasteTypes = [
  {
    'type': 'Cardboard',
    'icon': Icons.archive,
    'color': Color(0xFF8D6E63), // Warm brown
    'description': 'Cardboard items like boxes and packaging materials.',
    'recycleInfo': 'Cardboard is recycled by breaking it down, cleaning it, and processing it into new paper products.'
  },
  {
    'type': 'Glass',
    'icon': Icons.local_drink,
    'color': Color(0xFF42A5F5), // Vibrant blue
    'description': 'Glass bottles, jars, and containers for recycling.',
    'recycleInfo': 'Glass can be recycled by cleaning and sorting it, then melting it down to create new glass products.'
  },
  {
    'type': 'Plastic',
    'icon': Icons.recycling,
    'color': Color(0xFF66BB6A), // Eco-friendly green
    'description': 'Plastic items like bottles, bags, and containers.',
    'recycleInfo': 'Plastic is recycled by sorting, cleaning, and melting it down to create new plastic products.'
  },
  {
    'type': 'Metal',
    'icon': Icons.build,
    'color': Color(0xFF757575), // Metallic grey
    'description': 'Metal items like cans, steel, and aluminum.',
    'recycleInfo': 'Metal recycling involves cleaning, sorting, and melting the metal to create new products like cans or construction materials.'
  },
  {
    'type': 'Paper',
    'icon': Icons.newspaper,
    'color': Color(0xFFFFD54F), // Soft yellow
    'description': 'Paper products like newspapers, magazines, and books.',
    'recycleInfo': 'Paper is recycled by sorting, pulping, and removing any contaminants to make new paper products.'
  },
  {
    'type': 'Trash',
    'icon': Icons.delete_forever,
    'color': Color(0xFFE53935), // Bright red
    'description': 'Items that don’t fit into recycling categories.',
    'recycleInfo': 'Trash is typically sent to landfills, but some can be incinerated to generate energy or sorted for recycling in some cases.'
  },
];