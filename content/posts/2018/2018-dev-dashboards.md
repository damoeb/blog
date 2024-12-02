---
title: "Developer Dashboards"
date: 2018-02-22T12:56:40+01:00
draft: false
tags: 
  - dashboard
---

( I already had [some thoughts on that topic](https://yellowchicken.wordpress.com/2017/08/26/engineering-dashboard/) ).

# Goal

*   Get a better overview of future/pending/past work and keep it.
*   "If you want a developer to do something, e.g. establish a high test coverage, make it easy with sane reasons"

# What?

*   Pre-Deployment
    *   Feature Branches, consisting of
        *   PRs
        *   Build
            *   (Test) Reports
            *   Static Code Analysis (Report?)
            *   Build Status green/yellow/red
        *   Human Code Analysis (Code Reviews)
*   Post-Deployment
    *   Monitoring
        *   Active (Alerts)
        *   Passive
    *   Configuration
        *   Feature Flags?

# How?

https://prometheus.io https://www.elastic.co/elk-stack https://github.com/cristijora/vue-paper-dashboard

# Impressions

[caption id="attachment_media-18" align="aligncenter" width="2312"]![Screen Shot 2018-03-05 at 10.38.27.png](https://yellowchicken.files.wordpress.com/2018/02/screen-shot-2018-03-05-at-10-38-27.png) a build dashboard at goodle[/caption]

* * *

Designing a dashboard for concourse https://medium.com/concourse-ci/designing-a-dashboard-for-concourse-fe2e03248751

* * *

[caption id="attachment_1457" align="alignnone" width="2576"]![Screen Shot 2018-03-05 at 14.56.33.png](https://yellowchicken.files.wordpress.com/2018/02/screen-shot-2018-03-05-at-14-56-33.png) foot.it [via](https://medium.com/devs-foodit/pimp-my-jenkins-continuous-delivery-dashboard-edition-229463755730)[/caption]
