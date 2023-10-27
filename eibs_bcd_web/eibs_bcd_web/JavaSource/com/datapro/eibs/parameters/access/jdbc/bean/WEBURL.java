package com.datapro.eibs.parameters.access.jdbc.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class WEBURL {

   /**
    * The ID attribute.
   */
   protected java.lang.String ID = "";
   
   /**
    * Gets the ID value.
   */
   public java.lang.String getID() {
      return ID.trim();
   }
   
   /**
    * Sets the ID value.
   */
   public void setID(String ID) {
      this.ID = ID;
   }
   /**
    * The URL attribute.
   */
   protected java.lang.String URL = "";
   
   /**
    * Gets the URL value.
   */
   public java.lang.String getURL() {
      return URL.trim();
   }
   
   public String toString() {
      StringBuffer results = new StringBuffer();

      results.append(getClass().getName() + "\n");
      results.append("\tID=" + ID + "\n");
      results.append("\tURL=" + URL + "\n");

      return results.toString();
   }

}