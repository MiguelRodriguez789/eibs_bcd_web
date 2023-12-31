package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ELN004001 physical file definition.
* 
* File level identifier is 1130611113238.
* Record format level identifier is 3CCCEB77A25A3.
*/

public class ELN004001Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H01USERID",
                                     "H01PROGRM",
                                     "H01TIMSYS",
                                     "H01SCRCOD",
                                     "H01OPECOD",
                                     "H01FLGMAS",
                                     "H01FLGWK1",
                                     "H01FLGWK2",
                                     "H01FLGWK3",
                                     "E01LNECUN",
                                     "E01LNENUM",
                                     "E01CUSNA1",
                                     "E01OPETYP",
                                     "E01LNEAPF",
                                     "E01LNECCY",
                                     "E01LNEAMN",
                                     "E01LNETYL",
                                     "E01LNECAT",
                                     "E01LNEACD"
                                   };
  final static String tnames[] = {
                                   "H01USERID",
                                   "H01PROGRM",
                                   "H01TIMSYS",
                                   "H01SCRCOD",
                                   "H01OPECOD",
                                   "H01FLGMAS",
                                   "H01FLGWK1",
                                   "H01FLGWK2",
                                   "H01FLGWK3",
                                   "E01LNECUN",
                                   "E01LNENUM",
                                   "E01CUSNA1",
                                   "E01OPETYP",
                                   "E01LNEAPF",
                                   "E01LNECCY",
                                   "E01LNEAMN",
                                   "E01LNETYL",
                                   "E01LNECAT",
                                   "E01LNEACD"
                                 };
  final static String fid = "1130611113238";
  final static String rid = "3CCCEB77A25A3";
  final static String fmtname = "ELN004001";
  final int FIELDCOUNT = 19;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH01USERID = null;
  private CharacterField fieldH01PROGRM = null;
  private CharacterField fieldH01TIMSYS = null;
  private CharacterField fieldH01SCRCOD = null;
  private CharacterField fieldH01OPECOD = null;
  private CharacterField fieldH01FLGMAS = null;
  private CharacterField fieldH01FLGWK1 = null;
  private CharacterField fieldH01FLGWK2 = null;
  private CharacterField fieldH01FLGWK3 = null;
  private DecimalField fieldE01LNECUN = null;
  private DecimalField fieldE01LNENUM = null;
  private CharacterField fieldE01CUSNA1 = null;
  private CharacterField fieldE01OPETYP = null;
  private CharacterField fieldE01LNEAPF = null;
  private CharacterField fieldE01LNECCY = null;
  private DecimalField fieldE01LNEAMN = null;
  private CharacterField fieldE01LNETYL = null;
  private CharacterField fieldE01LNECAT = null;
  private CharacterField fieldE01LNEACD = null;

  /**
  * Constructor for ELN004001Message.
  */
  public ELN004001Message()
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
    recordsize = 163;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH01USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H01USERID");
    fields[1] = fieldH01PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H01PROGRM");
    fields[2] = fieldH01TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H01TIMSYS");
    fields[3] = fieldH01SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H01SCRCOD");
    fields[4] = fieldH01OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H01OPECOD");
    fields[5] = fieldH01FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H01FLGMAS");
    fields[6] = fieldH01FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H01FLGWK1");
    fields[7] = fieldH01FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H01FLGWK2");
    fields[8] = fieldH01FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H01FLGWK3");
    fields[9] = fieldE01LNECUN =
    new DecimalField(message, HEADERSIZE + 42, 10, 0, "E01LNECUN");
    fields[10] = fieldE01LNENUM =
    new DecimalField(message, HEADERSIZE + 52, 5, 0, "E01LNENUM");
    fields[11] = fieldE01CUSNA1 =
    new CharacterField(message, HEADERSIZE + 57, 60, "E01CUSNA1");
    fields[12] = fieldE01OPETYP =
    new CharacterField(message, HEADERSIZE + 117, 18, "E01OPETYP");
    fields[13] = fieldE01LNEAPF =
    new CharacterField(message, HEADERSIZE + 135, 1, "E01LNEAPF");
    fields[14] = fieldE01LNECCY =
    new CharacterField(message, HEADERSIZE + 136, 3, "E01LNECCY");
    fields[15] = fieldE01LNEAMN =
    new DecimalField(message, HEADERSIZE + 139, 17, 2, "E01LNEAMN");
    fields[16] = fieldE01LNETYL =
    new CharacterField(message, HEADERSIZE + 156, 4, "E01LNETYL");
    fields[17] = fieldE01LNECAT =
    new CharacterField(message, HEADERSIZE + 160, 1, "E01LNECAT");
    fields[18] = fieldE01LNEACD =
    new CharacterField(message, HEADERSIZE + 161, 2, "E01LNEACD");

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
  * Set field H01USERID using a String value.
  */
  public void setH01USERID(String newvalue)
  {
    fieldH01USERID.setString(newvalue);
  }

  /**
  * Get value of field H01USERID as a String.
  */
  public String getH01USERID()
  {
    return fieldH01USERID.getString();
  }

  /**
  * Set field H01PROGRM using a String value.
  */
  public void setH01PROGRM(String newvalue)
  {
    fieldH01PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H01PROGRM as a String.
  */
  public String getH01PROGRM()
  {
    return fieldH01PROGRM.getString();
  }

  /**
  * Set field H01TIMSYS using a String value.
  */
  public void setH01TIMSYS(String newvalue)
  {
    fieldH01TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H01TIMSYS as a String.
  */
  public String getH01TIMSYS()
  {
    return fieldH01TIMSYS.getString();
  }

  /**
  * Set field H01SCRCOD using a String value.
  */
  public void setH01SCRCOD(String newvalue)
  {
    fieldH01SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H01SCRCOD as a String.
  */
  public String getH01SCRCOD()
  {
    return fieldH01SCRCOD.getString();
  }

  /**
  * Set field H01OPECOD using a String value.
  */
  public void setH01OPECOD(String newvalue)
  {
    fieldH01OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H01OPECOD as a String.
  */
  public String getH01OPECOD()
  {
    return fieldH01OPECOD.getString();
  }

  /**
  * Set field H01FLGMAS using a String value.
  */
  public void setH01FLGMAS(String newvalue)
  {
    fieldH01FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H01FLGMAS as a String.
  */
  public String getH01FLGMAS()
  {
    return fieldH01FLGMAS.getString();
  }

  /**
  * Set field H01FLGWK1 using a String value.
  */
  public void setH01FLGWK1(String newvalue)
  {
    fieldH01FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H01FLGWK1 as a String.
  */
  public String getH01FLGWK1()
  {
    return fieldH01FLGWK1.getString();
  }

  /**
  * Set field H01FLGWK2 using a String value.
  */
  public void setH01FLGWK2(String newvalue)
  {
    fieldH01FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H01FLGWK2 as a String.
  */
  public String getH01FLGWK2()
  {
    return fieldH01FLGWK2.getString();
  }

  /**
  * Set field H01FLGWK3 using a String value.
  */
  public void setH01FLGWK3(String newvalue)
  {
    fieldH01FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H01FLGWK3 as a String.
  */
  public String getH01FLGWK3()
  {
    return fieldH01FLGWK3.getString();
  }

  /**
  * Set field E01LNECUN using a String value.
  */
  public void setE01LNECUN(String newvalue)
  {
    fieldE01LNECUN.setString(newvalue);
  }

  /**
  * Get value of field E01LNECUN as a String.
  */
  public String getE01LNECUN()
  {
    return fieldE01LNECUN.getString();
  }

  /**
  * Set numeric field E01LNECUN using a BigDecimal value.
  */
  public void setE01LNECUN(BigDecimal newvalue)
  {
    fieldE01LNECUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LNECUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LNECUN()
  {
    return fieldE01LNECUN.getBigDecimal();
  }

  /**
  * Set field E01LNENUM using a String value.
  */
  public void setE01LNENUM(String newvalue)
  {
    fieldE01LNENUM.setString(newvalue);
  }

  /**
  * Get value of field E01LNENUM as a String.
  */
  public String getE01LNENUM()
  {
    return fieldE01LNENUM.getString();
  }

  /**
  * Set numeric field E01LNENUM using a BigDecimal value.
  */
  public void setE01LNENUM(BigDecimal newvalue)
  {
    fieldE01LNENUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LNENUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LNENUM()
  {
    return fieldE01LNENUM.getBigDecimal();
  }

  /**
  * Set field E01CUSNA1 using a String value.
  */
  public void setE01CUSNA1(String newvalue)
  {
    fieldE01CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E01CUSNA1 as a String.
  */
  public String getE01CUSNA1()
  {
    return fieldE01CUSNA1.getString();
  }

  /**
  * Set field E01OPETYP using a String value.
  */
  public void setE01OPETYP(String newvalue)
  {
    fieldE01OPETYP.setString(newvalue);
  }

  /**
  * Get value of field E01OPETYP as a String.
  */
  public String getE01OPETYP()
  {
    return fieldE01OPETYP.getString();
  }

  /**
  * Set field E01LNEAPF using a String value.
  */
  public void setE01LNEAPF(String newvalue)
  {
    fieldE01LNEAPF.setString(newvalue);
  }

  /**
  * Get value of field E01LNEAPF as a String.
  */
  public String getE01LNEAPF()
  {
    return fieldE01LNEAPF.getString();
  }

  /**
  * Set field E01LNECCY using a String value.
  */
  public void setE01LNECCY(String newvalue)
  {
    fieldE01LNECCY.setString(newvalue);
  }

  /**
  * Get value of field E01LNECCY as a String.
  */
  public String getE01LNECCY()
  {
    return fieldE01LNECCY.getString();
  }

  /**
  * Set field E01LNEAMN using a String value.
  */
  public void setE01LNEAMN(String newvalue)
  {
    fieldE01LNEAMN.setString(newvalue);
  }

  /**
  * Get value of field E01LNEAMN as a String.
  */
  public String getE01LNEAMN()
  {
    return fieldE01LNEAMN.getString();
  }

  /**
  * Set numeric field E01LNEAMN using a BigDecimal value.
  */
  public void setE01LNEAMN(BigDecimal newvalue)
  {
    fieldE01LNEAMN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LNEAMN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LNEAMN()
  {
    return fieldE01LNEAMN.getBigDecimal();
  }

  /**
  * Set field E01LNETYL using a String value.
  */
  public void setE01LNETYL(String newvalue)
  {
    fieldE01LNETYL.setString(newvalue);
  }

  /**
  * Get value of field E01LNETYL as a String.
  */
  public String getE01LNETYL()
  {
    return fieldE01LNETYL.getString();
  }

  /**
  * Set field E01LNECAT using a String value.
  */
  public void setE01LNECAT(String newvalue)
  {
    fieldE01LNECAT.setString(newvalue);
  }

  /**
  * Get value of field E01LNECAT as a String.
  */
  public String getE01LNECAT()
  {
    return fieldE01LNECAT.getString();
  }

  /**
  * Set field E01LNEACD using a String value.
  */
  public void setE01LNEACD(String newvalue)
  {
    fieldE01LNEACD.setString(newvalue);
  }

  /**
  * Get value of field E01LNEACD as a String.
  */
  public String getE01LNEACD()
  {
    return fieldE01LNEACD.getString();
  }

}
