package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EPV113001 physical file definition.
* 
* File level identifier is 1150331100718.
* Record format level identifier is 286690CEA2244.
*/

public class EPV113001Message extends MessageRecord
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
                                     "E01PFNCUN",
                                     "E01PFNSEQ",
                                     "E01PFNNUM",
                                     "E01PFNCOD",
                                     "E01PFNACC",
                                     "E01PFNPAC",
                                     "E01PFNDSC",
                                     "E01PFNCUP",
                                     "E01PFNCNM",
                                     "E01PFNCSQ",
                                     "E01PFNOAM",
                                     "E01PFNFTB",
                                     "E01PFNFTY",
                                     "E01PFNFRT",
                                     "E01PFNRTE",
                                     "E01TOTRTE",
                                     "E01PFNPRD",
                                     "E01DSCPRD",
                                     "E01PFNVCU",
                                     "E01PFNVCO",
                                     "E01PFNBNK",
                                     "E01PFNBRN",
                                     "E01PFNOBK",
                                     "E01PFNOBR",
                                     "E01PFNOCY",
                                     "E01PFNOGL",
                                     "E01FLGFLT",
                                     "E01PFNRTX",
                                     "E01PFNFLX",
                                     "E01FLTORG",
                                     "E01FLTDSC"
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
                                   "E01PFNCUN",
                                   "E01PFNSEQ",
                                   "E01PFNNUM",
                                   "E01PFNCOD",
                                   "E01PFNACC",
                                   "E01PFNPAC",
                                   "E01PFNDSC",
                                   "E01PFNCUP",
                                   "E01PFNCNM",
                                   "E01PFNCSQ",
                                   "E01PFNOAM",
                                   "E01PFNFTB",
                                   "E01PFNFTY",
                                   "E01PFNFRT",
                                   "E01PFNRTE",
                                   "E01TOTRTE",
                                   "E01PFNPRD",
                                   "E01DSCPRD",
                                   "E01PFNVCU",
                                   "E01PFNVCO",
                                   "E01PFNBNK",
                                   "E01PFNBRN",
                                   "E01PFNOBK",
                                   "E01PFNOBR",
                                   "E01PFNOCY",
                                   "E01PFNOGL",
                                   "E01FLGFLT",
                                   "E01PFNRTX",
                                   "E01PFNFLX",
                                   "E01FLTORG",
                                   "E01FLTDSC"
                                 };
  final static String fid = "1150331100718";
  final static String rid = "286690CEA2244";
  final static String fmtname = "EPV113001";
  final int FIELDCOUNT = 40;
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
  private DecimalField fieldE01PFNCUN = null;
  private DecimalField fieldE01PFNSEQ = null;
  private DecimalField fieldE01PFNNUM = null;
  private CharacterField fieldE01PFNCOD = null;
  private DecimalField fieldE01PFNACC = null;
  private DecimalField fieldE01PFNPAC = null;
  private CharacterField fieldE01PFNDSC = null;
  private DecimalField fieldE01PFNCUP = null;
  private CharacterField fieldE01PFNCNM = null;
  private DecimalField fieldE01PFNCSQ = null;
  private DecimalField fieldE01PFNOAM = null;
  private CharacterField fieldE01PFNFTB = null;
  private CharacterField fieldE01PFNFTY = null;
  private DecimalField fieldE01PFNFRT = null;
  private DecimalField fieldE01PFNRTE = null;
  private DecimalField fieldE01TOTRTE = null;
  private CharacterField fieldE01PFNPRD = null;
  private CharacterField fieldE01DSCPRD = null;
  private DecimalField fieldE01PFNVCU = null;
  private DecimalField fieldE01PFNVCO = null;
  private CharacterField fieldE01PFNBNK = null;
  private DecimalField fieldE01PFNBRN = null;
  private CharacterField fieldE01PFNOBK = null;
  private DecimalField fieldE01PFNOBR = null;
  private CharacterField fieldE01PFNOCY = null;
  private DecimalField fieldE01PFNOGL = null;
  private CharacterField fieldE01FLGFLT = null;
  private DecimalField fieldE01PFNRTX = null;
  private CharacterField fieldE01PFNFLX = null;
  private DecimalField fieldE01FLTORG = null;
  private CharacterField fieldE01FLTDSC = null;

  /**
  * Constructor for EPV113001Message.
  */
  public EPV113001Message()
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
    recordsize = 441;
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
    fields[9] = fieldE01PFNCUN =
    new DecimalField(message, HEADERSIZE + 42, 10, 0, "E01PFNCUN");
    fields[10] = fieldE01PFNSEQ =
    new DecimalField(message, HEADERSIZE + 52, 3, 0, "E01PFNSEQ");
    fields[11] = fieldE01PFNNUM =
    new DecimalField(message, HEADERSIZE + 55, 13, 0, "E01PFNNUM");
    fields[12] = fieldE01PFNCOD =
    new CharacterField(message, HEADERSIZE + 68, 4, "E01PFNCOD");
    fields[13] = fieldE01PFNACC =
    new DecimalField(message, HEADERSIZE + 72, 13, 0, "E01PFNACC");
    fields[14] = fieldE01PFNPAC =
    new DecimalField(message, HEADERSIZE + 85, 13, 0, "E01PFNPAC");
    fields[15] = fieldE01PFNDSC =
    new CharacterField(message, HEADERSIZE + 98, 45, "E01PFNDSC");
    fields[16] = fieldE01PFNCUP =
    new DecimalField(message, HEADERSIZE + 143, 10, 0, "E01PFNCUP");
    fields[17] = fieldE01PFNCNM =
    new CharacterField(message, HEADERSIZE + 153, 45, "E01PFNCNM");
    fields[18] = fieldE01PFNCSQ =
    new DecimalField(message, HEADERSIZE + 198, 3, 0, "E01PFNCSQ");
    fields[19] = fieldE01PFNOAM =
    new DecimalField(message, HEADERSIZE + 201, 17, 2, "E01PFNOAM");
    fields[20] = fieldE01PFNFTB =
    new CharacterField(message, HEADERSIZE + 218, 2, "E01PFNFTB");
    fields[21] = fieldE01PFNFTY =
    new CharacterField(message, HEADERSIZE + 220, 2, "E01PFNFTY");
    fields[22] = fieldE01PFNFRT =
    new DecimalField(message, HEADERSIZE + 222, 11, 6, "E01PFNFRT");
    fields[23] = fieldE01PFNRTE =
    new DecimalField(message, HEADERSIZE + 233, 11, 6, "E01PFNRTE");
    fields[24] = fieldE01TOTRTE =
    new DecimalField(message, HEADERSIZE + 244, 11, 6, "E01TOTRTE");
    fields[25] = fieldE01PFNPRD =
    new CharacterField(message, HEADERSIZE + 255, 4, "E01PFNPRD");
    fields[26] = fieldE01DSCPRD =
    new CharacterField(message, HEADERSIZE + 259, 45, "E01DSCPRD");
    fields[27] = fieldE01PFNVCU =
    new DecimalField(message, HEADERSIZE + 304, 17, 2, "E01PFNVCU");
    fields[28] = fieldE01PFNVCO =
    new DecimalField(message, HEADERSIZE + 321, 17, 2, "E01PFNVCO");
    fields[29] = fieldE01PFNBNK =
    new CharacterField(message, HEADERSIZE + 338, 2, "E01PFNBNK");
    fields[30] = fieldE01PFNBRN =
    new DecimalField(message, HEADERSIZE + 340, 5, 0, "E01PFNBRN");
    fields[31] = fieldE01PFNOBK =
    new CharacterField(message, HEADERSIZE + 345, 2, "E01PFNOBK");
    fields[32] = fieldE01PFNOBR =
    new DecimalField(message, HEADERSIZE + 347, 5, 0, "E01PFNOBR");
    fields[33] = fieldE01PFNOCY =
    new CharacterField(message, HEADERSIZE + 352, 3, "E01PFNOCY");
    fields[34] = fieldE01PFNOGL =
    new DecimalField(message, HEADERSIZE + 355, 17, 0, "E01PFNOGL");
    fields[35] = fieldE01FLGFLT =
    new CharacterField(message, HEADERSIZE + 372, 1, "E01FLGFLT");
    fields[36] = fieldE01PFNRTX =
    new DecimalField(message, HEADERSIZE + 373, 11, 6, "E01PFNRTX");
    fields[37] = fieldE01PFNFLX =
    new CharacterField(message, HEADERSIZE + 384, 1, "E01PFNFLX");
    fields[38] = fieldE01FLTORG =
    new DecimalField(message, HEADERSIZE + 385, 11, 6, "E01FLTORG");
    fields[39] = fieldE01FLTDSC =
    new CharacterField(message, HEADERSIZE + 396, 45, "E01FLTDSC");

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
  * Set field E01PFNCUN using a String value.
  */
  public void setE01PFNCUN(String newvalue)
  {
    fieldE01PFNCUN.setString(newvalue);
  }

  /**
  * Get value of field E01PFNCUN as a String.
  */
  public String getE01PFNCUN()
  {
    return fieldE01PFNCUN.getString();
  }

  /**
  * Set numeric field E01PFNCUN using a BigDecimal value.
  */
  public void setE01PFNCUN(BigDecimal newvalue)
  {
    fieldE01PFNCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PFNCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PFNCUN()
  {
    return fieldE01PFNCUN.getBigDecimal();
  }

  /**
  * Set field E01PFNSEQ using a String value.
  */
  public void setE01PFNSEQ(String newvalue)
  {
    fieldE01PFNSEQ.setString(newvalue);
  }

  /**
  * Get value of field E01PFNSEQ as a String.
  */
  public String getE01PFNSEQ()
  {
    return fieldE01PFNSEQ.getString();
  }

  /**
  * Set numeric field E01PFNSEQ using a BigDecimal value.
  */
  public void setE01PFNSEQ(BigDecimal newvalue)
  {
    fieldE01PFNSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PFNSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PFNSEQ()
  {
    return fieldE01PFNSEQ.getBigDecimal();
  }

  /**
  * Set field E01PFNNUM using a String value.
  */
  public void setE01PFNNUM(String newvalue)
  {
    fieldE01PFNNUM.setString(newvalue);
  }

  /**
  * Get value of field E01PFNNUM as a String.
  */
  public String getE01PFNNUM()
  {
    return fieldE01PFNNUM.getString();
  }

  /**
  * Set numeric field E01PFNNUM using a BigDecimal value.
  */
  public void setE01PFNNUM(BigDecimal newvalue)
  {
    fieldE01PFNNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PFNNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PFNNUM()
  {
    return fieldE01PFNNUM.getBigDecimal();
  }

  /**
  * Set field E01PFNCOD using a String value.
  */
  public void setE01PFNCOD(String newvalue)
  {
    fieldE01PFNCOD.setString(newvalue);
  }

  /**
  * Get value of field E01PFNCOD as a String.
  */
  public String getE01PFNCOD()
  {
    return fieldE01PFNCOD.getString();
  }

  /**
  * Set field E01PFNACC using a String value.
  */
  public void setE01PFNACC(String newvalue)
  {
    fieldE01PFNACC.setString(newvalue);
  }

  /**
  * Get value of field E01PFNACC as a String.
  */
  public String getE01PFNACC()
  {
    return fieldE01PFNACC.getString();
  }

  /**
  * Set numeric field E01PFNACC using a BigDecimal value.
  */
  public void setE01PFNACC(BigDecimal newvalue)
  {
    fieldE01PFNACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PFNACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PFNACC()
  {
    return fieldE01PFNACC.getBigDecimal();
  }

  /**
  * Set field E01PFNPAC using a String value.
  */
  public void setE01PFNPAC(String newvalue)
  {
    fieldE01PFNPAC.setString(newvalue);
  }

  /**
  * Get value of field E01PFNPAC as a String.
  */
  public String getE01PFNPAC()
  {
    return fieldE01PFNPAC.getString();
  }

  /**
  * Set numeric field E01PFNPAC using a BigDecimal value.
  */
  public void setE01PFNPAC(BigDecimal newvalue)
  {
    fieldE01PFNPAC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PFNPAC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PFNPAC()
  {
    return fieldE01PFNPAC.getBigDecimal();
  }

  /**
  * Set field E01PFNDSC using a String value.
  */
  public void setE01PFNDSC(String newvalue)
  {
    fieldE01PFNDSC.setString(newvalue);
  }

  /**
  * Get value of field E01PFNDSC as a String.
  */
  public String getE01PFNDSC()
  {
    return fieldE01PFNDSC.getString();
  }

  /**
  * Set field E01PFNCUP using a String value.
  */
  public void setE01PFNCUP(String newvalue)
  {
    fieldE01PFNCUP.setString(newvalue);
  }

  /**
  * Get value of field E01PFNCUP as a String.
  */
  public String getE01PFNCUP()
  {
    return fieldE01PFNCUP.getString();
  }

  /**
  * Set numeric field E01PFNCUP using a BigDecimal value.
  */
  public void setE01PFNCUP(BigDecimal newvalue)
  {
    fieldE01PFNCUP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PFNCUP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PFNCUP()
  {
    return fieldE01PFNCUP.getBigDecimal();
  }

  /**
  * Set field E01PFNCNM using a String value.
  */
  public void setE01PFNCNM(String newvalue)
  {
    fieldE01PFNCNM.setString(newvalue);
  }

  /**
  * Get value of field E01PFNCNM as a String.
  */
  public String getE01PFNCNM()
  {
    return fieldE01PFNCNM.getString();
  }

  /**
  * Set field E01PFNCSQ using a String value.
  */
  public void setE01PFNCSQ(String newvalue)
  {
    fieldE01PFNCSQ.setString(newvalue);
  }

  /**
  * Get value of field E01PFNCSQ as a String.
  */
  public String getE01PFNCSQ()
  {
    return fieldE01PFNCSQ.getString();
  }

  /**
  * Set numeric field E01PFNCSQ using a BigDecimal value.
  */
  public void setE01PFNCSQ(BigDecimal newvalue)
  {
    fieldE01PFNCSQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PFNCSQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PFNCSQ()
  {
    return fieldE01PFNCSQ.getBigDecimal();
  }

  /**
  * Set field E01PFNOAM using a String value.
  */
  public void setE01PFNOAM(String newvalue)
  {
    fieldE01PFNOAM.setString(newvalue);
  }

  /**
  * Get value of field E01PFNOAM as a String.
  */
  public String getE01PFNOAM()
  {
    return fieldE01PFNOAM.getString();
  }

  /**
  * Set numeric field E01PFNOAM using a BigDecimal value.
  */
  public void setE01PFNOAM(BigDecimal newvalue)
  {
    fieldE01PFNOAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PFNOAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PFNOAM()
  {
    return fieldE01PFNOAM.getBigDecimal();
  }

  /**
  * Set field E01PFNFTB using a String value.
  */
  public void setE01PFNFTB(String newvalue)
  {
    fieldE01PFNFTB.setString(newvalue);
  }

  /**
  * Get value of field E01PFNFTB as a String.
  */
  public String getE01PFNFTB()
  {
    return fieldE01PFNFTB.getString();
  }

  /**
  * Set field E01PFNFTY using a String value.
  */
  public void setE01PFNFTY(String newvalue)
  {
    fieldE01PFNFTY.setString(newvalue);
  }

  /**
  * Get value of field E01PFNFTY as a String.
  */
  public String getE01PFNFTY()
  {
    return fieldE01PFNFTY.getString();
  }

  /**
  * Set field E01PFNFRT using a String value.
  */
  public void setE01PFNFRT(String newvalue)
  {
    fieldE01PFNFRT.setString(newvalue);
  }

  /**
  * Get value of field E01PFNFRT as a String.
  */
  public String getE01PFNFRT()
  {
    return fieldE01PFNFRT.getString();
  }

  /**
  * Set numeric field E01PFNFRT using a BigDecimal value.
  */
  public void setE01PFNFRT(BigDecimal newvalue)
  {
    fieldE01PFNFRT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PFNFRT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PFNFRT()
  {
    return fieldE01PFNFRT.getBigDecimal();
  }

  /**
  * Set field E01PFNRTE using a String value.
  */
  public void setE01PFNRTE(String newvalue)
  {
    fieldE01PFNRTE.setString(newvalue);
  }

  /**
  * Get value of field E01PFNRTE as a String.
  */
  public String getE01PFNRTE()
  {
    return fieldE01PFNRTE.getString();
  }

  /**
  * Set numeric field E01PFNRTE using a BigDecimal value.
  */
  public void setE01PFNRTE(BigDecimal newvalue)
  {
    fieldE01PFNRTE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PFNRTE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PFNRTE()
  {
    return fieldE01PFNRTE.getBigDecimal();
  }

  /**
  * Set field E01TOTRTE using a String value.
  */
  public void setE01TOTRTE(String newvalue)
  {
    fieldE01TOTRTE.setString(newvalue);
  }

  /**
  * Get value of field E01TOTRTE as a String.
  */
  public String getE01TOTRTE()
  {
    return fieldE01TOTRTE.getString();
  }

  /**
  * Set numeric field E01TOTRTE using a BigDecimal value.
  */
  public void setE01TOTRTE(BigDecimal newvalue)
  {
    fieldE01TOTRTE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TOTRTE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TOTRTE()
  {
    return fieldE01TOTRTE.getBigDecimal();
  }

  /**
  * Set field E01PFNPRD using a String value.
  */
  public void setE01PFNPRD(String newvalue)
  {
    fieldE01PFNPRD.setString(newvalue);
  }

  /**
  * Get value of field E01PFNPRD as a String.
  */
  public String getE01PFNPRD()
  {
    return fieldE01PFNPRD.getString();
  }

  /**
  * Set field E01DSCPRD using a String value.
  */
  public void setE01DSCPRD(String newvalue)
  {
    fieldE01DSCPRD.setString(newvalue);
  }

  /**
  * Get value of field E01DSCPRD as a String.
  */
  public String getE01DSCPRD()
  {
    return fieldE01DSCPRD.getString();
  }

  /**
  * Set field E01PFNVCU using a String value.
  */
  public void setE01PFNVCU(String newvalue)
  {
    fieldE01PFNVCU.setString(newvalue);
  }

  /**
  * Get value of field E01PFNVCU as a String.
  */
  public String getE01PFNVCU()
  {
    return fieldE01PFNVCU.getString();
  }

  /**
  * Set numeric field E01PFNVCU using a BigDecimal value.
  */
  public void setE01PFNVCU(BigDecimal newvalue)
  {
    fieldE01PFNVCU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PFNVCU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PFNVCU()
  {
    return fieldE01PFNVCU.getBigDecimal();
  }

  /**
  * Set field E01PFNVCO using a String value.
  */
  public void setE01PFNVCO(String newvalue)
  {
    fieldE01PFNVCO.setString(newvalue);
  }

  /**
  * Get value of field E01PFNVCO as a String.
  */
  public String getE01PFNVCO()
  {
    return fieldE01PFNVCO.getString();
  }

  /**
  * Set numeric field E01PFNVCO using a BigDecimal value.
  */
  public void setE01PFNVCO(BigDecimal newvalue)
  {
    fieldE01PFNVCO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PFNVCO as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PFNVCO()
  {
    return fieldE01PFNVCO.getBigDecimal();
  }

  /**
  * Set field E01PFNBNK using a String value.
  */
  public void setE01PFNBNK(String newvalue)
  {
    fieldE01PFNBNK.setString(newvalue);
  }

  /**
  * Get value of field E01PFNBNK as a String.
  */
  public String getE01PFNBNK()
  {
    return fieldE01PFNBNK.getString();
  }

  /**
  * Set field E01PFNBRN using a String value.
  */
  public void setE01PFNBRN(String newvalue)
  {
    fieldE01PFNBRN.setString(newvalue);
  }

  /**
  * Get value of field E01PFNBRN as a String.
  */
  public String getE01PFNBRN()
  {
    return fieldE01PFNBRN.getString();
  }

  /**
  * Set numeric field E01PFNBRN using a BigDecimal value.
  */
  public void setE01PFNBRN(BigDecimal newvalue)
  {
    fieldE01PFNBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PFNBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PFNBRN()
  {
    return fieldE01PFNBRN.getBigDecimal();
  }

  /**
  * Set field E01PFNOBK using a String value.
  */
  public void setE01PFNOBK(String newvalue)
  {
    fieldE01PFNOBK.setString(newvalue);
  }

  /**
  * Get value of field E01PFNOBK as a String.
  */
  public String getE01PFNOBK()
  {
    return fieldE01PFNOBK.getString();
  }

  /**
  * Set field E01PFNOBR using a String value.
  */
  public void setE01PFNOBR(String newvalue)
  {
    fieldE01PFNOBR.setString(newvalue);
  }

  /**
  * Get value of field E01PFNOBR as a String.
  */
  public String getE01PFNOBR()
  {
    return fieldE01PFNOBR.getString();
  }

  /**
  * Set numeric field E01PFNOBR using a BigDecimal value.
  */
  public void setE01PFNOBR(BigDecimal newvalue)
  {
    fieldE01PFNOBR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PFNOBR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PFNOBR()
  {
    return fieldE01PFNOBR.getBigDecimal();
  }

  /**
  * Set field E01PFNOCY using a String value.
  */
  public void setE01PFNOCY(String newvalue)
  {
    fieldE01PFNOCY.setString(newvalue);
  }

  /**
  * Get value of field E01PFNOCY as a String.
  */
  public String getE01PFNOCY()
  {
    return fieldE01PFNOCY.getString();
  }

  /**
  * Set field E01PFNOGL using a String value.
  */
  public void setE01PFNOGL(String newvalue)
  {
    fieldE01PFNOGL.setString(newvalue);
  }

  /**
  * Get value of field E01PFNOGL as a String.
  */
  public String getE01PFNOGL()
  {
    return fieldE01PFNOGL.getString();
  }

  /**
  * Set numeric field E01PFNOGL using a BigDecimal value.
  */
  public void setE01PFNOGL(BigDecimal newvalue)
  {
    fieldE01PFNOGL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PFNOGL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PFNOGL()
  {
    return fieldE01PFNOGL.getBigDecimal();
  }

  /**
  * Set field E01FLGFLT using a String value.
  */
  public void setE01FLGFLT(String newvalue)
  {
    fieldE01FLGFLT.setString(newvalue);
  }

  /**
  * Get value of field E01FLGFLT as a String.
  */
  public String getE01FLGFLT()
  {
    return fieldE01FLGFLT.getString();
  }

  /**
  * Set field E01PFNRTX using a String value.
  */
  public void setE01PFNRTX(String newvalue)
  {
    fieldE01PFNRTX.setString(newvalue);
  }

  /**
  * Get value of field E01PFNRTX as a String.
  */
  public String getE01PFNRTX()
  {
    return fieldE01PFNRTX.getString();
  }

  /**
  * Set numeric field E01PFNRTX using a BigDecimal value.
  */
  public void setE01PFNRTX(BigDecimal newvalue)
  {
    fieldE01PFNRTX.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PFNRTX as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PFNRTX()
  {
    return fieldE01PFNRTX.getBigDecimal();
  }

  /**
  * Set field E01PFNFLX using a String value.
  */
  public void setE01PFNFLX(String newvalue)
  {
    fieldE01PFNFLX.setString(newvalue);
  }

  /**
  * Get value of field E01PFNFLX as a String.
  */
  public String getE01PFNFLX()
  {
    return fieldE01PFNFLX.getString();
  }

  /**
  * Set field E01FLTORG using a String value.
  */
  public void setE01FLTORG(String newvalue)
  {
    fieldE01FLTORG.setString(newvalue);
  }

  /**
  * Get value of field E01FLTORG as a String.
  */
  public String getE01FLTORG()
  {
    return fieldE01FLTORG.getString();
  }

  /**
  * Set numeric field E01FLTORG using a BigDecimal value.
  */
  public void setE01FLTORG(BigDecimal newvalue)
  {
    fieldE01FLTORG.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FLTORG as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FLTORG()
  {
    return fieldE01FLTORG.getBigDecimal();
  }

  /**
  * Set field E01FLTDSC using a String value.
  */
  public void setE01FLTDSC(String newvalue)
  {
    fieldE01FLTDSC.setString(newvalue);
  }

  /**
  * Get value of field E01FLTDSC as a String.
  */
  public String getE01FLTDSC()
  {
    return fieldE01FLTDSC.getString();
  }

}
