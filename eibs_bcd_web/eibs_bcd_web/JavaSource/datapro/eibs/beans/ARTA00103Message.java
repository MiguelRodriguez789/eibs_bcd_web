package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ARTA00103 physical file definition.
* 
* File level identifier is 1040520160406.
* Record format level identifier is 552DF21998B5F.
*/

public class ARTA00103Message extends MessageRecord
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
                                     "E03DEAACC",
                                     "E03RECTYP",
                                     "E03NUMCOM",
                                     "E03DSCCOM",
                                     "E03COMAMT",
                                     "E03PYMFRM"
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
                                   "E03DEAACC",
                                   "E03RECTYP",
                                   "E03NUMCOM",
                                   "E03DSCCOM",
                                   "E03COMAMT",
                                   "E03PYMFRM"
                                 };
  final static String fid = "1040520160406";
  final static String rid = "552DF21998B5F";
  final static String fmtname = "ARTA00103";
  final int FIELDCOUNT = 15;
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
  private DecimalField fieldE03DEAACC = null;
  private CharacterField fieldE03RECTYP = null;
  private CharacterField fieldE03NUMCOM = null;
  private CharacterField fieldE03DSCCOM = null;
  private DecimalField fieldE03COMAMT = null;
  private CharacterField fieldE03PYMFRM = null;

  /**
  * Constructor for ARTA00103Message.
  */
  public ARTA00103Message()
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
    recordsize = 108;
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
    fields[9] = fieldE03DEAACC =
    new DecimalField(message, HEADERSIZE + 42, 10, 0, "E03DEAACC");
    fields[10] = fieldE03RECTYP =
    new CharacterField(message, HEADERSIZE + 52, 1, "E03RECTYP");
    fields[11] = fieldE03NUMCOM =
    new CharacterField(message, HEADERSIZE + 53, 4, "E03NUMCOM");
    fields[12] = fieldE03DSCCOM =
    new CharacterField(message, HEADERSIZE + 57, 35, "E03DSCCOM");
    fields[13] = fieldE03COMAMT =
    new DecimalField(message, HEADERSIZE + 92, 15, 2, "E03COMAMT");
    fields[14] = fieldE03PYMFRM =
    new CharacterField(message, HEADERSIZE + 107, 1, "E03PYMFRM");

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
  * Set field E03DEAACC using a String value.
  */
  public void setE03DEAACC(String newvalue)
  {
    fieldE03DEAACC.setString(newvalue);
  }

  /**
  * Get value of field E03DEAACC as a String.
  */
  public String getE03DEAACC()
  {
    return fieldE03DEAACC.getString();
  }

  /**
  * Set numeric field E03DEAACC using a BigDecimal value.
  */
  public void setE03DEAACC(BigDecimal newvalue)
  {
    fieldE03DEAACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03DEAACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03DEAACC()
  {
    return fieldE03DEAACC.getBigDecimal();
  }

  /**
  * Set field E03RECTYP using a String value.
  */
  public void setE03RECTYP(String newvalue)
  {
    fieldE03RECTYP.setString(newvalue);
  }

  /**
  * Get value of field E03RECTYP as a String.
  */
  public String getE03RECTYP()
  {
    return fieldE03RECTYP.getString();
  }

  /**
  * Set field E03NUMCOM using a String value.
  */
  public void setE03NUMCOM(String newvalue)
  {
    fieldE03NUMCOM.setString(newvalue);
  }

  /**
  * Get value of field E03NUMCOM as a String.
  */
  public String getE03NUMCOM()
  {
    return fieldE03NUMCOM.getString();
  }

  /**
  * Set field E03DSCCOM using a String value.
  */
  public void setE03DSCCOM(String newvalue)
  {
    fieldE03DSCCOM.setString(newvalue);
  }

  /**
  * Get value of field E03DSCCOM as a String.
  */
  public String getE03DSCCOM()
  {
    return fieldE03DSCCOM.getString();
  }

  /**
  * Set field E03COMAMT using a String value.
  */
  public void setE03COMAMT(String newvalue)
  {
    fieldE03COMAMT.setString(newvalue);
  }

  /**
  * Get value of field E03COMAMT as a String.
  */
  public String getE03COMAMT()
  {
    return fieldE03COMAMT.getString();
  }

  /**
  * Set numeric field E03COMAMT using a BigDecimal value.
  */
  public void setE03COMAMT(BigDecimal newvalue)
  {
    fieldE03COMAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E03COMAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE03COMAMT()
  {
    return fieldE03COMAMT.getBigDecimal();
  }

  /**
  * Set field E03PYMFRM using a String value.
  */
  public void setE03PYMFRM(String newvalue)
  {
    fieldE03PYMFRM.setString(newvalue);
  }

  /**
  * Get value of field E03PYMFRM as a String.
  */
  public String getE03PYMFRM()
  {
    return fieldE03PYMFRM.getString();
  }

}
