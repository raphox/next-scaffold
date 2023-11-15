---
to: src/pages/<%= h.inflection.tableize(name) %>/[id]/index.js
---
import Link from "next/link";
import { useRouter } from "next/router";
import { useParams, useSearchParams } from "next/navigation";
import { useMutation, useQuery } from "@tanstack/react-query";

import { api } from "@/services";
import <%= class_name %> from "../_components/<%= class_name %>";

export default function <%= class_name %>ShowPage() {
  const router = useRouter();
  const params = useParams();
  const searchParams = useSearchParams();
  const notice = searchParams.get("notice");
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

  const { isPending: isDeleting, mutate } = useMutation({
    mutationFn: (id) => {
      return api.delete(`/<%= plural_table_name %>/${id}`);
    },
  });

  const handleDelete = () => {
    mutate(params.id, {
      onSuccess: () => {
        queryClient.invalidateQueries({ queryKey: ["<%= plural_table_name %>"] });
        router.replace({
          pathname: "/<%= plural_table_name %>",
          query: { notice: "Removed with success." },
        });
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

      <<%= class_name %> {...<%= singular_table_name %>} />

      <div>
        <Link href={`/<%= plural_table_name %>/${<%= singular_table_name %>.id}/edit`}>Edit this <%= h.changeCase.lower(human_name) %></Link>
        {" | "}
        <Link href="/<%= plural_table_name %>">Back to <%= h.changeCase.lower(plural_table_name) %></Link>{" "}
        <button data={{ isLoading: isDeleting }} onClick={handleDelete}>
          Destroy this <%= h.changeCase.lower(human_name) %>
        </button>
      </div>
    </>
  );
}
