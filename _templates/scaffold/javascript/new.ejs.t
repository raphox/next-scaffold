---
to: src/pages/<%= h.inflection.tableize(name) %>/new.js
---
import Link from "next/link";
import { useRouter } from "next/router";
import { useMutation, useQueryClient } from "@tanstack/react-query";

import { api } from "@/services";
import { FormProvider } from "@/providers";
import <%= class_name %>Form, { resolver } from "@/components/<%= class_name %>Form";

export default function <%= class_name %>NewPage() {
  const router = useRouter();
  const queryClient = useQueryClient();

  const { isPending: isCreating, mutateAsync } = useMutation({
    mutationFn: (data) => api.post("/<%= plural_table_name %>", data),
    onSuccess: ({ data }) => {
      queryClient.invalidateQueries({ queryKey: ["<%= plural_table_name %>"] });
      router.push({
        pathname: `/<%= plural_table_name %>/${data.id}`,
        query: { notice: "Created with success." },
      });
    },
  });

  return (
    <>
      <h1>New <%= h.changeCase.lower(human_name) %></h1>

      <FormProvider resolver={resolver} values={{}} onSubmit={mutateAsync}>
        <<%= class_name %>Form />

        <div>
          <button disabled={isCreating} type="submit">
            Create
          </button>
        </div>
      </FormProvider>

      <br />

      <div>
        <Link href="/<%= plural_table_name %>">Back to <%= h.changeCase.lower(plural_table_name) %></Link>
      </div>
    </>
  );
}
