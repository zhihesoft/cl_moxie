class CarrierArgs {
  String userId;
  String moxieKey;
  String phone;
  String idCard;
  String idCardName;

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "MOXIE_APIKEY": moxieKey,
        "phone": phone,
        "idCard": idCard,
        "idCardName": idCardName,
      };
}
