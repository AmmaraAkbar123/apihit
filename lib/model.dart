class Config {
  final String businessName;
  final String logo;
  final String address;
  final String phone;
  final String email;
  final AppFeatures appFeatures;

  Config({
    required this.businessName,
    required this.logo,
    required this.address,
    required this.phone,
    required this.email,
    required this.appFeatures,
  });

  factory Config.fromJson(Map<String, dynamic> json) {
    return Config(
      businessName: json['business_name'],
      logo: json['logo'],
      address: json['address'],
      phone: json['phone'],
      email: json['email'],
      appFeatures: AppFeatures.fromJson(json['app_features']),
    );
  }
}

class AppFeatures {
  final Booking store;
  final Booking booking;
  final Booking tableReservation;
  final Booking ticketing;
  final Booking events;
  final Booking plans;

  AppFeatures({
    required this.store,
    required this.booking,
    required this.tableReservation,
    required this.ticketing,
    required this.events,
    required this.plans,
  });

  factory AppFeatures.fromJson(Map<String, dynamic> json) {
    return AppFeatures(
      store: Booking.fromJson(json['store']),
      booking: Booking.fromJson(json['booking']),
      tableReservation: Booking.fromJson(json['table_reservation']),
      ticketing: Booking.fromJson(json['ticketing']),
      events: Booking.fromJson(json['events']),
      plans: Booking.fromJson(json['plans']),
    );
  }

}

class Booking {
  final bool isProduct;
  final bool isService;
  final bool isStaff;
  final bool isResource;
  final bool isGallery;
  final bool isCheckout;
  final bool isBooking;
  final bool isSearchableService;

  Booking({
    required this.isProduct,
    required this.isService,
    required this.isStaff,
    required this.isResource,
    required this.isGallery,
    required this.isCheckout,
    required this.isBooking,
    required this.isSearchableService,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      isProduct: json['is_product'],
      isService: json['is_service'],
      isStaff: json['is_staff'],
      isResource: json['is_resource'],
      isGallery: json['is_gallery'],
      isCheckout: json['is_checkout'],
      isBooking: json['is_booking'],
      isSearchableService: json['is_searchable_service'],
    );
  }
}
