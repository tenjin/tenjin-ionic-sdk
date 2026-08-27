import { registerPlugin } from '@capacitor/core';

import type { TenjinPlugin } from './definitions';

const TenjinNative = registerPlugin<TenjinPlugin>('Tenjin');

// Reported to Tenjin as plugin_version. Kept in sync with package.json by
// release-please; do not edit by hand.
// x-release-please-start-version
const PLUGIN_VERSION = '2.1.0';
// x-release-please-end

const Tenjin: TenjinPlugin = Object.setPrototypeOf(
  {
    initialize(options: { sdkKey: string }): Promise<void> {
      return TenjinNative.initialize({ ...options, pluginVersion: PLUGIN_VERSION });
    },
  },
  TenjinNative,
);

export * from './definitions';
export { Tenjin };
