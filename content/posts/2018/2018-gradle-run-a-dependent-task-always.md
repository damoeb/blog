---
title: "Gradle: Run a dependent task, always"
date: 2018-02-16T22:23:40+01:00
draft: false

tags: 
  - gradle
  - build
---

With gradle you can build a dependency tree using the `dependsOn` relation. To create the relation A → B, you could write:

``` task A(dependsOn B) {.. } ```

Gradle will then take care of that all dependencies are executed before the task runs. Strictly speaking an outdated dependency B should cause A to be rerun too. Unfortunately I did not find a way to define a project as part of `inputs` , I though found a workaround to forcibly rebuild a parent node.

```
task taskN() {
  inputs...
  outputs...

  doLast {
    if (taskN.didWork) {
      tasks.getByPath(':projectB:taskM').outputs.upToDateWhen { false }
    }
  }
}
```
