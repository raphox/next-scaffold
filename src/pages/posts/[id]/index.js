import Link from "next/link";
import { useRouter } from "next/router";
import { useParams, useSearchParams } from "next/navigation";
import { useMutation } from 'react-query';
import { useQuery } from "react-query";

import { api } from "@/services";
import Post from "../_components/Post";

export default function PostShowPage() {
  const router = useRouter();
  const params = useParams();
  const searchParams = useSearchParams();
  const notice = searchParams.get("notice");
  const postId = params?.id;

  const {
    isIdle,
    isLoading,
    error,
    data: post,
  } = useQuery(
    ["posts", postId],
    () => api.get(`/posts/${params.id}`).then((res) => res.data),
    { enabled: !!postId, refetchOnMount: true }
  );

  const { isLoading: isDeleting, mutate } = useMutation((id) => {
    return api.delete(`/posts/${id}`);
  });

  const handleDelete = () => {
    mutate(params.id, {
      onSuccess: () => {
        router.replace({
          pathname: "/posts",
          query: { notice: "Removed with success." },
        });
      },
      onError: (error) => {
        alert(`Error: ${JSON.stringify(error)}`);
      },
    });
  };

  if (isIdle || isLoading) return "Loading...";

  if (error) return "An error has occurred: " + error.message;

  return (
    <>
      {notice && <p style={{ color: "green" }}>{notice}</p>}

      <Post {...post} />

      <div>
        <Link href={`/posts/${post.id}/edit`}>Edit this post</Link>
        {" | "}
        <Link href="/posts">Back to posts</Link>{" "}
        <button data={{ isLoading: isDeleting }} onClick={handleDelete}>
          Destroy this post
        </button>
      </div>
    </>
  );
}
