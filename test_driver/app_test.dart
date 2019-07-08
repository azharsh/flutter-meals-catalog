import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Count Item', () {
    final countTextItemDesert = find.byValueKey('countdesert');
    final countTextItemSeafood = find.byValueKey('countseafood');

    final gridContentDesert = find.byValueKey('gridcontentdesert');
    final gridContentSeafood = find.byValueKey('gridcontentseafood');
    final listcontentFavorite = find.byValueKey('listcontentfavorite');

    final search = find.byValueKey('search');
    final textSearch = find.byValueKey('textsearch');
    final closeSearchButton = find.byValueKey('closesearch');



    FlutterDriver driver;
    

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    //TEST UNTUK MENU DESERT
    test('tes ketika bottom nav bar menu desert di klik', () async {
      await driver.tap(find.text("Desert"));
      await new Future.delayed(new Duration(milliseconds: 7000));
      await driver.waitFor(gridContentDesert);
    });

    test('jumlah item Desert harus 49 item', () async {
      expect(await driver.getText(countTextItemDesert), '49');
    });

    //TEST SEARCH
    test('tes search', () async {
      await driver.tap(search);
        await new Future.delayed(new Duration(milliseconds: 1500));

        await driver.tap(textSearch);
        await new Future.delayed(new Duration(milliseconds: 1500));
        await driver.enterText("Apple");
        await new Future.delayed(new Duration(milliseconds: 5000));
        expect(await driver.getText(countTextItemDesert), '3');
//      await driver.tap(closeSearchButton);
//      await new Future.delayed(new Duration(milliseconds: 500));
    });

    //TEST UNTUK MENU SEAFOOD
    test('tes ketika bottom nav bar menu seafood di klik', () async {
      await driver.tap(find.text("Seafood"));
      await new Future.delayed(new Duration(milliseconds: 7000));
      await driver.waitFor(gridContentSeafood);
    });

    test('jumlah item Seafood harus 18 item', () async {
      expect(await driver.getText(countTextItemSeafood), '18');
    });

    //TEST UNTUK MENU FAVORITE
    test('tes ketika bottom nav bar menu favorite di klik', () async {
      await driver.tap(find.text("Favorite"));
      await new Future.delayed(new Duration(milliseconds: 7000));
      await driver.waitFor(listcontentFavorite);
    });


  });
}
