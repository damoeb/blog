---
title: "`git merge` with large amount of changed files"
date: 2016-03-30T13:34:35+01:00
draft: false

tags: 
  - git
  - 2016
---

If you try to merge huge branches with a lot of files (we had 900+), you might experience weird git behaviour, like "Bad Revision" messages, when you want to diff. In addition to that  many files may appear to be kicked out from the git tree or even get removed physically. So merging was impossible.

A good hint are the warnings at the end of the git merge stack trace.
```
 warning: inexact rename detection was skipped due to too many files.
warning: you may want to set your merge.renamelimit variable to at least 1503 and retry the command.
```

According to the latter warning you might increase the renamelimit using the command
```
 git config merge.renameLimit 1503
```

This fixes the merging problems.
