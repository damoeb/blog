---
title: "End to End Testing - Before You Get Started"
date: 2019-01-23T16:52:59+01:00
draft: false 

tags: 
  - testing
---

A lot of articles have been written on the topic end-to-end testing. I won't cover the basics here. In this post I want
to draw your attention to some questions, you should answer before you start even looking for a framework. And.. start slow!

Here is my story: In my last job I inherited the task to write end-to-end tests, so it was somehow easy to get started. 
We were using protractor, angular was still hot in these days. We were doing functional tests in an end-to-end setup, 
test were written in a QA department and maintained by the engineering teams. The tests were executed once a day on a special environment. 
It was a complete disaster. We did everything wrong.

We started to partially mock away the back-end calls so we could run the tests without a backend in a headless browser. 
We integrated the tests in the CI pipeline to reduce feedback times by a magnitude. The execution still took quite long, 
cause we ran the same tests on several browsers using browserstack.

Later I started to experiment with screenshot tests. Its really fun to work with them, cause you immediately know, whats 
wrong.

--

There is a lot you can do wrong, believe me. Its an engineering project itself to setup a proper end-to-end framework, so 
keep reading my thoughts, maybe you are actually looking for something else than end-to-end testing.

# What could be tested?
By definition of the term, if you take it literally, covers all layers, therefore the number of things you could check
is vast and cloudy too. Again, before you get started you should have a consensus in your team that what you test is 
what you want to test and end to end tests are a good way to achieve this. 

I will classify each case depending on what side of the app they are focusing on, into Front-End-Layer, Back-End-Layer or All-Layers

## Functionality
Given you respect the test automation piramid to some degree, they are not suitable for functional testing.
One reason why this is bad is that the cyclomatic complexity is too high, so you would need to write an insane
amount of tests to cover all cases.

(All-Focus)

## Service Availability

They are also not suitable to test service availability - a database -, there are monitoring tools that check
that and you might want to check the availability constantly not during one isolated test run.

(Back-End-Layer)

## Browser Compatibility

Many testing frameworks run on top of selenium. Selenium is an abstraction layer to interact with browsers in a way a 
user would do. Therefore the API may feel a bit limiting, but this is as it is.
The problem now is, that it is quite easy to run your test suite on different browsers and it might be tempted to test
if your app is looking smooth in those browsers that are most relevant for your user base.

One issue is that your app will perform differently in every browser engine, slightly but still enough to give you false 
positives. Second issue is that selenium client behave differently, giving you potential flacky tests.

(Front-End-Layer)


## Browser Performance

Performance can be evaluated truly everywhere, I mention it cause for browser performance testing with the release of 
selenium independend Chrome automation called puppeteer, you even have access to metrics like rendering performance and 
many more.

(All-Layers)

## Error Resilience

One problem on real end-to-end tests is the fragility. They will fail for many different reasons, which is usually something
you never want in testing. You have to balance the test execution speed and robustness against timing issues. For this reason
I was never a friend of real end-to-end tests. 
This fragility might not be an issue, but a feature. When you test error resilience, it makes test that your app is able
to recover from error cases. 

(All-Layers)

## User Interface
If you want to the the browser-based user interface and nothing else, there reside many helpful tools under the 
end-to-end-testing label. To keep the complexity under control, you should mock as much as possible. Unfortunately this
opens the can of mock maintenance.

(Front-End-Layer)


# What does a failing test tell you?
Ideally, a test failure should implicitly tell you whats wrong. No need to debug. Hence, unit-tests should only evaluate one 
expectation. With increasing complexity a test covers, this gets harder, until its out of control.

Its important, that if you have to debug to get to the source of the problem, developers will get unhappy with it. Test-Feedback
should be fast and accurate.

# Who writes the tests?
Some time ago, BDD got quite some attention. Cucumbers - a BDD framework - goal was, 
to have a non-technical, human readable language called Gherkin to write test cases. Even managers and customers should be 
able to write acceptance tests or at least the developer can extract test cases directly from the user story.

IMO this does not really work and misses the point. Those who write the tests should be those who maintain them, because 
you learn a lot while maintaining. The maintainer can only be the developer, they change the code, break a test and fix 
it immediately. The abstraction to bring in other parties writing tests does not bring any long-term advantage.

# Who and when runs the tests?
Tests should run always and immediately, although there may be trade-offs. For an immediate feedback the most significant
tests should be executed. Significant tests are those that are likely to fail for a good reason. Delayed execution is 
very frustrating, cause the developer considers the piece of code to be done and continues with other tasks. If you skip 
tests selectively you build up technical debt. Test that do not serve a purpose should be deleted.

# How long can you wait to get test results?
The immediate feedback should be super fast, below 5 min, like going for a coffee. Including compilation.

