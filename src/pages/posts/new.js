import Link from "next/link";
import { useRouter } from "next/router";
import { useMutation } from 'react-query';

import { api } from "@/services";
import PostForm from "./_components/PostForm";

export default function PostNewPage() {
  const router = useRouter();
  const { isLoading: isCreating, mutate } = useMutation((data) => {
    return api.post("/posts", data);
  });

  const handleCreate = (data) => {
    mutate(data, {
      onSuccess: ({ data: post }) => {
        router.replace({
          pathname: `/posts/${post.id}`,
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
      <h1>New post</h1>

      <PostForm
        isLoading={isCreating}
        data={{}}
        onSubmit={handleCreate}
      />

      <br />

      <div>
        <Link href="/posts">Back to posts</Link>
      </div>
    </>
  );
}
