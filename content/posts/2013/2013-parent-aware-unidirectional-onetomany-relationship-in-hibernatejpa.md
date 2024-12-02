---
title: "Parent-aware unidirectional @OneToMany relationship in Hibernate/JPA"
date: 2013-04-15T07:26:00+01:00
draft: false
tags: 
  - java
  - jpa
  - 2013
---

In a classical unidirectional one-to-many relation, the referred entity (Call) is not aware of its parent (Bill).   
```
public class Bill {
  (...)     
  @OneToMany( fetch = FetchType.LAZY, cascade = CascadeType.ALL)
  <b>@JoinColumn</b>(name = "billId")
  private Set calls;  
  (...) 
} 
``` 

Though, there may be some cases, where it is reasonable to make the information of the relation also available in the 
child entity (again, Call), e.g. if you want to retrieve all Calls of a specific Bill. An easy way to achieve that, 
is to explicetily add a @JoinColumn to the child entity. This column is completely managed by JPA/Hibernate, hence 
not modifieable.   
```
public class Call { 
  (...)     
  @Column( <b>insertable</b> = false, <b>updatable</b> = false )
  private Long billId;  
  (...) 
} 
``` 

This solution expects, that Id column of Bill is of type long.  Use <b>orphanRemoval=true</b>, to force removal of not 
associated childs.
