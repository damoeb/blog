---
title: "CQ5 replace Tab in ContentFinder with custom implementation"
date: 2013-04-17T14:42:00+01:00
draft: false
tags: 
  - cq5
  - 2013
---

Adobe already explained [how to add a custom tab to Content Finder](http://helpx.adobe.com/cq/kb/CustomCFTab.html). 
In order to replace an existing tab with your custom js file, e.g. movie tab, you simply have to use the same **"id"** 
value. For the movie tab, it is *cfTab-Movies*

```
{     
  "tabTip": CQ.I18n.getMessage("Movies"),
  <b>"id": "cfTab-Movies"</b>,
  "xtype": "contentfindertab",
  "iconCls": "cq-cft-tab-icon movies",
  (..) 
}
``` 
