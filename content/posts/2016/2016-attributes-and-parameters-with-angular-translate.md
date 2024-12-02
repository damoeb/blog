---
title: "Attributes and Parameters with Angular Translate"
date: 2016-05-13T09:28:42+01:00
draft: false
tags: 
  - angularjs
  - angular translate
---

```
translate-values="{map}"
translate-value-myargument="{string}"
translate-attr-myattribute="{string}"
```

`translate-value-{argument-name}` values are available in the translation by name.

`translate-attr-{attribute-name}` creates the attribute `attribute-name` with the translation as value.

The map feature is potentially critical, cause a value of the map could potentially escape its cage and inject some Java Script.

**Example:**
i18n JSON:
```
{"TRANSLATE_THIS_KEY": "My argument has the value '{{myargument}}'"}
```

Markup:
&lt;div&gt;&lt;/div&gt;

Result:
My argument has the value 'something creative'
