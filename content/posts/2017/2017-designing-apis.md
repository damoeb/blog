---
title: "How netflix designs APIs"
date: 2017-11-16T09:02:46+01:00
draft: false

tags: 
  - api
---

A really eye-opening talk by netflix how they designed their API and why did not follow the trends. Goals they followed:

*   one request delivers the entire data needed to render a page
*   no chatty clients
*   customers create the REST endpoints themselfes, netflix solely provides a groovy versioned sdk to aggregate data

See https://www.youtube.com/watch?v=StCrm572aEs
