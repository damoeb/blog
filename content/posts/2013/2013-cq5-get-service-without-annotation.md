---
title: "CQ5 get service without annotation (snippet)"
date: 2013-08-08T19:26:00+01:00
draft: false
tags: 
  - cq5
  - 2013
---

```
BundleContext context = FrameworkUtil.getBundle(MyService.class).getBundleContext();
ServiceReference reference = context.getServiceReference(MyService.class.getName());
MyService myService = (MyService)  context.getService(reference);
```
