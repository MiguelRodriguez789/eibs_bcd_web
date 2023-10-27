package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDP072401 physical file definition.
* 
* File level identifier is 1130611113112.
* Record format level identifier is 464EC2A03C653.
*/

public class EDP072401Message extends MessageRecord
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
                                     "E01CNTLAN",
                                     "E01DPANPR",
                                     "E01DPACUN",
                                     "E01DPAM21",
                                     "E01DPAM22",
                                     "E01DPAM23",
                                     "E01DPAM24",
                                     "E01DPAM25",
                                     "E01DPAM26",
                                     "E01DPAM27",
                                     "E01DPAM28",
                                     "E01DPATIP",
                                     "E01OPECDE"
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
                                   "E01CNTLAN",
                                   "E01DPANPR",
                                   "E01DPACUN",
                                   "E01DPAM21",
                                   "E01DPAM22",
                                   "E01DPAM23",
                                   "E01DPAM24",
                                   "E01DPAM25",
                                   "E01DPAM26",
                                   "E01DPAM27",
                                   "E01DPAM28",
                                   "E01DPATIP",
                                   "E01OPECDE"
                                 };
  final static String fid = "1130611113112";
  final static String rid = "464EC2A03C653";
  final static String fmtname = "EDP072401";
  final int FIELDCOUNT = 22;
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
  private CharacterField fieldE01CNTLAN = null;
  private DecimalField fieldE01DPANPR = null;
  private DecimalField fieldE01DPACUN = null;
  private CharacterField fieldE01DPAM21 = null;
  private CharacterField fieldE01DPAM22 = null;
  private CharacterField fieldE01DPAM23 = null;
  private CharacterField fieldE01DPAM24 = null;
  private CharacterField fieldE01DPAM25 = null;
  private CharacterField fieldE01DPAM26 = null;
  private CharacterField fieldE01DPAM27 = null;
  private CharacterField fieldE01DPAM28 = null;
  private CharacterField fieldE01DPATIP = null;
  private CharacterField fieldE01OPECDE = null;

  /**
  * Constructor for EDP072401Message.
  */
  public EDP072401Message()
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
    recordsize = 4164;
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
    fields[9] = fieldE01CNTLAN =
    new CharacterField(message, HEADERSIZE + 42, 1, "E01CNTLAN");
    fields[10] = fieldE01DPANPR =
    new DecimalField(message, HEADERSIZE + 43, 13, 0, "E01DPANPR");
    fields[11] = fieldE01DPACUN =
    new DecimalField(message, HEADERSIZE + 56, 10, 0, "E01DPACUN");
    fields[12] = fieldE01DPAM21 =
    new CharacterField(message, HEADERSIZE + 66, 512, "E01DPAM21");
    fields[13] = fieldE01DPAM22 =
    new CharacterField(message, HEADERSIZE + 578, 512, "E01DPAM22");
    fields[14] = fieldE01DPAM23 =
    new CharacterField(message, HEADERSIZE + 1090, 512, "E01DPAM23");
    fields[15] = fieldE01DPAM24 =
    new CharacterField(message, HEADERSIZE + 1602, 512, "E01DPAM24");
    fields[16] = fieldE01DPAM25 =
    new CharacterField(message, HEADERSIZE + 2114, 512, "E01DPAM25");
    fields[17] = fieldE01DPAM26 =
    new CharacterField(message, HEADERSIZE + 2626, 512, "E01DPAM26");
    fields[18] = fieldE01DPAM27 =
    new CharacterField(message, HEADERSIZE + 3138, 512, "E01DPAM27");
    fields[19] = fieldE01DPAM28 =
    new CharacterField(message, HEADERSIZE + 3650, 512, "E01DPAM28");
    fields[20] = fieldE01DPATIP =
    new CharacterField(message, HEADERSIZE + 4162, 1, "E01DPATIP");
    fields[21] = fieldE01OPECDE =
    new CharacterField(message, HEADERSIZE + 4163, 1, "E01OPECDE");

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
  * Set field E01CNTLAN using a String value.
  */
  public void setE01CNTLAN(String newvalue)
  {
    fieldE01CNTLAN.setString(newvalue);
  }

  /**
  * Get value of field E01CNTLAN as a String.
  */
  public String getE01CNTLAN()
  {
    return fieldE01CNTLAN.getString();
  }

  /**
  * Set field E01DPANPR using a String value.
  */
  public void setE01DPANPR(String newvalue)
  {
    fieldE01DPANPR.setString(newvalue);
  }

  /**
  * Get value of field E01DPANPR as a String.
  */
  public String getE01DPANPR()
  {
    return fieldE01DPANPR.getString();
  }

  /**
  * Set numeric field E01DPANPR using a BigDecimal value.
  */
  public void setE01DPANPR(BigDecimal newvalue)
  {
    fieldE01DPANPR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DPANPR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DPANPR()
  {
    return fieldE01DPANPR.getBigDecimal();
  }

  /**
  * Set field E01DPACUN using a String value.
  */
  public void setE01DPACUN(String newvalue)
  {
    fieldE01DPACUN.setString(newvalue);
  }

  /**
  * Get value of field E01DPACUN as a String.
  */
  public String getE01DPACUN()
  {
    return fieldE01DPACUN.getString();
  }

  /**
  * Set numeric field E01DPACUN using a BigDecimal value.
  */
  public void setE01DPACUN(BigDecimal newvalue)
  {
    fieldE01DPACUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DPACUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DPACUN()
  {
    return fieldE01DPACUN.getBigDecimal();
  }

  /**
  * Set field E01DPAM21 using a String value.
  */
  public void setE01DPAM21(String newvalue)
  {
    fieldE01DPAM21.setString(newvalue);
  }

  /**
  * Get value of field E01DPAM21 as a String.
  */
  public String getE01DPAM21()
  {
    return fieldE01DPAM21.getString();
  }

  /**
  * Set field E01DPAM22 using a String value.
  */
  public void setE01DPAM22(String newvalue)
  {
    fieldE01DPAM22.setString(newvalue);
  }

  /**
  * Get value of field E01DPAM22 as a String.
  */
  public String getE01DPAM22()
  {
    return fieldE01DPAM22.getString();
  }

  /**
  * Set field E01DPAM23 using a String value.
  */
  public void setE01DPAM23(String newvalue)
  {
    fieldE01DPAM23.setString(newvalue);
  }

  /**
  * Get value of field E01DPAM23 as a String.
  */
  public String getE01DPAM23()
  {
    return fieldE01DPAM23.getString();
  }

  /**
  * Set field E01DPAM24 using a String value.
  */
  public void setE01DPAM24(String newvalue)
  {
    fieldE01DPAM24.setString(newvalue);
  }

  /**
  * Get value of field E01DPAM24 as a String.
  */
  public String getE01DPAM24()
  {
    return fieldE01DPAM24.getString();
  }

  /**
  * Set field E01DPAM25 using a String value.
  */
  public void setE01DPAM25(String newvalue)
  {
    fieldE01DPAM25.setString(newvalue);
  }

  /**
  * Get value of field E01DPAM25 as a String.
  */
  public String getE01DPAM25()
  {
    return fieldE01DPAM25.getString();
  }

  /**
  * Set field E01DPAM26 using a String value.
  */
  public void setE01DPAM26(String newvalue)
  {
    fieldE01DPAM26.setString(newvalue);
  }

  /**
  * Get value of field E01DPAM26 as a String.
  */
  public String getE01DPAM26()
  {
    return fieldE01DPAM26.getString();
  }

  /**
  * Set field E01DPAM27 using a String value.
  */
  public void setE01DPAM27(String newvalue)
  {
    fieldE01DPAM27.setString(newvalue);
  }

  /**
  * Get value of field E01DPAM27 as a String.
  */
  public String getE01DPAM27()
  {
    return fieldE01DPAM27.getString();
  }

  /**
  * Set field E01DPAM28 using a String value.
  */
  public void setE01DPAM28(String newvalue)
  {
    fieldE01DPAM28.setString(newvalue);
  }

  /**
  * Get value of field E01DPAM28 as a String.
  */
  public String getE01DPAM28()
  {
    return fieldE01DPAM28.getString();
  }

  /**
  * Set field E01DPATIP using a String value.
  */
  public void setE01DPATIP(String newvalue)
  {
    fieldE01DPATIP.setString(newvalue);
  }

  /**
  * Get value of field E01DPATIP as a String.
  */
  public String getE01DPATIP()
  {
    return fieldE01DPATIP.getString();
  }

  /**
  * Set field E01OPECDE using a String value.
  */
  public void setE01OPECDE(String newvalue)
  {
    fieldE01OPECDE.setString(newvalue);
  }

  /**
  * Get value of field E01OPECDE as a String.
  */
  public String getE01OPECDE()
  {
    return fieldE01OPECDE.getString();
  }

}
