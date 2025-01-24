---
to: src/providers.tsx
---
import { useState, ReactNode } from "react";
import { QueryClient, QueryClientProvider, UseMutateAsyncFunction } from "@tanstack/react-query";
import { ReactQueryDevtools } from "@tanstack/react-query-devtools";

export function AppProvider({ children }: { children: ReactNode }) {
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
      <ReactQueryDevtools initialIsOpen={false} />
    </QueryClientProvider>
  );
}

import { AxiosResponse } from "axios";
import {
  useForm,
  FormProvider as FormProviderBase,
  Form,
  FieldValues,
  Resolver,
} from "react-hook-form";

interface FormProviderProps {
  children: ReactNode;
  values: FieldValues;
  resolver: Resolver;
  onSubmit: UseMutateAsyncFunction<AxiosResponse<any, any>, Error, any, unknown>;
}

export function FormProvider({ children, values, resolver, onSubmit }: FormProviderProps) {
  const { setError, ...formProps } = useForm({
    defaultValues: values,
    resolver,
  });

  const handleSubmit = async (fields: FieldValues) => {
    try {
      await onSubmit(fields.data);
    } catch (error: any) {
      if (error.response?.status === 422) {
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
    }
  };

  return (
    <FormProviderBase setError={setError} {...formProps}>
      <Form onSubmit={handleSubmit}>{children}</Form>
    </FormProviderBase>
  );
}
