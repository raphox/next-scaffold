---
inject: true
to: eslint.config.mjs
after: '...compat.extends'
prepend: true
skip_if: rules
---
,
  {
    rules: {
      "react-hooks/exhaustive-deps": "warn",
      "@typescript-eslint/no-explicit-any": "warn",
    }
  }