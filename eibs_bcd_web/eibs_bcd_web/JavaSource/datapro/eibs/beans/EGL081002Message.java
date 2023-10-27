package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EGL081002 physical file definition.
* 
* File level identifier is 1130611113204.
* Record format level identifier is 3C4C11DFF9C01.
*/

public class EGL081002Message extends MessageRecord
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
                                     "E02GLMBNK",
                                     "E02GLMBRN",
                                     "E02GLMCCY",
                                     "E02GLMGLN",
                                     "E02GLMACC",
                                     "E02GLMDSC",
                                     "E02GLMATY",
                                     "E02GLMRCL",
                                     "E02GLMCCN",
                                     "E02GLBOP1",
                                     "E02GLBOP2",
                                     "E02GLBOP3",
                                     "E02GLBLU1",
                                     "E02GLBLU2",
                                     "E02GLBLU3",
                                     "E02DSCCLS",
                                     "E02DSCATY"
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
                                   "E02GLMBNK",
                                   "E02GLMBRN",
                                   "E02GLMCCY",
                                   "E02GLMGLN",
                                   "E02GLMACC",
                                   "E02GLMDSC",
                                   "E02GLMATY",
                                   "E02GLMRCL",
                                   "E02GLMCCN",
                                   "E02GLBOP1",
                                   "E02GLBOP2",
                                   "E02GLBOP3",
                                   "E02GLBLU1",
                                   "E02GLBLU2",
                                   "E02GLBLU3",
                                   "E02DSCCLS",
                                   "E02DSCATY"
                                 };
  final static String fid = "1130611113204";
  final static String rid = "3C4C11DFF9C01";
  final static String fmtname = "EGL081002";
  final int FIELDCOUNT = 26;
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
  private CharacterField fieldE02GLMBNK = null;
  private DecimalField fieldE02GLMBRN = null;
  private CharacterField fieldE02GLMCCY = null;
  private DecimalField fieldE02GLMGLN = null;
  private DecimalField fieldE02GLMACC = null;
  private CharacterField fieldE02GLMDSC = null;
  private CharacterField fieldE02GLMATY = null;
  private CharacterField fieldE02GLMRCL = null;
  private CharacterField fieldE02GLMCCN = null;
  private DecimalField fieldE02GLBOP1 = null;
  private DecimalField fieldE02GLBOP2 = null;
  private DecimalField fieldE02GLBOP3 = null;
  private DecimalField fieldE02GLBLU1 = null;
  private DecimalField fieldE02GLBLU2 = null;
  private DecimalField fieldE02GLBLU3 = null;
  private CharacterField fieldE02DSCCLS = null;
  private CharacterField fieldE02DSCATY = null;

  /**
  * Constructor for EGL081002Message.
  */
  public EGL081002Message()
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
    recordsize = 260;
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
    fields[9] = fieldE02GLMBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E02GLMBNK");
    fields[10] = fieldE02GLMBRN =
    new DecimalField(message, HEADERSIZE + 44, 5, 0, "E02GLMBRN");
    fields[11] = fieldE02GLMCCY =
    new CharacterField(message, HEADERSIZE + 49, 3, "E02GLMCCY");
    fields[12] = fieldE02GLMGLN =
    new DecimalField(message, HEADERSIZE + 52, 17, 0, "E02GLMGLN");
    fields[13] = fieldE02GLMACC =
    new DecimalField(message, HEADERSIZE + 69, 13, 0, "E02GLMACC");
    fields[14] = fieldE02GLMDSC =
    new CharacterField(message, HEADERSIZE + 82, 60, "E02GLMDSC");
    fields[15] = fieldE02GLMATY =
    new CharacterField(message, HEADERSIZE + 142, 4, "E02GLMATY");
    fields[16] = fieldE02GLMRCL =
    new CharacterField(message, HEADERSIZE + 146, 1, "E02GLMRCL");
    fields[17] = fieldE02GLMCCN =
    new CharacterField(message, HEADERSIZE + 147, 1, "E02GLMCCN");
    fields[18] = fieldE02GLBOP1 =
    new DecimalField(message, HEADERSIZE + 148, 3, 0, "E02GLBOP1");
    fields[19] = fieldE02GLBOP2 =
    new DecimalField(message, HEADERSIZE + 151, 3, 0, "E02GLBOP2");
    fields[20] = fieldE02GLBOP3 =
    new DecimalField(message, HEADERSIZE + 154, 5, 0, "E02GLBOP3");
    fields[21] = fieldE02GLBLU1 =
    new DecimalField(message, HEADERSIZE + 159, 3, 0, "E02GLBLU1");
    fields[22] = fieldE02GLBLU2 =
    new DecimalField(message, HEADERSIZE + 162, 3, 0, "E02GLBLU2");
    fields[23] = fieldE02GLBLU3 =
    new DecimalField(message, HEADERSIZE + 165, 5, 0, "E02GLBLU3");
    fields[24] = fieldE02DSCCLS =
    new CharacterField(message, HEADERSIZE + 170, 45, "E02DSCCLS");
    fields[25] = fieldE02DSCATY =
    new CharacterField(message, HEADERSIZE + 215, 45, "E02DSCATY");

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
  * Set field E02GLMBNK using a String value.
  */
  public void setE02GLMBNK(String newvalue)
  {
    fieldE02GLMBNK.setString(newvalue);
  }

  /**
  * Get value of field E02GLMBNK as a String.
  */
  public String getE02GLMBNK()
  {
    return fieldE02GLMBNK.getString();
  }

  /**
  * Set field E02GLMBRN using a String value.
  */
  public void setE02GLMBRN(String newvalue)
  {
    fieldE02GLMBRN.setString(newvalue);
  }

  /**
  * Get value of field E02GLMBRN as a String.
  */
  public String getE02GLMBRN()
  {
    return fieldE02GLMBRN.getString();
  }

  /**
  * Set numeric field E02GLMBRN using a BigDecimal value.
  */
  public void setE02GLMBRN(BigDecimal newvalue)
  {
    fieldE02GLMBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02GLMBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02GLMBRN()
  {
    return fieldE02GLMBRN.getBigDecimal();
  }

  /**
  * Set field E02GLMCCY using a String value.
  */
  public void setE02GLMCCY(String newvalue)
  {
    fieldE02GLMCCY.setString(newvalue);
  }

  /**
  * Get value of field E02GLMCCY as a String.
  */
  public String getE02GLMCCY()
  {
    return fieldE02GLMCCY.getString();
  }

  /**
  * Set field E02GLMGLN using a String value.
  */
  public void setE02GLMGLN(String newvalue)
  {
    fieldE02GLMGLN.setString(newvalue);
  }

  /**
  * Get value of field E02GLMGLN as a String.
  */
  public String getE02GLMGLN()
  {
    return fieldE02GLMGLN.getString();
  }

  /**
  * Set numeric field E02GLMGLN using a BigDecimal value.
  */
  public void setE02GLMGLN(BigDecimal newvalue)
  {
    fieldE02GLMGLN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02GLMGLN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02GLMGLN()
  {
    return fieldE02GLMGLN.getBigDecimal();
  }

  /**
  * Set field E02GLMACC using a String value.
  */
  public void setE02GLMACC(String newvalue)
  {
    fieldE02GLMACC.setString(newvalue);
  }

  /**
  * Get value of field E02GLMACC as a String.
  */
  public String getE02GLMACC()
  {
    return fieldE02GLMACC.getString();
  }

  /**
  * Set numeric field E02GLMACC using a BigDecimal value.
  */
  public void setE02GLMACC(BigDecimal newvalue)
  {
    fieldE02GLMACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02GLMACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02GLMACC()
  {
    return fieldE02GLMACC.getBigDecimal();
  }

  /**
  * Set field E02GLMDSC using a String value.
  */
  public void setE02GLMDSC(String newvalue)
  {
    fieldE02GLMDSC.setString(newvalue);
  }

  /**
  * Get value of field E02GLMDSC as a String.
  */
  public String getE02GLMDSC()
  {
    return fieldE02GLMDSC.getString();
  }

  /**
  * Set field E02GLMATY using a String value.
  */
  public void setE02GLMATY(String newvalue)
  {
    fieldE02GLMATY.setString(newvalue);
  }

  /**
  * Get value of field E02GLMATY as a String.
  */
  public String getE02GLMATY()
  {
    return fieldE02GLMATY.getString();
  }

  /**
  * Set field E02GLMRCL using a String value.
  */
  public void setE02GLMRCL(String newvalue)
  {
    fieldE02GLMRCL.setString(newvalue);
  }

  /**
  * Get value of field E02GLMRCL as a String.
  */
  public String getE02GLMRCL()
  {
    return fieldE02GLMRCL.getString();
  }

  /**
  * Set field E02GLMCCN using a String value.
  */
  public void setE02GLMCCN(String newvalue)
  {
    fieldE02GLMCCN.setString(newvalue);
  }

  /**
  * Get value of field E02GLMCCN as a String.
  */
  public String getE02GLMCCN()
  {
    return fieldE02GLMCCN.getString();
  }

  /**
  * Set field E02GLBOP1 using a String value.
  */
  public void setE02GLBOP1(String newvalue)
  {
    fieldE02GLBOP1.setString(newvalue);
  }

  /**
  * Get value of field E02GLBOP1 as a String.
  */
  public String getE02GLBOP1()
  {
    return fieldE02GLBOP1.getString();
  }

  /**
  * Set numeric field E02GLBOP1 using a BigDecimal value.
  */
  public void setE02GLBOP1(BigDecimal newvalue)
  {
    fieldE02GLBOP1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02GLBOP1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02GLBOP1()
  {
    return fieldE02GLBOP1.getBigDecimal();
  }

  /**
  * Set field E02GLBOP2 using a String value.
  */
  public void setE02GLBOP2(String newvalue)
  {
    fieldE02GLBOP2.setString(newvalue);
  }

  /**
  * Get value of field E02GLBOP2 as a String.
  */
  public String getE02GLBOP2()
  {
    return fieldE02GLBOP2.getString();
  }

  /**
  * Set numeric field E02GLBOP2 using a BigDecimal value.
  */
  public void setE02GLBOP2(BigDecimal newvalue)
  {
    fieldE02GLBOP2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02GLBOP2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02GLBOP2()
  {
    return fieldE02GLBOP2.getBigDecimal();
  }

  /**
  * Set field E02GLBOP3 using a String value.
  */
  public void setE02GLBOP3(String newvalue)
  {
    fieldE02GLBOP3.setString(newvalue);
  }

  /**
  * Get value of field E02GLBOP3 as a String.
  */
  public String getE02GLBOP3()
  {
    return fieldE02GLBOP3.getString();
  }

  /**
  * Set numeric field E02GLBOP3 using a BigDecimal value.
  */
  public void setE02GLBOP3(BigDecimal newvalue)
  {
    fieldE02GLBOP3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02GLBOP3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02GLBOP3()
  {
    return fieldE02GLBOP3.getBigDecimal();
  }

  /**
  * Set field E02GLBLU1 using a String value.
  */
  public void setE02GLBLU1(String newvalue)
  {
    fieldE02GLBLU1.setString(newvalue);
  }

  /**
  * Get value of field E02GLBLU1 as a String.
  */
  public String getE02GLBLU1()
  {
    return fieldE02GLBLU1.getString();
  }

  /**
  * Set numeric field E02GLBLU1 using a BigDecimal value.
  */
  public void setE02GLBLU1(BigDecimal newvalue)
  {
    fieldE02GLBLU1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02GLBLU1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02GLBLU1()
  {
    return fieldE02GLBLU1.getBigDecimal();
  }

  /**
  * Set field E02GLBLU2 using a String value.
  */
  public void setE02GLBLU2(String newvalue)
  {
    fieldE02GLBLU2.setString(newvalue);
  }

  /**
  * Get value of field E02GLBLU2 as a String.
  */
  public String getE02GLBLU2()
  {
    return fieldE02GLBLU2.getString();
  }

  /**
  * Set numeric field E02GLBLU2 using a BigDecimal value.
  */
  public void setE02GLBLU2(BigDecimal newvalue)
  {
    fieldE02GLBLU2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02GLBLU2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02GLBLU2()
  {
    return fieldE02GLBLU2.getBigDecimal();
  }

  /**
  * Set field E02GLBLU3 using a String value.
  */
  public void setE02GLBLU3(String newvalue)
  {
    fieldE02GLBLU3.setString(newvalue);
  }

  /**
  * Get value of field E02GLBLU3 as a String.
  */
  public String getE02GLBLU3()
  {
    return fieldE02GLBLU3.getString();
  }

  /**
  * Set numeric field E02GLBLU3 using a BigDecimal value.
  */
  public void setE02GLBLU3(BigDecimal newvalue)
  {
    fieldE02GLBLU3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02GLBLU3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02GLBLU3()
  {
    return fieldE02GLBLU3.getBigDecimal();
  }

  /**
  * Set field E02DSCCLS using a String value.
  */
  public void setE02DSCCLS(String newvalue)
  {
    fieldE02DSCCLS.setString(newvalue);
  }

  /**
  * Get value of field E02DSCCLS as a String.
  */
  public String getE02DSCCLS()
  {
    return fieldE02DSCCLS.getString();
  }

  /**
  * Set field E02DSCATY using a String value.
  */
  public void setE02DSCATY(String newvalue)
  {
    fieldE02DSCATY.setString(newvalue);
  }

  /**
  * Get value of field E02DSCATY as a String.
  */
  public String getE02DSCATY()
  {
    return fieldE02DSCATY.getString();
  }

}
