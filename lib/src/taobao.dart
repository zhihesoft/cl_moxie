class TaobaoArgs {
  String userId;
  String moxieKey;

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "MOXIE_APIKEY": moxieKey,
      };
}
