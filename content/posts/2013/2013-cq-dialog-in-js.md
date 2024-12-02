---
title: "CQ5 Dialog in Js"
date: 2013-02-06T13:55:00+01:00
draft: false
tags: 
  - cq5
---


CQ5 code exmaples are rare, so i will post some Javascript Code, that would have helped me a lot. CQ5 is shipped with 
[Ext JS](http://www.sencha.com/products/extjs).

See [API docs](http://dev.day.com/docs/en/cq/current/widgets-api/index.html?class=CQ.Dialog) for more options. 
```
var dialog = new CQ.Dialog({
'width': 600, 
'modal': true, 
'resize': false, 
'title': 'My Title', 
'items': {
  'xtype': 'tabpanel', 
  'items':
    [{
      'xtype': 'panel',
      'title': 'Basic',
      'hideMode': 'offsets',
      'items': [
        {
          'xtype': 'textfield', 
          'fieldLabel': CQ.I18n.get('app.components.some.key'),
        },
        //...
      ]
    }]
 },
'buttons': [
  {
    'text': 'Save', 
    'handler': function () {
         //...
    }
  }, 
  {
    'text': 'Cancel', 
    'handler': function () {
       this.close();
  }
 }]
}); 
```
