---
title: "Resize an image resource in CQ5 using Java"
date: 2013-02-06T14:53:00+01:00
draft: false
tags: 
  - cq5
---

I already posted the question on [stackoverflow](http://stackoverflow.com/questions/14726485/resize-an-image-resource-in-cq5), 
but since I am not allowed yet to post a solution, I'll post it here.  I found a quite low level approach, to resizes a 
image identified by **jcrPathToImage** to **int targetWidth** and **int targetHeight**.   

## Resize Image
```
Resource resource = getResourceResolver().getResource(jcrPathToImage); 
Asset asset = resource.adaptTo(Asset.class); 
Layer layer = new Layer(asset.getOriginal().getStream()) layer.resize(targetWidth, targetHeight); 
```  

## Create new rendition in JCR

Extract mime type of the original image
```
Image image = new Image(resource); String mimeType = image.getMimeType(); 
```

Store the resized Image using its asset representation.
```
ByteArrayOutputStream bout = null;
ByteArrayInputStream bin = null;
try {
  bout = new ByteArrayOutputStream(2048);
  layer.write(mimeType, 1, bout);
  bin = new ByteArrayInputStream(bout.toByteArray());
  asset.addRendition(resizedImgName, bin, mimeType);
} finally {
  // close streams ...
}
``` 
This may be useful to generate thumbnails.
