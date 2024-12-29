clean:
	flutter clean
	flutter pub get

format:
	dart fix --apply
	dart format .
	flutter analyze .

gen:
	dart run build_runner build

gen_all:
	dart run build_runner build -d

logo_gen:
	dart run flutter_launcher_icons:main

run_main:
	flutter run -t lib/main/main.dart

run_go_router_builder: gen
	flutter run -t lib/go_router_builder/main.dart

.PHONY: clean run_dev format gen gen_all logo_gen run_main run_go_router_builder
