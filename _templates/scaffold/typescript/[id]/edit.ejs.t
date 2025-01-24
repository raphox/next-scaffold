---
to: src/pages/<%= h.inflection.tableize(name) %>/[id]/edit.tsx
---
import React from "react";

import Link from "next/link";
import { useParams } from "next/navigation";
import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";

import { api } from "@/services";
import { FormProvider } from "@/providers";
import <%= class_name %>Form, { resolver } from "@/components/<%= class_name %>Form";

export default function <%= class_name %>EditPage() {
  const params = useParams();
  const queryClient = useQueryClient();
  const <%= singular_table_name %>Id = params?.id;

  const {
    isPending: isUpdating,
    isSuccess,
    mutateAsync,
  } = useMutation({
    mutationFn: (data: any) => api.put(`/<%= plural_table_name %>/${<%= singular_table_name %>Id}`, data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["<%= plural_table_name %>"] });
    },
  });

  const { isPending, error, data } = useQuery({
    queryFn: () => api.get(`/<%= plural_table_name %>/${<%= singular_table_name %>Id}`).then((res) => res.data),
    queryKey: ["<%= plural_table_name %>", <%= singular_table_name %>Id],
    enabled: !!<%= singular_table_name %>Id,
  });

  if (isPending) {
    return "Loading...";
  } else if (error) {
    return "An error has occurred: " + error.message;
  }

  return (
    <>
      {isSuccess && <p style={{ color: "green" }}>Updated with success.</p>}

      <h1>Editing <%= singular_table_name %></h1>

      <FormProvider resolver={resolver} values={data} onSubmit={mutateAsync}>
        <<%= class_name %>Form />

        <div>
          <button disabled={isUpdating} type="submit">
            Update
          </button>
        </div>
      </FormProvider>

      <br />

      <div>
        <Link href={`/<%= plural_table_name %>/${<%= singular_table_name %>Id}`}>Show this <%= singular_table_name %></Link>
        {" | "}
        <Link href="/<%= plural_table_name %>">Back to <%= plural_table_name %></Link>
      </div>
    </>
  );
}
