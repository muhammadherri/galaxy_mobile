// ignore_for_file: file_names, duplicate_import
import 'package:bm_mobile/model/BMModels.dart';
import 'package:bm_mobile/model/BMModels.dart';
import 'package:bm_mobile/utils/BMImages.dart';
import 'BMColors.dart';

List<BMCategory> getCategoryItems() {
  List<BMCategory> list = [];

  var category1 = BMCategory();
  category1.name = "Transfer";
  category1.color = t5Cat1;
  category1.icon = t5_paperplane;
  list.add(category1);
  var category2 = BMCategory();
  category2.name = "Wallet";
  category2.color = t5Cat2;
  category2.icon = t5_wallet;
  list.add(category2);
  var category3 = BMCategory();
  category3.name = "Voucher";
  category3.color = t5Cat3;
  category3.icon = t5_coupon;
  list.add(category3);
  var category4 = BMCategory();
  category4.name = "Pay Bill";
  category4.color = t5Cat4;
  category4.icon = t5_invoice;
  list.add(category4);

  var category5 = BMCategory();
  category5.name = "Exchange";
  category5.color = t5Cat5;
  category5.icon = t5_dollar_exchange;
  list.add(category5);

  var category = BMCategory();
  category.name = "More";
  category.color = t5Cat6;
  category.icon = t5_circle;
  list.add(category);
  return list;
}

List<BMCategory> getBottomSheetItems() {
  List<BMCategory> list = [];
  var category1 = BMCategory();
  category1.name = "Transfer";
  category1.color = t5Cat1;
  category1.icon = t5_paperplane;
  list.add(category1);
  var category2 = BMCategory();
  category2.name = "Wallet";
  category2.color = t5Cat2;
  category2.icon = t5_wallet;
  list.add(category2);
  var category3 = BMCategory();
  category3.name = "Voucher";
  category3.color = t5Cat3;
  category3.icon = t5_coupon;
  list.add(category3);
  var category4 = BMCategory();
  category4.name = "Pay Bill";
  category4.color = t5Cat4;
  category4.icon = t5_invoice;
  list.add(category4);

  var category5 = BMCategory();
  category5.name = "Exchange";
  category5.color = t5Cat5;
  category5.icon = t5_dollar_exchange;
  list.add(category5);

  var category6 = BMCategory();
  category6.name = "Services";
  category6.color = t5Cat6;
  category6.icon = t5_circle;
  list.add(category6);

  var category9 = BMCategory();
  category9.name = "Crypto";
  category9.color = t5Cat3;
  category9.icon = t5_invoice;
  list.add(category9);
  var category11 = BMCategory();
  category11.name = "Mobile";
  category11.color = t5Cat5;
  category11.icon = t5_dollar_exchange;
  list.add(category11);

  var category12 = BMCategory();
  category12.name = "Services";
  category12.color = t5Cat6;
  category12.icon = t5_circle;
  list.add(category12);

  var category7 = BMCategory();
  category7.name = "Pay Bill";
  category7.color = t5Cat4;
  category7.icon = t5_invoice;
  list.add(category7);
  var category8 = BMCategory();
  category8.name = "Exchange";
  category8.color = t5Cat5;
  category8.icon = t5_dollar_exchange;
  list.add(category8);

  var category10 = BMCategory();
  category10.name = "Services";
  category10.color = t5Cat6;
  category10.icon = t5_circle;
  list.add(category10);

  return list;
}

List<BMSlider> getSliders() {
  List<BMSlider> list = [];
  BMSlider model1 = BMSlider();
  model1.balance = "\$150000";
  model1.accountNo = "145 250 230 120 150";
  model1.image = t5_bg_card_2;
  BMSlider model2 = BMSlider();
  model2.balance = "\$150000";
  model2.accountNo = "145 250 230 120 150";
  model2.image = t5_bg_card_1;
  BMSlider model3 = BMSlider();
  model3.balance = "\$150000";
  model3.accountNo = "145 250 230 120 150";
  model3.image = t5_bg_card_3;

  list.add(model1);
  list.add(model2);
  list.add(model3);
  return list;
}

