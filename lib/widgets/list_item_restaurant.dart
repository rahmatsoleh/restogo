import 'package:flutter/material.dart';

class ListItemRestaurant extends StatelessWidget {
  const ListItemRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 90,
          height: 90,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Image.network(
            "https://restaurant-api.dicoding.dev/images/medium/14",
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Melting Pot",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.location_on_outlined, color: Colors.grey),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            "Gading Tugusumberjo Peterongan Jombang Jawa Timur Indonesia",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amberAccent),
                      SizedBox(width: 4),
                      Text(
                        "4.8",
                        style: TextStyle(fontFamily: "Poppins", fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14,
                  color: Colors.grey,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
