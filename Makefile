clean:
	flutter clean
	cd ios && rm -rf Podfile.lock
	cd ios && rm -rf Pods
	flutter pub get
	cd ios && pod install

clean_gen:
	dart run build_runner clean
	dart run build_runner build --delete-conflicting-outputs

gen:
	dart run build_runner build --delete-conflicting-outputs

splash:
	flutter pub run flutter_native_splash:create

configure:
	flutterfire configure

.PHONY: clean clean_gen gen splash configure
