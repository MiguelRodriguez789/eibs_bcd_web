package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL017002 physical file definition.
* 
* File level identifier is 1170221115505.
* Record format level identifier is 55E71A66CF152.
*/

public class EDL017002Message extends MessageRecord
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
                                     "E02PFMBNK",
                                     "E02PFMBRN",
                                     "E02PFMINI",
                                     "E02PFMFIN",
                                     "E02PFMQTY",
                                     "E02PFMOPE",
                                     "E02PFMASG",
                                     "E02PFMACC",
                                     "E02PFMRBR",
                                     "E02PFMUSR",
                                     "E02PFMCRM",
                                     "E02PFMCRD",
                                     "E02PFMCRY",
                                     "E02PFMCRT",
                                     "E02PFMCRU",
                                     "E02ENDFLD",
                                     "E02NUMREC",
                                     "E02ACTION"
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
                                   "E02PFMBNK",
                                   "E02PFMBRN",
                                   "E02PFMINI",
                                   "E02PFMFIN",
                                   "E02PFMQTY",
                                   "E02PFMOPE",
                                   "E02PFMASG",
                                   "E02PFMACC",
                                   "E02PFMRBR",
                                   "E02PFMUSR",
                                   "E02PFMCRM",
                                   "E02PFMCRD",
                                   "E02PFMCRY",
                                   "E02PFMCRT",
                                   "E02PFMCRU",
                                   "E02ENDFLD",
                                   "E02NUMREC",
                                   "E02ACTION"
                                 };
  final static String fid = "1170221115505";
  final static String rid = "55E71A66CF152";
  final static String fmtname = "EDL017002";
  final int FIELDCOUNT = 27;
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
  private CharacterField fieldE02PFMBNK = null;
  private DecimalField fieldE02PFMBRN = null;
  private DecimalField fieldE02PFMINI = null;
  private DecimalField fieldE02PFMFIN = null;
  private DecimalField fieldE02PFMQTY = null;
  private CharacterField fieldE02PFMOPE = null;
  private DecimalField fieldE02PFMASG = null;
  private DecimalField fieldE02PFMACC = null;
  private DecimalField fieldE02PFMRBR = null;
  private CharacterField fieldE02PFMUSR = null;
  private DecimalField fieldE02PFMCRM = null;
  private DecimalField fieldE02PFMCRD = null;
  private DecimalField fieldE02PFMCRY = null;
  private CharacterField fieldE02PFMCRT = null;
  private CharacterField fieldE02PFMCRU = null;
  private CharacterField fieldE02ENDFLD = null;
  private DecimalField fieldE02NUMREC = null;
  private CharacterField fieldE02ACTION = null;

  /**
  * Constructor for EDL017002Message.
  */
  public EDL017002Message()
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
    recordsize = 188;
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
    fields[9] = fieldE02PFMBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E02PFMBNK");
    fields[10] = fieldE02PFMBRN =
    new DecimalField(message, HEADERSIZE + 44, 5, 0, "E02PFMBRN");
    fields[11] = fieldE02PFMINI =
    new DecimalField(message, HEADERSIZE + 49, 13, 0, "E02PFMINI");
    fields[12] = fieldE02PFMFIN =
    new DecimalField(message, HEADERSIZE + 62, 13, 0, "E02PFMFIN");
    fields[13] = fieldE02PFMQTY =
    new DecimalField(message, HEADERSIZE + 75, 13, 0, "E02PFMQTY");
    fields[14] = fieldE02PFMOPE =
    new CharacterField(message, HEADERSIZE + 88, 2, "E02PFMOPE");
    fields[15] = fieldE02PFMASG =
    new DecimalField(message, HEADERSIZE + 90, 13, 0, "E02PFMASG");
    fields[16] = fieldE02PFMACC =
    new DecimalField(message, HEADERSIZE + 103, 13, 0, "E02PFMACC");
    fields[17] = fieldE02PFMRBR =
    new DecimalField(message, HEADERSIZE + 116, 5, 0, "E02PFMRBR");
    fields[18] = fieldE02PFMUSR =
    new CharacterField(message, HEADERSIZE + 121, 10, "E02PFMUSR");
    fields[19] = fieldE02PFMCRM =
    new DecimalField(message, HEADERSIZE + 131, 3, 0, "E02PFMCRM");
    fields[20] = fieldE02PFMCRD =
    new DecimalField(message, HEADERSIZE + 134, 3, 0, "E02PFMCRD");
    fields[21] = fieldE02PFMCRY =
    new DecimalField(message, HEADERSIZE + 137, 5, 0, "E02PFMCRY");
    fields[22] = fieldE02PFMCRT =
    new CharacterField(message, HEADERSIZE + 142, 26, "E02PFMCRT");
    fields[23] = fieldE02PFMCRU =
    new CharacterField(message, HEADERSIZE + 168, 10, "E02PFMCRU");
    fields[24] = fieldE02ENDFLD =
    new CharacterField(message, HEADERSIZE + 178, 1, "E02ENDFLD");
    fields[25] = fieldE02NUMREC =
    new DecimalField(message, HEADERSIZE + 179, 8, 0, "E02NUMREC");
    fields[26] = fieldE02ACTION =
    new CharacterField(message, HEADERSIZE + 187, 1, "E02ACTION");

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
  * Set field E02PFMBNK using a String value.
  */
  public void setE02PFMBNK(String newvalue)
  {
    fieldE02PFMBNK.setString(newvalue);
  }

  /**
  * Get value of field E02PFMBNK as a String.
  */
  public String getE02PFMBNK()
  {
    return fieldE02PFMBNK.getString();
  }

  /**
  * Set field E02PFMBRN using a String value.
  */
  public void setE02PFMBRN(String newvalue)
  {
    fieldE02PFMBRN.setString(newvalue);
  }

  /**
  * Get value of field E02PFMBRN as a String.
  */
  public String getE02PFMBRN()
  {
    return fieldE02PFMBRN.getString();
  }

  /**
  * Set numeric field E02PFMBRN using a BigDecimal value.
  */
  public void setE02PFMBRN(BigDecimal newvalue)
  {
    fieldE02PFMBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PFMBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PFMBRN()
  {
    return fieldE02PFMBRN.getBigDecimal();
  }

  /**
  * Set field E02PFMINI using a String value.
  */
  public void setE02PFMINI(String newvalue)
  {
    fieldE02PFMINI.setString(newvalue);
  }

  /**
  * Get value of field E02PFMINI as a String.
  */
  public String getE02PFMINI()
  {
    return fieldE02PFMINI.getString();
  }

  /**
  * Set numeric field E02PFMINI using a BigDecimal value.
  */
  public void setE02PFMINI(BigDecimal newvalue)
  {
    fieldE02PFMINI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PFMINI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PFMINI()
  {
    return fieldE02PFMINI.getBigDecimal();
  }

  /**
  * Set field E02PFMFIN using a String value.
  */
  public void setE02PFMFIN(String newvalue)
  {
    fieldE02PFMFIN.setString(newvalue);
  }

  /**
  * Get value of field E02PFMFIN as a String.
  */
  public String getE02PFMFIN()
  {
    return fieldE02PFMFIN.getString();
  }

  /**
  * Set numeric field E02PFMFIN using a BigDecimal value.
  */
  public void setE02PFMFIN(BigDecimal newvalue)
  {
    fieldE02PFMFIN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PFMFIN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PFMFIN()
  {
    return fieldE02PFMFIN.getBigDecimal();
  }

  /**
  * Set field E02PFMQTY using a String value.
  */
  public void setE02PFMQTY(String newvalue)
  {
    fieldE02PFMQTY.setString(newvalue);
  }

  /**
  * Get value of field E02PFMQTY as a String.
  */
  public String getE02PFMQTY()
  {
    return fieldE02PFMQTY.getString();
  }

  /**
  * Set numeric field E02PFMQTY using a BigDecimal value.
  */
  public void setE02PFMQTY(BigDecimal newvalue)
  {
    fieldE02PFMQTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PFMQTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PFMQTY()
  {
    return fieldE02PFMQTY.getBigDecimal();
  }

  /**
  * Set field E02PFMOPE using a String value.
  */
  public void setE02PFMOPE(String newvalue)
  {
    fieldE02PFMOPE.setString(newvalue);
  }

  /**
  * Get value of field E02PFMOPE as a String.
  */
  public String getE02PFMOPE()
  {
    return fieldE02PFMOPE.getString();
  }

  /**
  * Set field E02PFMASG using a String value.
  */
  public void setE02PFMASG(String newvalue)
  {
    fieldE02PFMASG.setString(newvalue);
  }

  /**
  * Get value of field E02PFMASG as a String.
  */
  public String getE02PFMASG()
  {
    return fieldE02PFMASG.getString();
  }

  /**
  * Set numeric field E02PFMASG using a BigDecimal value.
  */
  public void setE02PFMASG(BigDecimal newvalue)
  {
    fieldE02PFMASG.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PFMASG as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PFMASG()
  {
    return fieldE02PFMASG.getBigDecimal();
  }

  /**
  * Set field E02PFMACC using a String value.
  */
  public void setE02PFMACC(String newvalue)
  {
    fieldE02PFMACC.setString(newvalue);
  }

  /**
  * Get value of field E02PFMACC as a String.
  */
  public String getE02PFMACC()
  {
    return fieldE02PFMACC.getString();
  }

  /**
  * Set numeric field E02PFMACC using a BigDecimal value.
  */
  public void setE02PFMACC(BigDecimal newvalue)
  {
    fieldE02PFMACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PFMACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PFMACC()
  {
    return fieldE02PFMACC.getBigDecimal();
  }

  /**
  * Set field E02PFMRBR using a String value.
  */
  public void setE02PFMRBR(String newvalue)
  {
    fieldE02PFMRBR.setString(newvalue);
  }

  /**
  * Get value of field E02PFMRBR as a String.
  */
  public String getE02PFMRBR()
  {
    return fieldE02PFMRBR.getString();
  }

  /**
  * Set numeric field E02PFMRBR using a BigDecimal value.
  */
  public void setE02PFMRBR(BigDecimal newvalue)
  {
    fieldE02PFMRBR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PFMRBR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PFMRBR()
  {
    return fieldE02PFMRBR.getBigDecimal();
  }

  /**
  * Set field E02PFMUSR using a String value.
  */
  public void setE02PFMUSR(String newvalue)
  {
    fieldE02PFMUSR.setString(newvalue);
  }

  /**
  * Get value of field E02PFMUSR as a String.
  */
  public String getE02PFMUSR()
  {
    return fieldE02PFMUSR.getString();
  }

  /**
  * Set field E02PFMCRM using a String value.
  */
  public void setE02PFMCRM(String newvalue)
  {
    fieldE02PFMCRM.setString(newvalue);
  }

  /**
  * Get value of field E02PFMCRM as a String.
  */
  public String getE02PFMCRM()
  {
    return fieldE02PFMCRM.getString();
  }

  /**
  * Set numeric field E02PFMCRM using a BigDecimal value.
  */
  public void setE02PFMCRM(BigDecimal newvalue)
  {
    fieldE02PFMCRM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PFMCRM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PFMCRM()
  {
    return fieldE02PFMCRM.getBigDecimal();
  }

  /**
  * Set field E02PFMCRD using a String value.
  */
  public void setE02PFMCRD(String newvalue)
  {
    fieldE02PFMCRD.setString(newvalue);
  }

  /**
  * Get value of field E02PFMCRD as a String.
  */
  public String getE02PFMCRD()
  {
    return fieldE02PFMCRD.getString();
  }

  /**
  * Set numeric field E02PFMCRD using a BigDecimal value.
  */
  public void setE02PFMCRD(BigDecimal newvalue)
  {
    fieldE02PFMCRD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PFMCRD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PFMCRD()
  {
    return fieldE02PFMCRD.getBigDecimal();
  }

  /**
  * Set field E02PFMCRY using a String value.
  */
  public void setE02PFMCRY(String newvalue)
  {
    fieldE02PFMCRY.setString(newvalue);
  }

  /**
  * Get value of field E02PFMCRY as a String.
  */
  public String getE02PFMCRY()
  {
    return fieldE02PFMCRY.getString();
  }

  /**
  * Set numeric field E02PFMCRY using a BigDecimal value.
  */
  public void setE02PFMCRY(BigDecimal newvalue)
  {
    fieldE02PFMCRY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PFMCRY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PFMCRY()
  {
    return fieldE02PFMCRY.getBigDecimal();
  }

  /**
  * Set field E02PFMCRT using a String value.
  */
  public void setE02PFMCRT(String newvalue)
  {
    fieldE02PFMCRT.setString(newvalue);
  }

  /**
  * Get value of field E02PFMCRT as a String.
  */
  public String getE02PFMCRT()
  {
    return fieldE02PFMCRT.getString();
  }

  /**
  * Set field E02PFMCRU using a String value.
  */
  public void setE02PFMCRU(String newvalue)
  {
    fieldE02PFMCRU.setString(newvalue);
  }

  /**
  * Get value of field E02PFMCRU as a String.
  */
  public String getE02PFMCRU()
  {
    return fieldE02PFMCRU.getString();
  }

  /**
  * Set field E02ENDFLD using a String value.
  */
  public void setE02ENDFLD(String newvalue)
  {
    fieldE02ENDFLD.setString(newvalue);
  }

  /**
  * Get value of field E02ENDFLD as a String.
  */
  public String getE02ENDFLD()
  {
    return fieldE02ENDFLD.getString();
  }

  /**
  * Set field E02NUMREC using a String value.
  */
  public void setE02NUMREC(String newvalue)
  {
    fieldE02NUMREC.setString(newvalue);
  }

  /**
  * Get value of field E02NUMREC as a String.
  */
  public String getE02NUMREC()
  {
    return fieldE02NUMREC.getString();
  }

  /**
  * Set numeric field E02NUMREC using a BigDecimal value.
  */
  public void setE02NUMREC(BigDecimal newvalue)
  {
    fieldE02NUMREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02NUMREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02NUMREC()
  {
    return fieldE02NUMREC.getBigDecimal();
  }

  /**
  * Set field E02ACTION using a String value.
  */
  public void setE02ACTION(String newvalue)
  {
    fieldE02ACTION.setString(newvalue);
  }

  /**
  * Get value of field E02ACTION as a String.
  */
  public String getE02ACTION()
  {
    return fieldE02ACTION.getString();
  }

}