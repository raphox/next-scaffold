---
to: src/pages/index.js
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
