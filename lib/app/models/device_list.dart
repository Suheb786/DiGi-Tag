class DeviceList {
  bool isChecked;
  final String deviceName;
  final String deviceId;
  final String deviceUID;

  DeviceList({
    required this.deviceId,
    required this.deviceName,
    required this.deviceUID,
    this.isChecked = false,
  });

  static DeviceList fromJSON(Map<String, dynamic> map) {
    DeviceList deviceList = DeviceList(
      deviceId: map['deviceId'],
      deviceName: map['name'],
      deviceUID: map['deviceUID'],
    );

    return deviceList;
  }
}
