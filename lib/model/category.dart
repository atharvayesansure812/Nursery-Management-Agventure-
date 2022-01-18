class CarouselItem {
  String Images;
  String Text;
  CarouselItem({required this.Images, required this.Text});
}

class Categoryp {
  String name;
  Categoryp({required this.name});
}

List<Categoryp> categoryp = [
  Categoryp(name: "Air Plant"),
  Categoryp(name: "Indoor Plant"),
  Categoryp(name: "Avenue Tree"),
  Categoryp(name: "Aromatic Plant"),
  Categoryp(name: "Winter Plant"),
];

List<CarouselItem> Carousel = [
  CarouselItem(
      Images:
          "https://media.istockphoto.com/photos/various-potted-plants-arranged-in-greenhouse-picture-id1207038306",
      Text: "Fruit"),
  CarouselItem(
      Images:
          "https://media.istockphoto.com/photos/greenhouse-containing-colorful-flowers-picture-id140471600",
      Text: "Vegetable"),
  CarouselItem(
      Images:
          "https://images.unsplash.com/photo-1598902468171-0f50e32a7bf2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
      Text: "Ornamental"),
  CarouselItem(
      Images:
          "https://images.unsplash.com/photo-1598902468171-0f50e32a7bf2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
      Text: "Forest"),
  CarouselItem(
      Images:
          "https://thumbs.dreamstime.com/b/plant-nursery-row-ornamental-tropical-35884431.jpghttps://thumbs.dreamstime.com/b/plant-nursery-row-ornamental-tropical-35884431.jpg",
      Text: "Agriculture"),
];

// List<String> Images = [
//   "https://thumbs.dreamstime.com/b/maidenhair-fern-5837842.jpg",
//   "https://image.shutterstock.com/image-photo/maidenhair-fern-ornamental-flower-pots-600w-1020810265.jpg",
//   "https://image.shutterstock.com/image-photo/southern-maidenhair-fern-600w-1139335070.jpg"
// ];

// List<String> Nursery_Name = [
//   "Blossom Valey",
//   "Tanuja Hightech\n        Nursery",
//   "Evergreen Nursery",
//   "Paradise Nursery",
//   "Garden Gate",
//   "Harmony"
// ];


// List BlossomValley = [
//   {
//     "plantName": "Maidenhair Fern",
//     "image": "https://thumbs.dreamstime.com/b/maidenhair-fern-5837842.jpg",
//     "Des": "People use it to make medicine. Maidenhair fern is used for bronchitis, coughs, whooping cough,"
//         "and heavy menstruation with cramps. It is also used to loosen chest congestion",
//     "price": "5",
//   },
//   {
//     "plantName": "Paddle Plant",
//     "Des": "Paddle Plant is an unusual-looking succulent that grows in a rosette of flat, round leaves. It adds bold texture, "
//         "color and form to a succulent dish garden, but this handsome houseplant is eye-catching on its own, too.",
//     "image":
//         "https://www.guide-to-houseplants.com/images/paddle-plant-whitepot.jpg",
//     "Mulimage": [
//       "https://www.guide-to-houseplants.com/images/paddle-plant-whitepot.jpg",
//       "https://cdn.pixabay.com/photo/2019/02/21/02/37/paddle-plant-4010480_960_720.jpg",
//       "https://thumbs.dreamstime.com/b/maidenhair-fern-5837842.jpg"
//     ],
//     "price": "10",
//   },
//   {
//     "plantName": "Maidenhair Fern",
//     "image": "https://thumbs.dreamstime.com/b/maidenhair-fern-5837842.jpg",
//     "Des": "People use it to make medicine. Maidenhair fern is used for bronchitis, coughs, whooping cough,"
//         "and heavy menstruation with cramps. It is also used to loosen chest congestion",
//     "Mulimage": [
//       "https://thumbs.dreamstime.com/b/maidenhair-fern-5837842.jpg",
//       "https://image.shutterstock.com/image-photo/maidenhair-fern-ornamental-flower-pots-600w-1020810265.jpg",
//       "https://image.shutterstock.com/image-photo/southern-maidenhair-fern-600w-1139335070.jpg"
//     ],
//     "price": "5",
//   },
//   {
//     "plantName": "Paddle Plant",
//     "Des": "Paddle Plant is an unusual-looking succulent that grows in a rosette of flat, round leaves. It adds bold texture, "
//         "color and form to a succulent dish garden, but this handsome houseplant is eye-catching on its own, too.",
//     "image":
//         "https://www.guide-to-houseplants.com/images/paddle-plant-whitepot.jpg",
//     "Mulimage": [
//       "https://www.guide-to-houseplants.com/images/paddle-plant-whitepot.jpg",
//       "https://cdn.pixabay.com/photo/2019/02/21/02/37/paddle-plant-4010480_960_720.jpg",
//       "https://thumbs.dreamstime.com/b/maidenhair-fern-5837842.jpg"
//     ],
//     "price": "10",
//   },
//   {
//     "plantName": "Maidenhair Fern",
//     "image": "https://thumbs.dreamstime.com/b/maidenhair-fern-5837842.jpg",
//     "Des": "People use it to make medicine. Maidenhair fern is used for bronchitis, coughs, whooping cough,"
//         "and heavy menstruation with cramps. It is also used to loosen chest congestion",
//     "Mulimage": [
//       "https://thumbs.dreamstime.com/b/maidenhair-fern-5837842.jpg",
//       "https://image.shutterstock.com/image-photo/maidenhair-fern-ornamental-flower-pots-600w-1020810265.jpg",
//       "https://image.shutterstock.com/image-photo/southern-maidenhair-fern-600w-1139335070.jpg"
//     ],
//     "price": "5",
//   },
//   {
//     "plantName": "Paddle Plant",
//     "Des": "Paddle Plant is an unusual-looking succulent that grows in a rosette of flat, round leaves. It adds bold texture, "
//         "color and form to a succulent dish garden, but this handsome houseplant is eye-catching on its own, too.",
//     "image":
//         "https://www.guide-to-houseplants.com/images/paddle-plant-whitepot.jpg",
//     "Mulimage": [
//       "https://www.guide-to-houseplants.com/images/paddle-plant-whitepot.jpg",
//       "https://cdn.pixabay.com/photo/2019/02/21/02/37/paddle-plant-4010480_960_720.jpg",
//       "https://thumbs.dreamstime.com/b/maidenhair-fern-5837842.jpg"
//     ],
//     "price": "10",
//   },

