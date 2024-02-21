import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'location.dart';
import 'weather.dart';

Future<Weather> forecast() async {
  const url = 'https://data.tmd.go.th/nwpapi/v1/forecast/location/hourly/at';
  const token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImRmNDcwYzU4ZTM0MzI3MWUyY2NjYmU2MjQ4MTZmZjFhNmExM2UzZDc2NWJiNDI0MGY4NDQ4MmZiZDljZWEwMTM4MTc5OWMwMzMzY2U3OTFiIn0.eyJhdWQiOiIyIiwianRpIjoiZGY0NzBjNThlMzQzMjcxZTJjY2NiZTYyNDgxNmZmMWE2YTEzZTNkNzY1YmI0MjQwZjg0NDgyZmJkOWNlYTAxMzgxNzk5YzAzMzNjZTc5MWIiLCJpYXQiOjE3MDc4ODIyNDQsIm5iZiI6MTcwNzg4MjI0NCwiZXhwIjoxNzM5NTA0NjQ0LCJzdWIiOiIzMDA4Iiwic2NvcGVzIjpbXX0.QtCf8PuYIA8Da94uveAfQ0at8AR26i2z7zQ6-vFy84WB7PbWT_RbqovTTxSMwshHa4VkzzPiOMoE92BkkBnLIEcXfwzjAp-fh4w9g28rSTwOaGz3g46Lfj8EW1Zdmg5Uxf6G0wL_CR3JcVBUQelioVoEsOPXprgqRqXeHo9nfxCkW7Td6aCazaGgvRNXQiXObGfhNLsVjCVuZQvSeOSiU1-7YmE9yZhi56NDJV7izwitqLgLAcXvb4nY_ALidwD87SD-DfqYiHHNtsJ6bSEgcfLwv-lGNspEA6j9HMZepzysPz8XorZsKlvGNZGgRD3NHLkWqU21KGIQb5V-Ba3NdWiKrqMO2nwHvmGfhjouKR2RkBiOryAC0ZScW4Nps9qBBjR_gFS5YLniGyjkPbWE_9ocpPRZYwDPjybtI5xIayzHJi-LPKdMX6ch3rvSa7xXWgy2aFQbYn7XmepxIJc5gUFsxi51C7eFHJ9xgPNOw7Nq9LhiWKBtYewkfsw33kcxBcPinoU3RwYvRhsYHX2Z0RINURaXgEWlBuBYxPbqu-bdSxtuNC9wgQDjlN9ez5vTUxi9Cp8VraRhSoGbmMKj0HvqSqBYoDjcmn1WdtK_K7JxPKavBcYAPdaEzxHGgthwyh3zdHjFNgE4wv-fdy1qAD4vvaP5y8xaADbThAkDezw';

  try {
    Position location = await getCurrentLocation();

    http.Response response = await http.get(
        Uri.parse(
            '$url?lat=${location.latitude}&lon=${location.longitude}&fields=tc,cond'),
        headers: {
          'accept': 'application/json',
          'authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)["WeatherForecasts"][0]["forecasts"]
          [0]["data"];
      Placemark address = (await placemarkFromCoordinates(
              location.latitude, location.longitude))
          .first;
      return Weather(
        address: '${address.subLocality}\n${address.administrativeArea}',
        temperature: result['tc'],
        cond: result['cond'],
      );
    } else {
      return Future.error(response.statusCode);
    }
  } catch (e) {
    return Future.error(e);
  }
}
