---
title: "Raw Html in CQ5"
date: 2013-02-06T14:09:00+01:00
draft: false
tags: 
  - cq5
---

I had to solve a problem of publishing some custom HTML code usning CQ5 with Ext JS. Raw HTML can be passed to DOM 
using [CQ.form.OwnerDraw](http://dev.day.com/docs/en/cq/5-3/widgets-api/index.html?class=CQ.form.OwnerDraw)

```
var rawComponent = new CQ.form.OwnerDraw({    html: '&lt;div&gt;I am raw&lt;/div&gt;' }); 
``` 

To alter this generated code, you may use a wrapping container like  

```
var wrapper = new CQ.Ext.Panel(); 
```

and pass the raw component to it.  

```
wrapper.removeAll(); // clear parent 
wrapper.add(rawComponent); 
wrapper.doLayout(); // force redraw 
```
