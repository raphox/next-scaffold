---
to: src/components/<%= class_name %>Form.tsx
---
<%
const ZOD_TYPE_MAP = {
  string: "string",
  text: "string",
};
_%>
import React from "react";

import { useFormContext } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import * as z from "zod";

const schema = z.object({
  <%_ Object.entries(resource_attrs).forEach(function([attribute, type]) { _%>
  <%- attribute %>: z.<%= ZOD_TYPE_MAP[type] || 'string' %>(),
  <%_ }) _%>
});

type FormData = z.infer<typeof schema>;

export const resolver = zodResolver(schema);

export default function <%= class_name %>Form() {
  const {
    register,
    formState: { errors },
  } = useFormContext<FormData>();

  return (
    <>
    <%_ Object.entries(resource_attrs).forEach(function([attribute, type]) { _%>
    <p>
      <label htmlFor="<%= attribute %>"><%= h.inflection.titleize(attribute) %>:</label>
      <input type="<%= type %>" {...register("<%= attribute %>")} />
      {errors.<%= attribute %> && <span>{errors.<%= attribute %>.message}</span>}
    </p>
    <%_ }) _%>
    </>
  );
}
