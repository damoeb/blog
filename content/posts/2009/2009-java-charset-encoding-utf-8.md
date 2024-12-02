---
title: "Java Charset Encoding Utf 8"
date: 2009-04-24T09:25:00+01:00
draft: false
tags: 
  - java
---

One of the most annoying stuff you will definitely come accross is character encoding.
When you initialize a `String` with the default constructor, the JVM uses uses the `Charset.defaultCharset()` for the encoding. 

Anothor constructor allows you to specify any Charset, that is available on your box.

```
/*
s1 and s2 deliver the same results
*/
String s1 = new String("hello");
String s2 = new String("hello".getBytes(), Charset.defaultCharset());

// specific encoding, and yes you this Ã¼ char there with intent
String s3 = new String("grÃ¼n".getBytes(), "UTF-8");
```

## Conversion
Charsets have a limited set of characters, that have to be used to encode a, probably much larger amount of charaters. Therefore in **<a href="http://en.wikipedia.org/wiki/Utf_8">UTF-8</a> ** the Umlaut **ü** is encoded as **Ã¼**. In Java there are serveral ways to convert from one encoding to an other. Let's assume you have an UTF-8 encoded String with the value **'grÃ¼n'** (See the last line of listing 1). To get rid of those escaped charaters like **Ã¼** you have to encode it with p.e. <a href="http://en.wikipedia.org/wiki/ISO/IEC_8859-1">ISO-8859-1</a>.

```
System.out.println(new String ( s.getBytes("ISO-8859-1"), "UTF-8"));
```

As far as I know isn't there any method that can detect the encoding of a String. You can test if a String is UTF-8 encoded, which means, the String only contains characters, that are valid in UTF-8. So it is probably be a valid ISO-8859-* String too. 
