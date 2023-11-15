module.exports = {
  params: ({ args, h }) => {
    const process_args = process.argv.slice(3);
    const [_generator, _action, ...others] = process_args;

    const attributes = others.reduce((result, item) => {
      const [key, type] = item.split(":");
      result[key] = type;

      return result;
    }, {});

    human_name = h.inflection.humanize(args.name);
    class_name = h.inflection.classify(args.name);
    plural_table_name = h.inflection.tableize(args.name);
    singular_table_name = h.inflection.singularize(plural_table_name);

    return {
      human_name,
      class_name,
      plural_table_name,
      singular_table_name,
      resource_attrs: attributes,
    };
  },
};
