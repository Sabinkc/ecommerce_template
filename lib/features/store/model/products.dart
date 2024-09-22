import 'package:flutter/material.dart';

// List of all product
final List products = [
  {
    "productId": "Lenovo",
    "categoryId": "Others",
    "section": "Deals",
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
    "productName": "Lenovo Ideapad 1 15lGL7 11th Gen Intel Celeron N4020 8GB DDR4 RAM 256GB SSD 15.6 HD Display",
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
    "productId": "Lenovo",
    "categoryId": "Test",
    "section": "Test",
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
    "productName": "Lenovo Ideapad 1 15lGL7 11th Gen Intel Celeron N4020 8GB DDR4 RAM 256GB SSD 15.6 HD Display",
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
  //Watches
  {
    "productId": "Gshock",
    "categoryId": "Watches",
    "section": "Best Seller",
    "imagewithColor": {
      Colors.black: [
        "assets/images/watch.jpg",
        "assets/images/watch.jpg",
        "assets/images/watch.jpg",
      ],
    },
    "productName": "Casio GM-2100-1AJF G-Shock Men's Watch",
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
    "productId": "Astrik",
    "categoryId": "Watches",
    "section": "New In",
    "imagewithColor": {
      Colors.black: [
        "assets/images/watches/asterisk1.jpg",
        "assets/images/watches/asterisk2.jpg",
        "assets/images/watches/asterisk3.jpg",
      ],
      const Color(0xFF3A2018): [
        "assets/images/watches/asterisk4.jpg",
        "assets/images/watches/asterisk5.jpg",
        "assets/images/watches/asterisk6.jpg",
      ],
      const Color(0xFF9F512E): [
        "assets/images/watches/asterisk7.jpg",
        "assets/images/watches/asterisk8.jpg",
        "assets/images/watches/asterisk9.jpg",
      ],
    },
    "productName": "Asterisk Jump Hour Automatic",
    "productPrice": 40000,
    "discountedPrice": 0,
    "discount": false,
    "discountPerc": 0,
    "desc": "The Channel Islands Automatic features a playful sea lion that indicates the minutes at the tip of its nose as it swims around the dial, and the jump hour is seen in the kelp below.",
    "specifications": {
      "Brand": "Asterisk",
      "CASE": "38mm Wide Hand-finished 316L Stainless Steel. 11mm Thick. 46mm Lug to Lug",
      "Item Shape": "Round",
      "Dial": " Multilayer printed illustrations",
      "Clasp": "Buckle",
      "Case material": "Solid Stainless Steel with Exhibition Window. Individually Numbered to 999",
      "CRYSTAL": "Ultra-scratch Resistant Sapphire Glass with Anti-reflective Coating",
      "Strap": "18mm Calf-skin Leather Strap with Tool-Free Quick Release Springbar System",
      "Calendar": "Day and date",
      "Movement": "Japanese Quartz",
      "Water resistant depth": "50 Meters",
      "Weight": "51 grams",
    },
  },
  {
    "productId": "CA",
    "categoryId": "Watches",
    "section": "Deals",
    "imagewithColor": {
      const Color(0xFFC35128): [
        "assets/images/watches/cal1.jpg",
      ],
      const Color(0xFF0D0D0D): [
        "assets/images/watches/cal2.jpg",
      ],
      const Color(0xFF1F5F5C): [
        "assets/images/watches/cal3.jpg",
      ],
    },
    "productName": "CA PCH Driver Jump Hour Brushed Gunmetal",
    "productPrice": 35000,
    "discountedPrice": 30000,
    "discount": true,
    "discountPerc": 5,
    "desc":
        "The CA PCH Driver is a nod to the driver's watches of the '70s. These designs allow you to read the time while your hand is on the steering wheel. The PCH utilizes a prism to reflect the hours and minutes from a flat surface up to the perpendicular angle for viewing. Using a micromotor gearbox, the hour jumps to the next hour when the minute disc reaches the 59-60 minute transition.",
    "specifications": {
      "Brand": "CA",
      "Movt": "Jump Hour Quartz with LED Light",
      "Case": "Gunmetal PVD 43mm Wide Brushed 316L Stainless Steel",
      "Clasp": "Buckle",
      "Strap": "22mm Silicone with Stainless Steel Buckle",
      "Water Resistance": "3 ATM",
    },
  },
  //Iphone Cases
  {
    "productId": "Iphone15",
    "categoryId": "Cases",
    "section": "New In",
    "imagewithColor": {
      const Color(0xFF6F4553): [
        "assets/images/iphonecases/iphone15_1.jpg",
        "assets/images/iphonecases/iphone15_2.jpg",
        "assets/images/iphonecases/iphone15_3.jpg",
      ],
      const Color(0xFF957963): [
        "assets/images/iphonecases/iphone15_4.jpg",
        "assets/images/iphonecases/iphone15_5.jpg",
        "assets/images/iphonecases/iphone15_6.jpg",
      ],
      const Color(0xFF545358): [
        "assets/images/iphonecases/iphone15_7.jpg",
        "assets/images/iphonecases/iphone15_8.jpg",
        "assets/images/iphonecases/iphone15_9.jpg",
      ],
    },
    "productName": "iPhone 15 FineWoven Case with MagSafe",
    "productPrice": 1054,
    "discountedPrice": 0,
    "discount": false,
    "discountPerc": 0,
    "desc": "Designed by Apple to complement iPhone 15, the FineWoven Case with MagSafe is a delightful"
        " way to give your iPhone extra protection while adding style."
        "Made from durable microtwill, the material has a soft, suedelike feel."
        " The FineWoven material was also designed with the earth in mind — it's made from "
        "68 percent post-consumer recycled content and significantly reduces carbon emissions"
        " compared to leather. The case quickly snaps into place and fits snugly over your iPhone"
        " without adding bulk."
        "With built-in magnets that align perfectly with iPhone 15, this case offers a magical"
        " attach experience and faster wireless charging, every time. When it's time to charge,"
        " just leave the case on your iPhone and snap on your MagSafe charger, or set it on your Qi-certified charger."
        "Like every Apple-designed case, it undergoes thousands of hours of testing throughout"
        " the design and manufacturing process. So not only does it look great, it's built to protect"
        " your iPhone from scratches and drops."
  },
  {
    "productId": "IphoneTT15",
    "categoryId": "Cases",
    "section": "Popular",
    "imagewithColor": {
      const Color(0xFF454442): [
        "assets/images/iphonecases/iphoneTT1.jpg",
      ],
      const Color(0xFFA19D97): [
        "assets/images/iphonecases/iphoneTT2.jpg",
      ],
      const Color(0xFFE6E3DC): [
        "assets/images/iphonecases/iphoneTT3.jpg",
      ],
      const Color(0xFF494E56): [
        "assets/images/iphonecases/iphoneTT4.jpg",
      ],
    },
    "productName": "iPhone 15 Pro Clear Case with MagSafe",
    "productPrice": 1054,
    "discountedPrice": 0,
    "discount": false,
    "discountPerc": 0,
    "desc": "Thin, light, and easy to grip — this Apple-designed case shows off the brilliant "
        "colored finish of iPhone 15 Pro while providing extra protection."
        "Crafted with a blend of optically clear polycarbonate and flexible materials, the"
        " case fits right over the buttons for easy use. On the surface, a scratch-resistant"
        " coating has been applied to both the interior and exterior. And all materials and "
        " coatings are optimized to prevent yellowing over time."
        "With built-in magnets that align perfectly with iPhone 15 Pro, this case offers a"
        " magical attach experience and faster wireless charging, every time. When it's time "
        " to charge, just leave the case on your iPhone and snap on your MagSafe charger, or "
        " set it on your Qi-certified charger."
  },
  {
    "productId": "Iphone15PP",
    "categoryId": "Cases",
    "section": "Deals",
    "imagewithColor": {
      const Color(0xFF424E5A): [
        "assets/images/iphonecases/iphone15PP_1.jpg",
        "assets/images/iphonecases/iphone15PP_2.jpg",
        "assets/images/iphonecases/iphone15PP_3.jpg",
      ],
      const Color(0xFFFBA578): [
        "assets/images/iphonecases/iphone15PP_4.jpg",
        "assets/images/iphonecases/iphone15PP_5.jpg",
        "assets/images/iphonecases/iphone15PP_6.jpg",
      ],
      const Color(0xFF323433): [
        "assets/images/iphonecases/iphone15PP_7.jpg",
        "assets/images/iphonecases/iphone15PP_8.jpg",
        "assets/images/iphonecases/iphone15PP_9.jpg",
      ],
    },
    "productName": "iPhone 15 Pro Silicone Case with MagSafe",
    "productPrice": 1500,
    "discountedPrice": 1200,
    "discount": true,
    "discountPerc": 5,
    "desc": "Designed by Apple to complement iPhone 15 Pro, the Silicone Case with MagSafe is "
        "a delightful way to protect your iPhone."
        "The silky, soft-touch finish of the silicone exterior feels great in your hand. "
        "And on the inside, there's a soft microfiber lining for even more protection."
        "With built-in magnets that align perfectly with iPhone 15 Pro, this case offers "
        "a magical attach experience and faster wireless charging, every time. When it's "
        "time to charge, just leave the case on your iPhone and snap on your MagSafe charger,"
        " or set it on your Qi-certified charger."
  },
  // Headphones
  {
    "productId": "Beats",
    "categoryId": "Headphones",
    "section": "Deals",
    "imagewithColor": {
      const Color(0xFF2D2D3B): [
        "assets/images/headphones/beats1.jpg",
        "assets/images/headphones/beats2.jpg",
        "assets/images/headphones/beats3.jpg",
      ],
      const Color(0xFF333536): [
        "assets/images/headphones/beats4.jpg",
        "assets/images/headphones/beats5.jpg",
        "assets/images/headphones/beats6.jpg",
      ],
      const Color(0xFF564743): [
        "assets/images/headphones/beats7.jpg",
        "assets/images/headphones/beats8.jpg",
        "assets/images/headphones/beats9.jpg",
      ],
    },
    "productName": "Beats Studio Pro Wireless Headphones",
    "productPrice": 37000,
    "discountedPrice": 30320,
    "discountPerc": 20,
    "discount": true,
    "desc": "What's in the box: Beats Studio3 Wireless headphones, Carrying case, 3.5mm"
        " RemoteTalk cable, Universal USB charging cable, Quick Start Guide, Warranty"
        " Card (USB power adapter sold separately)",
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
    "productId": "Astro",
    "categoryId": "Headphones",
    "section": "Best Seller",
    "imagewithColor": {
      const Color(0xFF9AB4AB): [
        "assets/images/headphones/astro1.jpg",
        "assets/images/headphones/astro2.jpg",
        "assets/images/headphones/astro3.jpg",
      ],
      const Color(0xFF212121): [
        "assets/images/headphones/astro4.jpg",
        "assets/images/headphones/astro5.jpg",
        "assets/images/headphones/astro6.jpg",
      ],
      const Color(0xFFC7C7C9): [
        "assets/images/headphones/astro7.jpg",
        "assets/images/headphones/astro8.jpg",
        "assets/images/headphones/astro9.jpg",
      ],
    },
    "productName": "Astro A10 Wired Gaming Headset",
    "productPrice": 37000,
    "discountedPrice": 0,
    "discountPerc": 0,
    "discount": false,
    "desc": "Buckle down for all-night gaming sessions with custom tuned"
        "1.30 in(32mm) dynamic drivers that are closed back for an immersive experience "
        "and astounding headband design for ultimate comfort. Adjust your audio without "
        "leaving your seat with the inline volume control so you never miss a moment of the action.",
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
    "productId": "Logitech",
    "categoryId": "Headphones",
    "section": "Popular",
    "imagewithColor": {
      Colors.black: [
        "assets/images/headphones/logitech1.jpg",
        "assets/images/headphones/logitech2.jpg",
        "assets/images/headphones/logitech3.jpg",
      ],
    },
    "productName": "Logitech G435 Ultra-Light Wireless Bluetooth Gaming Headset",
    "productPrice": 37000,
    "discountedPrice": 0,
    "discountPerc": 0,
    "discount": false,
    "desc": "Play games, play music, and play with friends. G435 Gaming Headset connects "
        "to your PC, phone, and other devices through gaming-grade LIGHTSPEED wireless and Bluetooth. "
        "It delivers powerful and clean sound while beamforming mics reduce background noise. "
        "It's also made with a minimum of 22% post-consumer recycled plastic. Play never ends with G435.",
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
  //Speakers
  {
    "productId": "Mivi",
    "categoryId": "Speakers",
    "section": "Deals",
    "imagewithColor": {
      const Color(0xFF373B40): [
        "assets/images/speakers/mivi1.jpg",
      ],
      const Color(0xFFFC6753): [
        "assets/images/speakers/mivi2.jpg",
      ],
      const Color(0xFF284471): [
        "assets/images/speakers/mivi3.jpg",
      ],
      const Color(0xFF336B51): [
        "assets/images/speakers/mivi4.jpg",
      ],
    },
    "productName": "Mivi Play 5 W Portable Bluetooth Speaker",
    "productPrice": 3000,
    "discountedPrice": 2500,
    "discountPerc": 3,
    "discount": true,
    "desc": "Meet Mivi Play, a portable and powerful Bluetooth speaker made for "
        "your personal indoor use. Movie marathons, Personal Concerts or a small get "
        "together, the Mivi Play bluetooth speaker is built to let you enjoy your favourite "
        "jams in all conditions. It packs a rechargeable lithium-ion battery of up to 12 hours, "
        "lasting longer than your party. Add a second speaker with our True Wireless Stereo feature "
        "to enter a stereo mode, and enjoy an even louder bass. With Bluetooth 5.0 and an in-built "
        "microphone, this speaker comes with the latest and advanced technology for all-round quality "
        "performance. This wireless bluetooth speaker will rock your world!",
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
    "productId": "boAt",
    "categoryId": "Speakers",
    "section": "New In",
    "imagewithColor": {
      const Color(0xFFC4281D): [
        "assets/images/speakers/boat1.jpg",
      ],
      const Color(0xFF40A5D7): [
        "assets/images/speakers/boat2.jpg",
      ],
      const Color(0xFF171515): [
        "assets/images/speakers/boat3.jpg",
      ],
    },
    "productName": "boAt Stone 350 10 W Bluetooth Speaker",
    "productPrice": 37000,
    "discountedPrice": 0,
    "discountPerc": 0,
    "discount": false,
    "desc": "Its time to enjoy a seamless playback experience courtesy boAt Stone "
        "350 10W portable wireless speaker. The speaker comes equipped with 1.96 dynamic "
        "drivers for an immersive stereo experience. It supports instant wireless connectivity "
        "with Bluetooth v5.0. The speaker pumps out nonstop audio for up to 12 hours on a single "
        "full charge. Apart from the wireless connectivity it comes equipped with the provision for "
        "AUX and TF Card connectivity as well. Its a cylindrical construct and an IPX7 rated water "
        "resistance for a carefree listening time and easy portability. Immerse into the "
        "realm of Nirvana wherever you go, with boAt Stone 350. The speaker also supports "
        "TWS feature meaning you can connect two Stone 350s and forge them into one for a bigger impact.",
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
  // Airpods
  {
    "productId": "Airpod2",
    "categoryId": "Airpods",
    "section": "Deals",
    "imagewithColor": {
      const Color.fromARGB(255, 234, 234, 234): [
        "assets/images/airpodsecondgen/airpodsec1.jpg",
        "assets/images/airpodsecondgen/airpodsec2.jpg",
        "assets/images/airpodsecondgen/airpodsec3.jpg",
      ],
    },
    "productName": "AirPods (2nd generation)",
    "productPrice": 25000,
    "discountedPrice": 22000,
    "discountPerc": 3,
    "discount": true,
    "desc": "More magical than ever."
        "AirPods deliver the wireless headphone experience, reimagined. Just pull them "
        "out of the Lightning Charging Case and they're ready to use with your iPhone, Apple Watch, iPad, or Mac. "
        "After a simple one-tap setup, AirPods work like magic. They're automatically on "
        "and always connected. AirPods can even sense when they're in your ears and pause when you take them out. "
        "To adjust the volume, change the song, make a call, or even get directions, simply "
        "say “Hey Siri” and make your request. You have the freedom to wear one or both AirPods, "
        "and you can play or skip forward with a double-tap when listening to music or podcasts.",
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
    "productId": "Airpod3",
    "categoryId": "Airpods",
    "section": "Popular",
    "imagewithColor": {
      const Color(0xFFEAEAEA): [
        "assets/images/airpodthirdgen/airpodthird1.jpg",
        "assets/images/airpodthirdgen/airpodthird2.jpg",
        "assets/images/airpodthirdgen/airpodthird3.jpg",
      ],
    },
    "productName": "AirPods (3rd generation)",
    "productPrice": 30000,
    "discountedPrice": 0,
    "discountPerc": 0,
    "discount": false,
    "desc": "More magical than ever."
        "AirPods deliver the wireless headphone experience, reimagined. Just pull them "
        "out of the Lightning Charging Case and they're ready to use with your iPhone, Apple Watch, iPad, or Mac. "
        "After a simple one-tap setup, AirPods work like magic. They're automatically on "
        "and always connected. AirPods can even sense when they're in your ears and pause when you take them out. "
        "To adjust the volume, change the song, make a call, or even get directions, simply "
        "say “Hey Siri” and make your request. You have the freedom to wear one or both AirPods, "
        "and you can play or skip forward with a double-tap when listening to music or podcasts.",
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
  // Air Tags
  {
    "productId": "AirTag1",
    "categoryId": "Others",
    "section": "New In",
    "imagewithColor": {
      const Color(0xFFC1514B): [
        "assets/images/airtag/airtag1.jpg",
        "assets/images/airtag/airtag2.jpg",
      ],
      const Color(0xFF996F7D): [
        "assets/images/airtag/airtag3.jpg",
        "assets/images/airtag/airtag4.jpg",
      ],
      const Color(0xFF78777D): [
        "assets/images/airtag/airtag5.jpg",
        "assets/images/airtag/airtag6.jpg",
      ],
    },
    "productName": "Air Tag",
    "productPrice": 3000,
    "discountedPrice": 0,
    "discountPerc": 0,
    "discount": false,
    "desc": "More magical than ever."
        "AirPods deliver the wireless headphone experience, reimagined. Just pull them "
        "out of the Lightning Charging Case and they're ready to use with your iPhone, Apple Watch, iPad, or Mac. "
        "After a simple one-tap setup, AirPods work like magic. They're automatically on "
        "and always connected. AirPods can even sense when they're in your ears and pause when you take them out. "
        "To adjust the volume, change the song, make a call, or even get directions, simply "
        "say “Hey Siri” and make your request. You have the freedom to wear one or both AirPods, "
        "and you can play or skip forward with a double-tap when listening to music or podcasts.",
  },

  {
    "productId": "Nillkin",
    "categoryId": "Others",
    "section": "Deals",
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
    "categoryId": "Others",
    "section": "Best Seller",
    "imagewithColor": {
      Colors.black: [
        "assets/images/sticker.jpg",
        "assets/images/sticker_1.jpg",
      ],
      Colors.grey: [
        "assets/images/sticker_2.jpg",
        "assets/images/sticker_1.jpg",
      ],
    },
    "productName": "COTEetCI 3m Protection Full Sticker for MacBook Air 13-inch 2020",
    "productPrice": 2850,
    "discountedPrice": 0,
    "discountPerc": 0,
    "discount": false,
    "desc":
        "Compatible with MacBook Pro 16 or 16.2 inch M3 Pro , M3 Max , M2 Pro , M2 Max , M1 Pro ,A2485 , A2780 , A2991&nbsp;Please kindly check the model number 'Axxxx' on the back of the MacBook before your purchaseOn-the-go travel protectionStylish Ultra-thin protectionOnly exits to restore the beauty of MacBook designAccurate alignment, Fine cutting, Highlighting quality",
  },
];
