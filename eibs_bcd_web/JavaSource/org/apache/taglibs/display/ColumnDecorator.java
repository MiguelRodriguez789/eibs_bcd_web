/**
 * $Id: ColumnDecorator.java,v 1.2 2017/05/26 22:13:23 ccastillo Exp $
 *
 * Status: Ok
 **/

package org.apache.taglibs.display;

public abstract class ColumnDecorator extends Decorator
{
   public ColumnDecorator()
   {
      super();
   }

   public abstract String decorate( Object columnValue );
}

