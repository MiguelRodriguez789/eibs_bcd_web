package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESD038001 physical file definition.
* 
* File level identifier is 1161017163716.
* Record format level identifier is 35F0480586580.
*/

public class ESD038001Message extends MessageRecord
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
                                     "E01SELLAN",
                                     "E01CNOTCN",
                                     "E01CNODCN",
                                     "E01CNOSCR",
                                     "E01CNOFLD",
                                     "E01CNOLAN",
                                     "E01CNODRQ",
                                     "E01NUMREC",
                                     "E01CNOOPE"
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
                                   "E01SELLAN",
                                   "E01CNOTCN",
                                   "E01CNODCN",
                                   "E01CNOSCR",
                                   "E01CNOFLD",
                                   "E01CNOLAN",
                                   "E01CNODRQ",
                                   "E01NUMREC",
                                   "E01CNOOPE"
                                 };
  final static String fid = "1161017163716";
  final static String rid = "35F0480586580";
  final static String fmtname = "ESD038001";
  final int FIELDCOUNT = 18;
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
  private CharacterField fieldE01SELLAN = null;
  private CharacterField fieldE01CNOTCN = null;
  private CharacterField fieldE01CNODCN = null;
  private DecimalField fieldE01CNOSCR = null;
  private DecimalField fieldE01CNOFLD = null;
  private CharacterField fieldE01CNOLAN = null;
  private CharacterField fieldE01CNODRQ = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01CNOOPE = null;

  /**
  * Constructor for ESD038001Message.
  */
  public ESD038001Message()
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
    recordsize = 106;
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
    fields[9] = fieldE01SELLAN =
    new CharacterField(message, HEADERSIZE + 42, 1, "E01SELLAN");
    fields[10] = fieldE01CNOTCN =
    new CharacterField(message, HEADERSIZE + 43, 2, "E01CNOTCN");
    fields[11] = fieldE01CNODCN =
    new CharacterField(message, HEADERSIZE + 45, 45, "E01CNODCN");
    fields[12] = fieldE01CNOSCR =
    new DecimalField(message, HEADERSIZE + 90, 3, 0, "E01CNOSCR");
    fields[13] = fieldE01CNOFLD =
    new DecimalField(message, HEADERSIZE + 93, 2, 0, "E01CNOFLD");
    fields[14] = fieldE01CNOLAN =
    new CharacterField(message, HEADERSIZE + 95, 1, "E01CNOLAN");
    fields[15] = fieldE01CNODRQ =
    new CharacterField(message, HEADERSIZE + 96, 1, "E01CNODRQ");
    fields[16] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 97, 8, 0, "E01NUMREC");
    fields[17] = fieldE01CNOOPE =
    new CharacterField(message, HEADERSIZE + 105, 1, "E01CNOOPE");

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
  * Set field E01SELLAN using a String value.
  */
  public void setE01SELLAN(String newvalue)
  {
    fieldE01SELLAN.setString(newvalue);
  }

  /**
  * Get value of field E01SELLAN as a String.
  */
  public String getE01SELLAN()
  {
    return fieldE01SELLAN.getString();
  }

  /**
  * Set field E01CNOTCN using a String value.
  */
  public void setE01CNOTCN(String newvalue)
  {
    fieldE01CNOTCN.setString(newvalue);
  }

  /**
  * Get value of field E01CNOTCN as a String.
  */
  public String getE01CNOTCN()
  {
    return fieldE01CNOTCN.getString();
  }

  /**
  * Set field E01CNODCN using a String value.
  */
  public void setE01CNODCN(String newvalue)
  {
    fieldE01CNODCN.setString(newvalue);
  }

  /**
  * Get value of field E01CNODCN as a String.
  */
  public String getE01CNODCN()
  {
    return fieldE01CNODCN.getString();
  }

  /**
  * Set field E01CNOSCR using a String value.
  */
  public void setE01CNOSCR(String newvalue)
  {
    fieldE01CNOSCR.setString(newvalue);
  }

  /**
  * Get value of field E01CNOSCR as a String.
  */
  public String getE01CNOSCR()
  {
    return fieldE01CNOSCR.getString();
  }

  /**
  * Set numeric field E01CNOSCR using a BigDecimal value.
  */
  public void setE01CNOSCR(BigDecimal newvalue)
  {
    fieldE01CNOSCR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CNOSCR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CNOSCR()
  {
    return fieldE01CNOSCR.getBigDecimal();
  }

  /**
  * Set field E01CNOFLD using a String value.
  */
  public void setE01CNOFLD(String newvalue)
  {
    fieldE01CNOFLD.setString(newvalue);
  }

  /**
  * Get value of field E01CNOFLD as a String.
  */
  public String getE01CNOFLD()
  {
    return fieldE01CNOFLD.getString();
  }

  /**
  * Set numeric field E01CNOFLD using a BigDecimal value.
  */
  public void setE01CNOFLD(BigDecimal newvalue)
  {
    fieldE01CNOFLD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CNOFLD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CNOFLD()
  {
    return fieldE01CNOFLD.getBigDecimal();
  }

  /**
  * Set field E01CNOLAN using a String value.
  */
  public void setE01CNOLAN(String newvalue)
  {
    fieldE01CNOLAN.setString(newvalue);
  }

  /**
  * Get value of field E01CNOLAN as a String.
  */
  public String getE01CNOLAN()
  {
    return fieldE01CNOLAN.getString();
  }

  /**
  * Set field E01CNODRQ using a String value.
  */
  public void setE01CNODRQ(String newvalue)
  {
    fieldE01CNODRQ.setString(newvalue);
  }

  /**
  * Get value of field E01CNODRQ as a String.
  */
  public String getE01CNODRQ()
  {
    return fieldE01CNODRQ.getString();
  }

  /**
  * Set field E01NUMREC using a String value.
  */
  public void setE01NUMREC(String newvalue)
  {
    fieldE01NUMREC.setString(newvalue);
  }

  /**
  * Get value of field E01NUMREC as a String.
  */
  public String getE01NUMREC()
  {
    return fieldE01NUMREC.getString();
  }

  /**
  * Set numeric field E01NUMREC using a BigDecimal value.
  */
  public void setE01NUMREC(BigDecimal newvalue)
  {
    fieldE01NUMREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01NUMREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01NUMREC()
  {
    return fieldE01NUMREC.getBigDecimal();
  }

  /**
  * Set field E01CNOOPE using a String value.
  */
  public void setE01CNOOPE(String newvalue)
  {
    fieldE01CNOOPE.setString(newvalue);
  }

  /**
  * Get value of field E01CNOOPE as a String.
  */
  public String getE01CNOOPE()
  {
    return fieldE01CNOOPE.getString();
  }

}