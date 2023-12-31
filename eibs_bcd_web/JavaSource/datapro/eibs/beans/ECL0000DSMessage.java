package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECL0000DS physical file definition.
* 
* File level identifier is 1130611112848.
* Record format level identifier is 3D8BFCE9610CD.
*/

public class ECL0000DSMessage extends MessageRecord
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
                                     "E01CCLIDT",
                                     "E01CCLIDN",
                                     "E01CCLPIN",
                                     "E01CCLNEW",
                                     "E01CCLCUN",
                                     "E01CCLTDD",
                                     "E01CCLTDC",
                                     "E01CCLNA1",
                                     "E01CCLAD1",
                                     "E01CCLAD2",
                                     "E01CCLCTY",
                                     "E01CCLZPC",
                                     "E01CCLCCS",
                                     "E01CCLCVD",
                                     "E01CCLCVC",
                                     "E01CCLBDM",
                                     "E01CCLBDD",
                                     "E01CCLBDY",
                                     "E01CCLHPN",
                                     "E01CCLBPN",
                                     "E01CCLFAX",
                                     "E01CCLQST",
                                     "E01CCLDSC",
                                     "E01CCLANS",
                                     "E01CCLEXP",
                                     "E01CCLERR",
                                     "E01CCLINT"
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
                                   "E01CCLIDT",
                                   "E01CCLIDN",
                                   "E01CCLPIN",
                                   "E01CCLNEW",
                                   "E01CCLCUN",
                                   "E01CCLTDD",
                                   "E01CCLTDC",
                                   "E01CCLNA1",
                                   "E01CCLAD1",
                                   "E01CCLAD2",
                                   "E01CCLCTY",
                                   "E01CCLZPC",
                                   "E01CCLCCS",
                                   "E01CCLCVD",
                                   "E01CCLCVC",
                                   "E01CCLBDM",
                                   "E01CCLBDD",
                                   "E01CCLBDY",
                                   "E01CCLHPN",
                                   "E01CCLBPN",
                                   "E01CCLFAX",
                                   "E01CCLQST",
                                   "E01CCLDSC",
                                   "E01CCLANS",
                                   "E01CCLEXP",
                                   "E01CCLERR",
                                   "E01CCLINT"
                                 };
  final static String fid = "1130611112848";
  final static String rid = "3D8BFCE9610CD";
  final static String fmtname = "ECL0000DS";
  final int FIELDCOUNT = 36;
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
  private CharacterField fieldE01CCLIDT = null;
  private DecimalField fieldE01CCLIDN = null;
  private CharacterField fieldE01CCLPIN = null;
  private CharacterField fieldE01CCLNEW = null;
  private DecimalField fieldE01CCLCUN = null;
  private CharacterField fieldE01CCLTDD = null;
  private CharacterField fieldE01CCLTDC = null;
  private CharacterField fieldE01CCLNA1 = null;
  private CharacterField fieldE01CCLAD1 = null;
  private CharacterField fieldE01CCLAD2 = null;
  private CharacterField fieldE01CCLCTY = null;
  private CharacterField fieldE01CCLZPC = null;
  private CharacterField fieldE01CCLCCS = null;
  private DecimalField fieldE01CCLCVD = null;
  private DecimalField fieldE01CCLCVC = null;
  private DecimalField fieldE01CCLBDM = null;
  private DecimalField fieldE01CCLBDD = null;
  private DecimalField fieldE01CCLBDY = null;
  private CharacterField fieldE01CCLHPN = null;
  private CharacterField fieldE01CCLBPN = null;
  private CharacterField fieldE01CCLFAX = null;
  private CharacterField fieldE01CCLQST = null;
  private CharacterField fieldE01CCLDSC = null;
  private CharacterField fieldE01CCLANS = null;
  private CharacterField fieldE01CCLEXP = null;
  private DecimalField fieldE01CCLERR = null;
  private DecimalField fieldE01CCLINT = null;

  /**
  * Constructor for ECL0000DSMessage.
  */
  public ECL0000DSMessage()
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
    recordsize = 451;
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
    fields[9] = fieldE01CCLIDT =
    new CharacterField(message, HEADERSIZE + 42, 1, "E01CCLIDT");
    fields[10] = fieldE01CCLIDN =
    new DecimalField(message, HEADERSIZE + 43, 10, 0, "E01CCLIDN");
    fields[11] = fieldE01CCLPIN =
    new CharacterField(message, HEADERSIZE + 53, 2, "E01CCLPIN");
    fields[12] = fieldE01CCLNEW =
    new CharacterField(message, HEADERSIZE + 55, 4, "E01CCLNEW");
    fields[13] = fieldE01CCLCUN =
    new DecimalField(message, HEADERSIZE + 59, 10, 0, "E01CCLCUN");
    fields[14] = fieldE01CCLTDD =
    new CharacterField(message, HEADERSIZE + 69, 20, "E01CCLTDD");
    fields[15] = fieldE01CCLTDC =
    new CharacterField(message, HEADERSIZE + 89, 20, "E01CCLTDC");
    fields[16] = fieldE01CCLNA1 =
    new CharacterField(message, HEADERSIZE + 109, 45, "E01CCLNA1");
    fields[17] = fieldE01CCLAD1 =
    new CharacterField(message, HEADERSIZE + 154, 45, "E01CCLAD1");
    fields[18] = fieldE01CCLAD2 =
    new CharacterField(message, HEADERSIZE + 199, 45, "E01CCLAD2");
    fields[19] = fieldE01CCLCTY =
    new CharacterField(message, HEADERSIZE + 244, 35, "E01CCLCTY");
    fields[20] = fieldE01CCLZPC =
    new CharacterField(message, HEADERSIZE + 279, 5, "E01CCLZPC");
    fields[21] = fieldE01CCLCCS =
    new CharacterField(message, HEADERSIZE + 284, 5, "E01CCLCCS");
    fields[22] = fieldE01CCLCVD =
    new DecimalField(message, HEADERSIZE + 289, 4, 0, "E01CCLCVD");
    fields[23] = fieldE01CCLCVC =
    new DecimalField(message, HEADERSIZE + 293, 4, 0, "E01CCLCVC");
    fields[24] = fieldE01CCLBDM =
    new DecimalField(message, HEADERSIZE + 297, 3, 0, "E01CCLBDM");
    fields[25] = fieldE01CCLBDD =
    new DecimalField(message, HEADERSIZE + 300, 3, 0, "E01CCLBDD");
    fields[26] = fieldE01CCLBDY =
    new DecimalField(message, HEADERSIZE + 303, 5, 0, "E01CCLBDY");
    fields[27] = fieldE01CCLHPN =
    new CharacterField(message, HEADERSIZE + 308, 15, "E01CCLHPN");
    fields[28] = fieldE01CCLBPN =
    new CharacterField(message, HEADERSIZE + 323, 15, "E01CCLBPN");
    fields[29] = fieldE01CCLFAX =
    new CharacterField(message, HEADERSIZE + 338, 15, "E01CCLFAX");
    fields[30] = fieldE01CCLQST =
    new CharacterField(message, HEADERSIZE + 353, 2, "E01CCLQST");
    fields[31] = fieldE01CCLDSC =
    new CharacterField(message, HEADERSIZE + 355, 45, "E01CCLDSC");
    fields[32] = fieldE01CCLANS =
    new CharacterField(message, HEADERSIZE + 400, 2, "E01CCLANS");
    fields[33] = fieldE01CCLEXP =
    new CharacterField(message, HEADERSIZE + 402, 45, "E01CCLEXP");
    fields[34] = fieldE01CCLERR =
    new DecimalField(message, HEADERSIZE + 447, 2, 0, "E01CCLERR");
    fields[35] = fieldE01CCLINT =
    new DecimalField(message, HEADERSIZE + 449, 2, 0, "E01CCLINT");

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
  * Set field E01CCLIDT using a String value.
  */
  public void setE01CCLIDT(String newvalue)
  {
    fieldE01CCLIDT.setString(newvalue);
  }

  /**
  * Get value of field E01CCLIDT as a String.
  */
  public String getE01CCLIDT()
  {
    return fieldE01CCLIDT.getString();
  }

  /**
  * Set field E01CCLIDN using a String value.
  */
  public void setE01CCLIDN(String newvalue)
  {
    fieldE01CCLIDN.setString(newvalue);
  }

  /**
  * Get value of field E01CCLIDN as a String.
  */
  public String getE01CCLIDN()
  {
    return fieldE01CCLIDN.getString();
  }

  /**
  * Set numeric field E01CCLIDN using a BigDecimal value.
  */
  public void setE01CCLIDN(BigDecimal newvalue)
  {
    fieldE01CCLIDN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CCLIDN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CCLIDN()
  {
    return fieldE01CCLIDN.getBigDecimal();
  }

  /**
  * Set field E01CCLPIN using a String value.
  */
  public void setE01CCLPIN(String newvalue)
  {
    fieldE01CCLPIN.setString(newvalue);
  }

  /**
  * Get value of field E01CCLPIN as a String.
  */
  public String getE01CCLPIN()
  {
    return fieldE01CCLPIN.getString();
  }

  /**
  * Set field E01CCLNEW using a String value.
  */
  public void setE01CCLNEW(String newvalue)
  {
    fieldE01CCLNEW.setString(newvalue);
  }

  /**
  * Get value of field E01CCLNEW as a String.
  */
  public String getE01CCLNEW()
  {
    return fieldE01CCLNEW.getString();
  }

  /**
  * Set field E01CCLCUN using a String value.
  */
  public void setE01CCLCUN(String newvalue)
  {
    fieldE01CCLCUN.setString(newvalue);
  }

  /**
  * Get value of field E01CCLCUN as a String.
  */
  public String getE01CCLCUN()
  {
    return fieldE01CCLCUN.getString();
  }

  /**
  * Set numeric field E01CCLCUN using a BigDecimal value.
  */
  public void setE01CCLCUN(BigDecimal newvalue)
  {
    fieldE01CCLCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CCLCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CCLCUN()
  {
    return fieldE01CCLCUN.getBigDecimal();
  }

  /**
  * Set field E01CCLTDD using a String value.
  */
  public void setE01CCLTDD(String newvalue)
  {
    fieldE01CCLTDD.setString(newvalue);
  }

  /**
  * Get value of field E01CCLTDD as a String.
  */
  public String getE01CCLTDD()
  {
    return fieldE01CCLTDD.getString();
  }

  /**
  * Set field E01CCLTDC using a String value.
  */
  public void setE01CCLTDC(String newvalue)
  {
    fieldE01CCLTDC.setString(newvalue);
  }

  /**
  * Get value of field E01CCLTDC as a String.
  */
  public String getE01CCLTDC()
  {
    return fieldE01CCLTDC.getString();
  }

  /**
  * Set field E01CCLNA1 using a String value.
  */
  public void setE01CCLNA1(String newvalue)
  {
    fieldE01CCLNA1.setString(newvalue);
  }

  /**
  * Get value of field E01CCLNA1 as a String.
  */
  public String getE01CCLNA1()
  {
    return fieldE01CCLNA1.getString();
  }

  /**
  * Set field E01CCLAD1 using a String value.
  */
  public void setE01CCLAD1(String newvalue)
  {
    fieldE01CCLAD1.setString(newvalue);
  }

  /**
  * Get value of field E01CCLAD1 as a String.
  */
  public String getE01CCLAD1()
  {
    return fieldE01CCLAD1.getString();
  }

  /**
  * Set field E01CCLAD2 using a String value.
  */
  public void setE01CCLAD2(String newvalue)
  {
    fieldE01CCLAD2.setString(newvalue);
  }

  /**
  * Get value of field E01CCLAD2 as a String.
  */
  public String getE01CCLAD2()
  {
    return fieldE01CCLAD2.getString();
  }

  /**
  * Set field E01CCLCTY using a String value.
  */
  public void setE01CCLCTY(String newvalue)
  {
    fieldE01CCLCTY.setString(newvalue);
  }

  /**
  * Get value of field E01CCLCTY as a String.
  */
  public String getE01CCLCTY()
  {
    return fieldE01CCLCTY.getString();
  }

  /**
  * Set field E01CCLZPC using a String value.
  */
  public void setE01CCLZPC(String newvalue)
  {
    fieldE01CCLZPC.setString(newvalue);
  }

  /**
  * Get value of field E01CCLZPC as a String.
  */
  public String getE01CCLZPC()
  {
    return fieldE01CCLZPC.getString();
  }

  /**
  * Set field E01CCLCCS using a String value.
  */
  public void setE01CCLCCS(String newvalue)
  {
    fieldE01CCLCCS.setString(newvalue);
  }

  /**
  * Get value of field E01CCLCCS as a String.
  */
  public String getE01CCLCCS()
  {
    return fieldE01CCLCCS.getString();
  }

  /**
  * Set field E01CCLCVD using a String value.
  */
  public void setE01CCLCVD(String newvalue)
  {
    fieldE01CCLCVD.setString(newvalue);
  }

  /**
  * Get value of field E01CCLCVD as a String.
  */
  public String getE01CCLCVD()
  {
    return fieldE01CCLCVD.getString();
  }

  /**
  * Set numeric field E01CCLCVD using a BigDecimal value.
  */
  public void setE01CCLCVD(BigDecimal newvalue)
  {
    fieldE01CCLCVD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CCLCVD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CCLCVD()
  {
    return fieldE01CCLCVD.getBigDecimal();
  }

  /**
  * Set field E01CCLCVC using a String value.
  */
  public void setE01CCLCVC(String newvalue)
  {
    fieldE01CCLCVC.setString(newvalue);
  }

  /**
  * Get value of field E01CCLCVC as a String.
  */
  public String getE01CCLCVC()
  {
    return fieldE01CCLCVC.getString();
  }

  /**
  * Set numeric field E01CCLCVC using a BigDecimal value.
  */
  public void setE01CCLCVC(BigDecimal newvalue)
  {
    fieldE01CCLCVC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CCLCVC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CCLCVC()
  {
    return fieldE01CCLCVC.getBigDecimal();
  }

  /**
  * Set field E01CCLBDM using a String value.
  */
  public void setE01CCLBDM(String newvalue)
  {
    fieldE01CCLBDM.setString(newvalue);
  }

  /**
  * Get value of field E01CCLBDM as a String.
  */
  public String getE01CCLBDM()
  {
    return fieldE01CCLBDM.getString();
  }

  /**
  * Set numeric field E01CCLBDM using a BigDecimal value.
  */
  public void setE01CCLBDM(BigDecimal newvalue)
  {
    fieldE01CCLBDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CCLBDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CCLBDM()
  {
    return fieldE01CCLBDM.getBigDecimal();
  }

  /**
  * Set field E01CCLBDD using a String value.
  */
  public void setE01CCLBDD(String newvalue)
  {
    fieldE01CCLBDD.setString(newvalue);
  }

  /**
  * Get value of field E01CCLBDD as a String.
  */
  public String getE01CCLBDD()
  {
    return fieldE01CCLBDD.getString();
  }

  /**
  * Set numeric field E01CCLBDD using a BigDecimal value.
  */
  public void setE01CCLBDD(BigDecimal newvalue)
  {
    fieldE01CCLBDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CCLBDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CCLBDD()
  {
    return fieldE01CCLBDD.getBigDecimal();
  }

  /**
  * Set field E01CCLBDY using a String value.
  */
  public void setE01CCLBDY(String newvalue)
  {
    fieldE01CCLBDY.setString(newvalue);
  }

  /**
  * Get value of field E01CCLBDY as a String.
  */
  public String getE01CCLBDY()
  {
    return fieldE01CCLBDY.getString();
  }

  /**
  * Set numeric field E01CCLBDY using a BigDecimal value.
  */
  public void setE01CCLBDY(BigDecimal newvalue)
  {
    fieldE01CCLBDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CCLBDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CCLBDY()
  {
    return fieldE01CCLBDY.getBigDecimal();
  }

  /**
  * Set field E01CCLHPN using a String value.
  */
  public void setE01CCLHPN(String newvalue)
  {
    fieldE01CCLHPN.setString(newvalue);
  }

  /**
  * Get value of field E01CCLHPN as a String.
  */
  public String getE01CCLHPN()
  {
    return fieldE01CCLHPN.getString();
  }

  /**
  * Set field E01CCLBPN using a String value.
  */
  public void setE01CCLBPN(String newvalue)
  {
    fieldE01CCLBPN.setString(newvalue);
  }

  /**
  * Get value of field E01CCLBPN as a String.
  */
  public String getE01CCLBPN()
  {
    return fieldE01CCLBPN.getString();
  }

  /**
  * Set field E01CCLFAX using a String value.
  */
  public void setE01CCLFAX(String newvalue)
  {
    fieldE01CCLFAX.setString(newvalue);
  }

  /**
  * Get value of field E01CCLFAX as a String.
  */
  public String getE01CCLFAX()
  {
    return fieldE01CCLFAX.getString();
  }

  /**
  * Set field E01CCLQST using a String value.
  */
  public void setE01CCLQST(String newvalue)
  {
    fieldE01CCLQST.setString(newvalue);
  }

  /**
  * Get value of field E01CCLQST as a String.
  */
  public String getE01CCLQST()
  {
    return fieldE01CCLQST.getString();
  }

  /**
  * Set field E01CCLDSC using a String value.
  */
  public void setE01CCLDSC(String newvalue)
  {
    fieldE01CCLDSC.setString(newvalue);
  }

  /**
  * Get value of field E01CCLDSC as a String.
  */
  public String getE01CCLDSC()
  {
    return fieldE01CCLDSC.getString();
  }

  /**
  * Set field E01CCLANS using a String value.
  */
  public void setE01CCLANS(String newvalue)
  {
    fieldE01CCLANS.setString(newvalue);
  }

  /**
  * Get value of field E01CCLANS as a String.
  */
  public String getE01CCLANS()
  {
    return fieldE01CCLANS.getString();
  }

  /**
  * Set field E01CCLEXP using a String value.
  */
  public void setE01CCLEXP(String newvalue)
  {
    fieldE01CCLEXP.setString(newvalue);
  }

  /**
  * Get value of field E01CCLEXP as a String.
  */
  public String getE01CCLEXP()
  {
    return fieldE01CCLEXP.getString();
  }

  /**
  * Set field E01CCLERR using a String value.
  */
  public void setE01CCLERR(String newvalue)
  {
    fieldE01CCLERR.setString(newvalue);
  }

  /**
  * Get value of field E01CCLERR as a String.
  */
  public String getE01CCLERR()
  {
    return fieldE01CCLERR.getString();
  }

  /**
  * Set numeric field E01CCLERR using a BigDecimal value.
  */
  public void setE01CCLERR(BigDecimal newvalue)
  {
    fieldE01CCLERR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CCLERR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CCLERR()
  {
    return fieldE01CCLERR.getBigDecimal();
  }

  /**
  * Set field E01CCLINT using a String value.
  */
  public void setE01CCLINT(String newvalue)
  {
    fieldE01CCLINT.setString(newvalue);
  }

  /**
  * Get value of field E01CCLINT as a String.
  */
  public String getE01CCLINT()
  {
    return fieldE01CCLINT.getString();
  }

  /**
  * Set numeric field E01CCLINT using a BigDecimal value.
  */
  public void setE01CCLINT(BigDecimal newvalue)
  {
    fieldE01CCLINT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CCLINT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CCLINT()
  {
    return fieldE01CCLINT.getBigDecimal();
  }

}