List<BMBill> getListData() {
  List<BMBill> list = [];
  var bill = BMBill();
  bill.name = "Electric bill";
  bill.day = "22";
  bill.icon = t5_light_bulb;
  bill.amount = "\$155.00";
  bill.date = "10/2/2019";

  list.add(bill);

  var bill1 = BMBill();
  bill1.name = "Water bill";
  bill1.day = "20";
  bill1.icon = t5_drop;
  bill1.amount = "\$855.00";
  bill1.date = "10/2/2019";

  list.add(bill1);

  var bill2 = BMBill();
  bill2.name = "Water bill";
  bill2.day = "12";
  bill2.icon = t5_drop;
  bill2.amount = "\$155.00";
  bill2.isPaid = true;
  bill2.date = "10/2/2019";

  list.add(bill2);

  var bill3 = BMBill();
  bill3.name = "Phone bill";
  bill3.day = "12";
  bill3.icon = t5_call_answer;
  bill3.amount = "\$25.00";
  bill3.date = "10/2/2019";

  list.add(bill3);

  var bill4 = BMBill();
  bill4.name = "Internet bill";
  bill4.day = "11";
  bill4.icon = t5_wifi;
  bill4.amount = "\$70.00";
  bill4.date = "10/2/2019";

  list.add(bill4);
  var bill5 = BMBill();
  bill5.name = "Electric bill";
  bill5.day = "10";
  bill5.icon = t5_light_bulb;
  bill5.amount = "\$600.00";
  bill5.date = "10/2/2019";
  bill5.isPaid = true;
  list.add(bill);
  list.add(bill2);
  list.add(bill);
  list.add(bill);
  list.add(bill1);
  list.add(bill2);
  list.add(bill3);
  list.add(bill4);
  list.add(bill);
  list.add(bill1);
  list.add(bill2);
  list.add(bill3);
  list.add(bill4);

  return list;
}

List<BMContact> getRecents() {
  List<BMContact> list = [];

  var people5 = BMContact();
  people5.img = t5_profile_8;
  people5.name = "Nia Scott";
  people5.contactno = "2589634589";
  list.add(people5);

  var people6 = BMContact();
  people6.img = t5_profile_9;
  people6.name = "Smith Scott";
  people6.contactno = "2589634589";
  list.add(people6);
  var people7 = BMContact();
  people7.img = t5_profile_9;
  people7.name = "Skyla Scott";
  people7.contactno = "2589634589";
  list.add(people7);
  return list;
}

List<BMContact> getPending() {
  List<BMContact> list = [];

  var people = BMContact();
  people.img = t5_profile_3;
  people.name = "Alice Smith";
  people.contactno = "2596854562";
  people.isOnline = true;
  list.add(people);

  var people2 = BMContact();
  people2.img = t5_profile_4;
  people2.name = "Hennah Tran";
  people2.contactno = "2596854562";

  list.add(people2);

  var people3 = BMContact();
  people3.img = t5_profile_6;
  people3.name = "Louisa MacGee";
  people3.contactno = "2596854562";
  list.add(people3);

  var people4 = BMContact();
  people4.img = t5_profile_7;
  people4.name = "Walter James";
  people4.contactno = "2596854562";
  people4.isOnline = true;
  list.add(people4);

  var people5 = BMContact();
  people5.img = t5_profile_8;
  people5.name = "Nia Scott";
  people5.contactno = "2596854562";
  list.add(people5);

  var people6 = BMContact();
  people6.img = t5_profile_9;
  people6.name = "Smith Scott";
  people6.contactno = "2596854562";
  list.add(people6);
  var people7 = BMContact();
  people7.img = t5_profile_9;
  people7.name = "Skyla Scott";
  people7.contactno = "2596854562";
  list.add(people7);
  list.add(people);
  list.add(people2);
  list.add(people3);
  list.add(people4);
  list.add(people5);
  list.add(people6);
  list.add(people7);
  return list;
}
