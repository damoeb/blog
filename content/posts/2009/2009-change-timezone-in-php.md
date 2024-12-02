---
title: "Change Timezone in PHP"
date: 2009-02-27T20:26:00+01:00
draft: false
tags: 
  - 2009
  - php
  - tripdrop
---

Assuming your webserver isn't in the timezone, it is expected - bought a cheap server in a foreign country ;) - you have two, actually three, ways to solve this.

### 1. During runtime
This solution nessetiates the fewest permissions. Just execute

```
putenv("TZ=Europe/Vaduz");
```
in your PHP script and done. Drawback: you have to do for every execution.

### 2. Permanent

If you're allowed to modify the php.ini, probably in

```
/etc/php5/apache2/php.ini
```

and change the parameter

```
date.timezone = Europe/Vaduz
```

A full list of all timezones can be found [where](http://www.php.net/manual/en/timezones.php).

To avoid any troubles with time conversion and timezones, you should use the [Unix time](http://en.wikipedia.org/wiki/Unix_time) or the Greenwich time.
