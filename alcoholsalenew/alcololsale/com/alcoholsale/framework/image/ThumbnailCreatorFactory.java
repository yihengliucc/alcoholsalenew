package com.alcoholsale.framework.image;

import java.io.IOException;
import java.io.IOException;

import com.alcoholsale.framework.image.impl.ImageMagickCreator;
import com.alcoholsale.framework.image.impl.JavaImageIOCreator;

public abstract class ThumbnailCreatorFactory {
	  public static String CREATORTYPE = "javaimageio";
	  
	  public static final IThumbnailCreator getCreator(String source, String target)
	  {
	    if (CREATORTYPE.equals("javaimageio")) {
	      return new JavaImageIOCreator(source, target);
	    }
	    if (CREATORTYPE.equals("imagemagick")) {
	      try
	      {
	        return new ImageMagickCreator(source, target);
	      }
	      catch (IOException e)
	      {
	        e.printStackTrace();
	      }
	    }
	    return new JavaImageIOCreator(source, target);
	  }
}
