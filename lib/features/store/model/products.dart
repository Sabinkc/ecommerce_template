import 'package:flutter/material.dart';

final List products = [
  {
    "productId": "Lenovo",
    "imagewithColor": {
      Colors.grey: [
        "assets/images/laptop.jpg",
        "assets/images/laptop_1.jpg",
        "assets/images/laptop.jpg",
      ],
      Colors.black: [
        "assets/images/laptop.jpg",
        "assets/images/laptop_1.jpg",
        "assets/images/laptop.jpg",
      ],
    },
    "productName": "Lenovo Ideapad 1 15lGL7 11thGen Intel Celeron N4020 8GB DDR4 RAM 256GB SSD 15.6 HD Display",
    "category": "Laptop",
    "productPrice": 130000,
    "discountedPrice": 110500,
    "discount": true,
    "discountPerc": 15,
    "desc": "The slim and light Lenovo IdeaPad 3i laptop packs powerful 12th generation Intel Core i5 U series processors and Intel Iris Xe graphics card.Voltage:3.7 volts.",
    "specifications": {
      "Brand": "Lenovo",
      "Display Size": "15.4 inch",
      "CPU Cores": "Dual Core",
      "Operating System": "Windows",
      "Graphic Card": "Integrated",
    },
    "specs": ["4GB / 64GB", "6GB / 128GB", "8GB / 256GB", "16GB / 512GB"]
  },
  {
    "productId": "Ghock1",
    "imagewithColor": {
      Colors.red: [
        "assets/images/watch.jpg",
        "assets/images/watch.jpg",
        "assets/images/watch.jpg",
      ],
      Colors.black: [
        "assets/images/watch.jpg",
        "assets/images/watch.jpg",
        "assets/images/watch.jpg",
      ],
      Colors.blue: [
        "assets/images/watch.jpg",
        "assets/images/watch.jpg",
        "assets/images/watch.jpg",
      ],
    },
    "productName": "Casio GM-2100-1AJF G-Shock Men's Watch",
    "category": "Watch",
    "productPrice": 10000,
    "discountedPrice": 0,
    "discount": false,
    "discountPerc": 0,
    "desc": "Casio GM-2100-1AJF G-Shock Men's Watch, Metal Cover, Black",
    "specifications": {
      "Brand": "Casio",
      "Model number": "GA2100",
      "Item Shape": "Round",
      "Dial window material type": "Mineral",
      "Display Type": "Analog",
      "Clasp": "Buckle",
      "Case material": "Resin",
      "Case Size": "48.5 x 45.4 x 11.8 mm",
      "Band Material": "Resin",
      "Band length": "Men's Standard",
      "Calendar": "Day and date",
      "Movement": "Japanese Quartz",
      "Water resistant depth": "200 Meters"
    },
  },
  {
    "productId": "Case1",
    "imagewithColor": {
      const Color(0xFF424E5A): [
        "assets/images/phonecase.jpg",
        "assets/images/phonecase_1.jpg",
        "assets/images/phonecase_2.jpg",
      ],
      const Color(0xFFFBA578): [
        "assets/images/phonecase_3.jpg",
        "assets/images/phonecase_4.jpg",
        "assets/images/phonecase_5.jpg",
      ],
      const Color(0xFFFDEAE6): [
        "assets/images/phonecase_6.jpg",
        "assets/images/phonecase_7.jpg",
        "assets/images/phonecase_8.jpg",
      ],
      const Color(0xFF323433): [
        "assets/images/phonecase_9.jpg",
        "assets/images/phonecase_10.jpg",
        "assets/images/phonecase_11.jpg",
      ],
    },
    "productName": "Benks ArmorPro Case for iPhone 15 Pro Max 600D Aramid Fiber Cover",
    "category": "Phone Case",
    "productPrice": 1054,
    "discountedPrice": 0,
    "discount": false,
    "discountPerc": 0,
    "desc":
        "Made with 600D DuPont™ Kevlar® fiber, Benks ArmorPro Case offers robust protection and minimalistic style for your iPhone 15 Pro Max MagSafe, Compatible Ultra-Slim, Minimalist, Design Easily, Detachable Durable and Robust Minimalist Style. It is sleek and elegant.- Buttons and lens frame color blends in well with the new iPhone natural. Titanium color- Has a dedicated action button (with a orange accent that matches the Ultra iWatch)- Cut outs are large and easy to access-&nbsp; actually provide drop data, and use real kevlar. The back looks and feels luxurious, and it is very smooth, but grippy.- Easy to clean, very few places for anything to accumulate, and no hard to reach corners when disinfecting- Slim, slender, thin but protective, and light.",
  },
  {
    "productId": "Headphone1",
    "imagewithColor": {
      const Color(0xFF564743): [
        "assets/images/headphone.jpg",
        "assets/images/headphone_1.jpg",
        "assets/images/headphone_2.jpg",
      ],
      const Color(0xFF333536): [
        "assets/images/headphone_3.jpg",
        "assets/images/headphone_4.jpg",
        "assets/images/headphone_5.jpg",
      ],
      const Color(0xFF2D2D3B): [
        "assets/images/headphone_6.jpg",
        "assets/images/headphone_7.jpg",
        "assets/images/headphone_8.jpg",
      ],
    },
    "productName": "Beats Studio Pro Wireless Headphones",
    "category": "headphone",
    "productPrice": 37000,
    "discountedPrice": 30320,
    "discountPerc": 20,
    "discount": true,
    "desc":
        "What's in the box: Beats Studio3 Wireless headphones, Carrying case, 3.5mm RemoteTalk cable, Universal USB charging cable, Quick Start Guide, Warranty Card (USB power adapter sold separately)",
    "specifications": {
      " Model": "MWC Firo (MH01B)",
      "Chip": "Jieli 6956",
      "Battery Capacity": "300mAh",
      "Stand-by Time": "300h",
      "Play music": "12h",
      "Charging Time": "2h",
      "Size": "W 17.4cm * L 18.4cm H 4.6cm",
      "Frequency Rage": "2.402MHz-2.480MHz",
      "Charging Voltage": "DC5V 300MA",
      "Ambient Temperature": "-20℃/+60℃",
      "Transmission Distance": "10m",
    },
  },
  {
    "productId": "Nillkin",
    "imagewithColor": {
      Colors.black: [
        "assets/images/nillkin.jpg",
        "assets/images/nillkin_1.jpg",
        "assets/images/nillkin_2.jpg",
      ],
      Colors.grey: [
        "assets/images/nillkin.jpg",
        "assets/images/nillkin_1.jpg",
        "assets/images/nillkin_2.jpg",
      ],
    },
    "productName": "Nillkin Bumper Keyboard Case For Apple Ipad Air, Air 5,10.5, Pro",
    "category": "Case",
    "productPrice": 9000,
    "discountedPrice": 8500,
    "discountPerc": 5.5,
    "discount": true,
    "desc":
        "Bumper Combo Keyboard Case (Backlit version) is a multi-function keyboard case specially for iPad Pro and iPad Air, featuring an adjustable stand, a removable keyboard and a trackpad that make it convenient to type, view, read and sketch. Also let you enjoy a flexible operation experience. The adopted military-grade anti-fall case wraps tightly around iPad 's edges, offering all around protection. -Patented sliding camera cover design efficiently protect iPad's camera from abrasion and scratches. Concise and delicate PU fabric blends with the aesthetics of iPad, a perfect integration of art and technology.",
    "specifications": {},
  },
  {
    "productId": "COTEetCI",
    "imagewithColor": {
      Colors.black: [
        "assets/images/sticker.jpg",
        "assets/images/sticker_1.jpg",
        "assets/images/sticker_2.jpg",
      ],
      Colors.grey: [
        "assets/images/sticker.jpg",
        "assets/images/sticker_1.jpg",
        "assets/images/sticker_2.jpg",
      ],
    },
    "productName": "COTEetCI 3m Protection Full Sticker for MacBook Air 13-inch 2020",
    "category": "Sticker",
    "productPrice": 2850,
    "discountedPrice": 0,
    "discountPerc": 0,
    "discount": false,
    "desc":
        "Compatible with MacBook Pro 16 or 16.2 inch M3 Pro , M3 Max , M2 Pro , M2 Max , M1 Pro ,A2485 , A2780 , A2991&nbsp;Please kindly check the model number 'Axxxx' on the back of the MacBook before your purchaseOn-the-go travel protectionStylish Ultra-thin protectionOnly exits to restore the beauty of MacBook designAccurate alignment, Fine cutting, Highlighting quality",
  },
];
