---
title: "Gradle: configuration phase vs execution phase"
date: 2018-02-16T16:19:40+01:00
draft: false

tags: 
  - gradle
  - build
---

```
task clean()  {
  // runs always
  doLast {
    // runs only when executed
    delete "${buildDir}"
  }
}
```
