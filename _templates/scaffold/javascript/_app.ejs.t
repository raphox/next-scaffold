---
to: src/pages/_app.js
---
import { AppProvider } from "@/providers";

export default function MyApp({ Component, pageProps }) {
  // Use the layout defined at the page level, if available
  const getLayout = Component.getLayout || ((page) => page);

  return getLayout(
    <AppProvider>
      <Component {...pageProps} />
    </AppProvider>
  );
}
