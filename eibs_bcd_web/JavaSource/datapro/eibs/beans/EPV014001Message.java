package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EPV014001 physical file definition.
* 
* File level identifier is 1140708124729.
* Record format level identifier is 3E09888DAE03B.
*/

public class EPV014001Message extends MessageRecord
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
                                     "E01PVMNUM",
                                     "E01PVMBNK",
                                     "E01PVMBRN",
                                     "E01PVMCCY",
                                     "E01PVMSTS",
                                     "E01PVMCUN",
                                     "E01PVMIDN",
                                     "E01PVMIDT",
                                     "E01PVMIDP",
                                     "E01PVMNA1",
                                     "E01PVMOPM",
                                     "E01PVMOPD",
                                     "E01PVMOPY",
                                     "E01PVMOTM",
                                     "E01PVMOUS",
                                     "E01PVMOFC",
                                     "E01OFCAPM",
                                     "E01APRRMK",
                                     "E01PVMRKA",
                                     "E01PVDACC",
                                     "E01PVDACD",
                                     "E01PVDTYP",
                                     "E01PVDPRO",
                                     "E01PRODSC",
                                     "E01PVDOFA",
                                     "E01PVDAPA",
                                     "E01PVDPAM",
                                     "E01PVDTRM",
                                     "E01PVDTRC",
                                     "E01PVDRTE",
                                     "E01PVDPNU",
                                     "E01PVDCNV",
                                     "E01PVDORG",
                                     "E01PVDORD",
                                     "E01PVDDST",
                                     "E01PVDDSD",
                                     "PVMRTE",
                                     "PVMRT1",
                                     "PVMRT2",
                                     "PVMMPB",
                                     "PVMIRA",
                                     "E01NUMREC",
                                     "E01INDOPE"
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
                                   "E01PVMNUM",
                                   "E01PVMBNK",
                                   "E01PVMBRN",
                                   "E01PVMCCY",
                                   "E01PVMSTS",
                                   "E01PVMCUN",
                                   "E01PVMIDN",
                                   "E01PVMIDT",
                                   "E01PVMIDP",
                                   "E01PVMNA1",
                                   "E01PVMOPM",
                                   "E01PVMOPD",
                                   "E01PVMOPY",
                                   "E01PVMOTM",
                                   "E01PVMOUS",
                                   "E01PVMOFC",
                                   "E01OFCAPM",
                                   "E01APRRMK",
                                   "E01PVMRKA",
                                   "E01PVDACC",
                                   "E01PVDACD",
                                   "E01PVDTYP",
                                   "E01PVDPRO",
                                   "E01PRODSC",
                                   "E01PVDOFA",
                                   "E01PVDAPA",
                                   "E01PVDPAM",
                                   "E01PVDTRM",
                                   "E01PVDTRC",
                                   "E01PVDRTE",
                                   "E01PVDPNU",
                                   "E01PVDCNV",
                                   "E01PVDORG",
                                   "E01PVDORD",
                                   "E01PVDDST",
                                   "E01PVDDSD",
                                   "PVMRTE",
                                   "PVMRT1",
                                   "PVMRT2",
                                   "PVMMPB",
                                   "PVMIRA",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1140708124729";
  final static String rid = "3E09888DAE03B";
  final static String fmtname = "EPV014001";
  final int FIELDCOUNT = 52;
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
  private DecimalField fieldE01PVMNUM = null;
  private CharacterField fieldE01PVMBNK = null;
  private DecimalField fieldE01PVMBRN = null;
  private CharacterField fieldE01PVMCCY = null;
  private CharacterField fieldE01PVMSTS = null;
  private DecimalField fieldE01PVMCUN = null;
  private CharacterField fieldE01PVMIDN = null;
  private CharacterField fieldE01PVMIDT = null;
  private CharacterField fieldE01PVMIDP = null;
  private CharacterField fieldE01PVMNA1 = null;
  private DecimalField fieldE01PVMOPM = null;
  private DecimalField fieldE01PVMOPD = null;
  private DecimalField fieldE01PVMOPY = null;
  private CharacterField fieldE01PVMOTM = null;
  private CharacterField fieldE01PVMOUS = null;
  private CharacterField fieldE01PVMOFC = null;
  private CharacterField fieldE01OFCAPM = null;
  private CharacterField fieldE01APRRMK = null;
  private DecimalField fieldE01PVMRKA = null;
  private DecimalField fieldE01PVDACC = null;
  private CharacterField fieldE01PVDACD = null;
  private CharacterField fieldE01PVDTYP = null;
  private CharacterField fieldE01PVDPRO = null;
  private CharacterField fieldE01PRODSC = null;
  private DecimalField fieldE01PVDOFA = null;
  private DecimalField fieldE01PVDAPA = null;
  private DecimalField fieldE01PVDPAM = null;
  private DecimalField fieldE01PVDTRM = null;
  private CharacterField fieldE01PVDTRC = null;
  private DecimalField fieldE01PVDRTE = null;
  private DecimalField fieldE01PVDPNU = null;
  private DecimalField fieldE01PVDCNV = null;
  private CharacterField fieldE01PVDORG = null;
  private CharacterField fieldE01PVDORD = null;
  private CharacterField fieldE01PVDDST = null;
  private CharacterField fieldE01PVDDSD = null;
  private CharacterField fieldPVMRTE = null;
  private CharacterField fieldPVMRT1 = null;
  private CharacterField fieldPVMRT2 = null;
  private CharacterField fieldPVMMPB = null;
  private DecimalField fieldPVMIRA = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for EPV014001Message.
  */
  public EPV014001Message()
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
    recordsize = 633;
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
    fields[9] = fieldE01PVMNUM =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E01PVMNUM");
    fields[10] = fieldE01PVMBNK =
    new CharacterField(message, HEADERSIZE + 55, 2, "E01PVMBNK");
    fields[11] = fieldE01PVMBRN =
    new DecimalField(message, HEADERSIZE + 57, 5, 0, "E01PVMBRN");
    fields[12] = fieldE01PVMCCY =
    new CharacterField(message, HEADERSIZE + 62, 3, "E01PVMCCY");
    fields[13] = fieldE01PVMSTS =
    new CharacterField(message, HEADERSIZE + 65, 1, "E01PVMSTS");
    fields[14] = fieldE01PVMCUN =
    new DecimalField(message, HEADERSIZE + 66, 10, 0, "E01PVMCUN");
    fields[15] = fieldE01PVMIDN =
    new CharacterField(message, HEADERSIZE + 76, 25, "E01PVMIDN");
    fields[16] = fieldE01PVMIDT =
    new CharacterField(message, HEADERSIZE + 101, 4, "E01PVMIDT");
    fields[17] = fieldE01PVMIDP =
    new CharacterField(message, HEADERSIZE + 105, 4, "E01PVMIDP");
    fields[18] = fieldE01PVMNA1 =
    new CharacterField(message, HEADERSIZE + 109, 45, "E01PVMNA1");
    fields[19] = fieldE01PVMOPM =
    new DecimalField(message, HEADERSIZE + 154, 3, 0, "E01PVMOPM");
    fields[20] = fieldE01PVMOPD =
    new DecimalField(message, HEADERSIZE + 157, 3, 0, "E01PVMOPD");
    fields[21] = fieldE01PVMOPY =
    new DecimalField(message, HEADERSIZE + 160, 5, 0, "E01PVMOPY");
    fields[22] = fieldE01PVMOTM =
    new CharacterField(message, HEADERSIZE + 165, 26, "E01PVMOTM");
    fields[23] = fieldE01PVMOUS =
    new CharacterField(message, HEADERSIZE + 191, 10, "E01PVMOUS");
    fields[24] = fieldE01PVMOFC =
    new CharacterField(message, HEADERSIZE + 201, 4, "E01PVMOFC");
    fields[25] = fieldE01OFCAPM =
    new CharacterField(message, HEADERSIZE + 205, 45, "E01OFCAPM");
    fields[26] = fieldE01APRRMK =
    new CharacterField(message, HEADERSIZE + 250, 45, "E01APRRMK");
    fields[27] = fieldE01PVMRKA =
    new DecimalField(message, HEADERSIZE + 295, 17, 2, "E01PVMRKA");
    fields[28] = fieldE01PVDACC =
    new DecimalField(message, HEADERSIZE + 312, 13, 0, "E01PVDACC");
    fields[29] = fieldE01PVDACD =
    new CharacterField(message, HEADERSIZE + 325, 2, "E01PVDACD");
    fields[30] = fieldE01PVDTYP =
    new CharacterField(message, HEADERSIZE + 327, 4, "E01PVDTYP");
    fields[31] = fieldE01PVDPRO =
    new CharacterField(message, HEADERSIZE + 331, 4, "E01PVDPRO");
    fields[32] = fieldE01PRODSC =
    new CharacterField(message, HEADERSIZE + 335, 45, "E01PRODSC");
    fields[33] = fieldE01PVDOFA =
    new DecimalField(message, HEADERSIZE + 380, 17, 2, "E01PVDOFA");
    fields[34] = fieldE01PVDAPA =
    new DecimalField(message, HEADERSIZE + 397, 17, 2, "E01PVDAPA");
    fields[35] = fieldE01PVDPAM =
    new DecimalField(message, HEADERSIZE + 414, 17, 2, "E01PVDPAM");
    fields[36] = fieldE01PVDTRM =
    new DecimalField(message, HEADERSIZE + 431, 6, 0, "E01PVDTRM");
    fields[37] = fieldE01PVDTRC =
    new CharacterField(message, HEADERSIZE + 437, 1, "E01PVDTRC");
    fields[38] = fieldE01PVDRTE =
    new DecimalField(message, HEADERSIZE + 438, 17, 2, "E01PVDRTE");
    fields[39] = fieldE01PVDPNU =
    new DecimalField(message, HEADERSIZE + 455, 5, 0, "E01PVDPNU");
    fields[40] = fieldE01PVDCNV =
    new DecimalField(message, HEADERSIZE + 460, 9, 0, "E01PVDCNV");
    fields[41] = fieldE01PVDORG =
    new CharacterField(message, HEADERSIZE + 469, 4, "E01PVDORG");
    fields[42] = fieldE01PVDORD =
    new CharacterField(message, HEADERSIZE + 473, 45, "E01PVDORD");
    fields[43] = fieldE01PVDDST =
    new CharacterField(message, HEADERSIZE + 518, 4, "E01PVDDST");
    fields[44] = fieldE01PVDDSD =
    new CharacterField(message, HEADERSIZE + 522, 45, "E01PVDDSD");
    fields[45] = fieldPVMRTE =
    new CharacterField(message, HEADERSIZE + 567, 10, "PVMRTE");
    fields[46] = fieldPVMRT1 =
    new CharacterField(message, HEADERSIZE + 577, 10, "PVMRT1");
    fields[47] = fieldPVMRT2 =
    new CharacterField(message, HEADERSIZE + 587, 10, "PVMRT2");
    fields[48] = fieldPVMMPB =
    new CharacterField(message, HEADERSIZE + 597, 10, "PVMMPB");
    fields[49] = fieldPVMIRA =
    new DecimalField(message, HEADERSIZE + 607, 17, 2, "PVMIRA");
    fields[50] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 624, 8, 0, "E01NUMREC");
    fields[51] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 632, 1, "E01INDOPE");

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
  * Set field E01PVMNUM using a String value.
  */
  public void setE01PVMNUM(String newvalue)
  {
    fieldE01PVMNUM.setString(newvalue);
  }

  /**
  * Get value of field E01PVMNUM as a String.
  */
  public String getE01PVMNUM()
  {
    return fieldE01PVMNUM.getString();
  }

  /**
  * Set numeric field E01PVMNUM using a BigDecimal value.
  */
  public void setE01PVMNUM(BigDecimal newvalue)
  {
    fieldE01PVMNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PVMNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PVMNUM()
  {
    return fieldE01PVMNUM.getBigDecimal();
  }

  /**
  * Set field E01PVMBNK using a String value.
  */
  public void setE01PVMBNK(String newvalue)
  {
    fieldE01PVMBNK.setString(newvalue);
  }

  /**
  * Get value of field E01PVMBNK as a String.
  */
  public String getE01PVMBNK()
  {
    return fieldE01PVMBNK.getString();
  }

  /**
  * Set field E01PVMBRN using a String value.
  */
  public void setE01PVMBRN(String newvalue)
  {
    fieldE01PVMBRN.setString(newvalue);
  }

  /**
  * Get value of field E01PVMBRN as a String.
  */
  public String getE01PVMBRN()
  {
    return fieldE01PVMBRN.getString();
  }

  /**
  * Set numeric field E01PVMBRN using a BigDecimal value.
  */
  public void setE01PVMBRN(BigDecimal newvalue)
  {
    fieldE01PVMBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PVMBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PVMBRN()
  {
    return fieldE01PVMBRN.getBigDecimal();
  }

  /**
  * Set field E01PVMCCY using a String value.
  */
  public void setE01PVMCCY(String newvalue)
  {
    fieldE01PVMCCY.setString(newvalue);
  }

  /**
  * Get value of field E01PVMCCY as a String.
  */
  public String getE01PVMCCY()
  {
    return fieldE01PVMCCY.getString();
  }

  /**
  * Set field E01PVMSTS using a String value.
  */
  public void setE01PVMSTS(String newvalue)
  {
    fieldE01PVMSTS.setString(newvalue);
  }

  /**
  * Get value of field E01PVMSTS as a String.
  */
  public String getE01PVMSTS()
  {
    return fieldE01PVMSTS.getString();
  }

  /**
  * Set field E01PVMCUN using a String value.
  */
  public void setE01PVMCUN(String newvalue)
  {
    fieldE01PVMCUN.setString(newvalue);
  }

  /**
  * Get value of field E01PVMCUN as a String.
  */
  public String getE01PVMCUN()
  {
    return fieldE01PVMCUN.getString();
  }

  /**
  * Set numeric field E01PVMCUN using a BigDecimal value.
  */
  public void setE01PVMCUN(BigDecimal newvalue)
  {
    fieldE01PVMCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PVMCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PVMCUN()
  {
    return fieldE01PVMCUN.getBigDecimal();
  }

  /**
  * Set field E01PVMIDN using a String value.
  */
  public void setE01PVMIDN(String newvalue)
  {
    fieldE01PVMIDN.setString(newvalue);
  }

  /**
  * Get value of field E01PVMIDN as a String.
  */
  public String getE01PVMIDN()
  {
    return fieldE01PVMIDN.getString();
  }

  /**
  * Set field E01PVMIDT using a String value.
  */
  public void setE01PVMIDT(String newvalue)
  {
    fieldE01PVMIDT.setString(newvalue);
  }

  /**
  * Get value of field E01PVMIDT as a String.
  */
  public String getE01PVMIDT()
  {
    return fieldE01PVMIDT.getString();
  }

  /**
  * Set field E01PVMIDP using a String value.
  */
  public void setE01PVMIDP(String newvalue)
  {
    fieldE01PVMIDP.setString(newvalue);
  }

  /**
  * Get value of field E01PVMIDP as a String.
  */
  public String getE01PVMIDP()
  {
    return fieldE01PVMIDP.getString();
  }

  /**
  * Set field E01PVMNA1 using a String value.
  */
  public void setE01PVMNA1(String newvalue)
  {
    fieldE01PVMNA1.setString(newvalue);
  }

  /**
  * Get value of field E01PVMNA1 as a String.
  */
  public String getE01PVMNA1()
  {
    return fieldE01PVMNA1.getString();
  }

  /**
  * Set field E01PVMOPM using a String value.
  */
  public void setE01PVMOPM(String newvalue)
  {
    fieldE01PVMOPM.setString(newvalue);
  }

  /**
  * Get value of field E01PVMOPM as a String.
  */
  public String getE01PVMOPM()
  {
    return fieldE01PVMOPM.getString();
  }

  /**
  * Set numeric field E01PVMOPM using a BigDecimal value.
  */
  public void setE01PVMOPM(BigDecimal newvalue)
  {
    fieldE01PVMOPM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PVMOPM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PVMOPM()
  {
    return fieldE01PVMOPM.getBigDecimal();
  }

  /**
  * Set field E01PVMOPD using a String value.
  */
  public void setE01PVMOPD(String newvalue)
  {
    fieldE01PVMOPD.setString(newvalue);
  }

  /**
  * Get value of field E01PVMOPD as a String.
  */
  public String getE01PVMOPD()
  {
    return fieldE01PVMOPD.getString();
  }

  /**
  * Set numeric field E01PVMOPD using a BigDecimal value.
  */
  public void setE01PVMOPD(BigDecimal newvalue)
  {
    fieldE01PVMOPD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PVMOPD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PVMOPD()
  {
    return fieldE01PVMOPD.getBigDecimal();
  }

  /**
  * Set field E01PVMOPY using a String value.
  */
  public void setE01PVMOPY(String newvalue)
  {
    fieldE01PVMOPY.setString(newvalue);
  }

  /**
  * Get value of field E01PVMOPY as a String.
  */
  public String getE01PVMOPY()
  {
    return fieldE01PVMOPY.getString();
  }

  /**
  * Set numeric field E01PVMOPY using a BigDecimal value.
  */
  public void setE01PVMOPY(BigDecimal newvalue)
  {
    fieldE01PVMOPY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PVMOPY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PVMOPY()
  {
    return fieldE01PVMOPY.getBigDecimal();
  }

  /**
  * Set field E01PVMOTM using a String value.
  */
  public void setE01PVMOTM(String newvalue)
  {
    fieldE01PVMOTM.setString(newvalue);
  }

  /**
  * Get value of field E01PVMOTM as a String.
  */
  public String getE01PVMOTM()
  {
    return fieldE01PVMOTM.getString();
  }

  /**
  * Set field E01PVMOUS using a String value.
  */
  public void setE01PVMOUS(String newvalue)
  {
    fieldE01PVMOUS.setString(newvalue);
  }

  /**
  * Get value of field E01PVMOUS as a String.
  */
  public String getE01PVMOUS()
  {
    return fieldE01PVMOUS.getString();
  }

  /**
  * Set field E01PVMOFC using a String value.
  */
  public void setE01PVMOFC(String newvalue)
  {
    fieldE01PVMOFC.setString(newvalue);
  }

  /**
  * Get value of field E01PVMOFC as a String.
  */
  public String getE01PVMOFC()
  {
    return fieldE01PVMOFC.getString();
  }

  /**
  * Set field E01OFCAPM using a String value.
  */
  public void setE01OFCAPM(String newvalue)
  {
    fieldE01OFCAPM.setString(newvalue);
  }

  /**
  * Get value of field E01OFCAPM as a String.
  */
  public String getE01OFCAPM()
  {
    return fieldE01OFCAPM.getString();
  }

  /**
  * Set field E01APRRMK using a String value.
  */
  public void setE01APRRMK(String newvalue)
  {
    fieldE01APRRMK.setString(newvalue);
  }

  /**
  * Get value of field E01APRRMK as a String.
  */
  public String getE01APRRMK()
  {
    return fieldE01APRRMK.getString();
  }

  /**
  * Set field E01PVMRKA using a String value.
  */
  public void setE01PVMRKA(String newvalue)
  {
    fieldE01PVMRKA.setString(newvalue);
  }

  /**
  * Get value of field E01PVMRKA as a String.
  */
  public String getE01PVMRKA()
  {
    return fieldE01PVMRKA.getString();
  }

  /**
  * Set numeric field E01PVMRKA using a BigDecimal value.
  */
  public void setE01PVMRKA(BigDecimal newvalue)
  {
    fieldE01PVMRKA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PVMRKA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PVMRKA()
  {
    return fieldE01PVMRKA.getBigDecimal();
  }

  /**
  * Set field E01PVDACC using a String value.
  */
  public void setE01PVDACC(String newvalue)
  {
    fieldE01PVDACC.setString(newvalue);
  }

  /**
  * Get value of field E01PVDACC as a String.
  */
  public String getE01PVDACC()
  {
    return fieldE01PVDACC.getString();
  }

  /**
  * Set numeric field E01PVDACC using a BigDecimal value.
  */
  public void setE01PVDACC(BigDecimal newvalue)
  {
    fieldE01PVDACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PVDACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PVDACC()
  {
    return fieldE01PVDACC.getBigDecimal();
  }

  /**
  * Set field E01PVDACD using a String value.
  */
  public void setE01PVDACD(String newvalue)
  {
    fieldE01PVDACD.setString(newvalue);
  }

  /**
  * Get value of field E01PVDACD as a String.
  */
  public String getE01PVDACD()
  {
    return fieldE01PVDACD.getString();
  }

  /**
  * Set field E01PVDTYP using a String value.
  */
  public void setE01PVDTYP(String newvalue)
  {
    fieldE01PVDTYP.setString(newvalue);
  }

  /**
  * Get value of field E01PVDTYP as a String.
  */
  public String getE01PVDTYP()
  {
    return fieldE01PVDTYP.getString();
  }

  /**
  * Set field E01PVDPRO using a String value.
  */
  public void setE01PVDPRO(String newvalue)
  {
    fieldE01PVDPRO.setString(newvalue);
  }

  /**
  * Get value of field E01PVDPRO as a String.
  */
  public String getE01PVDPRO()
  {
    return fieldE01PVDPRO.getString();
  }

  /**
  * Set field E01PRODSC using a String value.
  */
  public void setE01PRODSC(String newvalue)
  {
    fieldE01PRODSC.setString(newvalue);
  }

  /**
  * Get value of field E01PRODSC as a String.
  */
  public String getE01PRODSC()
  {
    return fieldE01PRODSC.getString();
  }

  /**
  * Set field E01PVDOFA using a String value.
  */
  public void setE01PVDOFA(String newvalue)
  {
    fieldE01PVDOFA.setString(newvalue);
  }

  /**
  * Get value of field E01PVDOFA as a String.
  */
  public String getE01PVDOFA()
  {
    return fieldE01PVDOFA.getString();
  }

  /**
  * Set numeric field E01PVDOFA using a BigDecimal value.
  */
  public void setE01PVDOFA(BigDecimal newvalue)
  {
    fieldE01PVDOFA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PVDOFA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PVDOFA()
  {
    return fieldE01PVDOFA.getBigDecimal();
  }

  /**
  * Set field E01PVDAPA using a String value.
  */
  public void setE01PVDAPA(String newvalue)
  {
    fieldE01PVDAPA.setString(newvalue);
  }

  /**
  * Get value of field E01PVDAPA as a String.
  */
  public String getE01PVDAPA()
  {
    return fieldE01PVDAPA.getString();
  }

  /**
  * Set numeric field E01PVDAPA using a BigDecimal value.
  */
  public void setE01PVDAPA(BigDecimal newvalue)
  {
    fieldE01PVDAPA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PVDAPA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PVDAPA()
  {
    return fieldE01PVDAPA.getBigDecimal();
  }

  /**
  * Set field E01PVDPAM using a String value.
  */
  public void setE01PVDPAM(String newvalue)
  {
    fieldE01PVDPAM.setString(newvalue);
  }

  /**
  * Get value of field E01PVDPAM as a String.
  */
  public String getE01PVDPAM()
  {
    return fieldE01PVDPAM.getString();
  }

  /**
  * Set numeric field E01PVDPAM using a BigDecimal value.
  */
  public void setE01PVDPAM(BigDecimal newvalue)
  {
    fieldE01PVDPAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PVDPAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PVDPAM()
  {
    return fieldE01PVDPAM.getBigDecimal();
  }

  /**
  * Set field E01PVDTRM using a String value.
  */
  public void setE01PVDTRM(String newvalue)
  {
    fieldE01PVDTRM.setString(newvalue);
  }

  /**
  * Get value of field E01PVDTRM as a String.
  */
  public String getE01PVDTRM()
  {
    return fieldE01PVDTRM.getString();
  }

  /**
  * Set numeric field E01PVDTRM using a BigDecimal value.
  */
  public void setE01PVDTRM(BigDecimal newvalue)
  {
    fieldE01PVDTRM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PVDTRM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PVDTRM()
  {
    return fieldE01PVDTRM.getBigDecimal();
  }

  /**
  * Set field E01PVDTRC using a String value.
  */
  public void setE01PVDTRC(String newvalue)
  {
    fieldE01PVDTRC.setString(newvalue);
  }

  /**
  * Get value of field E01PVDTRC as a String.
  */
  public String getE01PVDTRC()
  {
    return fieldE01PVDTRC.getString();
  }

  /**
  * Set field E01PVDRTE using a String value.
  */
  public void setE01PVDRTE(String newvalue)
  {
    fieldE01PVDRTE.setString(newvalue);
  }

  /**
  * Get value of field E01PVDRTE as a String.
  */
  public String getE01PVDRTE()
  {
    return fieldE01PVDRTE.getString();
  }

  /**
  * Set numeric field E01PVDRTE using a BigDecimal value.
  */
  public void setE01PVDRTE(BigDecimal newvalue)
  {
    fieldE01PVDRTE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PVDRTE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PVDRTE()
  {
    return fieldE01PVDRTE.getBigDecimal();
  }

  /**
  * Set field E01PVDPNU using a String value.
  */
  public void setE01PVDPNU(String newvalue)
  {
    fieldE01PVDPNU.setString(newvalue);
  }

  /**
  * Get value of field E01PVDPNU as a String.
  */
  public String getE01PVDPNU()
  {
    return fieldE01PVDPNU.getString();
  }

  /**
  * Set numeric field E01PVDPNU using a BigDecimal value.
  */
  public void setE01PVDPNU(BigDecimal newvalue)
  {
    fieldE01PVDPNU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PVDPNU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PVDPNU()
  {
    return fieldE01PVDPNU.getBigDecimal();
  }

  /**
  * Set field E01PVDCNV using a String value.
  */
  public void setE01PVDCNV(String newvalue)
  {
    fieldE01PVDCNV.setString(newvalue);
  }

  /**
  * Get value of field E01PVDCNV as a String.
  */
  public String getE01PVDCNV()
  {
    return fieldE01PVDCNV.getString();
  }

  /**
  * Set numeric field E01PVDCNV using a BigDecimal value.
  */
  public void setE01PVDCNV(BigDecimal newvalue)
  {
    fieldE01PVDCNV.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PVDCNV as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PVDCNV()
  {
    return fieldE01PVDCNV.getBigDecimal();
  }

  /**
  * Set field E01PVDORG using a String value.
  */
  public void setE01PVDORG(String newvalue)
  {
    fieldE01PVDORG.setString(newvalue);
  }

  /**
  * Get value of field E01PVDORG as a String.
  */
  public String getE01PVDORG()
  {
    return fieldE01PVDORG.getString();
  }

  /**
  * Set field E01PVDORD using a String value.
  */
  public void setE01PVDORD(String newvalue)
  {
    fieldE01PVDORD.setString(newvalue);
  }

  /**
  * Get value of field E01PVDORD as a String.
  */
  public String getE01PVDORD()
  {
    return fieldE01PVDORD.getString();
  }

  /**
  * Set field E01PVDDST using a String value.
  */
  public void setE01PVDDST(String newvalue)
  {
    fieldE01PVDDST.setString(newvalue);
  }

  /**
  * Get value of field E01PVDDST as a String.
  */
  public String getE01PVDDST()
  {
    return fieldE01PVDDST.getString();
  }

  /**
  * Set field E01PVDDSD using a String value.
  */
  public void setE01PVDDSD(String newvalue)
  {
    fieldE01PVDDSD.setString(newvalue);
  }

  /**
  * Get value of field E01PVDDSD as a String.
  */
  public String getE01PVDDSD()
  {
    return fieldE01PVDDSD.getString();
  }

  /**
  * Set field PVMRTE using a String value.
  */
  public void setPVMRTE(String newvalue)
  {
    fieldPVMRTE.setString(newvalue);
  }

  /**
  * Get value of field PVMRTE as a String.
  */
  public String getPVMRTE()
  {
    return fieldPVMRTE.getString();
  }

  /**
  * Set field PVMRT1 using a String value.
  */
  public void setPVMRT1(String newvalue)
  {
    fieldPVMRT1.setString(newvalue);
  }

  /**
  * Get value of field PVMRT1 as a String.
  */
  public String getPVMRT1()
  {
    return fieldPVMRT1.getString();
  }

  /**
  * Set field PVMRT2 using a String value.
  */
  public void setPVMRT2(String newvalue)
  {
    fieldPVMRT2.setString(newvalue);
  }

  /**
  * Get value of field PVMRT2 as a String.
  */
  public String getPVMRT2()
  {
    return fieldPVMRT2.getString();
  }

  /**
  * Set field PVMMPB using a String value.
  */
  public void setPVMMPB(String newvalue)
  {
    fieldPVMMPB.setString(newvalue);
  }

  /**
  * Get value of field PVMMPB as a String.
  */
  public String getPVMMPB()
  {
    return fieldPVMMPB.getString();
  }

  /**
  * Set field PVMIRA using a String value.
  */
  public void setPVMIRA(String newvalue)
  {
    fieldPVMIRA.setString(newvalue);
  }

  /**
  * Get value of field PVMIRA as a String.
  */
  public String getPVMIRA()
  {
    return fieldPVMIRA.getString();
  }

  /**
  * Set numeric field PVMIRA using a BigDecimal value.
  */
  public void setPVMIRA(BigDecimal newvalue)
  {
    fieldPVMIRA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field PVMIRA as a BigDecimal.
  */
  public BigDecimal getBigDecimalPVMIRA()
  {
    return fieldPVMIRA.getBigDecimal();
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
  * Set field E01INDOPE using a String value.
  */
  public void setE01INDOPE(String newvalue)
  {
    fieldE01INDOPE.setString(newvalue);
  }

  /**
  * Get value of field E01INDOPE as a String.
  */
  public String getE01INDOPE()
  {
    return fieldE01INDOPE.getString();
  }

}
