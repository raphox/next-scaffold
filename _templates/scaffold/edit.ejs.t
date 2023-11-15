---
to: src/pages/<%= h.inflection.tableize(name) %>/[id]/edit.js
---
import { useState } from "react";
import Link from "next/link";
import { useParams } from "next/navigation";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";

import { api } from "@/services";
import <%= class_name %>Form from "../_components/<%= class_name %>Form";

export default function <%= class_name %>EditPage() {
  const params = useParams();
  const [notice, setNotice] = useState();
  const queryClient = useQueryClient();
  const <%= singular_table_name %>Id = params?.id;

  const {
    isPending,
    error,
    data: <%= singular_table_name %>,
  } = useQuery({
    queryKey: ["<%= plural_table_name %>", <%= singular_table_name %>Id],
    queryFn: () => api.get(`/<%= plural_table_name %>/${params.id}`).then((res) => res.data),
    enabled: !!<%= singular_table_name %>Id,
    refetchOnMount: true,
  });

  const { isPending: isUpdating, mutate } = useMutation({
    mutationFn: (data) => {
      return api.put(`/<%= plural_table_name %>/${<%= singular_table_name %>Id}`, data);
    },
  });

  const handleUpdate = (data) => {
    mutate(data, {
      onSuccess: (result) => {
        queryClient.invalidateQueries({ queryKey: ["<%= plural_table_name %>"] });
        setNotice("Updated with success.");
      },
      onError: (error) => {
        alert(`Error: ${JSON.stringify(error)}`);
      },
    });
  };

  if (isPending) return "Loading...";

  if (error) return "An error has occurred: " + error.message;

  return (
    <>
      {notice && <p style={{ color: "green" }}>{notice}</p>}

      <h1>Editing <%= h.changeCase.lower(human_name) %></h1>

      <<%= class_name %>Form
        isLoading={isUpdating}
        data={<%= singular_table_name %>}
        onSubmit={handleUpdate}
      />

      <br />

      <div>
        <Link href={`/<%= plural_table_name %>/${<%= singular_table_name %>.id}`}>Show this <%= h.changeCase.lower(human_name) %></Link>
        {" | "}
        <Link href="/<%= plural_table_name %>">Back to <%= h.changeCase.lower(plural_table_name) %></Link>
      </div>
    </>
  );
}
