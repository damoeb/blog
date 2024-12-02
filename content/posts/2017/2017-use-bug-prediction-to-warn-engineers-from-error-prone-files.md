---
title: "Use Bug Prediction to Warn Engineers from Error-Prone Files"
date: 2017-07-26T07:56:55+01:00
draft: false

tags: 
  - bugs
---

Google once [posted an article](http://google-engtools.blogspot.ch/2011/12/bug-prediction-at-google.html?view=timeslide) in which they describe how they use bug prediction algorithms to flag error prone source files (hot spots) in reviews and therefore warn reviewers to be especially careful. The idea is, that some bug-fixes require some more subsequent bug fixing, because

*   the bug does not get smashed on the first attempt
*   a fix introduces new issues due to complexity/fragility of the code
*   the reported and fixed bug is part of a larger bug

They decided to use the simple [algorithm by Rahman et al.](https://scholar.google.com/scholar?q=Bug+Cache+for+inspections%3A+hit+or+miss%3F) that returns very non-opaque results by only [looking at the commit history](https://scholar.google.com/scholar?cluster=338532016657424558) of a file. So no magic AI involved. Other algorithm like code complexity have the downside, that even code that needs to be complex will be flagged. As a requirement you need a standardized commit message format (e.g. [angular 2 commit guidelines](https://github.com/angular/angular/blob/master/CONTRIBUTING.md#commit)) in order to identify the bug-fix commits. After identifying those hot-spots, they will mark them in the code reviews. Unfortunately they did not report a final conclusion of whether bug prediction improved their overall code quality/performance.
