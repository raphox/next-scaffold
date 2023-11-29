---
inject: true
to: next.config.js
after: "nextConfig = {"
skip_if: distDir
---
  output: "export",
  trailingSlash: true,
  distDir: process.argv[2] === "build" ? "../public" : ".next",
  images: {
    unoptimized: true,
  },
