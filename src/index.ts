import { registerPlugin } from '@capacitor/core';

import type { TenjinPlugin } from './definitions';

const Tenjin = registerPlugin<TenjinPlugin>('Tenjin');

export * from './definitions';
export { Tenjin };
