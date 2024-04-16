import 'package:flutter/material.dart';

import '../constants/image_constants.dart';

class RestroData {

  static const String jsonData =
  '''{
    "response":[
      {
        "dishes": [
          {
            "image": "https://firebasestorage.googleapis.com/v0/b/restaurant-80efb.appspot.com/o/menu%2Flobster.jpg?alt=media&token=4f17c9f3-2d5b-45f5-b12c-e7fbb62752b5",
            "category": "fish",
            "name": "Lobster tails and sesame Bok Choy",
            "price": "300",
            "ingredients": "shiitake mushroom, sesame oil, 2 lobster tails, hot cooked brown basmati or jasmine rice, 2 heads baby bok choy, white miso",
            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
          },
          {
            "image": "https://firebasestorage.googleapis.com/v0/b/restaurant-80efb.appspot.com/o/menu%2Fsteak.jpg?alt=media&token=2344040d-1a11-411d-816d-3955c9b96edf",
            "category": "meat",
            "name": "Coffee-Rubbed Steak with brussels salad",
            "price": "300",
            "ingredients": "ground coffee beans, shredded Brussels sprouts, blue cheese, black pepper, 500g hanger steak, olive oil, honey, chopped toasted pecans, ",
            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
          },
          {
            "image": "https://firebasestorage.googleapis.com/v0/b/restaurant-80efb.appspot.com/o/menu%2Feggs.jpg?alt=media&token=a831b04b-155c-4b64-912c-3e3af6796f15",
            "category": "meat",
            "name": "Lightened-Up scotch eggs",
            "price": "300",
            "ingredients": "ground turkey, fresh sage, garlic clove, 4 hard-cooked large eggs, canola oil",
            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
          },
          {
            "image": "https://firebasestorage.googleapis.com/v0/b/restaurant-80efb.appspot.com/o/menu%2Fsauce.jpg?alt=media&token=6a7fef58-039f-40d5-95ec-4c2f4732e554",
            "category": "garnish",
            "name": "Romesco sauce",
            "price": "300",
            "ingredients": "4 garlic cloves, red bell peppers, jalapeño or fresno chile, olive oil, tomato, red wine",
            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
          },
          {
            "image":"https://firebasestorage.googleapis.com/v0/b/restaurant-80efb.appspot.com/o/menu%2Fpie.jpg?alt=media&token=93d427f4-f486-4c78-bd86-c5b3469dd796",
            "category": "desert",
            "name": "Cranberry and dark cherry clafoutis",
            "price": "300",
            "ingredients": "almond extract, cranberries, cinnamon, cherries, reduced-fat milk, sugar",
            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
          },
          {
            "image": "https://firebasestorage.googleapis.com/v0/b/restaurant-80efb.appspot.com/o/menu%2Fpoached%20pears.jpg?alt=media&token=791aed0d-eead-4a5f-a0bc-808573066734",
            "category": "desert",
            "name": "Pomegranate-poached pears",
            "price": "300",
            "ingredients": "pears, vanilla extract, Pinot Noir, maple syrup, pomegranate juice,reduced-fat Greek yogurt",
            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
          },
          {
            "image": "https://firebasestorage.googleapis.com/v0/b/restaurant-80efb.appspot.com/o/menu%2Foysters.jpg?alt=media&token=4429f8fe-de63-4f46-9489-b42cd5ce3ed0",
            "category": "fish",
            "name": "Barbecued oysters with garlic",
            "price": "300",
            "ingredients": "onion, lemon juice, parsley leaves, garlic, 12 rock oysters",
            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
          },
          {
            "image": "https://firebasestorage.googleapis.com/v0/b/restaurant-80efb.appspot.com/o/menu%2Fsalad.jpg?alt=media&token=4646a685-af37-482c-b141-7fc918b688b3",
            "category": "meat",
            "name": "Minted melon, tomato & prosciutto salad",
            "price": "300",
            "ingredients": "heirloom tomatoes, Charentais melon, prosciutto, red wine,  mint, crusty bread",
            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
          },
          {
            "image":"https://firebasestorage.googleapis.com/v0/b/restaurant-80efb.appspot.com/o/menu%2Fshrimp.jpg?alt=media&token=cb2f67b9-820d-4800-9596-73e57f7cb6a4",
            "category": "meat",
            "name": "John's jambalaya",
            "price": "300",
            "ingredients": "chicken thighs fillets, sesame oil, garlic, cherry tomatoes, fresh thyme leaves, oregano",
            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
          },
          {
            "image":"https://firebasestorage.googleapis.com/v0/b/restaurant-80efb.appspot.com/o/menu%2Fsteakpotato.jpg?alt=media&token=112f6ca5-4d74-47cb-bd95-f7d5031bfa9f",
            "category": "meat",
            "name": "Peppered fillet steak with parsley potatoes",
            "price": "300",
            "ingredients": "3 large red-skinned potatoes, sesame oil, garlic, parsley, watercress salad, 2 beef fillet steaks",
            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
          },
          {
            "image": "https://firebasestorage.googleapis.com/v0/b/restaurant-80efb.appspot.com/o/menu%2Ffish.jpg?alt=media&token=45a37c05-90ea-4eef-b5f9-eff1a3c0356d",
            "category": "fish",
            "name": "Baked sea bass with fennel",
            "price": "300",
            "ingredients": "2 sea bass, olive oil, basil leaves, black olives, lemon slices, fennel",
            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
          },
          {
            "image": "https://firebasestorage.googleapis.com/v0/b/restaurant-80efb.appspot.com/o/menu%2Fsalmon.jpg?alt=media&token=cc7bbe8a-a615-46d4-9c7e-bff212b997ea",
            "category": "fish",
            "name": "Smoked salmon with prawns",
            "price": "300",
            "ingredients": "4 slices smoked salmon, olive oil, 10 large prawns, lime juice, salad leaf, root ginger",
            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
          }
        ],
        "wines": [
          {
            "category":"white",
            "name": "Wine I",
            "price": "300",
            "ingredients": "grapes",
            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit 13%alc."
          },
          {
            "category":"white",
            "name": "Wine II",
            "price": "300",
            "ingredients": "grapes",
            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit 13%alc."
          },
          {
            "category":"white",
            "name": "Wine III",
            "price": "300",
            "ingredients": "grapes",
            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit 13%alc."
          },
          {
            "category":"white",
            "name": "Wine IV",
            "price": "300",
            "ingredients": "grapes",
            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit 13%alc."
          },
          {
            "category":"red",
            "name": "Wine V",
            "price": "300",
            "ingredients": "grapes",
            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit 13%alc."
          },
          {
            "category":"red",
            "name": "Wine VI",
            "price": "300",
            "ingredients": "grapes",
            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit 13%alc."
          },
          {
            "category":"red",
            "name": "Wine VII",
            "price": "300",
            "ingredients": "grapes",
            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit 13%alc."
          },
          {
            "category":"rose",
            "name": "Wine VIII",
            "price": "300",
            "ingredients": "grapes",
            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit 13%alc."
          },
          {
            "category":"rose",
            "name": "Wine IX",
            "price": "300",
            "ingredients": "grapes",
            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit 13%alc."
          },
          {
            "category":"rose",
            "name": "Wine X",
            "price": "300",
            "ingredients": "grapes",
            "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit 13%alc."
          }
        ],
        "reservation": []
      }
    ]
  }''';

