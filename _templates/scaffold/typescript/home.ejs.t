---
to: src/pages/index.tsx
---
import { useEffect } from "react";
import { useRouter } from "next/navigation";

export default function HomePage() {
  const { push } = useRouter();

  useEffect(() => {
    push("/<%= plural_table_name %>");
  }, []);

  return <p>Loading...</p>;
};
