// ignore_for_file: non_constant_identifier_names

class Paths {
  static String noxlogo = "lib/images/noxlogo.png";
  static String betofiber = "assets/brands/betofiber.png";
  static String boyner = "assets/brands/boyner.png";
  static String cardtek = "assets/brands/cardtek.png";
  static String merck = "assets/brands/merck.png";
  static String remax = "assets/brands/remax.png";
  static String saray = "assets/brands/saray.png";
  static String seranit = "assets/brands/seranit.png";
  static String yurticikargo = "assets/brands/yurticikargo.png";
  static String vanucci = "assets/brands/vanucci.png";
  static String varyans = "assets/brands/varyans.png";
  static String egzotiktatil = "assets/brands/egzotiktatil.png";
  static String fomilk = "assets/brands/fomilk.png";
  static String intersport = "assets/brands/intersport.png";
  static String pistoncms = "assets/brands/pistoncms.png";
  static String tahsildaroglu = "assets/brands/tahsildaroglu.png";
  static String sembol = "assets/brands/sembol.png";
  static String mevbank = "assets/brands/mevbank.png";
  static String lebibyalkin = "assets/brands/mevbank.png";
  static String Sembol(int page) => "assets/products/sembol$page.png";
  static String Mevbank(int page) => "assets/products/mevbank$page.png";
  static String product(String path) => path.replaceAll("brands", "products");
}
