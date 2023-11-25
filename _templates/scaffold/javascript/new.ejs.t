---
to: src/pages/<%= h.inflection.tableize(name) %>/new.js
---
import Link from "next/link";
import { useRouter } from "next/router";
import { useMutation, useQueryClient } from "@tanstack/react-query";

import { api } from "@/services";
import <%= class_name %>Form from "@/components/<%= class_name %>Form";

export default function <%= class_name %>NewPage() {
  const router = useRouter();
  const queryClient = useQueryClient();
  const { isPending: isCreating, mutate } = useMutation({
    mutationFn: (data) => {
      return api.post("/<%= plural_table_name %>", data);
    },
  });

  const handleCreate = (data) => {
    mutate(data, {
      onSuccess: ({ data: <%= singular_table_name %> }) => {
        queryClient.invalidateQueries({ queryKey: ["<%= plural_table_name %>"] });
        router.replace({
          pathname: `/<%= plural_table_name %>/${<%= singular_table_name %>.id}`,
          query: { notice: "Created with success." },
        });
      },
      onError: (error) => {
        alert(`Error: ${JSON.stringify(error)}`);
      },
    });
  };

  return (
    <>
      <h1>New <%= h.changeCase.lower(human_name) %></h1>

      <<%= class_name %>Form
        isLoading={isCreating}
        data={{}}
        onSubmit={handleCreate}
      />

      <br />

      <div>
        <Link href="/<%= plural_table_name %>">Back to <%= h.changeCase.lower(plural_table_name) %></Link>
      </div>
    </>
  );
}
