package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESD081702 physical file definition.
* 
* File level identifier is 1160928171018.
* Record format level identifier is 34E38F7997C01.
*/

public class ESD081702Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H02USERID",
                                     "H02PROGRM",
                                     "H02TIMSYS",
                                     "H02SCRCOD",
                                     "H02OPECOD",
                                     "H02FLGMAS",
                                     "H02FLGWK1",
                                     "H02FLGWK2",
                                     "H02FLGWK3",
                                     "E02CIFACC",
                                     "E02CIFACD",
                                     "E02CIFPRD",
                                     "E02CIFCUN",
                                     "E02CUSNA1",
                                     "E02CIFBNK",
                                     "E02CIFBRN",
                                     "E02CIFCCY",
                                     "E02CIFGLN",
                                     "E02CIFATY",
                                     "E02CIFOFC",
                                     "E02CIFACS",
                                     "E02CUMMA1",
                                     "E02CUMMA2",
                                     "E02CUMMA3",
                                     "E02CUMMA4",
                                     "E02CUMCTY",
                                     "E02CUMCTR",
                                     "E02CUMSTE",
                                     "E02CUMZPC",
                                     "E02CUMPOB",
                                     "E02CUSIAD",
                                     "E02CUSFAX",
                                     "E02CUSMLC",
                                     "E02DSCTYP",
                                     "E02DSCPRO",
                                     "E02DSCOFC",
                                     "E02DATEAM",
                                     "E02DATEAD",
                                     "E02DATEAY",
                                     "E02DATEBM",
                                     "E02DATEBD",
                                     "E02DATEBY",
                                     "E02DATECM",
                                     "E02DATECD",
                                     "E02DATECY",
                                     "E02AMOUN1",
                                     "E02AMOUN2",
                                     "E02AMOUN3",
                                     "E02USRCO1",
                                     "E02USRCO2",
                                     "E02DSCCO1",
                                     "E02DSCCO2",
                                     "E02OFCEML",
                                     "E02OFCPHN",
                                     "E02OFCPXT",
                                     "E02OFCAOF",
                                     "E02LCMSTS"
                                   };
  final static String tnames[] = {
                                   "H02USERID",
                                   "H02PROGRM",
                                   "H02TIMSYS",
                                   "H02SCRCOD",
                                   "H02OPECOD",
                                   "H02FLGMAS",
                                   "H02FLGWK1",
                                   "H02FLGWK2",
                                   "H02FLGWK3",
                                   "E02CIFACC",
                                   "E02CIFACD",
                                   "E02CIFPRD",
                                   "E02CIFCUN",
                                   "E02CUSNA1",
                                   "E02CIFBNK",
                                   "E02CIFBRN",
                                   "E02CIFCCY",
                                   "E02CIFGLN",
                                   "E02CIFATY",
                                   "E02CIFOFC",
                                   "E02CIFACS",
                                   "E02CUMMA1",
                                   "E02CUMMA2",
                                   "E02CUMMA3",
                                   "E02CUMMA4",
                                   "E02CUMCTY",
                                   "E02CUMCTR",
                                   "E02CUMSTE",
                                   "E02CUMZPC",
                                   "E02CUMPOB",
                                   "E02CUSIAD",
                                   "E02CUSFAX",
                                   "E02CUSMLC",
                                   "E02DSCTYP",
                                   "E02DSCPRO",
                                   "E02DSCOFC",
                                   "E02DATEAM",
                                   "E02DATEAD",
                                   "E02DATEAY",
                                   "E02DATEBM",
                                   "E02DATEBD",
                                   "E02DATEBY",
                                   "E02DATECM",
                                   "E02DATECD",
                                   "E02DATECY",
                                   "E02AMOUN1",
                                   "E02AMOUN2",
                                   "E02AMOUN3",
                                   "E02USRCO1",
                                   "E02USRCO2",
                                   "E02DSCCO1",
                                   "E02DSCCO2",
                                   "E02OFCEML",
                                   "E02OFCPHN",
                                   "E02OFCPXT",
                                   "E02OFCAOF",
                                   "E02LCMSTS"
                                 };
  final static String fid = "1160928171018";
  final static String rid = "34E38F7997C01";
  final static String fmtname = "ESD081702";
  final int FIELDCOUNT = 57;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH02USERID = null;
  private CharacterField fieldH02PROGRM = null;
  private CharacterField fieldH02TIMSYS = null;
  private CharacterField fieldH02SCRCOD = null;
  private CharacterField fieldH02OPECOD = null;
  private CharacterField fieldH02FLGMAS = null;
  private CharacterField fieldH02FLGWK1 = null;
  private CharacterField fieldH02FLGWK2 = null;
  private CharacterField fieldH02FLGWK3 = null;
  private DecimalField fieldE02CIFACC = null;
  private CharacterField fieldE02CIFACD = null;
  private CharacterField fieldE02CIFPRD = null;
  private DecimalField fieldE02CIFCUN = null;
  private CharacterField fieldE02CUSNA1 = null;
  private CharacterField fieldE02CIFBNK = null;
  private DecimalField fieldE02CIFBRN = null;
  private CharacterField fieldE02CIFCCY = null;
  private DecimalField fieldE02CIFGLN = null;
  private CharacterField fieldE02CIFATY = null;
  private CharacterField fieldE02CIFOFC = null;
  private CharacterField fieldE02CIFACS = null;
  private CharacterField fieldE02CUMMA1 = null;
  private CharacterField fieldE02CUMMA2 = null;
  private CharacterField fieldE02CUMMA3 = null;
  private CharacterField fieldE02CUMMA4 = null;
  private CharacterField fieldE02CUMCTY = null;
  private CharacterField fieldE02CUMCTR = null;
  private CharacterField fieldE02CUMSTE = null;
  private CharacterField fieldE02CUMZPC = null;
  private CharacterField fieldE02CUMPOB = null;
  private CharacterField fieldE02CUSIAD = null;
  private DecimalField fieldE02CUSFAX = null;
  private CharacterField fieldE02CUSMLC = null;
  private CharacterField fieldE02DSCTYP = null;
  private CharacterField fieldE02DSCPRO = null;
  private CharacterField fieldE02DSCOFC = null;
  private DecimalField fieldE02DATEAM = null;
  private DecimalField fieldE02DATEAD = null;
  private DecimalField fieldE02DATEAY = null;
  private DecimalField fieldE02DATEBM = null;
  private DecimalField fieldE02DATEBD = null;
  private DecimalField fieldE02DATEBY = null;
  private DecimalField fieldE02DATECM = null;
  private DecimalField fieldE02DATECD = null;
  private DecimalField fieldE02DATECY = null;
  private DecimalField fieldE02AMOUN1 = null;
  private DecimalField fieldE02AMOUN2 = null;
  private DecimalField fieldE02AMOUN3 = null;
  private CharacterField fieldE02USRCO1 = null;
  private CharacterField fieldE02USRCO2 = null;
  private CharacterField fieldE02DSCCO1 = null;
  private CharacterField fieldE02DSCCO2 = null;
  private CharacterField fieldE02OFCEML = null;
  private DecimalField fieldE02OFCPHN = null;
  private DecimalField fieldE02OFCPXT = null;
  private CharacterField fieldE02OFCAOF = null;
  private CharacterField fieldE02LCMSTS = null;

  /**
  * Constructor for ESD081702Message.
  */
  public ESD081702Message()
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
    recordsize = 907;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH02USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H02USERID");
    fields[1] = fieldH02PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H02PROGRM");
    fields[2] = fieldH02TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H02TIMSYS");
    fields[3] = fieldH02SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H02SCRCOD");
    fields[4] = fieldH02OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H02OPECOD");
    fields[5] = fieldH02FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H02FLGMAS");
    fields[6] = fieldH02FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H02FLGWK1");
    fields[7] = fieldH02FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H02FLGWK2");
    fields[8] = fieldH02FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H02FLGWK3");
    fields[9] = fieldE02CIFACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E02CIFACC");
    fields[10] = fieldE02CIFACD =
    new CharacterField(message, HEADERSIZE + 55, 2, "E02CIFACD");
    fields[11] = fieldE02CIFPRD =
    new CharacterField(message, HEADERSIZE + 57, 4, "E02CIFPRD");
    fields[12] = fieldE02CIFCUN =
    new DecimalField(message, HEADERSIZE + 61, 10, 0, "E02CIFCUN");
    fields[13] = fieldE02CUSNA1 =
    new CharacterField(message, HEADERSIZE + 71, 60, "E02CUSNA1");
    fields[14] = fieldE02CIFBNK =
    new CharacterField(message, HEADERSIZE + 131, 2, "E02CIFBNK");
    fields[15] = fieldE02CIFBRN =
    new DecimalField(message, HEADERSIZE + 133, 5, 0, "E02CIFBRN");
    fields[16] = fieldE02CIFCCY =
    new CharacterField(message, HEADERSIZE + 138, 3, "E02CIFCCY");
    fields[17] = fieldE02CIFGLN =
    new DecimalField(message, HEADERSIZE + 141, 17, 0, "E02CIFGLN");
    fields[18] = fieldE02CIFATY =
    new CharacterField(message, HEADERSIZE + 158, 4, "E02CIFATY");
    fields[19] = fieldE02CIFOFC =
    new CharacterField(message, HEADERSIZE + 162, 4, "E02CIFOFC");
    fields[20] = fieldE02CIFACS =
    new CharacterField(message, HEADERSIZE + 166, 1, "E02CIFACS");
    fields[21] = fieldE02CUMMA1 =
    new CharacterField(message, HEADERSIZE + 167, 60, "E02CUMMA1");
    fields[22] = fieldE02CUMMA2 =
    new CharacterField(message, HEADERSIZE + 227, 60, "E02CUMMA2");
    fields[23] = fieldE02CUMMA3 =
    new CharacterField(message, HEADERSIZE + 287, 60, "E02CUMMA3");
    fields[24] = fieldE02CUMMA4 =
    new CharacterField(message, HEADERSIZE + 347, 60, "E02CUMMA4");
    fields[25] = fieldE02CUMCTY =
    new CharacterField(message, HEADERSIZE + 407, 35, "E02CUMCTY");
    fields[26] = fieldE02CUMCTR =
    new CharacterField(message, HEADERSIZE + 442, 35, "E02CUMCTR");
    fields[27] = fieldE02CUMSTE =
    new CharacterField(message, HEADERSIZE + 477, 4, "E02CUMSTE");
    fields[28] = fieldE02CUMZPC =
    new CharacterField(message, HEADERSIZE + 481, 15, "E02CUMZPC");
    fields[29] = fieldE02CUMPOB =
    new CharacterField(message, HEADERSIZE + 496, 10, "E02CUMPOB");
    fields[30] = fieldE02CUSIAD =
    new CharacterField(message, HEADERSIZE + 506, 60, "E02CUSIAD");
    fields[31] = fieldE02CUSFAX =
    new DecimalField(message, HEADERSIZE + 566, 16, 0, "E02CUSFAX");
    fields[32] = fieldE02CUSMLC =
    new CharacterField(message, HEADERSIZE + 582, 4, "E02CUSMLC");
    fields[33] = fieldE02DSCTYP =
    new CharacterField(message, HEADERSIZE + 586, 45, "E02DSCTYP");
    fields[34] = fieldE02DSCPRO =
    new CharacterField(message, HEADERSIZE + 631, 45, "E02DSCPRO");
    fields[35] = fieldE02DSCOFC =
    new CharacterField(message, HEADERSIZE + 676, 45, "E02DSCOFC");
    fields[36] = fieldE02DATEAM =
    new DecimalField(message, HEADERSIZE + 721, 3, 0, "E02DATEAM");
    fields[37] = fieldE02DATEAD =
    new DecimalField(message, HEADERSIZE + 724, 3, 0, "E02DATEAD");
    fields[38] = fieldE02DATEAY =
    new DecimalField(message, HEADERSIZE + 727, 5, 0, "E02DATEAY");
    fields[39] = fieldE02DATEBM =
    new DecimalField(message, HEADERSIZE + 732, 3, 0, "E02DATEBM");
    fields[40] = fieldE02DATEBD =
    new DecimalField(message, HEADERSIZE + 735, 3, 0, "E02DATEBD");
    fields[41] = fieldE02DATEBY =
    new DecimalField(message, HEADERSIZE + 738, 5, 0, "E02DATEBY");
    fields[42] = fieldE02DATECM =
    new DecimalField(message, HEADERSIZE + 743, 3, 0, "E02DATECM");
    fields[43] = fieldE02DATECD =
    new DecimalField(message, HEADERSIZE + 746, 3, 0, "E02DATECD");
    fields[44] = fieldE02DATECY =
    new DecimalField(message, HEADERSIZE + 749, 5, 0, "E02DATECY");
    fields[45] = fieldE02AMOUN1 =
    new DecimalField(message, HEADERSIZE + 754, 17, 2, "E02AMOUN1");
    fields[46] = fieldE02AMOUN2 =
    new DecimalField(message, HEADERSIZE + 771, 17, 2, "E02AMOUN2");
    fields[47] = fieldE02AMOUN3 =
    new DecimalField(message, HEADERSIZE + 788, 17, 2, "E02AMOUN3");
    fields[48] = fieldE02USRCO1 =
    new CharacterField(message, HEADERSIZE + 805, 4, "E02USRCO1");
    fields[49] = fieldE02USRCO2 =
    new CharacterField(message, HEADERSIZE + 809, 4, "E02USRCO2");
    fields[50] = fieldE02DSCCO1 =
    new CharacterField(message, HEADERSIZE + 813, 4, "E02DSCCO1");
    fields[51] = fieldE02DSCCO2 =
    new CharacterField(message, HEADERSIZE + 817, 4, "E02DSCCO2");
    fields[52] = fieldE02OFCEML =
    new CharacterField(message, HEADERSIZE + 821, 60, "E02OFCEML");
    fields[53] = fieldE02OFCPHN =
    new DecimalField(message, HEADERSIZE + 881, 16, 0, "E02OFCPHN");
    fields[54] = fieldE02OFCPXT =
    new DecimalField(message, HEADERSIZE + 897, 5, 0, "E02OFCPXT");
    fields[55] = fieldE02OFCAOF =
    new CharacterField(message, HEADERSIZE + 902, 4, "E02OFCAOF");
    fields[56] = fieldE02LCMSTS =
    new CharacterField(message, HEADERSIZE + 906, 1, "E02LCMSTS");

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
  * Set field H02USERID using a String value.
  */
  public void setH02USERID(String newvalue)
  {
    fieldH02USERID.setString(newvalue);
  }

  /**
  * Get value of field H02USERID as a String.
  */
  public String getH02USERID()
  {
    return fieldH02USERID.getString();
  }

  /**
  * Set field H02PROGRM using a String value.
  */
  public void setH02PROGRM(String newvalue)
  {
    fieldH02PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H02PROGRM as a String.
  */
  public String getH02PROGRM()
  {
    return fieldH02PROGRM.getString();
  }

  /**
  * Set field H02TIMSYS using a String value.
  */
  public void setH02TIMSYS(String newvalue)
  {
    fieldH02TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H02TIMSYS as a String.
  */
  public String getH02TIMSYS()
  {
    return fieldH02TIMSYS.getString();
  }

  /**
  * Set field H02SCRCOD using a String value.
  */
  public void setH02SCRCOD(String newvalue)
  {
    fieldH02SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H02SCRCOD as a String.
  */
  public String getH02SCRCOD()
  {
    return fieldH02SCRCOD.getString();
  }

  /**
  * Set field H02OPECOD using a String value.
  */
  public void setH02OPECOD(String newvalue)
  {
    fieldH02OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H02OPECOD as a String.
  */
  public String getH02OPECOD()
  {
    return fieldH02OPECOD.getString();
  }

  /**
  * Set field H02FLGMAS using a String value.
  */
  public void setH02FLGMAS(String newvalue)
  {
    fieldH02FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H02FLGMAS as a String.
  */
  public String getH02FLGMAS()
  {
    return fieldH02FLGMAS.getString();
  }

  /**
  * Set field H02FLGWK1 using a String value.
  */
  public void setH02FLGWK1(String newvalue)
  {
    fieldH02FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK1 as a String.
  */
  public String getH02FLGWK1()
  {
    return fieldH02FLGWK1.getString();
  }

  /**
  * Set field H02FLGWK2 using a String value.
  */
  public void setH02FLGWK2(String newvalue)
  {
    fieldH02FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK2 as a String.
  */
  public String getH02FLGWK2()
  {
    return fieldH02FLGWK2.getString();
  }

  /**
  * Set field H02FLGWK3 using a String value.
  */
  public void setH02FLGWK3(String newvalue)
  {
    fieldH02FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK3 as a String.
  */
  public String getH02FLGWK3()
  {
    return fieldH02FLGWK3.getString();
  }

  /**
  * Set field E02CIFACC using a String value.
  */
  public void setE02CIFACC(String newvalue)
  {
    fieldE02CIFACC.setString(newvalue);
  }

  /**
  * Get value of field E02CIFACC as a String.
  */
  public String getE02CIFACC()
  {
    return fieldE02CIFACC.getString();
  }

  /**
  * Set numeric field E02CIFACC using a BigDecimal value.
  */
  public void setE02CIFACC(BigDecimal newvalue)
  {
    fieldE02CIFACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CIFACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CIFACC()
  {
    return fieldE02CIFACC.getBigDecimal();
  }

  /**
  * Set field E02CIFACD using a String value.
  */
  public void setE02CIFACD(String newvalue)
  {
    fieldE02CIFACD.setString(newvalue);
  }

  /**
  * Get value of field E02CIFACD as a String.
  */
  public String getE02CIFACD()
  {
    return fieldE02CIFACD.getString();
  }

  /**
  * Set field E02CIFPRD using a String value.
  */
  public void setE02CIFPRD(String newvalue)
  {
    fieldE02CIFPRD.setString(newvalue);
  }

  /**
  * Get value of field E02CIFPRD as a String.
  */
  public String getE02CIFPRD()
  {
    return fieldE02CIFPRD.getString();
  }

  /**
  * Set field E02CIFCUN using a String value.
  */
  public void setE02CIFCUN(String newvalue)
  {
    fieldE02CIFCUN.setString(newvalue);
  }

  /**
  * Get value of field E02CIFCUN as a String.
  */
  public String getE02CIFCUN()
  {
    return fieldE02CIFCUN.getString();
  }

  /**
  * Set numeric field E02CIFCUN using a BigDecimal value.
  */
  public void setE02CIFCUN(BigDecimal newvalue)
  {
    fieldE02CIFCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CIFCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CIFCUN()
  {
    return fieldE02CIFCUN.getBigDecimal();
  }

  /**
  * Set field E02CUSNA1 using a String value.
  */
  public void setE02CUSNA1(String newvalue)
  {
    fieldE02CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E02CUSNA1 as a String.
  */
  public String getE02CUSNA1()
  {
    return fieldE02CUSNA1.getString();
  }

  /**
  * Set field E02CIFBNK using a String value.
  */
  public void setE02CIFBNK(String newvalue)
  {
    fieldE02CIFBNK.setString(newvalue);
  }

  /**
  * Get value of field E02CIFBNK as a String.
  */
  public String getE02CIFBNK()
  {
    return fieldE02CIFBNK.getString();
  }

  /**
  * Set field E02CIFBRN using a String value.
  */
  public void setE02CIFBRN(String newvalue)
  {
    fieldE02CIFBRN.setString(newvalue);
  }

  /**
  * Get value of field E02CIFBRN as a String.
  */
  public String getE02CIFBRN()
  {
    return fieldE02CIFBRN.getString();
  }

  /**
  * Set numeric field E02CIFBRN using a BigDecimal value.
  */
  public void setE02CIFBRN(BigDecimal newvalue)
  {
    fieldE02CIFBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CIFBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CIFBRN()
  {
    return fieldE02CIFBRN.getBigDecimal();
  }

  /**
  * Set field E02CIFCCY using a String value.
  */
  public void setE02CIFCCY(String newvalue)
  {
    fieldE02CIFCCY.setString(newvalue);
  }

  /**
  * Get value of field E02CIFCCY as a String.
  */
  public String getE02CIFCCY()
  {
    return fieldE02CIFCCY.getString();
  }

  /**
  * Set field E02CIFGLN using a String value.
  */
  public void setE02CIFGLN(String newvalue)
  {
    fieldE02CIFGLN.setString(newvalue);
  }

  /**
  * Get value of field E02CIFGLN as a String.
  */
  public String getE02CIFGLN()
  {
    return fieldE02CIFGLN.getString();
  }

  /**
  * Set numeric field E02CIFGLN using a BigDecimal value.
  */
  public void setE02CIFGLN(BigDecimal newvalue)
  {
    fieldE02CIFGLN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CIFGLN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CIFGLN()
  {
    return fieldE02CIFGLN.getBigDecimal();
  }

  /**
  * Set field E02CIFATY using a String value.
  */
  public void setE02CIFATY(String newvalue)
  {
    fieldE02CIFATY.setString(newvalue);
  }

  /**
  * Get value of field E02CIFATY as a String.
  */
  public String getE02CIFATY()
  {
    return fieldE02CIFATY.getString();
  }

  /**
  * Set field E02CIFOFC using a String value.
  */
  public void setE02CIFOFC(String newvalue)
  {
    fieldE02CIFOFC.setString(newvalue);
  }

  /**
  * Get value of field E02CIFOFC as a String.
  */
  public String getE02CIFOFC()
  {
    return fieldE02CIFOFC.getString();
  }

  /**
  * Set field E02CIFACS using a String value.
  */
  public void setE02CIFACS(String newvalue)
  {
    fieldE02CIFACS.setString(newvalue);
  }

  /**
  * Get value of field E02CIFACS as a String.
  */
  public String getE02CIFACS()
  {
    return fieldE02CIFACS.getString();
  }

  /**
  * Set field E02CUMMA1 using a String value.
  */
  public void setE02CUMMA1(String newvalue)
  {
    fieldE02CUMMA1.setString(newvalue);
  }

  /**
  * Get value of field E02CUMMA1 as a String.
  */
  public String getE02CUMMA1()
  {
    return fieldE02CUMMA1.getString();
  }

  /**
  * Set field E02CUMMA2 using a String value.
  */
  public void setE02CUMMA2(String newvalue)
  {
    fieldE02CUMMA2.setString(newvalue);
  }

  /**
  * Get value of field E02CUMMA2 as a String.
  */
  public String getE02CUMMA2()
  {
    return fieldE02CUMMA2.getString();
  }

  /**
  * Set field E02CUMMA3 using a String value.
  */
  public void setE02CUMMA3(String newvalue)
  {
    fieldE02CUMMA3.setString(newvalue);
  }

  /**
  * Get value of field E02CUMMA3 as a String.
  */
  public String getE02CUMMA3()
  {
    return fieldE02CUMMA3.getString();
  }

  /**
  * Set field E02CUMMA4 using a String value.
  */
  public void setE02CUMMA4(String newvalue)
  {
    fieldE02CUMMA4.setString(newvalue);
  }

  /**
  * Get value of field E02CUMMA4 as a String.
  */
  public String getE02CUMMA4()
  {
    return fieldE02CUMMA4.getString();
  }

  /**
  * Set field E02CUMCTY using a String value.
  */
  public void setE02CUMCTY(String newvalue)
  {
    fieldE02CUMCTY.setString(newvalue);
  }

  /**
  * Get value of field E02CUMCTY as a String.
  */
  public String getE02CUMCTY()
  {
    return fieldE02CUMCTY.getString();
  }

  /**
  * Set field E02CUMCTR using a String value.
  */
  public void setE02CUMCTR(String newvalue)
  {
    fieldE02CUMCTR.setString(newvalue);
  }

  /**
  * Get value of field E02CUMCTR as a String.
  */
  public String getE02CUMCTR()
  {
    return fieldE02CUMCTR.getString();
  }

  /**
  * Set field E02CUMSTE using a String value.
  */
  public void setE02CUMSTE(String newvalue)
  {
    fieldE02CUMSTE.setString(newvalue);
  }

  /**
  * Get value of field E02CUMSTE as a String.
  */
  public String getE02CUMSTE()
  {
    return fieldE02CUMSTE.getString();
  }

  /**
  * Set field E02CUMZPC using a String value.
  */
  public void setE02CUMZPC(String newvalue)
  {
    fieldE02CUMZPC.setString(newvalue);
  }

  /**
  * Get value of field E02CUMZPC as a String.
  */
  public String getE02CUMZPC()
  {
    return fieldE02CUMZPC.getString();
  }

  /**
  * Set field E02CUMPOB using a String value.
  */
  public void setE02CUMPOB(String newvalue)
  {
    fieldE02CUMPOB.setString(newvalue);
  }

  /**
  * Get value of field E02CUMPOB as a String.
  */
  public String getE02CUMPOB()
  {
    return fieldE02CUMPOB.getString();
  }

  /**
  * Set field E02CUSIAD using a String value.
  */
  public void setE02CUSIAD(String newvalue)
  {
    fieldE02CUSIAD.setString(newvalue);
  }

  /**
  * Get value of field E02CUSIAD as a String.
  */
  public String getE02CUSIAD()
  {
    return fieldE02CUSIAD.getString();
  }

  /**
  * Set field E02CUSFAX using a String value.
  */
  public void setE02CUSFAX(String newvalue)
  {
    fieldE02CUSFAX.setString(newvalue);
  }

  /**
  * Get value of field E02CUSFAX as a String.
  */
  public String getE02CUSFAX()
  {
    return fieldE02CUSFAX.getString();
  }

  /**
  * Set numeric field E02CUSFAX using a BigDecimal value.
  */
  public void setE02CUSFAX(BigDecimal newvalue)
  {
    fieldE02CUSFAX.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CUSFAX as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CUSFAX()
  {
    return fieldE02CUSFAX.getBigDecimal();
  }

  /**
  * Set field E02CUSMLC using a String value.
  */
  public void setE02CUSMLC(String newvalue)
  {
    fieldE02CUSMLC.setString(newvalue);
  }

  /**
  * Get value of field E02CUSMLC as a String.
  */
  public String getE02CUSMLC()
  {
    return fieldE02CUSMLC.getString();
  }

  /**
  * Set field E02DSCTYP using a String value.
  */
  public void setE02DSCTYP(String newvalue)
  {
    fieldE02DSCTYP.setString(newvalue);
  }

  /**
  * Get value of field E02DSCTYP as a String.
  */
  public String getE02DSCTYP()
  {
    return fieldE02DSCTYP.getString();
  }

  /**
  * Set field E02DSCPRO using a String value.
  */
  public void setE02DSCPRO(String newvalue)
  {
    fieldE02DSCPRO.setString(newvalue);
  }

  /**
  * Get value of field E02DSCPRO as a String.
  */
  public String getE02DSCPRO()
  {
    return fieldE02DSCPRO.getString();
  }

  /**
  * Set field E02DSCOFC using a String value.
  */
  public void setE02DSCOFC(String newvalue)
  {
    fieldE02DSCOFC.setString(newvalue);
  }

  /**
  * Get value of field E02DSCOFC as a String.
  */
  public String getE02DSCOFC()
  {
    return fieldE02DSCOFC.getString();
  }

  /**
  * Set field E02DATEAM using a String value.
  */
  public void setE02DATEAM(String newvalue)
  {
    fieldE02DATEAM.setString(newvalue);
  }

  /**
  * Get value of field E02DATEAM as a String.
  */
  public String getE02DATEAM()
  {
    return fieldE02DATEAM.getString();
  }

  /**
  * Set numeric field E02DATEAM using a BigDecimal value.
  */
  public void setE02DATEAM(BigDecimal newvalue)
  {
    fieldE02DATEAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DATEAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DATEAM()
  {
    return fieldE02DATEAM.getBigDecimal();
  }

  /**
  * Set field E02DATEAD using a String value.
  */
  public void setE02DATEAD(String newvalue)
  {
    fieldE02DATEAD.setString(newvalue);
  }

  /**
  * Get value of field E02DATEAD as a String.
  */
  public String getE02DATEAD()
  {
    return fieldE02DATEAD.getString();
  }

  /**
  * Set numeric field E02DATEAD using a BigDecimal value.
  */
  public void setE02DATEAD(BigDecimal newvalue)
  {
    fieldE02DATEAD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DATEAD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DATEAD()
  {
    return fieldE02DATEAD.getBigDecimal();
  }

  /**
  * Set field E02DATEAY using a String value.
  */
  public void setE02DATEAY(String newvalue)
  {
    fieldE02DATEAY.setString(newvalue);
  }

  /**
  * Get value of field E02DATEAY as a String.
  */
  public String getE02DATEAY()
  {
    return fieldE02DATEAY.getString();
  }

  /**
  * Set numeric field E02DATEAY using a BigDecimal value.
  */
  public void setE02DATEAY(BigDecimal newvalue)
  {
    fieldE02DATEAY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DATEAY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DATEAY()
  {
    return fieldE02DATEAY.getBigDecimal();
  }

  /**
  * Set field E02DATEBM using a String value.
  */
  public void setE02DATEBM(String newvalue)
  {
    fieldE02DATEBM.setString(newvalue);
  }

  /**
  * Get value of field E02DATEBM as a String.
  */
  public String getE02DATEBM()
  {
    return fieldE02DATEBM.getString();
  }

  /**
  * Set numeric field E02DATEBM using a BigDecimal value.
  */
  public void setE02DATEBM(BigDecimal newvalue)
  {
    fieldE02DATEBM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DATEBM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DATEBM()
  {
    return fieldE02DATEBM.getBigDecimal();
  }

  /**
  * Set field E02DATEBD using a String value.
  */
  public void setE02DATEBD(String newvalue)
  {
    fieldE02DATEBD.setString(newvalue);
  }

  /**
  * Get value of field E02DATEBD as a String.
  */
  public String getE02DATEBD()
  {
    return fieldE02DATEBD.getString();
  }

  /**
  * Set numeric field E02DATEBD using a BigDecimal value.
  */
  public void setE02DATEBD(BigDecimal newvalue)
  {
    fieldE02DATEBD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DATEBD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DATEBD()
  {
    return fieldE02DATEBD.getBigDecimal();
  }

  /**
  * Set field E02DATEBY using a String value.
  */
  public void setE02DATEBY(String newvalue)
  {
    fieldE02DATEBY.setString(newvalue);
  }

  /**
  * Get value of field E02DATEBY as a String.
  */
  public String getE02DATEBY()
  {
    return fieldE02DATEBY.getString();
  }

  /**
  * Set numeric field E02DATEBY using a BigDecimal value.
  */
  public void setE02DATEBY(BigDecimal newvalue)
  {
    fieldE02DATEBY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DATEBY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DATEBY()
  {
    return fieldE02DATEBY.getBigDecimal();
  }

  /**
  * Set field E02DATECM using a String value.
  */
  public void setE02DATECM(String newvalue)
  {
    fieldE02DATECM.setString(newvalue);
  }

  /**
  * Get value of field E02DATECM as a String.
  */
  public String getE02DATECM()
  {
    return fieldE02DATECM.getString();
  }

  /**
  * Set numeric field E02DATECM using a BigDecimal value.
  */
  public void setE02DATECM(BigDecimal newvalue)
  {
    fieldE02DATECM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DATECM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DATECM()
  {
    return fieldE02DATECM.getBigDecimal();
  }

  /**
  * Set field E02DATECD using a String value.
  */
  public void setE02DATECD(String newvalue)
  {
    fieldE02DATECD.setString(newvalue);
  }

  /**
  * Get value of field E02DATECD as a String.
  */
  public String getE02DATECD()
  {
    return fieldE02DATECD.getString();
  }

  /**
  * Set numeric field E02DATECD using a BigDecimal value.
  */
  public void setE02DATECD(BigDecimal newvalue)
  {
    fieldE02DATECD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DATECD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DATECD()
  {
    return fieldE02DATECD.getBigDecimal();
  }

  /**
  * Set field E02DATECY using a String value.
  */
  public void setE02DATECY(String newvalue)
  {
    fieldE02DATECY.setString(newvalue);
  }

  /**
  * Get value of field E02DATECY as a String.
  */
  public String getE02DATECY()
  {
    return fieldE02DATECY.getString();
  }

  /**
  * Set numeric field E02DATECY using a BigDecimal value.
  */
  public void setE02DATECY(BigDecimal newvalue)
  {
    fieldE02DATECY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02DATECY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02DATECY()
  {
    return fieldE02DATECY.getBigDecimal();
  }

  /**
  * Set field E02AMOUN1 using a String value.
  */
  public void setE02AMOUN1(String newvalue)
  {
    fieldE02AMOUN1.setString(newvalue);
  }

  /**
  * Get value of field E02AMOUN1 as a String.
  */
  public String getE02AMOUN1()
  {
    return fieldE02AMOUN1.getString();
  }

  /**
  * Set numeric field E02AMOUN1 using a BigDecimal value.
  */
  public void setE02AMOUN1(BigDecimal newvalue)
  {
    fieldE02AMOUN1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02AMOUN1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02AMOUN1()
  {
    return fieldE02AMOUN1.getBigDecimal();
  }

  /**
  * Set field E02AMOUN2 using a String value.
  */
  public void setE02AMOUN2(String newvalue)
  {
    fieldE02AMOUN2.setString(newvalue);
  }

  /**
  * Get value of field E02AMOUN2 as a String.
  */
  public String getE02AMOUN2()
  {
    return fieldE02AMOUN2.getString();
  }

  /**
  * Set numeric field E02AMOUN2 using a BigDecimal value.
  */
  public void setE02AMOUN2(BigDecimal newvalue)
  {
    fieldE02AMOUN2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02AMOUN2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02AMOUN2()
  {
    return fieldE02AMOUN2.getBigDecimal();
  }

  /**
  * Set field E02AMOUN3 using a String value.
  */
  public void setE02AMOUN3(String newvalue)
  {
    fieldE02AMOUN3.setString(newvalue);
  }

  /**
  * Get value of field E02AMOUN3 as a String.
  */
  public String getE02AMOUN3()
  {
    return fieldE02AMOUN3.getString();
  }

  /**
  * Set numeric field E02AMOUN3 using a BigDecimal value.
  */
  public void setE02AMOUN3(BigDecimal newvalue)
  {
    fieldE02AMOUN3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02AMOUN3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02AMOUN3()
  {
    return fieldE02AMOUN3.getBigDecimal();
  }

  /**
  * Set field E02USRCO1 using a String value.
  */
  public void setE02USRCO1(String newvalue)
  {
    fieldE02USRCO1.setString(newvalue);
  }

  /**
  * Get value of field E02USRCO1 as a String.
  */
  public String getE02USRCO1()
  {
    return fieldE02USRCO1.getString();
  }

  /**
  * Set field E02USRCO2 using a String value.
  */
  public void setE02USRCO2(String newvalue)
  {
    fieldE02USRCO2.setString(newvalue);
  }

  /**
  * Get value of field E02USRCO2 as a String.
  */
  public String getE02USRCO2()
  {
    return fieldE02USRCO2.getString();
  }

  /**
  * Set field E02DSCCO1 using a String value.
  */
  public void setE02DSCCO1(String newvalue)
  {
    fieldE02DSCCO1.setString(newvalue);
  }

  /**
  * Get value of field E02DSCCO1 as a String.
  */
  public String getE02DSCCO1()
  {
    return fieldE02DSCCO1.getString();
  }

  /**
  * Set field E02DSCCO2 using a String value.
  */
  public void setE02DSCCO2(String newvalue)
  {
    fieldE02DSCCO2.setString(newvalue);
  }

  /**
  * Get value of field E02DSCCO2 as a String.
  */
  public String getE02DSCCO2()
  {
    return fieldE02DSCCO2.getString();
  }

  /**
  * Set field E02OFCEML using a String value.
  */
  public void setE02OFCEML(String newvalue)
  {
    fieldE02OFCEML.setString(newvalue);
  }

  /**
  * Get value of field E02OFCEML as a String.
  */
  public String getE02OFCEML()
  {
    return fieldE02OFCEML.getString();
  }

  /**
  * Set field E02OFCPHN using a String value.
  */
  public void setE02OFCPHN(String newvalue)
  {
    fieldE02OFCPHN.setString(newvalue);
  }

  /**
  * Get value of field E02OFCPHN as a String.
  */
  public String getE02OFCPHN()
  {
    return fieldE02OFCPHN.getString();
  }

  /**
  * Set numeric field E02OFCPHN using a BigDecimal value.
  */
  public void setE02OFCPHN(BigDecimal newvalue)
  {
    fieldE02OFCPHN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02OFCPHN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02OFCPHN()
  {
    return fieldE02OFCPHN.getBigDecimal();
  }

  /**
  * Set field E02OFCPXT using a String value.
  */
  public void setE02OFCPXT(String newvalue)
  {
    fieldE02OFCPXT.setString(newvalue);
  }

  /**
  * Get value of field E02OFCPXT as a String.
  */
  public String getE02OFCPXT()
  {
    return fieldE02OFCPXT.getString();
  }

  /**
  * Set numeric field E02OFCPXT using a BigDecimal value.
  */
  public void setE02OFCPXT(BigDecimal newvalue)
  {
    fieldE02OFCPXT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02OFCPXT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02OFCPXT()
  {
    return fieldE02OFCPXT.getBigDecimal();
  }

  /**
  * Set field E02OFCAOF using a String value.
  */
  public void setE02OFCAOF(String newvalue)
  {
    fieldE02OFCAOF.setString(newvalue);
  }

  /**
  * Get value of field E02OFCAOF as a String.
  */
  public String getE02OFCAOF()
  {
    return fieldE02OFCAOF.getString();
  }

  /**
  * Set field E02LCMSTS using a String value.
  */
  public void setE02LCMSTS(String newvalue)
  {
    fieldE02LCMSTS.setString(newvalue);
  }

  /**
  * Get value of field E02LCMSTS as a String.
  */
  public String getE02LCMSTS()
  {
    return fieldE02LCMSTS.getString();
  }

}