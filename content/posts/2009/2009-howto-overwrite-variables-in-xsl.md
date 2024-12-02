---
title: "How to Overwrite Variables in Xsl"
date: 2009-04-29T11:59:00+01:00
draft: false
tags: 
  - java
---

XSL is sometimes pretty nasty. Lots of commonly programming stuff isn't available, p.e. loops. Even the simplest operation - overwriting values of variables - is pretty tricky, and cannot actually been done in the way we would like to. And apparently its not even possible to globally overwrite the value.

The only way to set the value of a **xsl:variable** is to do it at the initialization, in the body of it.

So if you start your initialization like this you cannot change its level anmore (globally).
