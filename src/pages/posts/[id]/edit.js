import { useState } from "react";
import Link from "next/link";
import { useParams } from "next/navigation";
import { useQuery, useMutation } from 'react-query';

import { api } from "@/services";
import PostForm from "../_components/PostForm";

export default function PostEditPage() {
  const params = useParams();
  const [notice, setNotice] = useState();
  const postId = params?.id;

  const {
    isIdle,
    isLoading,
    error,
    data: post,
  } = useQuery(
    ["posts", postId],
    () => api.get(`/posts/${postId}`).then((res) => res.data),
    { enabled: !!postId, refetchOnMount: true }
  );

  const { isLoading: isUpdating, mutate } = useMutation((data) => {
    return api.put(`/posts/${postId}`, data);
  });

  const handleUpdate = (data) => {
    mutate(data, {
      onSuccess: (result) => {
        setNotice("Updated with success.");
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

      <h1>Editing post</h1>

      <PostForm
        isLoading={isUpdating}
        data={post}
        onSubmit={handleUpdate}
      />

      <br />

      <div>
        <Link href={`/posts/${post.id}`}>Show this post</Link>
        {" | "}
        <Link href="/posts">Back to posts</Link>
      </div>
    </>
  );
}
