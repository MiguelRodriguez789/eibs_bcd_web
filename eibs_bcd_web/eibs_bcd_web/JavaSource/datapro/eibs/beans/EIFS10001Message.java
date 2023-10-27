package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EIFS10001 physical file definition.
* 
* File level identifier is 1160502065533.
* Record format level identifier is 55EA1111B2F69.
*/

public class EIFS10001Message extends MessageRecord
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
                                     "E01DIREC",
                                     "E01FILE",
                                     "E01LENG",
                                     "E01SEQ",
                                     "E01DATA"
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
                                   "E01DIREC",
                                   "E01FILE",
                                   "E01LENG",
                                   "E01SEQ",
                                   "E01DATA"
                                 };
  final static String fid = "1160502065533";
  final static String rid = "55EA1111B2F69";
  final static String fmtname = "EIFS10001";
  final int FIELDCOUNT = 14;
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
  private CharacterField fieldE01DIREC = null;
  private CharacterField fieldE01FILE = null;
  private DecimalField fieldE01LENG = null;
  private DecimalField fieldE01SEQ = null;
  private CharacterField fieldE01DATA = null;

  /**
  * Constructor for EIFS10001Message.
  */
  public EIFS10001Message()
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
    recordsize = 4530;
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
    fields[9] = fieldE01DIREC =
    new CharacterField(message, HEADERSIZE + 42, 100, "E01DIREC");
    fields[10] = fieldE01FILE =
    new CharacterField(message, HEADERSIZE + 142, 270, "E01FILE");
    fields[11] = fieldE01LENG =
    new DecimalField(message, HEADERSIZE + 412, 16, 0, "E01LENG");
    fields[12] = fieldE01SEQ =
    new DecimalField(message, HEADERSIZE + 428, 6, 0, "E01SEQ");
    fields[13] = fieldE01DATA =
    new CharacterField(message, HEADERSIZE + 434, 4096, "E01DATA");

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
  * Set field E01DIREC using a String value.
  */
  public void setE01DIREC(String newvalue)
  {
    fieldE01DIREC.setString(newvalue);
  }

  /**
  * Get value of field E01DIREC as a String.
  */
  public String getE01DIREC()
  {
    return fieldE01DIREC.getString();
  }

  /**
  * Set field E01FILE using a String value.
  */
  public void setE01FILE(String newvalue)
  {
    fieldE01FILE.setString(newvalue);
  }

  /**
  * Get value of field E01FILE as a String.
  */
  public String getE01FILE()
  {
    return fieldE01FILE.getString();
  }

  /**
  * Set field E01LENG using a String value.
  */
  public void setE01LENG(String newvalue)
  {
    fieldE01LENG.setString(newvalue);
  }

  /**
  * Get value of field E01LENG as a String.
  */
  public String getE01LENG()
  {
    return fieldE01LENG.getString();
  }

  /**
  * Set numeric field E01LENG using a BigDecimal value.
  */
  public void setE01LENG(BigDecimal newvalue)
  {
    fieldE01LENG.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LENG as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LENG()
  {
    return fieldE01LENG.getBigDecimal();
  }

  /**
  * Set field E01SEQ using a String value.
  */
  public void setE01SEQ(String newvalue)
  {
    fieldE01SEQ.setString(newvalue);
  }

  /**
  * Get value of field E01SEQ as a String.
  */
  public String getE01SEQ()
  {
    return fieldE01SEQ.getString();
  }

  /**
  * Set numeric field E01SEQ using a BigDecimal value.
  */
  public void setE01SEQ(BigDecimal newvalue)
  {
    fieldE01SEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SEQ()
  {
    return fieldE01SEQ.getBigDecimal();
  }

  /**
  * Set field E01DATA using a String value.
  */
  public void setE01DATA(String newvalue)
  {
    fieldE01DATA.setString(newvalue);
  }

  /**
  * Get value of field E01DATA as a String.
  */
  public String getE01DATA()
  {
    return fieldE01DATA.getString();
  }

}