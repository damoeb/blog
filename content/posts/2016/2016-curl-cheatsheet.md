---
title: "Curl Cheatsheet"
date: 2016-07-27T09:23:35+01:00
draft: true

tags: 
  - 2016
  - curl
---

**PUT of a JSON with Cookie.**

```
curl --cookie "JSESSIONID=12345ascdef" -v -H 'Content-Type: application/json' -H 'Accept: application/json' -X PUT -d '[{"id":"description","readOnly":false,"value":"2"}]' http://sample-endpoint-1
```

**PUT of Form data with a Cookie**

```
curl --cookie "JSESSIONID=12345ascdef" -v -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: application/json' -X PUT -d 'metadata=%5B%7B%22flavor%22%3A%22dublincore%2Fepisode%22%2C%22title%22%3A%22EVENTS.EVENTS.DETAILS.CATALOG.EPISODE%22%2C%22fields%22%3A%5B%7B%22id%22%3A%22title%22%2C%22readOnly%22%3Afalse%2C%22value%22%3A%22Schweizerische+Aussenpolitik+2%22%2C%22label%22%3A%22EVENTS.EVENTS.DETAILS.METADATA.TITLE%22%2C%22required%22%3Atrue%2C%22type%22%3A%22text%22%7D%5D%7D%5D' http://sample-endpoint-1</span>
```
