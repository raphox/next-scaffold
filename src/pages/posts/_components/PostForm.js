
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import * as z from "zod";

const schema = z.object({
  title: z.string(),
  body: z.string(),
});

export default function PostForm({ data, isLoading, onSubmit }) {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm({
    values: data,
    resolver: zodResolver(schema),
  });

  return (
    <form onSubmit={handleSubmit(onSubmit)}>
      <p>
        <label htmlFor="title">Title:</label>
        <input type="string" {...register("title")} />
        {errors.title && <span>{errors.title.message}</span>}
      </p>
      <p>
        <label htmlFor="body">Body:</label>
        <input type="text" {...register("body")} />
        {errors.body && <span>{errors.body.message}</span>}
      </p>

      <div>
        <button disable={isLoading} type="submit">Submit</button>
      </div>
    </form>
  );
}
