package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESS003502 physical file definition.
* 
* File level identifier is 1130611113405.
* Record format level identifier is 2F474E5F54660.
*/

public class ESS003502Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "E02PWRWRD",
                                     "E02ERROR"
                                   };
  final static String tnames[] = {
                                   "E02PWRWRD",
                                   "E02ERROR"
                                 };
  final static String fid = "1130611113405";
  final static String rid = "2F474E5F54660";
  final static String fmtname = "ESS003502";
  final int FIELDCOUNT = 2;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldE02PWRWRD = null;
  private CharacterField fieldE02ERROR = null;

  /**
  * Constructor for ESS003502Message.
  */
  public ESS003502Message()
  {
    createFields();
    initialize();
  }

  /**
  * Create fields for this message.
  * This method implements the abstract method in the MessageRecord superclass.
  */
  protected void createFields()
  {
    recordsize = 11;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldE02PWRWRD =
    new CharacterField(message, HEADERSIZE + 0, 10, "E02PWRWRD");
    fields[1] = fieldE02ERROR =
    new CharacterField(message, HEADERSIZE + 10, 1, "E02ERROR");

    synchronized (tlookup)
    {
      if (tlookup.isEmpty())
      {
        for (int i = 0; i < tnames.length; i++)
          tlookup.put(tnames[i], new Integer(i));
      }
    }

    taglookup = tlookup;
  }

  /**
  * Set field E02PWRWRD using a String value.
  */
  public void setE02PWRWRD(String newvalue)
  {
    fieldE02PWRWRD.setString(newvalue);
  }

  /**
  * Get value of field E02PWRWRD as a String.
  */
  public String getE02PWRWRD()
  {
    return fieldE02PWRWRD.getString();
  }

  /**
  * Set field E02ERROR using a String value.
  */
  public void setE02ERROR(String newvalue)
  {
    fieldE02ERROR.setString(newvalue);
  }

  /**
  * Get value of field E02ERROR as a String.
  */
  public String getE02ERROR()
  {
    return fieldE02ERROR.getString();
  }

}