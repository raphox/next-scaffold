---
to: src/components/<%= class_name %>.tsx
---
<%
const INTERFACE_TYPE_MAP = {
  string: "string",
  text: "string",
};
_%>
import React from "react";

export interface Props {
  id: string;
  <%_ Object.entries(resource_attrs).forEach(function([attribute, type]) { _%>
  <%- attribute %>: <%= INTERFACE_TYPE_MAP[type] || 'string' %>;
  <%_ }) _%>
}

export default function <%= class_name %>(props: Props) {
  return (
    <>
    <%_ Object.entries(resource_attrs).forEach(function([attribute, type]) { _%>
      <p>
        <b><%= attribute %>:</b> {props.<%= attribute %>}
      </p>
    <%_ }) _%>
    </>
  );
}