  static const String restaurantData = '''{
    "response":
    [
    {
        "_id": 101,
        "image": "${ImageConstants.rivaroCafe}",
        "name": "Tupac Berlin",
        "contact": {
            "phone": "+493078891980",
            "email": "morrisparkbakeshop@example.org",
            "location": [
                52.4916992,
                13.3146769
            ]
        },
        "stars": 4,
        "categories": [
            "Italian",
            "Polynesian",
            "Coffee"
        ],
        "no_reviews": "1420",
        "address": "Hagelberger Str. 9, 10965 Berlin, Germany",
        "rating": {
            "one": "25",
            "two": "36",
            "three": "88",
            "four": "90",
            "five": "45"
        },
        "reviews": [
            {
                "name": "John Doe",
                "image": "john_doe.jpg",
                "reviewRating": 4.5,
                "title": "Great product!",
                "text": "I absolutely love this product. It exceeded my expectations and I would highly recommend it to others."
            },
            {
                "name": "Jane Smith",
                "image": "jane_smith.jpg",
                "reviewRating": 5,
                "title": "Amazing!",
                "text": "This product is amazing. It's exactly what I needed and I'm extremely satisfied with my purchase."
            },
            {
                "name": "Michael Johnson",
                "image": "michael_johnson.jpg",
                "reviewRating": 4,
                "title": "Good value for money",
                "text": "I found this product to be a good value for the price. It's well-made and functions exactly as described."
            },
            {
                "name": "Emily Brown",
                "image": "emily_brown.jpg",
                "reviewRating": 3.5,
                "title": "Decent product",
                "text": "Overall, this product is decent. It works fine but there are a few minor issues that could be improved."
            }
        ]
    },
    {
        "_id": 102,
        "image": "${ImageConstants.rivaroCafe}",
        "name": "Kitchen & Bar at Courtyard",
        "contact": {
            "phone": "492-555-0119",
            "email": "djreynoldspubandrestaurant@example.org",
            "location": [
                52.4916992,
                13.3146769
            ]
        },
        "stars": 2,
        "categories": [
            "Pancakes",
            "Californian",
            "African"
        ],
        "no_reviews": "1358",
        "address": "Axel-Springer-Straße 55, 10117 Berlin, Germany",
        "rating": {
            "one": "25",
            "two": "36",
            "three": "88",
            "four": "90",
            "five": "45"
        },
        "reviews": [
            {
                "name": "John Doe",
                "image": "john_doe.jpg",
                "reviewRating": 4.5,
                "title": "Great product!",
                "text": "I absolutely love this product. It exceeded my expectations and I would highly recommend it to others."
            },
            {
                "name": "Jane Smith",
                "image": "jane_smith.jpg",
                "reviewRating": 5,
                "title": "Amazing!",
                "text": "This product is amazing. It's exactly what I needed and I'm extremely satisfied with my purchase."
            },
            {
                "name": "Michael Johnson",
                "image": "michael_johnson.jpg",
                "reviewRating": 4,
                "title": "Good value for money",
                "text": "I found this product to be a good value for the price. It's well-made and functions exactly as described."
            },
            {
                "name": "Emily Brown",
                "image": "emily_brown.jpg",
                "reviewRating": 3.5,
                "title": "Decent product",
                "text": "Overall, this product is decent. It works fine but there are a few minor issues that could be improved."
            }
        ]
    },
    {
        "_id": 103,
        "image": "${ImageConstants.rivaroCafe}",
        "name": "Bon Dia Restaurant",
        "contact": {
            "phone": "152-555-0146",
            "email": "wendy's@example.net",
            "location": [
                52.4916992,
                13.3146769
            ]
        },
        "stars": 4,
        "categories": [
            "Fruits",
            "Greek",
            "Chinese"
        ],
        "no_reviews": "120",
        "address": "Budapester Str. 45, 10787 Berlin, Germany",
        "rating": {
            "one": "25",
            "two": "36",
            "three": "88",
            "four": "90",
            "five": "45"
        },
        "reviews": [
            {
                "name": "John Doe",
                "image": "john_doe.jpg",
                "reviewRating": 4.5,
                "title": "Great product!",
                "text": "I absolutely love this product. It exceeded my expectations and I would highly recommend it to others."
            },
            {
                "name": "Jane Smith",
                "image": "jane_smith.jpg",
                "reviewRating": 5,
                "title": "Amazing!",
                "text": "This product is amazing. It's exactly what I needed and I'm extremely satisfied with my purchase."
            },
            {
                "name": "Michael Johnson",
                "image": "michael_johnson.jpg",
                "reviewRating": 4,
                "title": "Good value for money",
                "text": "I found this product to be a good value for the price. It's well-made and functions exactly as described."
            },
            {
                "name": "Emily Brown",
                "image": "emily_brown.jpg",
                "reviewRating": 3.5,
                "title": "Decent product",
                "text": "Overall, this product is decent. It works fine but there are a few minor issues that could be improved."
            }
        ]
    },
    {
        "_id": 104,
        "image": "${ImageConstants.rivaroCafe}",
        "name": "The Social Hub Restaurant & Bar Berlin",
        "contact": {
            "phone": "887-555-0124",
            "email": "rivieracaterer@example.com",
            "location": [
                52.4916992,
                13.3146769
            ]
        },
        "stars": 5,
        "categories": [
            "Japanese"
        ],
        "no_reviews": "258",
        "address": "Schicklerstraße 40, 10179 Berlin, Germany",
        "rating": {
            "one": "25",
            "two": "36",
            "three": "88",
            "four": "90",
            "five": "45"
        },
        "reviews": [
            {
                "name": "John Doe",
                "image": "john_doe.jpg",
                "reviewRating": 4.5,
                "title": "Great product!",
                "text": "I absolutely love this product. It exceeded my expectations and I would highly recommend it to others."
            },
            {
                "name": "Jane Smith",
                "image": "jane_smith.jpg",
                "reviewRating": 5,
                "title": "Amazing!",
                "text": "This product is amazing. It's exactly what I needed and I'm extremely satisfied with my purchase."
            },
            {
                "name": "Michael Johnson",
                "image": "michael_johnson.jpg",
                "reviewRating": 4,
                "title": "Good value for money",
                "text": "I found this product to be a good value for the price. It's well-made and functions exactly as described."
            },
            {
                "name": "Emily Brown",
                "image": "emily_brown.jpg",
                "reviewRating": 3.5,
                "title": "Decent product",
                "text": "Overall, this product is decent. It works fine but there are a few minor issues that could be improved."
            }
        ]
    },
    {
        "_id": 105,
        "image": "${ImageConstants.rivaroCafe}",
        "name": "Brunos On The Boulevard",
        "contact": {
            "phone": "467-555-0191",
            "email": "brunosontheboulevard@example.net",
            "location": [
                -73.8803827,
                40.7643124
            ]
        },
        "stars": 2,
        "categories": [
            "Vegetarian",
            "Smoothies",
            "Donuts",
            "Southwestern"
        ],
        "no_reviews": "1120",
        "address": "Friedrich-Wilhelm-Straße 67, 12103 Berlin, Germany",
        "rating": {
            "one": "25",
            "two": "36",
            "three": "88",
            "four": "90",
            "five": "45"
        },
        "reviews": [
            {
                "name": "John Doe",
                "image": "john_doe.jpg",
                "reviewRating": 4.5,
                "title": "Great product!",
                "text": "I absolutely love this product. It exceeded my expectations and I would highly recommend it to others."
            },
            {
                "name": "Jane Smith",
                "image": "jane_smith.jpg",
                "reviewRating": 5,
                "title": "Amazing!",
                "text": "This product is amazing. It's exactly what I needed and I'm extremely satisfied with my purchase."
            },
            {
                "name": "Michael Johnson",
                "image": "michael_johnson.jpg",
                "reviewRating": 4,
                "title": "Good value for money",
                "text": "I found this product to be a good value for the price. It's well-made and functions exactly as described."
            },
            {
                "name": "Emily Brown",
                "image": "emily_brown.jpg",
                "reviewRating": 3.5,
                "title": "Decent product",
                "text": "Overall, this product is decent. It works fine but there are a few minor issues that could be improved."
            }
        ]
    },
    {
        "_id": 106,
        "image": "${ImageConstants.rivaroCafe}",
        "name": "Mövenpick",
        "contact": {
            "phone": "472-555-0118",
            "email": "kosherisland@example.com",
            "location": [
                52.4916992,
                13.3146769
            ]
        },
        "stars": 4,
        "categories": [
            "Caribbean",
            "Puerto Rican",
            "Puerto Rican"
        ],
        "no_reviews": "1369",
        "address": "Schöneberger Str. 3, 10963 Berlin, Germany",
        "rating": {
            "one": "25",
            "two": "36",
            "three": "88",
            "four": "90",
            "five": "45"
        },
        "reviews": [
            {
                "name": "John Doe",
                "image": "john_doe.jpg",
                "reviewRating": 4.5,
                "title": "Great product!",
                "text": "I absolutely love this product. It exceeded my expectations and I would highly recommend it to others."
            },
            {
                "name": "Jane Smith",
                "image": "jane_smith.jpg",
                "reviewRating": 5,
                "title": "Amazing!",
                "text": "This product is amazing. It's exactly what I needed and I'm extremely satisfied with my purchase."
            },
            {
                "name": "Michael Johnson",
                "image": "michael_johnson.jpg",
                "reviewRating": 4,
                "title": "Good value for money",
                "text": "I found this product to be a good value for the price. It's well-made and functions exactly as described."
            },
            {
                "name": "Emily Brown",
                "image": "emily_brown.jpg",
                "reviewRating": 3.5,
                "title": "Decent product",
                "text": "Overall, this product is decent. It works fine but there are a few minor issues that could be improved."
            }
        ]
    },
    {
        "_id": 107,
        "image": "${ImageConstants.rivaroCafe}",
        "name": "FOODFACTORY Cube Berlin",
        "contact": {
            "phone": "718-555-0193",
            "email": "tovkosherkitchen@example.com",
            "location": [
                52.4916992,
                13.3146769
            ]
        },
        "stars": 3,
        "categories": [
            "Steak",
            "Creole",
            "Steak",
            "Cajun"
        ],
        "no_reviews": "9658",
        "address": "Washingtonpl. 3, 10557 Berlin, Germany",
        "rating": {
            "one": "25",
            "two": "36",
            "three": "88",
            "four": "90",
            "five": "45"
        },
        "reviews": [
            {
                "name": "John Doe",
                "image": "john_doe.jpg",
                "reviewRating": 4.5,
                "title": "Great product!",
                "text": "I absolutely love this product. It exceeded my expectations and I would highly recommend it to others."
            },
            {
                "name": "Jane Smith",
                "image": "jane_smith.jpg",
                "reviewRating": 5,
                "title": "Amazing!",
                "text": "This product is amazing. It's exactly what I needed and I'm extremely satisfied with my purchase."
            },
            {
                "name": "Michael Johnson",
                "image": "michael_johnson.jpg",
                "reviewRating": 4,
                "title": "Good value for money",
                "text": "I found this product to be a good value for the price. It's well-made and functions exactly as described."
            },
            {
                "name": "Emily Brown",
                "image": "emily_brown.jpg",
                "reviewRating": 3.5,
                "title": "Decent product",
                "text": "Overall, this product is decent. It works fine but there are a few minor issues that could be improved."
            }
        ]
    },
    {
        "_id": 108,
        "image": "${ImageConstants.rivaroCafe}",
        "name": "Maschari Cafe & Restaurant",
        "contact": {
            "phone": "497-555-0155",
            "email": "tastethetropicsicecream@example.net",
            "location": [
                52.4916992,
                13.3146769
            ]
        },
        "stars": 2,
        "categories": [
            "French",
            "South and Central American"
        ],
        "no_reviews": "1258",
        "address": "Wiener Straße 1-6, 10999 Berlin, Germany",
        "rating": {
            "one": "25",
            "two": "36",
            "three": "88",
            "four": "90",
            "five": "45"
        },
        "reviews": [
            {
                "name": "John Doe",
                "image": "john_doe.jpg",
                "reviewRating": 4.5,
                "title": "Great product!",
                "text": "I absolutely love this product. It exceeded my expectations and I would highly recommend it to others."
            },
            {
                "name": "Jane Smith",
                "image": "jane_smith.jpg",
                "reviewRating": 5,
                "title": "Amazing!",
                "text": "This product is amazing. It's exactly what I needed and I'm extremely satisfied with my purchase."
            },
            {
                "name": "Michael Johnson",
                "image": "michael_johnson.jpg",
                "reviewRating": 4,
                "title": "Good value for money",
                "text": "I found this product to be a good value for the price. It's well-made and functions exactly as described."
            },
            {
                "name": "Emily Brown",
                "image": "emily_brown.jpg",
                "reviewRating": 3.5,
                "title": "Decent product",
                "text": "Overall, this product is decent. It works fine but there are a few minor issues that could be improved."
            }
        ]
    },
    {
        "_id": 109,
        "image": "${ImageConstants.rivaroCafe}",
        "name": "Al Faisal Grills and Restaurant",
        "contact": {
            "phone": "153-555-0172",
            "email": "wilken'sfinefood@example.net",
            "location": [
                52.4916992,
                13.3146769
            ]
        },
        "stars": 4,
        "categories": [
            "Hotdogs",
            "Vietnamese",
            "Italian",
            "Tex-Mex",
            "Italian"
        ],
        "no_reviews": "3695",
        "address": "Sonnenallee 13, 12047 Berlin, Germany",
        "rating": {
            "one": "25",
            "two": "36",
            "three": "88",
            "four": "90",
            "five": "45"
        },
        "reviews": [
            {
                "name": "John Doe",
                "image": "john_doe.jpg",
                "reviewRating": 4.5,
                "title": "Great product!",
                "text": "I absolutely love this product. It exceeded my expectations and I would highly recommend it to others."
            },
            {
                "name": "Jane Smith",
                "image": "jane_smith.jpg",
                "reviewRating": 5,
                "title": "Amazing!",
                "text": "This product is amazing. It's exactly what I needed and I'm extremely satisfied with my purchase."
            },
            {
                "name": "Michael Johnson",
                "image": "michael_johnson.jpg",
                "reviewRating": 4,
                "title": "Good value for money",
                "text": "I found this product to be a good value for the price. It's well-made and functions exactly as described."
            },
            {
                "name": "Emily Brown",
                "image": "emily_brown.jpg",
                "reviewRating": 3.5,
                "title": "Decent product",
                "text": "Overall, this product is decent. It works fine but there are a few minor issues that could be improved."
            }
        ]
    },
    {
        "_id": 110,
        "image": "${ImageConstants.rivaroCafe}",
        "name": "Café Wintergarten (Restaurant & Café)",
        "contact": {
            "phone": "863-555-0146",
            "email": "reginacaterers@example.org",
            "location": [
                52.4916992,
                13.3146769
            ]
        },
        "stars": 4,
        "categories": [
            "Sandwiches",
            "Middle Eastern",
            "Turkish",
            "Dominican"
        ],
        "no_reviews": "1478",
        "address": "Potsdamer Str. 96 10785, 10785 Berlin, Germany",
        "rating": {
            "one": "25",
            "two": "36",
            "three": "88",
            "four": "90",
            "five": "45"
        },
        "reviews": [
            {
                "name": "John Doe",
                "image": "john_doe.jpg",
                "reviewRating": 4.5,
                "title": "Great product!",
                "text": "I absolutely love this product. It exceeded my expectations and I would highly recommend it to others."
            },
            {
                "name": "Jane Smith",
                "image": "jane_smith.jpg",
                "reviewRating": 5,
                "title": "Amazing!",
                "text": "This product is amazing. It's exactly what I needed and I'm extremely satisfied with my purchase."
            },
            {
                "name": "Michael Johnson",
                "image": "michael_johnson.jpg",
                "reviewRating": 4,
                "title": "Good value for money",
                "text": "I found this product to be a good value for the price. It's well-made and functions exactly as described."
            },
            {
                "name": "Emily Brown",
                "image": "emily_brown.jpg",
                "reviewRating": 3.5,
                "title": "Decent product",
                "text": "Overall, this product is decent. It works fine but there are a few minor issues that could be improved."
            }
        ]
    },
    {
        "_id": 111,
        "image": "${ImageConstants.rivaroCafe}",
        "name": "Lavin Restaurant",
        "contact": {
            "phone": "346-555-0132",
            "email": "wildasia@example.net",
            "location": [
                52.4916992,
                13.3146769
            ]
        },
        "stars": 3,
        "categories": [
            "Cajun",
            "Juice",
            "Brazilian",
            "Creole",
            "Korean"
        ],
        "no_reviews": "2584",
        "address": "Herrfurthstraße 29, 12049 Berlin, Germany",
        "rating": {
            "one": "25",
            "two": "36",
            "three": "88",
            "four": "90",
            "five": "45"
        },
        "reviews": [
            {
                "name": "John Doe",
                "image": "john_doe.jpg",
                "reviewRating": 4.5,
                "title": "Great product!",
                "text": "I absolutely love this product. It exceeded my expectations and I would highly recommend it to others."
            },
            {
                "name": "Jane Smith",
                "image": "jane_smith.jpg",
                "reviewRating": 5,
                "title": "Amazing!",
                "text": "This product is amazing. It's exactly what I needed and I'm extremely satisfied with my purchase."
            },
            {
                "name": "Michael Johnson",
                "image": "michael_johnson.jpg",
                "reviewRating": 4,
                "title": "Good value for money",
                "text": "I found this product to be a good value for the price. It's well-made and functions exactly as described."
            },
            {
                "name": "Emily Brown",
                "image": "emily_brown.jpg",
                "reviewRating": 3.5,
                "title": "Decent product",
                "text": "Overall, this product is decent. It works fine but there are a few minor issues that could be improved."
            }
        ]
    },
    {
        "_id": 112,
        "image": "${ImageConstants.rivaroCafe}",
        "name": "Michelberger Restaurant",
        "contact": {
            "phone": "999-555-0128",
            "email": "candccateringservice@example.com",
            "location": [
                52.5045667,
                13.4478541
            ]
        },
        "stars": 0,
        "categories": [
            "Polynesian"
        ],
        "no_reviews": "2595",
        "address": "Warschauer Str. 39-40, 10243 Berlin, Germany",
        "rating": {
            "one": "25",
            "two": "36",
            "three": "88",
            "four": "90",
            "five": "45"
        },
        "reviews": [
            {
                "name": "John Doe",
                "image": "john_doe.jpg",
                "reviewRating": 4.5,
                "title": "Great product!",
                "text": "I absolutely love this product. It exceeded my expectations and I would highly recommend it to others."
            },
            {
                "name": "Jane Smith",
                "image": "jane_smith.jpg",
                "reviewRating": 5,
                "title": "Amazing!",
                "text": "This product is amazing. It's exactly what I needed and I'm extremely satisfied with my purchase."
            },
            {
                "name": "Michael Johnson",
                "image": "michael_johnson.jpg",
                "reviewRating": 4,
                "title": "Good value for money",
                "text": "I found this product to be a good value for the price. It's well-made and functions exactly as described."
            },
            {
                "name": "Emily Brown",
                "image": "emily_brown.jpg",
                "reviewRating": 3.5,
                "title": "Decent product",
                "text": "Overall, this product is decent. It works fine but there are a few minor issues that could be improved."
            }
        ]
    },
    {
        "_id": 113,
        "image": "${ImageConstants.rivaroCafe}",
        "name": "CHIARO",
        "contact": {
            "phone": "727-555-0144",
            "email": "maymaykitchen@example.com",
            "location": [
                52.5045788,
                13.3778519
            ]
        },
        "stars": 3,
        "categories": [
            "Gelato"
        ],
        "no_reviews": "1254",
        "address": "Behrenstraße 37, 10117 Berlin, Germany",
        "rating": {
            "one": "25",
            "two": "36",
            "three": "88",
            "four": "90",
            "five": "45"
        },
        "reviews": [
            {
                "name": "John Doe",
                "image": "john_doe.jpg",
                "reviewRating": 4.5,
                "title": "Great product!",
                "text": "I absolutely love this product. It exceeded my expectations and I would highly recommend it to others."
            },
            {
                "name": "Jane Smith",
                "image": "jane_smith.jpg",
                "reviewRating": 5,
                "title": "Amazing!",
                "text": "This product is amazing. It's exactly what I needed and I'm extremely satisfied with my purchase."
            },
            {
                "name": "Michael Johnson",
                "image": "michael_johnson.jpg",
                "reviewRating": 4,
                "title": "Good value for money",
                "text": "I found this product to be a good value for the price. It's well-made and functions exactly as described."
            },
            {
                "name": "Emily Brown",
                "image": "emily_brown.jpg",
                "reviewRating": 3.5,
                "title": "Decent product",
                "text": "Overall, this product is decent. It works fine but there are a few minor issues that could be improved."
            }
        ]
    },
    {
        "_id": 114,
        "image": "${ImageConstants.rivaroCafe}",
        "name": "Johnny's Bar - Karibisches Restaurant",
        "contact": {
            "phone": "231-555-0110",
            "email": "carvelicecream@example.com",
            "location": [
                52.5077352,
                13.3182724
            ]
        },
        "stars": 5,
        "categories": [
            "Caribbean"
        ],
        "no_reviews": "3695",
        "address": "Zimmerstraße 88/89, 10117 Berlin, Germany",
        "rating": {
            "one": "25",
            "two": "36",
            "three": "88",
            "four": "90",
            "five": "45"
        },
        "reviews": [
            {
                "name": "John Doe",
                "image": "john_doe.jpg",
                "reviewRating": 4.5,
                "title": "Great product!",
                "text": "I absolutely love this product. It exceeded my expectations and I would highly recommend it to others."
            },
            {
                "name": "Jane Smith",
                "image": "jane_smith.jpg",
                "reviewRating": 5,
                "title": "Amazing!",
                "text": "This product is amazing. It's exactly what I needed and I'm extremely satisfied with my purchase."
            },
            {
                "name": "Michael Johnson",
                "image": "michael_johnson.jpg",
                "reviewRating": 4,
                "title": "Good value for money",
                "text": "I found this product to be a good value for the price. It's well-made and functions exactly as described."
            },
            {
                "name": "Emily Brown",
                "image": "emily_brown.jpg",
                "reviewRating": 3.5,
                "title": "Decent product",
                "text": "Overall, this product is decent. It works fine but there are a few minor issues that could be improved."
            }
        ]
    },
    {
        "_id": 115,
        "image": "${ImageConstants.rivaroCafe}",
        "name": "Restaurant Mittmann's",
        "contact": {
            "phone": "240-555-0154",
            "email": "1east66thstreetkitchen@example.com",
            "location": [
                52.5077352,
                13.3182724
            ]
        },
        "stars": 1,
        "categories": [
            "Cuban"
        ],
        "no_reviews": "1485",
        "address": "Rungestraße 11, 10179 Berlin, Germany",
        "rating": {
            "one": "25",
            "two": "36",
            "three": "88",
            "four": "90",
            "five": "45"
        },
        "reviews": [
            {
                "name": "John Doe",
                "image": "john_doe.jpg",
                "reviewRating": 4.5,
                "title": "Great product!",
                "text": "I absolutely love this product. It exceeded my expectations and I would highly recommend it to others."
            },
            {
                "name": "Jane Smith",
                "image": "jane_smith.jpg",
                "reviewRating": 5,
                "title": "Amazing!",
                "text": "This product is amazing. It's exactly what I needed and I'm extremely satisfied with my purchase."
            },
            {
                "name": "Michael Johnson",
                "image": "michael_johnson.jpg",
                "reviewRating": 4,
                "title": "Good value for money",
                "text": "I found this product to be a good value for the price. It's well-made and functions exactly as described."
            },
            {
                "name": "Emily Brown",
                "image": "emily_brown.jpg",
                "reviewRating": 3.5,
                "title": "Decent product",
                "text": "Overall, this product is decent. It works fine but there are a few minor issues that could be improved."
            }
        ]
    },
    {
        "_id": 116,
        "image": "${ImageConstants.rivaroCafe}",
        "name": "Nante-Eck | Restaurant Berlin Mitte",
        "contact": {
            "phone": "452-555-0186",
            "email": "seudafoods@example.net",
            "location": [
                52.5077352,
                13.3182724
            ]
        },
        "stars": 0,
        "categories": [
            "Tea"
        ],
        "no_reviews": "2514",
        "address": "Unter den Linden 35, 10117 Berlin, Germany",
        "rating": {
            "one": "25",
            "two": "36",
            "three": "88",
            "four": "90",
            "five": "45"
        },
        "reviews": [
            {
                "name": "John Doe",
                "image": "john_doe.jpg",
                "reviewRating": 4.5,
                "title": "Great product!",
                "text": "I absolutely love this product. It exceeded my expectations and I would highly recommend it to others."
            },
            {
                "name": "Jane Smith",
                "image": "jane_smith.jpg",
                "reviewRating": 5,
                "title": "Amazing!",
                "text": "This product is amazing. It's exactly what I needed and I'm extremely satisfied with my purchase."
            },
            {
                "name": "Michael Johnson",
                "image": "michael_johnson.jpg",
                "reviewRating": 4,
                "title": "Good value for money",
                "text": "I found this product to be a good value for the price. It's well-made and functions exactly as described."
            },
            {
                "name": "Emily Brown",
                "image": "emily_brown.jpg",
                "reviewRating": 3.5,
                "title": "Decent product",
                "text": "Overall, this product is decent. It works fine but there are a few minor issues that could be improved."
            }
        ]
    },
    {
        "_id": 117,
        "image": "${ImageConstants.rivaroCafe}",
        "name": "Restaurant Maximilians Berlin",
        "contact": {
            "phone": "618-555-0199",
            "email": "carvelicecream@example.com",
            "location": [
                52.5077352,
                13.3182724
            ]
        },
        "stars": 0,
        "categories": [
            "American",
            "Pizza","Vegetables"
        ],
        "no_reviews": "6584",
        "address": "Friedrichstraße 185-190, 10117 Berlin, Germany",
        "rating": {
            "one": "25",
            "two": "36",
            "three": "88",
            "four": "90",
            "five": "45"
        },
        "reviews": [
            {
                "name": "John Doe",
                "image": "john_doe.jpg",
                "reviewRating": 4.5,
                "title": "Great product!",
                "text": "I absolutely love this product. It exceeded my expectations and I would highly recommend it to others."
            },
            {
                "name": "Jane Smith",
                "image": "jane_smith.jpg",
                "reviewRating": 5,
                "title": "Amazing!",
                "text": "This product is amazing. It's exactly what I needed and I'm extremely satisfied with my purchase."
            },
            {
                "name": "Michael Johnson",
                "image": "michael_johnson.jpg",
                "reviewRating": 4,
                "title": "Good value for money",
                "text": "I found this product to be a good value for the price. It's well-made and functions exactly as described."
            },
            {
                "name": "Emily Brown",
                "image": "emily_brown.jpg",
                "reviewRating": 3.5,
                "title": "Decent product",
                "text": "Overall, this product is decent. It works fine but there are a few minor issues that could be improved."
            }
        ]
    },
    {
        "_id": 118,
        "image": "${ImageConstants.rivaroCafe}",
        "name": "Dolores Mitte",
        "contact": {
            "phone": "447-555-0129",
            "email": "nordicdelicacies@example.org",
            "location": [
                52.5077352,
                13.3182724
            ]
        },
        "stars": 0,
        "categories": [
            "Confectionary"
        ],
        "no_reviews": "1596",
        "address": "Rosa-Luxemburg-Straße 7, 10178 Berlin, Germany",
        "rating": {
            "one": "25",
            "two": "36",
            "three": "88",
            "four": "90",
            "five": "45"
            },
            "reviews": [
                {
                    "name": "John Doe",
                    "image": "john_doe.jpg",
                    "reviewRating": 4.5,
                    "title": "Great product!",
                    "text": "I absolutely love this product. It exceeded my expectations and I would highly recommend it to others."
                },
                {
                    "name": "Jane Smith",
                    "image": "jane_smith.jpg",
                    "reviewRating": 5,
                    "title": "Amazing!",
                    "text": "This product is amazing. It's exactly what I needed and I'm extremely satisfied with my purchase."
                },
                {
                    "name": "Michael Johnson",
                    "image": "michael_johnson.jpg",
                    "reviewRating": 4,
                    "title": "Good value for money",
                    "text": "I found this product to be a good value for the price. It's well-made and functions exactly as described."
                },
                {
                    "name": "Emily Brown",
                    "image": "emily_brown.jpg",
                    "reviewRating": 3.5,
                    "title": "Decent product",
                    "text": "Overall, this product is decent. It works fine but there are a few minor issues that could be improved."
                }
            ]
    },
    {
        "_id": 119,
        "image": "${ImageConstants.rivaroCafe}",
        "name": "BRGRS. | Mitte",
        "contact": {
            "phone": "192-555-0130",
            "email": "gloriousfood@example.com",
            "location": [
                52.5077352,
                13.3182724
            ]
        },
        "stars": 3,
        "categories": [
            "Donuts",
            "Cuban",
            "Russian","Vegetables"
        ],
        "no_reviews": "1365",
        "address": "Brückenstraße 1A, 10179 Berlin, Germany",
        "rating": {
            "one": "25",
            "two": "36",
            "three": "88",
            "four": "90",
            "five": "45"
        },
        "reviews": [
            {
                "name": "John Doe",
                "image": "john_doe.jpg",
                "reviewRating": 4.5,
                "title": "Great product!",
                "text": "I absolutely love this product. It exceeded my expectations and I would highly recommend it to others."
            },
            {
                "name": "Jane Smith",
                "image": "jane_smith.jpg",
                "reviewRating": 5.0,
                "title": "Amazing!",
                "text": "This product is amazing. It's exactly what I needed and I'm extremely satisfied with my purchase."
            },
            {
                "name": "Michael Johnson",
                "image": "michael_johnson.jpg",
                "reviewRating": 4.0,
                "title": "Good value for money",
                "text": "I found this product to be a good value for the price. It's well-made and functions exactly as described."
            },
            {
                "name": "Emily Brown",
                "image": "emily_brown.jpg",
                "reviewRating": 3.5,
                "title": "Decent product",
                "text": "Overall, this product is decent. It works fine but there are a few minor issues that could be improved."
            }
        ]
    },
    {
        "_id": 120,
        "image": "${ImageConstants.rivaroCafe}",
        "name": "Frederick's",
        "contact": {
            "phone": "236-555-0153",
            "email": "sal'sdeli@example.net",
            "location": [
                52.5077352,
                13.3182724
            ]
        },
        "stars": 2,
        "categories": [
            "Vegetables",
            "coffee"
        ],
        "no_reviews": "3624",
        "address": "Bellevuestraße 1, 10785 Berlin, Germany",
        "rating": {
            "one": "25",
            "two": "36",
            "three": "88",
            "four": "90",
            "five": "45"
        },
        "reviews": [
            {
                "name": "John Doe",
                "image": "john_doe.jpg",
                "reviewRating": 4.5,
                "title": "Great product!",
                "text": "I absolutely love this product. It exceeded my expectations and I would highly recommend it to others."
            },
            {
                "name": "Jane Smith",
                "image": "jane_smith.jpg",
                "reviewRating": 5,
                "title": "Amazing!",
                "text": "This product is amazing. It's exactly what I needed and I'm extremely satisfied with my purchase."
            },
            {
                "name": "Michael Johnson",
                "image": "michael_johnson.jpg",
                "reviewRating": 4,
                "title": "Good value for money",
                "text": "I found this product to be a good value for the price. It's well-made and functions exactly as described."
            },
            {
                "name": "Emily Brown",
                "image": "emily_brown.jpg",
                "reviewRating": 3.5,
                "title": "Decent product",
                "text": "Overall, this product is decent. It works fine but there are a few minor issues that could be improved."
            }
        ]
    }
]
  }''';
}