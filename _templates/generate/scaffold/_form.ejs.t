---
to: src/pages/<%= h.inflection.tableize(name) %>/_components/<%= class_name %>Form.js
---
<%
const ZOD_TYPE_MAP = {
  string: "string",
  text: "string",
};
%>
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import * as z from "zod";

const schema = z.object({
  <%_ Object.entries(resource_attrs).forEach(function([attribute, type]) { _%>
  <%= attribute %>: z.<%= ZOD_TYPE_MAP[type] %>(),
  <%_ }) _%>
});

export default function <%= class_name %>Form({ data, isLoading, onSubmit }) {
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
    <%_ Object.entries(resource_attrs).forEach(function([attribute, type]) { _%>
      <p>
        <label htmlFor="<%= attribute %>"><%= h.inflection.titleize(attribute) %>:</label>
        <input type="<%= type %>" {...register("<%= attribute %>")} />
        {errors.<%= attribute %> && <span>{errors.<%= attribute %>.message}</span>}
      </p>
    <%_ }) _%>

      <div>
        <button disable={isLoading} type="submit">Submit</button>
      </div>
    </form>
  );
}
