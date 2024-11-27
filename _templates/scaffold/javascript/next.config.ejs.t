---
inject: true
to: next.config.mjs
after: "nextConfig = {"
skip_if: distDir
---
  output: "export",
  trailingSlash: true,
  distDir: process.argv[2] === "build" ? "../public" : ".next",
  images: {
    unoptimized: true,
  },
