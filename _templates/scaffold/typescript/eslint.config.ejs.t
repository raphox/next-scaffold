---
inject: true
to: eslint.config.mjs
after: 'eslintConfig'
skip_if: rules
---
  ...compat.extends("next/core-web-vitals", "next/typescript"),
  {
    rules: {
      "react-hooks/exhaustive-deps": "warn",
      "@typescript-eslint/no-explicit-any": "warn",
    }
  }