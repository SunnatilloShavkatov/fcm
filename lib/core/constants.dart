import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Constants {
  static const shipperId = /*kDebugMode ? */
      'd4b1658f-3271-4973-8591-98a82939a664' /*  'e2d30f35-3d1e-4363-8113-9c81fdb2a762'*/ /*: 'e2d30f35-3d1e-4363-8113-9c81fdb2a762'*/;

  static const baseUrl = /* !kDebugMode ?*/ 'https://test.customer.api.delever.uz/v1/';

  /*'https://customer.api.delever.uz/v1/';*/
  static const androidPlatformID = "6bd7c2e3-d35e-47df-93ce-ed54ed53f95f";
  static const iosPlatformID = "f6631db7-09d0-4cd9-a03a-b7a590abb8c1";

  // static const apiKey = '66e41b39-b5ee-40f6-8e51-52c6c6b4ddf1';
  ///not active
  static const apiKey = 'e190819a-d0df-4e60-923d-8a64fb149936';
  static const yandexKey = 'https://geocode-maps.yandex.ru/1.x/';

  static const CURRENT_ORDERS = [
    '986a0d09-7b4d-4ca9-8567-aa1c6d770505',
    'ccb62ffb-f0e1-472e-bf32-d130bea90617',
    '1b6dc9a3-64aa-4f68-b54f-71ffe8164cd3',
    'b0cb7c69-5e3d-47c7-9813-b0a7cc3d81fd',
    '8781af8e-f74d-4fb6-ae23-fd997f4a2ee0',
    '84be5a2f-3a92-4469-8283-220ca34a0de4',
    'e665273d-5415-4243-a329-aee410e39465',
  ];

  static const String FINISHED_ORDERS = 'e665273d-5415-4243-a329-aee410e39465';
  static const String NEW = "986a0d09-7b4d-4ca9-8567-aa1c6d770505";
  static const String COURIER_ACCEPTED = "8781af8e-f74d-4fb6-ae23-fd997f4a2ee0";
  static const String OPERATOR_ACCEPTED =
      "ccb62ffb-f0e1-472e-bf32-d130bea90617";
  static const String VENDOR_ACCEPTED = "1b6dc9a3-64aa-4f68-b54f-71ffe8164cd3";
  static const String VENDOR_READY = "b0cb7c69-5e3d-47c7-9813-b0a7cc3d81fd";
  static const String VENDOR_CANCELLED = "c4227d1b-c317-46f8-b1e3-a48c2496206f";
  static const String COURIER_PICKED_UP =
      "84be5a2f-3a92-4469-8283-220ca34a0de4";
  static const String COURIER_CANCELLED =
      "6ba783a3-1c2e-479c-9626-25526b3d9d36";
  static const String OPERATOR_CANCELLED =
      "b5d1aa93-bccd-40bb-ae29-ea5a85a2b1d1";
  static const String SERVER_CANCELLED = "d39cb255-6cf5-4602-896d-9c559d40cbbe";
  static const String DELIVERED = "79413606-a56f-45ed-97c3-f3f18e645972";

  static const ORDER_CANCELLED = [
    VENDOR_CANCELLED,
    COURIER_CANCELLED,
    OPERATOR_CANCELLED,
    SERVER_CANCELLED,
  ];

  static const ORDER_FINISHED = [
    FINISHED_ORDERS,
    VENDOR_CANCELLED,
    COURIER_CANCELLED,
    OPERATOR_CANCELLED,
    SERVER_CANCELLED,
  ];

  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'new orders', // id
    'new orders', // title
    description: 'new orders description', // description
    importance: Importance.high,
  );

  static const String appName = "TarnovBoshiClientApp";
}

/// test shipperId => d4b1658f-3271-4973-8591-98a82939a664
/// tarnov shipperId => e2d30f35-3d1e-4363-8113-9c81fdb2a762
/*
*
* "courier_accepted": "8781af8e-f74d-4fb6-ae23-fd997f4a2ee0",
  "courier_picked_up": "84be5a2f-3a92-4469-8283-220ca34a0de4",
  "delivered": "79413606-a56f-45ed-97c3-f3f18e645972",
  "finished": "e665273d-5415-4243-a329-aee410e39465",
  "new": "986a0d09-7b4d-4ca9-8567-aa1c6d770505",
  "operator_accepted": "ccb62ffb-f0e1-472e-bf32-d130bea90617",
  "operator_cancelled": "b5d1aa93-bccd-40bb-ae29-ea5a85a2b1d1",
  "server_cancelled": "d39cb255-6cf5-4602-896d-9c559d40cbbe",
  "vendor_accepted": "1b6dc9a3-64aa-4f68-b54f-71ffe8164cd3",
  "vendor_ready": "b0cb7c69-5e3d-47c7-9813-b0a7cc3d81fd"
* */
