---
title: "Zend Lucene and Java Lucene"
date: 2009-02-22T11:49:00+01:00
draft: false
tags: 
  - lucene
  - zend
  - php
  - 2009
---

If you want to realize a fulltext search engine you can't ignore [Apache Lucene](http://lucene.apache.org/) and its 
port for Java. This powerful implementation uses a reverse index, like google does, and its results are pretty good.

Unfortuantely most webhoster won't support Java therefore you could switch to the PHP port of lucene implemented by 
the PHP [framework Zend](http://www.zend.com/de/downloads/), called Zend Lucene.

Thankworthy both implementations are compatible, you just have to consider the right version. Currently Zend supports 
the lucene index till version 2.3, though Apache lucene has already released version 2.4.

Older apache lucene releases can be downloaded from the [maven repository](http://repo1.maven.org/maven2/org/apache/lucene/lucene-core/2.3.2/)
