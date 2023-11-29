---
to: src/providers.js
---
import { useState } from "react";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { ReactQueryDevtools } from "@tanstack/react-query-devtools";

export function AppProvider({ children }) {
  const [queryClient] = useState(
    () =>
      new QueryClient({
        defaultOptions: {
          queries: {
            refetchOnWindowFocus: false,
          },
        },
      })
  );

  return (
    <QueryClientProvider client={queryClient}>
      {children}
      {<ReactQueryDevtools initialIsOpen={false} />}
    </QueryClientProvider>
  );
}

import {
  useForm,
  FormProvider as FormProviderBase,
  Form,
} from "react-hook-form";

export function FormProvider({ children, values, resolver, onSubmit }) {
  const { setError, ...formProps } = useForm({
    values,
    resolver,
  });

  const handleSubmit = ({ data }) => {
    onSubmit(data).catch((error) => {
      if (error.response.status === 422) {
        const serverError = error.response.data;

        for (const attribute in serverError) {
          setError(attribute, {
            type: "server",
            message: serverError[attribute],
          });
        }
      } else {
        alert(`Error: ${JSON.stringify(error)}`);
      }
    });
  };

  return (
    <FormProviderBase {...formProps}>
      <Form onSubmit={handleSubmit}>{children}</Form>
    </FormProviderBase>
  );
}
