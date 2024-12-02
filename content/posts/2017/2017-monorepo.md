---
title: "Monorepo"
date: 2017-10-30T13:44:46+01:00
draft: false

tags: 
  - repos
---

In the company I am working, we are using a multirepo approach to organize our source code. Unfortunately, with a growing number of repos we ran into problems.

*   It became difficult to search for code, because you need all project checkout out and up to date
*   Our conservative way of sharing code lead to a lot of overhead to keep the other ends up to date
*   Therefore the inhibition threshold to change something increased because you wnt to avoid the overhead of creating all those branches with the new version reference
*   You never know (immediately) if an update of a dependency broke something on the integrating side, because you don't run their test suite. Moreover you are unaware of where the dependency might be used
*   You don't know if a change in a dependency broke something on the integrating side
*   We constantly collect technical depts, because we don't update every dependency reference immediately

Here is a video from google, where they explain their motivation for using a monorepo. https://www.youtube.com/watch?v=W71BTkUbdqE

## Facts on multi-repo

*   strong ownership
*   fast builds
*   separation
*   isolated master breakage
*   code silos for architecture, best practices
*   intransparency
*   overhead
*   dependency hell
*   functionality duplication
*   team boundaries/ownership is usually defined per repo
*   changes in base libraries are propagated on demand (pull)
*   integration of breaking changes are visible once the integrating side demands the new version and builds

## Pro monorepo

*   simple code sharing (can become a problem)
*   large scale refactoring are easy
*   atomic changes
*   collaboration among teams
*   flexible team boundaries, owners are defined per branch in the tree structure
*   simplified dependency management
*   changes in base libraries are instantly propagated (push)
*   integration of breaking changes are instantly visible
*   code base modernization works without overhead

## Contra monorepo

*   simple code sharing: adding dependencies has to be controlled
*   long build times
*   broken master
*   IDE lag
*   Investment on code health: Remove dead code, unused APIs, get support for large-scale cleanups

Facebook on monorepos

"_We could have spent a lot of time making it more modular in a way that would be friendly to a source control tool, but there are a number of benefits to using a single repository. Even at our current scale, we often make large changes throughout our code base, and having a single repository is useful for continuous modernization. Splitting it up would make large, atomic refactorings more difficult._"

## Challenges

*   multiple inheritance with conflicting versions. Refusing to update a dependency creates this d[iamond deps. problem](https://www.youtube.com/watch?time_continue=1226&v=W71BTkUbdqE) and builds up technical dept. So it makes a lot sense that all dependencies are always upgraded.![Screen Shot 2017-10-31 at 15.17.05](https://yellowchicken.files.wordpress.com/2017/10/screen-shot-2017-10-31-at-15-17-05.png)
*   A monorepo will require a build system that respects its nature
*   All JavaScript projects (may) share the same node_modules, because they have to use the same versions

Sources:

*   [Uber Technology Day: Monorepo to Multirepo and Back Again](https://www.youtube.com/watch?v=lV8-1S28ycM)
*   [Monorepos vs Manyrepos](https://speakerdeck.com/fabpot/a-monorepo-vs-manyrepos)
*   [Scaling Mercurial at Facebook](https://code.facebook.com/posts/218678814984400/scaling-mercurial-at-facebook/)
*   [Potential Structure of a monorepo](https://github.com/logiball/monorepo)
*   https://github.com/korfuri/awesome-monorepo
*   [We’ll Never Know Whether Monorepos Are Better](https://web.archive.org/web/20160419050154/https://www.ravelin.com/blog/2016/2/8/multi-to-monorepository)
*   [Multi- to monorepository Introduction](https://web.archive.org/web/20160419050154/https://www.ravelin.com/blog/2016/2/8/multi-to-monorepository)
*   [Tomono - helper to migrate multiple repos to a monorepo](https://github.com/unravelin/tomono)>
