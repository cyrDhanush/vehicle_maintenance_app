import 'package:vehicle_maintenance_app/models/shop_model.dart';

Map<String, dynamic> carMakers = {
  'Mahindra': [
    'XUV300',
    'XUV500',
    'XUV700',
    'Thar',
  ],
  'Tata': [
    'Harrier',
    'Nexon',
    'Hexa',
    'Punch',
  ],
  'Hyundai': [
    'Creta',
    'Xcent',
    'Venue',
    'Verna',
  ],
  'Honda': [
    'Amaze',
    'City',
    'Accord',
    'Civic',
  ],
};

Map<String, String> carPhotos = {
  'XUV300': 'xuv300.png',
  'XUV500': 'xuv500.png',
  'XUV700': 'xuv700.png',
  'Thar': 'thar.webp',
  'Harrier': 'harrier.png',
  'Nexon': 'nexon.png',
  'Hexa': 'hexa.png',
  'Punch': 'punch.jpeg',
  'Creta': 'creta.png',
  'Xcent': 'xcent.png',
  'Venue': 'venue.png',
  'Verna': 'verna.png',
  'Amaze': 'amaze.png',
  'City': 'city.png',
  'Accord': 'accord.png',
  'Civic': 'civic.png',
};

Map<String, int> services = {
  'General check-up and inspection': 4000,
  'Engine oil change': 1770,
  'Air filter cleaning or replacement': 2300,
  'Brake system inspection and repair': 3100,
  'Wheel alignment and balancing': 1600,
  'Battery check and replacement': 2900,
  'Suspension system inspection and repair': 3500,
  'Transmission system service': 2850,
  'Fuel system cleaning': 2700,
  'Spark plug replacement': 1040,
  'Coolant system flush and refill': 1500,
  'Timing belt replacement': 3000,
  'Power steering system service': 2100,
  'AC system service and repair': 4020,
  'Exhaust system inspection and repair': 2700,
};

List<ShopModel> shopdata = [
  ShopModel(
    shopname: 'A to Z  Motor Cycle Service Center',
    shopaddress:
        'R26C+PQX, Bajanai kovil Main Rd, Kavanur R.F.R[31]C, Tamil Nadu 603203',
    shopphone: '+91 9892327504',
  ),
  ShopModel(
    shopname: 'S-Drive Multibrand Car Service - Perumbakkam',
    shopaddress:
        'No 8, 202c, Nookampalayam Rd, Perumbakkam, Chennai, Tamil Nadu 600126',
    shopphone: '+91 9196937586',
  ),
  ShopModel(
    shopname: 'Vijay Automobiles Kattankulathur (car and bike)',
    shopaddress:
        'No 20 , Humming bird street, near Vgn Southern Avenue, apts, Kattankulathur, Tamil Nadu 603203',
    shopphone: '+91 9395562173',
  ),
  ShopModel(
    shopname: 'Yamaha Service Centre (Bikes)',
    shopaddress:
        'No.50, NH-1, Vallal MGR Salai, Opp. Railway Station, Maraimalai Nagar, Tamil Nadu 603209',
    shopphone: '+91 95660 09898',
  ),
  ShopModel(
    shopname: 'Maruti Suzuki Service (Vishnu Cars)',
    shopaddress:
        'No 19, GST Rd Potheri, Kattankulathur, Guduvancheri, Tamil Nadu 603202',
    shopphone: '044 6620 5616',
  ),
  ShopModel(
    shopname: 'MG Automobile ( Car and Bike)',
    shopaddress: 'Pillayar Koil St, Potheri, Kattankulathur, Tamil Nadu 603203',
    shopphone: '+91 9854056414',
  ),
  ShopModel(
    shopname: 'MAHARAJA AUTO MOBILE & GARAGE (Car and Bike)',
    shopaddress:
        'Thailavaram Bus Stop, Thailavaram Village R2JW+9MG Chennai - Theni Highway, Chennai - Theni Hwy, Potheri, Kattankulathur, TamilNadu 603202',
    shopphone: '+91 9618683380',
  ),
];

Map finaldata = {
  // sample
  'name': 'dhanush',
  'cars': {
    'key': {
      'carmaker': 'carmaker',
      'carmodel': 'carmodel',
    },
  },
  'services': {
    'servicekey': {
      'carkey': 'carkey',
      'shopname': 'shopname',
      'servicename': 'servicename',
      'serviceprice': 'serviceprice',
      'servicedate': 'servicedate',
      'servicetime': 'servicetime',
      'notes': 'notes of the service',
      'paymentstatus': 'paymentstatus', //  completed, pending
    },
  },
};
