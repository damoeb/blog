---
title: "Format Specifier in JavaScript Console"
date: 2016-04-09T08:40:12+01:00
draft: false

tags: 
  - 2016
  - logging
---

Like in  printf, chrome JavaScript supports <a href="https://developer.chrome.com/devtools/docs/console-api#consolelogobject-object">format specifiers</a> to visually improve logging statements.
<table>
<thead>
<tr>
<th>Format Specifier</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>%s</code></td>
<td>Formats the value as a string.</td>
</tr>
<tr>
<td><code>%d</code> or <code>%i</code></td>
<td>Formats the value as an integer.</td>
</tr>
<tr>
<td><code>%f</code></td>
<td>Formats the value as a floating point value.</td>
</tr>
<tr>
<td><code>%o</code></td>
<td>Formats the value as an expandable DOM element (as in the Elements panel).</td>
</tr>
<tr>
<td><code>%O</code></td>
<td>Formats the value as an expandable JavaScript object.</td>
</tr>
<tr>
<td><code>%c</code></td>
<td>Formats the output string according to CSS styles you provide.</td>
</tr>
</tbody>
</table>