// {
//   "plantName": "Arcca plant",
//   "image":
//       "https://media.ugaoo.com/catalog/product/cache/81d2f56800d33f099d2b369affd8e374/m/o/monsteradeliciosa_45.png",
//   "price": 5,
// },
// {
//   "plantName": "Inchplant",
//   "image":
//       "https://balconygardenweb-lhnfx0beomqvnhspx.netdna-ssl.com/wp-content/uploads/2021/04/7-Tradescantia-Zebrina.jpg.webp",
//   "price": 5,
// },
// {
//   "plantName": "Heartleaf Philodendron",
//   "image":
//       "https://balconygardenweb-lhnfx0beomqvnhspx.netdna-ssl.com/wp-content/uploads/2021/04/8-Philodendron-hederaceum.jpg.webp",
//   "price": 5,
// },
// {
//   "plantName": "Guiana Chestnut",
//   "image":
//       "https://balconygardenweb-lhnfx0beomqvnhspx.netdna-ssl.com/wp-content/uploads/2021/04/9-Pachira-aquatica.jpg.webp",
//   "price": 5,
// },
// {
//   "plantName": " Banana Leaf Fig",
//   "image":
//       "https://balconygardenweb-lhnfx0beomqvnhspx.netdna-ssl.com/wp-content/uploads/2021/04/10-FICUS-ALLI.jpg.webp",
//   "price": 5,
// },
// {
//   "plantName": "Peacock Plant",
//   "image":
//       "https://balconygardenweb-lhnfx0beomqvnhspx.netdna-ssl.com/wp-content/uploads/2021/04/11-Calathea-Peacock.jpg.webp",
//   "price": 5,
// },
// ];
// List EverGreen = [
//   // "nurseryName": "Blossom Valley",
//   // "location": "Dombivali",

//   {
//     "plantName": "Spider Plant",
//     "image":
//         "https://balconygardenweb-lhnfx0beomqvnhspx.netdna-ssl.com/wp-content/uploads/2021/04/3-Spider-Plant.jpg.webp"
//   },

//   //  "nurseryName": "Evergreen",
//   // "location": "Panvel",

//   {
//     "plantName": "Dragon Tree",
//     "image":
//         "https://balconygardenweb-lhnfx0beomqvnhspx.netdna-ssl.com/wp-content/uploads/2021/04/5-Dragon-Tree.jpg.webp",
//   },

//   {
//     "plantName": " Silver Dollar Vine",
//     "image":
//         "https://balconygardenweb-lhnfx0beomqvnhspx.netdna-ssl.com/wp-content/uploads/2021/04/6-Silver-Dollar-Vine.jpg.webp",
//   }
// ];
