all: run_main

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
	flutter pub get
	flutter run -t lib/main/main.dart

run_go_router_builder: gen
	flutter pub get
	flutter run -t lib/go_router_builder/main.dart

run_hooks_riverpod:
	flutter pub get
	flutter run -t lib/hooks_riverpod/main.dart

.PHONY: clean run_dev format gen gen_all logo_gen run_main \
				run_go_router_builder run_hooks_riverpod
