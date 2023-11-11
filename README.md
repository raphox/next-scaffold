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

## Using

```
npm install
npx hygen generate scaffold post title:string body:text
```

### Result

https://github.com/raphox/next-rails-scaffold/blob/a71c76d432d850f1f5acbd9ed76ede0ceba76e5b/src/services.js#L1-L26

https://github.com/raphox/next-rails-scaffold/blob/a71c76d432d850f1f5acbd9ed76ede0ceba76e5b/src/pages/posts/index.js#L1-L43

https://github.com/raphox/next-rails-scaffold/blob/a71c76d432d850f1f5acbd9ed76ede0ceba76e5b/src/pages/posts/new.js#L1-L45

https://github.com/raphox/next-rails-scaffold/blob/a71c76d432d850f1f5acbd9ed76ede0ceba76e5b/src/pages/posts/%5Bid%5D/edit.js#L1-L65

https://github.com/raphox/next-rails-scaffold/blob/a71c76d432d850f1f5acbd9ed76ede0ceba76e5b/src/pages/posts/%5Bid%5D/index.js#L1-L66

https://github.com/raphox/next-rails-scaffold/blob/a71c76d432d850f1f5acbd9ed76ede0ceba76e5b/src/pages/posts/_components/Post.js#L1-L12

https://github.com/raphox/next-rails-scaffold/blob/a71c76d432d850f1f5acbd9ed76ede0ceba76e5b/src/pages/posts/_components/PostForm.js#L1-L39
