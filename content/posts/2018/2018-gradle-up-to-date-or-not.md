---
title: "Gradle: UP-TO-DATE or not?"
date: 2018-02-19T09:34:54+01:00
draft: false

tags: 
  - gradle
  - build
---

Running a gradle task with caching will only run a task if the <code>inputs</code> and <code>outputs</code> are either not defined or outdate. To get some debugging information about why a task is not UP-TO-DATE run gradle with --info
```
 gradle taskA --info
```
