class Weather {
  //eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImRmNDcwYzU4ZTM0MzI3MWUyY2NjYmU2MjQ4MTZmZjFhNmExM2UzZDc2NWJiNDI0MGY4NDQ4MmZiZDljZWEwMTM4MTc5OWMwMzMzY2U3OTFiIn0.eyJhdWQiOiIyIiwianRpIjoiZGY0NzBjNThlMzQzMjcxZTJjY2NiZTYyNDgxNmZmMWE2YTEzZTNkNzY1YmI0MjQwZjg0NDgyZmJkOWNlYTAxMzgxNzk5YzAzMzNjZTc5MWIiLCJpYXQiOjE3MDc4ODIyNDQsIm5iZiI6MTcwNzg4MjI0NCwiZXhwIjoxNzM5NTA0NjQ0LCJzdWIiOiIzMDA4Iiwic2NvcGVzIjpbXX0.QtCf8PuYIA8Da94uveAfQ0at8AR26i2z7zQ6-vFy84WB7PbWT_RbqovTTxSMwshHa4VkzzPiOMoE92BkkBnLIEcXfwzjAp-fh4w9g28rSTwOaGz3g46Lfj8EW1Zdmg5Uxf6G0wL_CR3JcVBUQelioVoEsOPXprgqRqXeHo9nfxCkW7Td6aCazaGgvRNXQiXObGfhNLsVjCVuZQvSeOSiU1-7YmE9yZhi56NDJV7izwitqLgLAcXvb4nY_ALidwD87SD-DfqYiHHNtsJ6bSEgcfLwv-lGNspEA6j9HMZepzysPz8XorZsKlvGNZGgRD3NHLkWqU21KGIQb5V-Ba3NdWiKrqMO2nwHvmGfhjouKR2RkBiOryAC0ZScW4Nps9qBBjR_gFS5YLniGyjkPbWE_9ocpPRZYwDPjybtI5xIayzHJi-LPKdMX6ch3rvSa7xXWgy2aFQbYn7XmepxIJc5gUFsxi51C7eFHJ9xgPNOw7Nq9LhiWKBtYewkfsw33kcxBcPinoU3RwYvRhsYHX2Z0RINURaXgEWlBuBYxPbqu-bdSxtuNC9wgQDjlN9ez5vTUxi9Cp8VraRhSoGbmMKj0HvqSqBYoDjcmn1WdtK_K7JxPKavBcYAPdaEzxHGgthwyh3zdHjFNgE4wv-fdy1qAD4vvaP5y8xaADbThAkDezw

  static const _condition = [
    '',
    'ท้องฟ้าแจ่มใส (Clear)',
    'มีเมฆบางส่วน (Partly cloudy)',
    'เมฆเป็นส่วนมาก (Cloudy)',
    'มีเมฆมาก (Overcast)',
    'ฝนตกเล็กน้อย (Light rain)',
    'ฝนปานกลาง (Moderate rain)',
    'ฝนตกหนัก (Heavy rain)',
    'ฝนฟ้าคะนอง (Thunderstorm)',
    'อากาศหนาวจัด (Very cold)',
    'อากาศหนาว (Cold)',
    'อากาศเย็น (Cool)',
    'อากาศร้อนจัด (Very hot)',
  ];

  static const _symbol = [
    '',
    '🌈',
    '☁',
    '☁☁',
    '☁☁☁',
    '🌦',
    '🌧',
    '☔',
    '⛈',
    '☃',
    '⛄',
    '❄',
    '☀',
  ];

  final String address;
  final double temperature;
  final int cond;

  Weather(
      {required this.address, required this.temperature, required this.cond});

  String get condition => _condition[cond];

  String get symbol => _symbol[cond];
}
