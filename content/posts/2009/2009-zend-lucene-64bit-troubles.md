---
title: "Zend Lucene 64bit troubles"
date: 2009-02-26T19:55:00+01:00
draft: false
tags: 
  - php
  - lucene
  - 2009
---

Apparently Zend Lucene suffers from troubles on 64 bit machines, several bugs
( [Exception opening index on 64bit platforms](http://framework.zend.com/issues/browse/ZF-4113), 
[Lucene doesn't work on 64-bit](http://framework.zend.com/issues/browse/ZF-4071)). Thats the bad news!

The good news is that those bugs can be easily be fixed, [the solution is here](http://framework.zend.com/issues/browse/ZF-4071?focusedCommentId=28325#action_28325).
