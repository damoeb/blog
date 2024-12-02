---
title: "angular watch expressions for nested fields with special charaters"
date: 2016-04-04T09:44:26+01:00
draft: false
tags: 
  - 2016
  - angularjs
---

If you have model names that contain reserved keywords like operators, watch expression in the dot notation will fail. 
Luckily these names can be escaped.

```
$scope.$watch('metadataForm["dublincore/episode__isPartOf"]', function(modelCtrl) { 
... 
})
```
