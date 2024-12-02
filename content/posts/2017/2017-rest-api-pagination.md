---
title: "REST API pagination, the header approach"
date: 2017-03-05T18:00:05+01:00
draft: false

tags: 
  - rest
---
Use headers instead of bloated jsons.

    HTTP/1.1 200
    X-Pagination-Count: 100
    X-Pagination-Page: 5
    X-Pagination-Limit: 20
    Content-Type: application/json
