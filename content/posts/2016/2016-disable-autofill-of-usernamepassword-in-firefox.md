---
title: "Disable Autofill of saved credentials into a form in firefox"
date: 2016-05-05T10:11:35+01:00
draft: false

tags: 
  - 2016
---

Firefox comes with this annoying feature, where it tries to fill forms with the saved username and password. The algorithm is quite stupid. If there is a input field of type password in a form, Firefox infers that the previous field must be the username field - and fills in the data.

There is no way to disable this behavior, neither by some dynamic magic or a special HTML attribute.

The only way, that worked for me, was, to add two additional hidden fields that serve only the purpose of satisfying this feature. Note, that their type cannot be hidden, cause firefox will then ignore them. But you can hide them using CSS.
```
.hidden {
  display: none;
}
```

```
<input type="text" class="hidden">
<input type="password" class="hidden">
```
