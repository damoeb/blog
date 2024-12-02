---
title: "Apache2 File Permissions"
date: 2013-03-31T22:04:00+01:00
draft: false
tags: 
  - 2013
  - apache
---

Directories 
```
find /var/www -type d -exec chmod 0775 {} + 
```

Files 
```
find /var/www -type f -exec chmod 0664 {} + 
```
