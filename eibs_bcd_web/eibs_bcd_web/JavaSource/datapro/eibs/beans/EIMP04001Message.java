package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EIMP04001 physical file definition.
* 
* File level identifier is 1130611113212.
* Record format level identifier is 4F956AEFB8ED7.
*/

public class EIMP04001Message extends MessageRecord
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
                                     "E01IMIBNK",
                                     "E01IMICDE",
                                     "E01IMIORG",
                                     "E01IMIFRQ",
                                     "E01IMIRQR",
                                     "E01IMIPRT",
                                     "E01IMIPRE",
                                     "E01IMIDTP",
                                     "E01IMIRD1",
                                     "E01IMIRD2",
                                     "E01IMIRD3",
                                     "E01IMIUSR",
                                     "E01IMIFI1",
                                     "E01IMIFI2",
                                     "E01IMIDSC"
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
                                   "E01IMIBNK",
                                   "E01IMICDE",
                                   "E01IMIORG",
                                   "E01IMIFRQ",
                                   "E01IMIRQR",
                                   "E01IMIPRT",
                                   "E01IMIPRE",
                                   "E01IMIDTP",
                                   "E01IMIRD1",
                                   "E01IMIRD2",
                                   "E01IMIRD3",
                                   "E01IMIUSR",
                                   "E01IMIFI1",
                                   "E01IMIFI2",
                                   "E01IMIDSC"
                                 };
  final static String fid = "1130611113212";
  final static String rid = "4F956AEFB8ED7";
  final static String fmtname = "EIMP04001";
  final int FIELDCOUNT = 24;
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
  private CharacterField fieldE01IMIBNK = null;
  private CharacterField fieldE01IMICDE = null;
  private CharacterField fieldE01IMIORG = null;
  private CharacterField fieldE01IMIFRQ = null;
  private CharacterField fieldE01IMIRQR = null;
  private CharacterField fieldE01IMIPRT = null;
  private CharacterField fieldE01IMIPRE = null;
  private CharacterField fieldE01IMIDTP = null;
  private DecimalField fieldE01IMIRD1 = null;
  private DecimalField fieldE01IMIRD2 = null;
  private DecimalField fieldE01IMIRD3 = null;
  private CharacterField fieldE01IMIUSR = null;
  private CharacterField fieldE01IMIFI1 = null;
  private CharacterField fieldE01IMIFI2 = null;
  private CharacterField fieldE01IMIDSC = null;

  /**
  * Constructor for EIMP04001Message.
  */
  public EIMP04001Message()
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
    recordsize = 148;
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
    fields[9] = fieldE01IMIBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01IMIBNK");
    fields[10] = fieldE01IMICDE =
    new CharacterField(message, HEADERSIZE + 44, 4, "E01IMICDE");
    fields[11] = fieldE01IMIORG =
    new CharacterField(message, HEADERSIZE + 48, 8, "E01IMIORG");
    fields[12] = fieldE01IMIFRQ =
    new CharacterField(message, HEADERSIZE + 56, 1, "E01IMIFRQ");
    fields[13] = fieldE01IMIRQR =
    new CharacterField(message, HEADERSIZE + 57, 1, "E01IMIRQR");
    fields[14] = fieldE01IMIPRT =
    new CharacterField(message, HEADERSIZE + 58, 1, "E01IMIPRT");
    fields[15] = fieldE01IMIPRE =
    new CharacterField(message, HEADERSIZE + 59, 1, "E01IMIPRE");
    fields[16] = fieldE01IMIDTP =
    new CharacterField(message, HEADERSIZE + 60, 2, "E01IMIDTP");
    fields[17] = fieldE01IMIRD1 =
    new DecimalField(message, HEADERSIZE + 62, 3, 0, "E01IMIRD1");
    fields[18] = fieldE01IMIRD2 =
    new DecimalField(message, HEADERSIZE + 65, 3, 0, "E01IMIRD2");
    fields[19] = fieldE01IMIRD3 =
    new DecimalField(message, HEADERSIZE + 68, 5, 0, "E01IMIRD3");
    fields[20] = fieldE01IMIUSR =
    new CharacterField(message, HEADERSIZE + 73, 10, "E01IMIUSR");
    fields[21] = fieldE01IMIFI1 =
    new CharacterField(message, HEADERSIZE + 83, 10, "E01IMIFI1");
    fields[22] = fieldE01IMIFI2 =
    new CharacterField(message, HEADERSIZE + 93, 10, "E01IMIFI2");
    fields[23] = fieldE01IMIDSC =
    new CharacterField(message, HEADERSIZE + 103, 45, "E01IMIDSC");

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
  * Set field E01IMIBNK using a String value.
  */
  public void setE01IMIBNK(String newvalue)
  {
    fieldE01IMIBNK.setString(newvalue);
  }

  /**
  * Get value of field E01IMIBNK as a String.
  */
  public String getE01IMIBNK()
  {
    return fieldE01IMIBNK.getString();
  }

  /**
  * Set field E01IMICDE using a String value.
  */
  public void setE01IMICDE(String newvalue)
  {
    fieldE01IMICDE.setString(newvalue);
  }

  /**
  * Get value of field E01IMICDE as a String.
  */
  public String getE01IMICDE()
  {
    return fieldE01IMICDE.getString();
  }

  /**
  * Set field E01IMIORG using a String value.
  */
  public void setE01IMIORG(String newvalue)
  {
    fieldE01IMIORG.setString(newvalue);
  }

  /**
  * Get value of field E01IMIORG as a String.
  */
  public String getE01IMIORG()
  {
    return fieldE01IMIORG.getString();
  }

  /**
  * Set field E01IMIFRQ using a String value.
  */
  public void setE01IMIFRQ(String newvalue)
  {
    fieldE01IMIFRQ.setString(newvalue);
  }

  /**
  * Get value of field E01IMIFRQ as a String.
  */
  public String getE01IMIFRQ()
  {
    return fieldE01IMIFRQ.getString();
  }

  /**
  * Set field E01IMIRQR using a String value.
  */
  public void setE01IMIRQR(String newvalue)
  {
    fieldE01IMIRQR.setString(newvalue);
  }

  /**
  * Get value of field E01IMIRQR as a String.
  */
  public String getE01IMIRQR()
  {
    return fieldE01IMIRQR.getString();
  }

  /**
  * Set field E01IMIPRT using a String value.
  */
  public void setE01IMIPRT(String newvalue)
  {
    fieldE01IMIPRT.setString(newvalue);
  }

  /**
  * Get value of field E01IMIPRT as a String.
  */
  public String getE01IMIPRT()
  {
    return fieldE01IMIPRT.getString();
  }

  /**
  * Set field E01IMIPRE using a String value.
  */
  public void setE01IMIPRE(String newvalue)
  {
    fieldE01IMIPRE.setString(newvalue);
  }

  /**
  * Get value of field E01IMIPRE as a String.
  */
  public String getE01IMIPRE()
  {
    return fieldE01IMIPRE.getString();
  }

  /**
  * Set field E01IMIDTP using a String value.
  */
  public void setE01IMIDTP(String newvalue)
  {
    fieldE01IMIDTP.setString(newvalue);
  }

  /**
  * Get value of field E01IMIDTP as a String.
  */
  public String getE01IMIDTP()
  {
    return fieldE01IMIDTP.getString();
  }

  /**
  * Set field E01IMIRD1 using a String value.
  */
  public void setE01IMIRD1(String newvalue)
  {
    fieldE01IMIRD1.setString(newvalue);
  }

  /**
  * Get value of field E01IMIRD1 as a String.
  */
  public String getE01IMIRD1()
  {
    return fieldE01IMIRD1.getString();
  }

  /**
  * Set numeric field E01IMIRD1 using a BigDecimal value.
  */
  public void setE01IMIRD1(BigDecimal newvalue)
  {
    fieldE01IMIRD1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01IMIRD1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01IMIRD1()
  {
    return fieldE01IMIRD1.getBigDecimal();
  }

  /**
  * Set field E01IMIRD2 using a String value.
  */
  public void setE01IMIRD2(String newvalue)
  {
    fieldE01IMIRD2.setString(newvalue);
  }

  /**
  * Get value of field E01IMIRD2 as a String.
  */
  public String getE01IMIRD2()
  {
    return fieldE01IMIRD2.getString();
  }

  /**
  * Set numeric field E01IMIRD2 using a BigDecimal value.
  */
  public void setE01IMIRD2(BigDecimal newvalue)
  {
    fieldE01IMIRD2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01IMIRD2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01IMIRD2()
  {
    return fieldE01IMIRD2.getBigDecimal();
  }

  /**
  * Set field E01IMIRD3 using a String value.
  */
  public void setE01IMIRD3(String newvalue)
  {
    fieldE01IMIRD3.setString(newvalue);
  }

  /**
  * Get value of field E01IMIRD3 as a String.
  */
  public String getE01IMIRD3()
  {
    return fieldE01IMIRD3.getString();
  }

  /**
  * Set numeric field E01IMIRD3 using a BigDecimal value.
  */
  public void setE01IMIRD3(BigDecimal newvalue)
  {
    fieldE01IMIRD3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01IMIRD3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01IMIRD3()
  {
    return fieldE01IMIRD3.getBigDecimal();
  }

  /**
  * Set field E01IMIUSR using a String value.
  */
  public void setE01IMIUSR(String newvalue)
  {
    fieldE01IMIUSR.setString(newvalue);
  }

  /**
  * Get value of field E01IMIUSR as a String.
  */
  public String getE01IMIUSR()
  {
    return fieldE01IMIUSR.getString();
  }

  /**
  * Set field E01IMIFI1 using a String value.
  */
  public void setE01IMIFI1(String newvalue)
  {
    fieldE01IMIFI1.setString(newvalue);
  }

  /**
  * Get value of field E01IMIFI1 as a String.
  */
  public String getE01IMIFI1()
  {
    return fieldE01IMIFI1.getString();
  }

  /**
  * Set field E01IMIFI2 using a String value.
  */
  public void setE01IMIFI2(String newvalue)
  {
    fieldE01IMIFI2.setString(newvalue);
  }

  /**
  * Get value of field E01IMIFI2 as a String.
  */
  public String getE01IMIFI2()
  {
    return fieldE01IMIFI2.getString();
  }

  /**
  * Set field E01IMIDSC using a String value.
  */
  public void setE01IMIDSC(String newvalue)
  {
    fieldE01IMIDSC.setString(newvalue);
  }

  /**
  * Get value of field E01IMIDSC as a String.
  */
  public String getE01IMIDSC()
  {
    return fieldE01IMIDSC.getString();
  }

}
