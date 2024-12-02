---
title: "Testing using protractor, lessons learned"
date: 2017-02-22T10:12:59+01:00
draft: false

tags: 
  - testing
  - protractor
---

*   A failing test should tell you what is wrong and not the area.
*   Abstract everything by using components. We reuse the component architecture of the webapp in the unit test and protractor tests. E.g. two pages with the same datpicker component will also use only only one datepicker protractor component.
*   protractor only returns promises This is annoying for debugging
*   use beforeAll to speed up tests. If possible try to use beforeAll instead of beforeEach.
*   Keep the element selectors used for the page/component abstractions in one place only, close to the business logic and also use them in the unit tests.
*   Run everything via ./node_modules (npm best pratice) > $ ./node_modules/protractor/bin/webdriver-manager start ```
*   Avoid expect statements, if possible, due to the strict behavior of selenium. Simply clicking on an element, that is not visible at the moment, will raise an exception.
