---
title: "Multitail: Log output highlighting in terminal"
date: 2013-03-26T09:07:00+01:00
draft: false
tags: 
  - logging
  - 2013
---

[Multitail](http://www.vanheusden.com/multitail/) is a command line tool primarily used to merge several log files. 
It is also capable of highlighting the output from one or more log files. In Ubuntu, you simply create or extend your 
multitail configuration in your home. 

```
vi ~/.multitailrc
``` 

and define there your custom color scheme named **yourcolorscheme**

```
colorscheme:yourcolorscheme 
cs_re:red,,bold:.*ERROR.* 
cs_re:green:INFO 
```

When invoking multitail command, provide the designated color scheme (-cS) you want to use. 

```
multitail -cS yourcolorscheme -f logs/server.log
``` 

Thanks to [Gilles](http://unix.stackexchange.com/questions/8414/how-to-have-tail-f-show-colored-output) for the input.
