import 'package:flutter/material.dart';

class Product {
  late final String image, title, description, productName, productOwnersname;
  late final double price, size;
  late final int id;
  late final Color color;

  Product({
    required this.image,
    required this.title,
    required this.description,
    required this.productName,
    required this.productOwnersname,
    required this.price,
    required this.size,
    required this.id,
    required this.color,
  });
}

List<Product> products = [
  Product(
      image: "assets/images/marketplace_images/orchidplant.jpg",
      title: "House decorated Plants",
      description:
          "Orchid plants are diverse and elegant with vibrant blooms. They captivate with their colors and delicate petals, making them a popular choice among flower enthusiasts",
      price: 100.00,
      size: 2,
      id: 1,
      color: const Color(0xFF3D82AE),
      productName: 'Orchid',
      productOwnersname: 'ABC Shop'),
  Product(
      image: "assets/images/marketplace_images/tomatoplant.jpg",
      title: "Decorated and Vege",
      description:
          "Tomato plants are prolific growers known for their juicy and flavorful fruits. With lush green foliage, they produce clusters of red, yellow, or orange tomatoes that are versatile and delicious in various culinary creations.",
      price: 100.00,
      size: 2,
      id: 2,
      color: const Color(0xFF3D82AE),
      productName: 'Tomatto',
      productOwnersname: 'CDE Shop'),
  Product(
      image: "assets/images/marketplace_images/grapesplant.jpg",
      title: "Sweet and Refresh",
      description:
          "Grapes are luscious fruits that grow in clusters on vines. They come in various colors like green, red, and purple. With their sweet and juicy flavor, grapes are enjoyed as a refreshing snack and used in winemaking and cooking",
      price: 100.00,
      size: 2,
      id: 3,
      color: const Color(0xFF3D82AE),
      productName: 'Graphes',
      productOwnersname: 'XYX shop'),
  Product(
      image: "assets/images/marketplace_images/orchidplant.jpg",
      title: "Eye catchins",
      description:
          "අලංකාර වගේම වඩාත් ආකර්ශණීය මල් වර්ග අතුරින් ඕකිඩ් කියන්නේ ඒ ලැයිස්තුවේ ඉහළින්ම තියෙන මල් වර්ගයක්. ගෙවතු අලංකරණයට වගේම උද්‍යාන අලංකරණයටත් වාණිජමය වශයෙන් වුණත් ඕකිඩ් වගා කරන්නට පුළුවන් .ඉතින් ඕකිඩ් කියන්නේ බොහෝ සංවේදී ශාකයක්. උඩවැඩියා කියන්නෙත් මේ ඕකිඩ් මල්වලටමයි. ඉතින් ලංකාවේ දේශගුණික තත්ත්වය මත ඕකිඩ් මල් වර්ග කිහිපයක් වගා කරන්නට හැකියි.ඉතින් ඕකිඩ් වර්ෂා කාලයේ දී වනාන්තරවල ස්වාභාවිකව වැඩෙන ශාකයක් වුණත් විවිධ දේශගුණික තත්ත්වයන් යටතේ කෘතීම පරිසරයේදීත් වගා කළ හැකියි.",
      price: 100.00,
      size: 2,
      id: 4,
      color: const Color(0xFF3D82AE),
      productName: 'ඕකිඩ් පැලැටි',
      productOwnersname: 'PQR Shop'),
];
