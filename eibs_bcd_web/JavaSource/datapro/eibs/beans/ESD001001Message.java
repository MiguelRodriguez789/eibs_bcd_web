package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESD001001 physical file definition.
* 
* File level identifier is 1130611113341.
* Record format level identifier is 39FB9F88FAD81.
*/

public class ESD001001Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H01USR",
                                     "H01PGM",
                                     "H01TIM",
                                     "H01SCR",
                                     "H01OPE",
                                     "H01MAS",
                                     "H01WK1",
                                     "H01WK2",
                                     "H01WK3",
                                     "E01NOF",
                                     "E01SWI",
                                     "E01CCY",
                                     "E01SIC",
                                     "E01ABC"
                                   };
  final static String tnames[] = {
                                   "H01USR",
                                   "H01PGM",
                                   "H01TIM",
                                   "H01SCR",
                                   "H01OPE",
                                   "H01MAS",
                                   "H01WK1",
                                   "H01WK2",
                                   "H01WK3",
                                   "E01NOF",
                                   "E01SWI",
                                   "E01CCY",
                                   "E01SIC",
                                   "E01ABC"
                                 };
  final static String fid = "1130611113341";
  final static String rid = "39FB9F88FAD81";
  final static String fmtname = "ESD001001";
  final int FIELDCOUNT = 14;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH01USR = null;
  private CharacterField fieldH01PGM = null;
  private CharacterField fieldH01TIM = null;
  private CharacterField fieldH01SCR = null;
  private CharacterField fieldH01OPE = null;
  private CharacterField fieldH01MAS = null;
  private CharacterField fieldH01WK1 = null;
  private CharacterField fieldH01WK2 = null;
  private CharacterField fieldH01WK3 = null;
  private CharacterField fieldE01NOF = null;
  private CharacterField fieldE01SWI = null;
  private CharacterField fieldE01CCY = null;
  private CharacterField fieldE01SIC = null;
  private CharacterField fieldE01ABC = null;

  /**
  * Constructor for ESD001001Message.
  */
  public ESD001001Message()
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
    recordsize = 121;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH01USR =
    new CharacterField(message, HEADERSIZE + 0, 10, "H01USR");
    fields[1] = fieldH01PGM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H01PGM");
    fields[2] = fieldH01TIM =
    new CharacterField(message, HEADERSIZE + 20, 12, "H01TIM");
    fields[3] = fieldH01SCR =
    new CharacterField(message, HEADERSIZE + 32, 2, "H01SCR");
    fields[4] = fieldH01OPE =
    new CharacterField(message, HEADERSIZE + 34, 4, "H01OPE");
    fields[5] = fieldH01MAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H01MAS");
    fields[6] = fieldH01WK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H01WK1");
    fields[7] = fieldH01WK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H01WK2");
    fields[8] = fieldH01WK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H01WK3");
    fields[9] = fieldE01NOF =
    new CharacterField(message, HEADERSIZE + 42, 1, "E01NOF");
    fields[10] = fieldE01SWI =
    new CharacterField(message, HEADERSIZE + 43, 25, "E01SWI");
    fields[11] = fieldE01CCY =
    new CharacterField(message, HEADERSIZE + 68, 3, "E01CCY");
    fields[12] = fieldE01SIC =
    new CharacterField(message, HEADERSIZE + 71, 25, "E01SIC");
    fields[13] = fieldE01ABC =
    new CharacterField(message, HEADERSIZE + 96, 25, "E01ABC");

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
  * Set field H01USR using a String value.
  */
  public void setH01USR(String newvalue)
  {
    fieldH01USR.setString(newvalue);
  }

  /**
  * Get value of field H01USR as a String.
  */
  public String getH01USR()
  {
    return fieldH01USR.getString();
  }

  /**
  * Set field H01PGM using a String value.
  */
  public void setH01PGM(String newvalue)
  {
    fieldH01PGM.setString(newvalue);
  }

  /**
  * Get value of field H01PGM as a String.
  */
  public String getH01PGM()
  {
    return fieldH01PGM.getString();
  }

  /**
  * Set field H01TIM using a String value.
  */
  public void setH01TIM(String newvalue)
  {
    fieldH01TIM.setString(newvalue);
  }

  /**
  * Get value of field H01TIM as a String.
  */
  public String getH01TIM()
  {
    return fieldH01TIM.getString();
  }

  /**
  * Set field H01SCR using a String value.
  */
  public void setH01SCR(String newvalue)
  {
    fieldH01SCR.setString(newvalue);
  }

  /**
  * Get value of field H01SCR as a String.
  */
  public String getH01SCR()
  {
    return fieldH01SCR.getString();
  }

  /**
  * Set field H01OPE using a String value.
  */
  public void setH01OPE(String newvalue)
  {
    fieldH01OPE.setString(newvalue);
  }

  /**
  * Get value of field H01OPE as a String.
  */
  public String getH01OPE()
  {
    return fieldH01OPE.getString();
  }

  /**
  * Set field H01MAS using a String value.
  */
  public void setH01MAS(String newvalue)
  {
    fieldH01MAS.setString(newvalue);
  }

  /**
  * Get value of field H01MAS as a String.
  */
  public String getH01MAS()
  {
    return fieldH01MAS.getString();
  }

  /**
  * Set field H01WK1 using a String value.
  */
  public void setH01WK1(String newvalue)
  {
    fieldH01WK1.setString(newvalue);
  }

  /**
  * Get value of field H01WK1 as a String.
  */
  public String getH01WK1()
  {
    return fieldH01WK1.getString();
  }

  /**
  * Set field H01WK2 using a String value.
  */
  public void setH01WK2(String newvalue)
  {
    fieldH01WK2.setString(newvalue);
  }

  /**
  * Get value of field H01WK2 as a String.
  */
  public String getH01WK2()
  {
    return fieldH01WK2.getString();
  }

  /**
  * Set field H01WK3 using a String value.
  */
  public void setH01WK3(String newvalue)
  {
    fieldH01WK3.setString(newvalue);
  }

  /**
  * Get value of field H01WK3 as a String.
  */
  public String getH01WK3()
  {
    return fieldH01WK3.getString();
  }

  /**
  * Set field E01NOF using a String value.
  */
  public void setE01NOF(String newvalue)
  {
    fieldE01NOF.setString(newvalue);
  }

  /**
  * Get value of field E01NOF as a String.
  */
  public String getE01NOF()
  {
    return fieldE01NOF.getString();
  }

  /**
  * Set field E01SWI using a String value.
  */
  public void setE01SWI(String newvalue)
  {
    fieldE01SWI.setString(newvalue);
  }

  /**
  * Get value of field E01SWI as a String.
  */
  public String getE01SWI()
  {
    return fieldE01SWI.getString();
  }

  /**
  * Set field E01CCY using a String value.
  */
  public void setE01CCY(String newvalue)
  {
    fieldE01CCY.setString(newvalue);
  }

  /**
  * Get value of field E01CCY as a String.
  */
  public String getE01CCY()
  {
    return fieldE01CCY.getString();
  }

  /**
  * Set field E01SIC using a String value.
  */
  public void setE01SIC(String newvalue)
  {
    fieldE01SIC.setString(newvalue);
  }

  /**
  * Get value of field E01SIC as a String.
  */
  public String getE01SIC()
  {
    return fieldE01SIC.getString();
  }

  /**
  * Set field E01ABC using a String value.
  */
  public void setE01ABC(String newvalue)
  {
    fieldE01ABC.setString(newvalue);
  }

  /**
  * Get value of field E01ABC as a String.
  */
  public String getE01ABC()
  {
    return fieldE01ABC.getString();
  }

}
