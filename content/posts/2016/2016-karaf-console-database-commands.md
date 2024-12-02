---
title: "Karaf Console Cheatsheet"
date: 2016-02-04T09:44:20+01:00
draft: true

tags: 
  - karaf
  - 2016
---

>**karaf@root**> </span><span>service:list Datasource

feature installieren

**karaf@root**> </span><span>feature:install jdbc

>**karaf@root**> </span><span>jdbc:tables jdbc/matterhorn

>**karaf@root**> </span><span>jdbc:query jdbc/matterhorn “select * from mh_job where id = 362”

>**karaf@root**> </span><span>jdbc:execute jdbc/matterhorn “update from mh_job set status=2 where id = 362”
