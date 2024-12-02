---
title: "Scheduled Service in CQ5"
date: 2013-06-03T09:35:00+01:00
draft: false
tags: 
  - cq5
---

Cron [or](http://stackoverflow.com/questions/1029383/time-triggered-job-cron-or-quartz)
Quartz like behaviour in CQ5 comes out of the box. See [more examples](http://sling.apache.org/site/scheduler-service-commons-scheduler.html). 
I have seen the annotation as comments, which I think is a bad style. 

```
import org.apache.felix.scr.annotations.Component; 
import org.apache.felix.scr.annotations.Property; 
import org.apache.felix.scr.annotations.Service; 
import org.slf4j.Logger; import org.slf4j.LoggerFactory;  

@Component @Service @Property(name="scheduler.expression", value = "0 * * * * ?") 
public class ScheduledJob implements Runnable {      
  private static final Logger LOGGER = LoggerFactory.getLogger(ScheduledJob.class);      

  public void run() {         
    // your code goes here ...     
  } 
} 
```
