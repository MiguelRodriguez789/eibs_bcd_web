package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ERA007903S physical file definition.
* 
* File level identifier is 1150507164914.
* Record format level identifier is 490151EB1FEB2.
*/

public class ERA007903SMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "H03USERID",
                                     "H03PROGRM",
                                     "H03TIMSYS",
                                     "H03SCRCOD",
                                     "H03OPECOD",
                                     "H03FLGMAS",
                                     "H03FLGWK1",
                                     "H03FLGWK2",
                                     "H03FLGWK3",
                                     "E03ROCCUN",
                                     "E03ROCIDN",
                                     "E03ROCRF3",
                                     "E03ROCCID",
                                     "E03ROCCNO"
                                   };
  final static String tnames[] = {
                                   "H03USERID",
                                   "H03PROGRM",
                                   "H03TIMSYS",
                                   "H03SCRCOD",
                                   "H03OPECOD",
                                   "H03FLGMAS",
                                   "H03FLGWK1",
                                   "H03FLGWK2",
                                   "H03FLGWK3",
                                   "E03ROCCUN",
                                   "E03ROCIDN",
                                   "E03ROCRF3",
                                   "E03ROCCID",
                                   "E03ROCCNO"
                                 };
  final static String fid = "1150507164914";
  final static String rid = "490151EB1FEB2";
  final static String fmtname = "ERA007903S";
  final int FIELDCOUNT = 14;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH03USERID = null;
  private CharacterField fieldH03PROGRM = null;
  private CharacterField fieldH03TIMSYS = null;
  private CharacterField fieldH03SCRCOD = null;
  private CharacterField fieldH03OPECOD = null;
  private CharacterField fieldH03FLGMAS = null;
  private CharacterField fieldH03FLGWK1 = null;
  private CharacterField fieldH03FLGWK2 = null;
  private CharacterField fieldH03FLGWK3 = null;
  private DecimalField fieldE03ROCCUN = null;
  private CharacterField fieldE03ROCIDN = null;
  private DecimalField fieldE03ROCRF3 = null;
  private CharacterField fieldE03ROCCID = null;
  private CharacterField fieldE03ROCCNO = null;

  /**
  * Constructor for ERA007903SMessage.
  */
  public ERA007903SMessage()
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
    recordsize = 206;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH03USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H03USERID");
    fields[1] = fieldH03PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H03PROGRM");
    fields[2] = fieldH03TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H03TIMSYS");
    fields[3] = fieldH03SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H03SCRCOD");
    fields[4] = fieldH03OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H03OPECOD");
    fields[5] = fieldH03FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H03FLGMAS");
    fields[6] = fieldH03FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H03FLGWK1");
    fields[7] = fieldH03FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H03FLGWK2");
    fields[8] = fieldH03FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H03FLGWK3");
    fields[9] = fieldE03ROCCUN =
    new DecimalField(message, HEADERSIZE + 42, 10, 0, "E03ROCCUN");
    fields[10] = fieldE03ROCIDN =
    new CharacterField(message, HEADERSIZE + 52, 25, "E03ROCIDN");
    fields[11] = fieldE03ROCRF3 =
    new DecimalField(message, HEADERSIZE + 77, 14, 0, "E03ROCRF3");
    fields[12] = fieldE03ROCCID =
    new CharacterField(message, HEADERSIZE + 91, 15, "E03ROCCID");
    fields[13] = fieldE03ROCCNO =
    new CharacterField(message, HEADERSIZE + 106, 100, "E03ROCCNO");

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
  * Set field H03USERID using a String value.
  */
  public void setH03USERID(String newvalue)
  {
    fieldH03USERID.setString(newvalue);
  }

  /**
  * Get value of field H03USERID as a String.
  */
  public String getH03USERID()
  {
    return fieldH03USERID.getString();
  }

  /**
  * Set field H03PROGRM using a String value.
  */
  public void setH03PROGRM(String newvalue)
  {
    fieldH03PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H03PROGRM as a String.
  */
  public String getH03PROGRM()
  {
    return fieldH03PROGRM.getString();
  }

  /**
  * Set field H03TIMSYS using a String value.
  */
  public void setH03TIMSYS(String newvalue)
  {
    fieldH03TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H03TIMSYS as a String.
  */
  public String getH03TIMSYS()
  {
    return fieldH03TIMSYS.getString();
  }

  /**
  * Set field H03SCRCOD using a String value.
  */
  public void setH03SCRCOD(String newvalue)
  {
    fieldH03SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H03SCRCOD as a String.
  */
  public String getH03SCRCOD()
  {
    return fieldH03SCRCOD.getString();
  }

  /**
  * Set field H03OPECOD using a String value.
  */
  public void setH03OPECOD(String newvalue)
  {
    fieldH03OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H03OPECOD as a String.
  */
  public String getH03OPECOD()
  {
    return fieldH03OPECOD.getString();
  }

  /**
  * Set field H03FLGMAS using a String value.
  */
  public void setH03FLGMAS(String newvalue)
  {
    fieldH03FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H03FLGMAS as a String.
  */
  public String getH03FLGMAS()
  {
    return fieldH03FLGMAS.getString();
  }

  /**
  * Set field H03FLGWK1 using a String value.
  */
  public void setH03FLGWK1(String newvalue)
  {
    fieldH03FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H03FLGWK1 as a String.
  */
  public String getH03FLGWK1()
  {
    return fieldH03FLGWK1.getString();
  }

  /**
  * Set field H03FLGWK2 using a String value.
  */
  public void setH03FLGWK2(String newvalue)
  {
    fieldH03FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H03FLGWK2 as a String.
  */
  public String getH03FLGWK2()
  {
    return fieldH03FLGWK2.getString();
  }

  /**
  * Set field H03FLGWK3 using a String value.
  */
  public void setH03FLGWK3(String newvalue)
  {
    fieldH03FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H03FLGWK3 as a String.
  */
  public String getH03FLGWK3()
  {
    return fieldH03FLGWK3.getString();
  }

  /**
  * Set field E03ROCCUN using a String value.
  */
  public void setE03ROCCUN(String newvalue)
  {
    fieldE03ROCCUN.setString(newvalue);
  }

  /**
  * Get value of field E03ROCCUN as a String.
  */
  public String getE03ROCCUN()
  {
    return fieldE03ROCCUN.getString();
  }

  /**
  * Set numeric field E03ROCCUN using a BigDecimal value.
  */
  public void setE03ROCCUN(BigDecimal newvalue)
  {
    fieldE03ROCCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03ROCCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03ROCCUN()
  {
    return fieldE03ROCCUN.getBigDecimal();
  }

  /**
  * Set field E03ROCIDN using a String value.
  */
  public void setE03ROCIDN(String newvalue)
  {
    fieldE03ROCIDN.setString(newvalue);
  }

  /**
  * Get value of field E03ROCIDN as a String.
  */
  public String getE03ROCIDN()
  {
    return fieldE03ROCIDN.getString();
  }

  /**
  * Set field E03ROCRF3 using a String value.
  */
  public void setE03ROCRF3(String newvalue)
  {
    fieldE03ROCRF3.setString(newvalue);
  }

  /**
  * Get value of field E03ROCRF3 as a String.
  */
  public String getE03ROCRF3()
  {
    return fieldE03ROCRF3.getString();
  }

  /**
  * Set numeric field E03ROCRF3 using a BigDecimal value.
  */
  public void setE03ROCRF3(BigDecimal newvalue)
  {
    fieldE03ROCRF3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03ROCRF3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03ROCRF3()
  {
    return fieldE03ROCRF3.getBigDecimal();
  }

  /**
  * Set field E03ROCCID using a String value.
  */
  public void setE03ROCCID(String newvalue)
  {
    fieldE03ROCCID.setString(newvalue);
  }

  /**
  * Get value of field E03ROCCID as a String.
  */
  public String getE03ROCCID()
  {
    return fieldE03ROCCID.getString();
  }

  /**
  * Set field E03ROCCNO using a String value.
  */
  public void setE03ROCCNO(String newvalue)
  {
    fieldE03ROCCNO.setString(newvalue);
  }

  /**
  * Get value of field E03ROCCNO as a String.
  */
  public String getE03ROCCNO()
  {
    return fieldE03ROCCNO.getString();
  }

}
