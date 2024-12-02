---
title: "karma tests with $interval"
date: 2016-05-25T09:16:32+01:00
draft: false

tags: 
  - karma
  - testing
---

Using $interval instead of the JavaScript native setInteval gives you more control in your tests. $interval works 
synchronously and will wait until you feed it with time offsets, using
```
 $interval.flush(<msecs>)
```
