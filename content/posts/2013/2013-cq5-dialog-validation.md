---
title: "CQ5 Dialog Validation"
date: 2013-02-06T14:39:00+01:00
draft: false
tags: 
  - cq5
---

By registering a listener to the **beforesubmit** event, you can validate a dialog.

```
... xtype="dialog"&gt;    ... 
```

### Serverside Validation
After defining a custom validating servlet, you can put the following code snippet in the **beforesubmit** area. It is important to call the servlet using **async=false**, to ensure everything is handled by the same thread.  

```
CQ.Ext.Ajax.request({ method: 'POST', url: '/content.myvalidationservlet.json', async: false, success: function(response){
  // do something 
}, params: { ... } }); 
```
