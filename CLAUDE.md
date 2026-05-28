# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

`ionic-capacitor-tenjin` is a Capacitor plugin that wraps the native Tenjin SDKs (iOS + Android) and exposes them to Ionic/Capacitor apps via a TypeScript bridge. There is no web implementation — calls on the web platform are no-ops.

Capacitor minimum: **6.0** (required for `CAPBridgedPlugin` registration). iOS distribution is **SPM-primary** with a CocoaPods podspec retained for Capacitor 6/7 apps still on Pods. Capacitor 8 apps must use SPM.

## Build / verify commands

- `npm run build` — clean `dist/`, run `docgen` (regenerates README from the TS API), compile TS via `tsc` into `dist/esm/`, then bundle with Rollup into `dist/plugin.js` (IIFE) and `dist/plugin.cjs.js` (CJS). Run this whenever `src/definitions.ts` changes.
- `npm run watch` — `tsc --watch` only (no rollup, no docgen).
- `npm run verify` — `verify:ios` (`xcodebuild -scheme IonicCapacitorTenjin -destination generic/platform=iOS`, driven by the root `Package.swift`), `verify:android` (`./gradlew clean build test`), and `verify:web` (`npm run build`).
- `npm run lint` / `npm run fmt` — ESLint + Prettier + SwiftLint.
- Run a single Android unit test: `cd android && ./gradlew test --tests "com.getcapacitor.ExampleUnitTest.<methodName>"`.
- Run the iOS test target via SPM: `swift test` (host platform only) or via Xcode by opening `Package.swift` and running the `IonicCapacitorTenjinPluginTests` scheme.

## Architecture

The plugin has three coordinated layers; the **JS plugin name must stay `"Tenjin"`** in all three or `registerPlugin` won't find the native side.

1. **TypeScript API (`src/`)** — `definitions.ts` declares the `TenjinPlugin` interface. `index.ts` calls `registerPlugin<TenjinPlugin>('Tenjin')` and re-exports the types. Only `src/index.ts` is fed to `tsc` (see `tsconfig.json` `files`).
2. **iOS** — split into **two SPM targets** because SPM 5.9 forbids mixed Swift+ObjC in a single target:
   - `ios/Sources/TenjinImplementation/` (Obj-C only): `TenjinImplementation.m` + `include/TenjinImplementation.h`. Wraps the upstream `TenjinSDK` xcframework. Public header lives under `include/` (SPM's public-header convention).
   - `ios/Sources/IonicCapacitorTenjinPlugin/` (Swift only): `TenjinPlugin.swift` is `@objc(TenjinPlugin)` and conforms to `CAPBridgedPlugin`, declaring `jsName = "Tenjin"` and the `pluginMethods` array. This list **must include every method** callable from JS — Capacitor 6+ SPM uses this array instead of the old `CAP_PLUGIN_METHOD` Obj-C macros. The Swift target depends on `TenjinImplementation` and `import`s it.

   `TenjinSDK`'s xcframework ships an incomplete module umbrella (the `+*ILRD.h` category headers aren't in the umbrella). `TenjinImplementation.m` works around this by **forward-declaring** the missing `+impressionFromJSON:` selectors in a local `@interface TenjinSDK (...)` block — methods resolve at link time. If you add a new ILRD ad-network category from TenjinSDK, add its selector to that forward-declaration block too.
3. **Android (`android/src/main/java/com/tenjin/plugins/capacitor/`)** — `TenjinPlugin.java` (`@CapacitorPlugin(name = "Tenjin")`) is the bridge; `Tenjin.java` is the implementation wrapping `com.tenjin:android-sdk` (pinned in `android/build.gradle`). Toolchain: AGP 8.7.2, Gradle 8.9, Java 17 source/target, compileSdk 34. The devDependency `@capacitor/android` is pinned to `^6.0.0` because Cap 7+ requires Java 21 to build; published consumers can be on any Cap 6+/Java 17+ host.

### Adding or changing a plugin method

A new method requires changes in **five** places — missing the `pluginMethods` registration is the silent failure that most resembles `"Tenjin" plugin is not implemented on ios`:

1. Add the signature to the `TenjinPlugin` interface in `src/definitions.ts`. Capacitor passes a single `options` object — model multiple args as object fields.
2. Add `@objc func <name>(_ call: CAPPluginCall)` to `ios/Sources/IonicCapacitorTenjinPlugin/TenjinPlugin.swift`, extracting args via `call.getString/getInt/getDouble/getAny` and calling into `TenjinImplementation`.
3. **Add a matching `CAPPluginMethod(name: "<name>", returnType: CAPPluginReturnPromise)` entry to the `pluginMethods` array** in the same Swift file. Capacitor 6+ uses this array (not the legacy Obj-C macros) to route calls.
4. Add the underlying logic to `ios/Sources/TenjinImplementation/TenjinImplementation.{m,include/TenjinImplementation.h}` if it's new; the public Obj-C interface must live under `include/` so SPM/Swift can see it.
5. Add `@PluginMethod public void <name>(PluginCall call)` to `android/src/main/java/com/tenjin/plugins/capacitor/TenjinPlugin.java`, delegating to `Tenjin.java`.
6. Re-run `npm run build` so docgen regenerates README from the updated interface.

### README is partly generated

`npm run build` runs `docgen --api TenjinPlugin --output-readme README.md`. This rewrites the API section of the README from `src/definitions.ts`. Hand-written prose lives outside the generated block, but keep TS doc comments tidy.

## Distribution

- **SPM (Capacitor 7/8)**: `Package.swift` at the repo root. Library product `IonicCapacitorTenjin`, target `IonicCapacitorTenjinPlugin`. Depends on `capacitor-swift-pm` (>=7.0.0) and `tenjin-ios-sdk` (exact pin).
- **CocoaPods (Capacitor 6/7)**: `IonicCapacitorTenjin.podspec` ships the same sources from `ios/Sources/IonicCapacitorTenjinPlugin/`. Keep `s.dependency 'TenjinSDK'` in lockstep with the SPM `tenjin-ios-sdk` version pin.
- **Android**: standard Gradle library. `android/build.gradle` pins `com.tenjin:android-sdk`.

`package.json#files` controls what npm publishes (`android/src/main/`, `android/build.gradle`, `dist/`, `ios/Sources/`, `ios/Tests/`, `Package.swift`, podspec). Update it if you add files in new locations.

## Example app

`ionic-example/` is a standalone Ionic/Angular sample for manual integration testing on Capacitor 8 (iOS 15+, Android via Cap 8 toolchain). It depends on the plugin via `"ionic-capacitor-tenjin": "file:.."` and is built independently (`cd ionic-example && npm install && npm run build && npx cap sync`). Not invoked by the root verify scripts.
