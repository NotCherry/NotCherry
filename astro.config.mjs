import { defineConfig } from 'astro/config';
import react from '@astrojs/react';

export default defineConfig({
  site: 'https://notcherry.github.io',
  base: '/NotCherry',
  integrations: [react()],
});
