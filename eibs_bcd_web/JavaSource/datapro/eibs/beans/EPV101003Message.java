package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EPV101003 physical file definition.
* 
* File level identifier is 1130611113305.
* Record format level identifier is 4A957CD0ED4DA.
*/

public class EPV101003Message extends MessageRecord
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
                                     "E03PVMNUM",
                                     "E03PVMCUN",
                                     "E03PLTYPE",
                                     "E03PLDESC",
                                     "E03PLAMOU"
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
                                   "E03PVMNUM",
                                   "E03PVMCUN",
                                   "E03PLTYPE",
                                   "E03PLDESC",
                                   "E03PLAMOU"
                                 };
  final static String fid = "1130611113305";
  final static String rid = "4A957CD0ED4DA";
  final static String fmtname = "EPV101003";
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
  private DecimalField fieldE03PVMNUM = null;
  private DecimalField fieldE03PVMCUN = null;
  private CharacterField fieldE03PLTYPE = null;
  private CharacterField fieldE03PLDESC = null;
  private DecimalField fieldE03PLAMOU = null;

  /**
  * Constructor for EPV101003Message.
  */
  public EPV101003Message()
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
    recordsize = 128;
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
    fields[9] = fieldE03PVMNUM =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E03PVMNUM");
    fields[10] = fieldE03PVMCUN =
    new DecimalField(message, HEADERSIZE + 55, 10, 0, "E03PVMCUN");
    fields[11] = fieldE03PLTYPE =
    new CharacterField(message, HEADERSIZE + 65, 1, "E03PLTYPE");
    fields[12] = fieldE03PLDESC =
    new CharacterField(message, HEADERSIZE + 66, 45, "E03PLDESC");
    fields[13] = fieldE03PLAMOU =
    new DecimalField(message, HEADERSIZE + 111, 17, 2, "E03PLAMOU");

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
  * Set field E03PVMNUM using a String value.
  */
  public void setE03PVMNUM(String newvalue)
  {
    fieldE03PVMNUM.setString(newvalue);
  }

  /**
  * Get value of field E03PVMNUM as a String.
  */
  public String getE03PVMNUM()
  {
    return fieldE03PVMNUM.getString();
  }

  /**
  * Set numeric field E03PVMNUM using a BigDecimal value.
  */
  public void setE03PVMNUM(BigDecimal newvalue)
  {
    fieldE03PVMNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03PVMNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03PVMNUM()
  {
    return fieldE03PVMNUM.getBigDecimal();
  }

  /**
  * Set field E03PVMCUN using a String value.
  */
  public void setE03PVMCUN(String newvalue)
  {
    fieldE03PVMCUN.setString(newvalue);
  }

  /**
  * Get value of field E03PVMCUN as a String.
  */
  public String getE03PVMCUN()
  {
    return fieldE03PVMCUN.getString();
  }

  /**
  * Set numeric field E03PVMCUN using a BigDecimal value.
  */
  public void setE03PVMCUN(BigDecimal newvalue)
  {
    fieldE03PVMCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03PVMCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03PVMCUN()
  {
    return fieldE03PVMCUN.getBigDecimal();
  }

  /**
  * Set field E03PLTYPE using a String value.
  */
  public void setE03PLTYPE(String newvalue)
  {
    fieldE03PLTYPE.setString(newvalue);
  }

  /**
  * Get value of field E03PLTYPE as a String.
  */
  public String getE03PLTYPE()
  {
    return fieldE03PLTYPE.getString();
  }

  /**
  * Set field E03PLDESC using a String value.
  */
  public void setE03PLDESC(String newvalue)
  {
    fieldE03PLDESC.setString(newvalue);
  }

  /**
  * Get value of field E03PLDESC as a String.
  */
  public String getE03PLDESC()
  {
    return fieldE03PLDESC.getString();
  }

  /**
  * Set field E03PLAMOU using a String value.
  */
  public void setE03PLAMOU(String newvalue)
  {
    fieldE03PLAMOU.setString(newvalue);
  }

  /**
  * Get value of field E03PLAMOU as a String.
  */
  public String getE03PLAMOU()
  {
    return fieldE03PLAMOU.getString();
  }

  /**
  * Set numeric field E03PLAMOU using a BigDecimal value.
  */
  public void setE03PLAMOU(BigDecimal newvalue)
  {
    fieldE03PLAMOU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03PLAMOU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03PLAMOU()
  {
    return fieldE03PLAMOU.getBigDecimal();
  }

}
