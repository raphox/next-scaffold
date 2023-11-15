---
inject: true
to: next.config.js
after: "nextConfig = {"
skip_if: distDir
---
  output: 'export',
  distDir: "../public",
  images: {
    unoptimized: true,
  },