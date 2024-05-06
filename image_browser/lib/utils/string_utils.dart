
class StringUtils{

  static bool isNotBlank(String? value){
    if(value==null||value.isEmpty==true){
      return false;
    }
    return true;
  }

  static bool isBlank(String? value){
    if(value==null||value.isEmpty==true){
      return true;
    }
    return false;
  }
  //比较字符串是否相等
  static bool equaIgnoreCase (String? value1, String? value2){
    if(value1 == null || value2 == null){
      return false;
    }
    return value1.toLowerCase() == value2.toLowerCase();
  }

  static double doubleParse(String? value) {
    return double.tryParse(value ?? "0") ?? 0;
  }

  static int intParse(String? value) {
    return int.tryParse(value ?? "0") ?? 0;
  }

  ///数组转字符串 ,隔开
  static String splitArray(List list, {String split = ","}){
    List tempList = [];
    String str = '';
    list.forEach((f){
      tempList.add(f);
    });

    tempList.forEach((f){
      if(str == ''){
        str = "$f";
      }else {
        str = "$str$split$f";
      }
    });

    return str;
  }

  static String nFormatter(String num, [int digits = 1]) {
    List si = [
      {'value': 1, 'symbol': ''},
      {'value': 1e3, 'symbol': 'k'},
      {'value': 1e6, 'symbol': 'M'},
      {'value': 1e9, 'symbol': 'G'},
      {'value': 1e12, 'symbol': 'T'},
      {'value': 1e15, 'symbol': 'P'},
      {'value': 1e18, 'symbol': 'E'},
    ];
    var rx = RegExp(r'\.0+$|(\.[0-9]*[1-9])0+$');
    var i;
    for (i = si.length - 1; i > 0; i--) {
      if (StringUtils.intParse(num).abs() >= si[i]['value']) {
        break;
      }
    }
    return (StringUtils.intParse(num) / si[i]['value']).toStringAsFixed(digits).replaceAll(rx, '') + si[i]['symbol'];
  }

  /// "BTC/USDT" -> "USDT"
  static String coinPair2Quote(String? coinPair) {
    if (isBlank(coinPair)) {
      return "--";
    }
    if (coinPair!.contains("/")) {
      List<String>? coinArr =  coinPair.split("/").toList();
      if (coinArr.length > 1) {
        return coinArr[1];
      }
    }
    return "--";
  }
  /// "BTC/USDT" -> "BTC"
  static String coinPair2Base(String? coinPair) {
    if (isBlank(coinPair)) {
      return "--";
    }
    if (coinPair!.contains("/")) {
      List<String>? coinArr =  coinPair.split("/").toList();
      if (coinArr.length > 1) {
        return coinArr[0];
      }
    }
    return "--";
  }
}