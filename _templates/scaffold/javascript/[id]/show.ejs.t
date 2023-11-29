---
to: src/pages/<%= h.inflection.tableize(name) %>/[id]/index.js
---
import Link from "next/link";
import { useRouter, useParams, useSearchParams } from "next/navigation";
import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";

import { api } from "@/services";
import <%= class_name %> from "@/components/<%= class_name %>";

export default function <%= class_name %>ShowPage() {
  const router = useRouter();
  const params = useParams();
  const searchParams = useSearchParams();
  const queryClient = useQueryClient();
  const notice = searchParams.get("notice");
  const <%= singular_table_name %>Id = params?.id;

  const { isPending: isDeleting, mutate } = useMutation({
    mutationFn: (data) => api.delete(`/<%= plural_table_name %>/${<%= singular_table_name %>Id}`, data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["<%= plural_table_name %>"] });
      router.replace({
        pathname: "/<%= plural_table_name %>",
        query: { notice: "Removed with success." },
      });
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
      {notice && <p style={{ color: "green" }}>{notice}</p>}

      <<%= class_name %> {...data} />

      <div>
        <Link href={`/<%= plural_table_name %>/${<%= singular_table_name %>Id}/edit`}>Edit this <%= h.changeCase.lower(human_name) %></Link>
        {" | "}
        <Link href="/<%= plural_table_name %>">Back to <%= h.changeCase.lower(plural_table_name) %></Link>{" "}
        <button disabled={isDeleting} onClick={mutate}>
          Destroy this <%= h.changeCase.lower(human_name) %>
        </button>
      </div>
    </>
  );
}
