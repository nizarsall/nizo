part of carp_background_location;

class LocationServiceRepository {
  static LocationServiceRepository _instance = LocationServiceRepository._();

  LocationServiceRepository._();

  factory LocationServiceRepository() => _instance;

  static const String isolateName = 'LocatorIsolate';
  final f = funcs.instance;
  Future<void> init(Map<dynamic, dynamic> params) async {
    final SendPort? send = IsolateNameServer.lookupPortByName(isolateName);
    send?.send(null);
  }

  Future<void> dispose() async {
    final SendPort? send = IsolateNameServer.lookupPortByName(isolateName);
    send?.send(null);
  }

  Future<void> callback(LocationDto locationDto) async {
    final SendPort? send = IsolateNameServer.lookupPortByName(isolateName);
     f.insert(locationDto.latitude, locationDto.longitude,
      '${DateTime.fromMillisecondsSinceEpoch(locationDto.time ~/ 1)}');
    print("success");
    
    send?.send(locationDto);
  }

  static double dp(double val, int places) {
    double mod = pow(10.0, places) as double;
    return ((val * mod).round().toDouble() / mod);
  }

  static String formatDateLog(DateTime date) =>
      '${date.hour.toString()}:${date.minute.toString()}:${date.second.toString()}';

  static String formatLog(LocationDto locationDto) =>
      '${dp(locationDto.latitude, 4).toString()} ${dp(locationDto.longitude, 4).toString()}';
}
