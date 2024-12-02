---
title: "CQ5 Internationalization"
date: 2013-02-06T13:23:00+01:00
draft: false
tags: 
  - cq5
---

To achieve the goal of a multi lingual CQ5-based application, you may use CQ I18n implementation 
([API](http://dev.day.com/docs/en/cq/current/javadoc/com/day/cq/i18n/I18n.html)) to access the translated strings from 
the ResourceBundle, according to your language.

In the XML definition of a component, the dialog.xml, use the key directly in the text field, e.g. 

```
fieldLabel="app.component.key"
``` 
CQ5 will resolve the reference automatically.

```
 (...) &lt;/mypanel&gt
```

In Java Script, CQ5 provides the method 
```
CQ.I18n.get('app.component.key')
```

In Java we implemented a Localization service, that loads all keys from JCR.
 
In JSP you can use after importing I18n.
