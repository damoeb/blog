---
title: "Announcing RSS Proxy 1.0 - Automated Feed Generator"
date: 2021-01-03T12:00:12+01:00
draft: false
---

> *tl;dr*: [rss-proxy](https://github.com/damoeb/rss-proxy) transforms almost any website into a feed, just with one click.


RSS is the glue code for an open and free internet. It helps you build your own network of sources. Unfortunately some
websites don't support it at all or not in a way to fill your need. This is where rss-proxy comes to play. It is a simple
middleware that transforms HTML to a feed. The user will choose a suggested feed from a collection of feeds that exist
in a website of interest.

[![Screenshot v1](/rss-proxy-v1.png)](https://rssproxy-v1.migor.org)
Screenshot of rss-proxy. On the left you can see the management area, on the right the website with the highlighted articles
that the selected feed candidate will map into the feed.

# Motivation
I figured out that of any kind networks have a huge, huge value. Take states for example, they are basically just
social networks of humans interacting within a certain context, oboying to the rules of the network. Same goes for
news networks. When I learned that news and social media ar broken, I wanted to build my personal network of sources
that I own and control entirely. Source by source. I did not want any "smartness" in it, like recommender systems, cause they don't work
for me. One reason why they don't work is that you usually train one system per account. But what you usually want is
a recommender system per context and those times when you wander to the awkward sides of youtube - as an example - I
don't want them at all to be used.

Despite the fact that rss generation is a niche, it is a rather crowded niche (see [#appendix](appendix)). There are a ton of solutions for this problem,
which all chose the same approach: the user has to define the selectors for the particluar feed-entry fields. This is
a tedious and complex activity, especially if the website changes frequently. I don't like this approach.

[rss-proxy](https://github.com/damoeb/rss-proxy) tries to resolve feed mapping in an automatic manner, which leads to a more general feed, though finding and fixing
 a broken [rss-proxy](https://github.com/damoeb/rss-proxy) feed becomes trivial. A feed generator should solve the hardest problem in a good way: Getting updates
 of a website and point to the right link. Then the heavy lifting like full-feeds should be outsourced to other special services
 or the feed reader.


# Birth of rss-proxy
When you want to go extreme with RSS, you will soon learn that there ist no feed for that fragment of a website you are
interested in. I wanted a tool, that can turn a messy website into a standardized format that I can use to post-process.
Hence, 8 month ago, I started developing [rss-proxy](https://github.com/damoeb/rss-proxy), that should just analyze the HTML DOM structure and convert that
potentially into a feed. I did not want to mess around with selectors (which is the general approach), cause I expect websites to
change frequently, so I don't want to invest time into that.

I had the following design goals in mind:
- Dead simple UX
- Works with a wide range of DOMs
- Stateless
- Cheap to define
- Error handling
- Support JavaScript-generated sites


I wanted [rss-proxy](https://github.com/damoeb/rss-proxy) to support a wide variety of DOMs, so I was observing the HN community and the RSS subreddit for
people who want requested a feed of specific site. Here is my list:

- https://heise.de
- https://heise.de/tp
- https://developers.googleblog.com/
- http://blog.spencermounta.in/
- https://bookmarks.kovah.de/guest/links
- https://www.brandonsmith.ninja/
- https://jon.bo/posts/
- https://arzg.github.io/lang/
- https://bulletin.nu/
- https://demo.linkace.org/guest/links
- https://blog.substack.com/
- https://hystoria.100millionbooks.org/
- https://www.slowernews.com/
- https://lukesmith.xyz/
- https://sandiego.craigslist.org/search/lab
- https://www.vlive.tv/channel/FD53B/board/69
- https://arxiv.org/list/math.GN/recent

I added a JavaScript option, to trigger a pre-rendering in a headless chrome. Unfortunately this leads to 10x longer response times. 

## What's next
Both deployments POC and v1 are under heavy load, so I conclude there is quite some interest. I want to deploy an
instance that supports JavaScript pre-rendering, though due to its CPU-intensity, I need a mechanism to throttle
the request in combination with an API key for that feature. Moreover, I think, API keys can act as a lever, so users
will engage more with existing and planned features.

v1 still has some weaknesses, see [issues with v1](https://github.com/damoeb/rss-proxy/issues/16). There are some sites,
that just fail with [rss-proxy](https://github.com/damoeb/rss-proxy). I want to support as many of those weird sites as possible, cause they might bring-up some
flaws with the algorithm. 

## Appendix
Here is an incomplete list of feed generators I found.
- [rss bridge](https://github.com/RSS-Bridge/rss-bridge)
- [rss box](https://rssbox.herokuapp.com/)
- [feed43.com](https://feed43.com/)
- [rss.app](https://rss.app/)
- [fetchrss.com](http://fetchrss.com/)
- [freerssgenerator.com](http://www.freerssgenerator.com/)
- [fivefilters](http://createfeed.fivefilters.org/index.php)

