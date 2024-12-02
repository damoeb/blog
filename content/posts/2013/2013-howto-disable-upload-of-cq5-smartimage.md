---
title: "Howto disable upload of CQ5 SmartImage"
date: 2013-02-08T10:42:00+01:00
draft: false
tags: 
  - cq5
---

According to the SmartImage API docs, there is a option to disable the upload of this component. 
```
allowUpload="false"
```

Unfortunately, it is still possible. I tried to solve it, by --preventing the click event--. Nothing.   

I solved it using a CSS workaround, that hides the file upload field. Don't forget to specify the **id** in both snippets. 
Add this to your css to hide the upload field 
```
/* Hide upload field */ 
#some-unique-id .x-form-item {
  display: none!important; 
} 
```
