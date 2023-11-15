---
to: src/pages/<%= h.inflection.tableize(name) %>/_components/<%= class_name %>.js
---
export default function <%= class_name %>(props) {
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

