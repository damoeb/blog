---
title: "Video Streaming in IE-11 using HTML5 "
date: 2016-09-13T09:20:58+01:00
draft: false

tags: 
  - ie11
  - video
---

IE11 can be bitchy. To enable real streaming and avoid progressive downloads, make sure your backend send the Accept-ranges header.
<pre class="code-java">&lt;header&gt;
  &lt;name&gt;Accept-Ranges&lt;/name&gt;
  &lt;value&gt;bytes&lt;/value&gt;
&lt;/header&gt;
```
<p class="code-java">For verification/testing purposes it is nice to have a simple backend. I used a nodejs module <a href="https://github.com/meloncholy/vid-streamer">vidstreamer</a> that supports pseudo streaming.</p>

<pre class="p1"><span>var http = require("http");</span>
<span>var vidStreamer = require("vid-streamer");</span>

<span>var config = {</span>
<span> "mode": "development",</span>
<span> "forceDownload": false,</span>
<span> "random": false,</span>
<span> "rootFolder": "/Users/bob/data/",</span>
<span> "rootPath": "",</span>
<span> "maxAge": "3600",</span>
<span> "throttle": false</span>
<span>}</span>

<span>var app = http.createServer(vidStreamer.settings(config));</span>
<span>app.listen(3000);</span>
<span>console.log("Listening on port 3000");</span>
```
