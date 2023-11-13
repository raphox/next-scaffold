# next-rails-scaffold

## Templates

```
_templates/generate/scaffold/
├── _component.ejs.t
├── _form.ejs.t
├── edit.ejs.t
├── index.js
├── list.ejs.t
├── new.ejs.t
├── services.ejs.t
└── show.ejs.t
```

## Frontend tech stack:


* **Next.js (https://nextjs.org)** - _The React Framework for the Web_
    - Elevate our frontend development by leveraging Next.js, a powerful React Framework tailored for the web. Join us in creating and managing a dynamic and responsive web application with enhanced performance and developer-friendly features.
* **Axios (https://axios-http.com)** - _Promise based HTTP client for the browser and node.js_
    - Empower our application with Axios, a versatile and promise-based HTTP client. Contribute to setting up a global request configuration, defining custom headers, and handling exceptions and success responses. Ensure smooth communication between the browser and node.js.
* **React Query (https://tanstack.com/query/latest)** - _Powerful asynchronous state management for TS/JS, React, Solid, Vue, and Svelte_
    - Transform the way we handle asynchronous state management using React Query. Collaborate with us to seamlessly load and update data through RESTful requests. Bring your expertise in TypeScript/JavaScript, React, Solid, Vue, or Svelte to enhance our application's state management capabilities.
* **React Hook Form (https://react-hook-form.com)** - _Performant, flexible, and extensible forms with easy-to-use validation_
    - Contribute to building high-performance, flexible, and extensible forms with React Hook Form. Your role involves defining and implementing robust form validations, ensuring an effortless and error-free user experience. Join us in creating dynamic and user-friendly forms.
* **Zod (https://zod.dev)** - _TypeScript-first schema validation with static type inference_
    - Enhance our application's integrity with Zod, a TypeScript-first schema validation tool. Work with us to define and enforce validation rules, leveraging static type inference for a more secure and type-safe codebase. Ensure data consistency and reliability.
* **Hygen (https://www.hygen.io)** - _The scalable code generator that saves you time_
    - Optimize our development workflow with Hygen, a scalable code generator designed to save time. Play a crucial role in defining and utilizing templates for our code generation process. Improve code consistency and reduce repetitive tasks by incorporating Hygen into our project.

## Using

```
npm install
npx hygen generate scaffold post title:string body:text
```

### Result

Generated files strutucture:

```
src
├── pages
|   └── posts
|       ├── [id]
|       |   ├── edit.js
|       |   └── index.js
|       ├── _components
|       |   ├── Post.js
|       |   └── PostForm.js
|       ├── index.js
|       └── new.js
└── services.js
```

https://github.com/raphox/next-rails-scaffold/blob/a71c76d432d850f1f5acbd9ed76ede0ceba76e5b/src/services.js#L1-L26

https://github.com/raphox/next-rails-scaffold/blob/a71c76d432d850f1f5acbd9ed76ede0ceba76e5b/src/pages/posts/index.js#L1-L43

https://github.com/raphox/next-rails-scaffold/blob/a71c76d432d850f1f5acbd9ed76ede0ceba76e5b/src/pages/posts/new.js#L1-L45

https://github.com/raphox/next-rails-scaffold/blob/a71c76d432d850f1f5acbd9ed76ede0ceba76e5b/src/pages/posts/%5Bid%5D/edit.js#L1-L65

https://github.com/raphox/next-rails-scaffold/blob/a71c76d432d850f1f5acbd9ed76ede0ceba76e5b/src/pages/posts/%5Bid%5D/index.js#L1-L66

https://github.com/raphox/next-rails-scaffold/blob/a71c76d432d850f1f5acbd9ed76ede0ceba76e5b/src/pages/posts/_components/Post.js#L1-L12

https://github.com/raphox/next-rails-scaffold/blob/a71c76d432d850f1f5acbd9ed76ede0ceba76e5b/src/pages/posts/_components/PostForm.js#L1-L39
