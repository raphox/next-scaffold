---
to: src/pages/<%= h.inflection.tableize(name) %>/index.js
---
import Link from "next/link";
import { useSearchParams } from "next/navigation";
import { useQuery } from "@tanstack/react-query";

import { api } from "@/services";
import <%= class_name %> from "./_components/<%= class_name %>";

export default function <%= class_name %>Page() {
  const searchParams = useSearchParams();
  const notice = searchParams.get("notice");
  const {
    isLoading,
    error,
    data: <%= plural_table_name %>,
  } = useQuery("<%= plural_table_name %>", () =>
    api.get("/<%= plural_table_name %>").then((res) => res.data)
  );

  if (isLoading) return "Loading...";

  if (error) return "An error has occurred: " + error.message;

  return (
    <>
      {notice && <p style={{ color: "green" }}>{notice}</p>}

      <h1><%= h.inflection.pluralize(human_name) %></h1>

      <div id="<%= plural_table_name %>">
        {<%= plural_table_name %>.map((<%= singular_table_name %>) => (
          <div key={<%= singular_table_name %>.id} id={`<%= singular_table_name %>_${<%= singular_table_name %>.id}`}>
            <<%= class_name %> {...<%= singular_table_name %>} />
            <p>
              <Link href={`/<%= plural_table_name %>/${<%= singular_table_name %>.id}`}>Show this <%= h.changeCase.lower(human_name) %></Link>
            </p>
          </div>
        ))}
      </div>

      <Link href={`/<%= plural_table_name %>/new`}>New <%= h.changeCase.lower(human_name) %></Link>
    </>
  );
}
