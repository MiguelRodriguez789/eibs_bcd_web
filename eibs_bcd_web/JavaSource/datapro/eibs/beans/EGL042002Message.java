package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EGL042002 physical file definition.
* 
* File level identifier is 1160115052931.
* Record format level identifier is 42BD7C2A9C8F0.
*/

public class EGL042002Message extends MessageRecord
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
                                     "E02GLMATY",
                                     "E02GLMACD",
                                     "E02GLMCLS",
                                     "E02GLMDSC",
                                     "E02GLMRCL",
                                     "E02GLMCCN",
                                     "E02GLBBAL",
                                     "E02GLBAVG",
                                     "E02GLBOPM",
                                     "E02GLBOPD",
                                     "E02GLBOPY",
                                     "E02GLBLUM",
                                     "E02GLBLUD",
                                     "E02GLBLUY",
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
                                   "E02GLMATY",
                                   "E02GLMACD",
                                   "E02GLMCLS",
                                   "E02GLMDSC",
                                   "E02GLMRCL",
                                   "E02GLMCCN",
                                   "E02GLBBAL",
                                   "E02GLBAVG",
                                   "E02GLBOPM",
                                   "E02GLBOPD",
                                   "E02GLBOPY",
                                   "E02GLBLUM",
                                   "E02GLBLUD",
                                   "E02GLBLUY",
                                   "E02DSCCLS",
                                   "E02DSCATY"
                                 };
  final static String fid = "1160115052931";
  final static String rid = "42BD7C2A9C8F0";
  final static String fmtname = "EGL042002";
  final int FIELDCOUNT = 29;
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
  private CharacterField fieldE02GLMATY = null;
  private CharacterField fieldE02GLMACD = null;
  private DecimalField fieldE02GLMCLS = null;
  private CharacterField fieldE02GLMDSC = null;
  private CharacterField fieldE02GLMRCL = null;
  private CharacterField fieldE02GLMCCN = null;
  private DecimalField fieldE02GLBBAL = null;
  private DecimalField fieldE02GLBAVG = null;
  private DecimalField fieldE02GLBOPM = null;
  private DecimalField fieldE02GLBOPD = null;
  private DecimalField fieldE02GLBOPY = null;
  private DecimalField fieldE02GLBLUM = null;
  private DecimalField fieldE02GLBLUD = null;
  private DecimalField fieldE02GLBLUY = null;
  private CharacterField fieldE02DSCCLS = null;
  private CharacterField fieldE02DSCATY = null;

  /**
  * Constructor for EGL042002Message.
  */
  public EGL042002Message()
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
    recordsize = 294;
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
    fields[13] = fieldE02GLMATY =
    new CharacterField(message, HEADERSIZE + 69, 4, "E02GLMATY");
    fields[14] = fieldE02GLMACD =
    new CharacterField(message, HEADERSIZE + 73, 2, "E02GLMACD");
    fields[15] = fieldE02GLMCLS =
    new DecimalField(message, HEADERSIZE + 75, 3, 0, "E02GLMCLS");
    fields[16] = fieldE02GLMDSC =
    new CharacterField(message, HEADERSIZE + 78, 60, "E02GLMDSC");
    fields[17] = fieldE02GLMRCL =
    new CharacterField(message, HEADERSIZE + 138, 1, "E02GLMRCL");
    fields[18] = fieldE02GLMCCN =
    new CharacterField(message, HEADERSIZE + 139, 1, "E02GLMCCN");
    fields[19] = fieldE02GLBBAL =
    new DecimalField(message, HEADERSIZE + 140, 21, 2, "E02GLBBAL");
    fields[20] = fieldE02GLBAVG =
    new DecimalField(message, HEADERSIZE + 161, 21, 2, "E02GLBAVG");
    fields[21] = fieldE02GLBOPM =
    new DecimalField(message, HEADERSIZE + 182, 3, 0, "E02GLBOPM");
    fields[22] = fieldE02GLBOPD =
    new DecimalField(message, HEADERSIZE + 185, 3, 0, "E02GLBOPD");
    fields[23] = fieldE02GLBOPY =
    new DecimalField(message, HEADERSIZE + 188, 5, 0, "E02GLBOPY");
    fields[24] = fieldE02GLBLUM =
    new DecimalField(message, HEADERSIZE + 193, 3, 0, "E02GLBLUM");
    fields[25] = fieldE02GLBLUD =
    new DecimalField(message, HEADERSIZE + 196, 3, 0, "E02GLBLUD");
    fields[26] = fieldE02GLBLUY =
    new DecimalField(message, HEADERSIZE + 199, 5, 0, "E02GLBLUY");
    fields[27] = fieldE02DSCCLS =
    new CharacterField(message, HEADERSIZE + 204, 45, "E02DSCCLS");
    fields[28] = fieldE02DSCATY =
    new CharacterField(message, HEADERSIZE + 249, 45, "E02DSCATY");

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
  * Set field E02GLMACD using a String value.
  */
  public void setE02GLMACD(String newvalue)
  {
    fieldE02GLMACD.setString(newvalue);
  }

  /**
  * Get value of field E02GLMACD as a String.
  */
  public String getE02GLMACD()
  {
    return fieldE02GLMACD.getString();
  }

  /**
  * Set field E02GLMCLS using a String value.
  */
  public void setE02GLMCLS(String newvalue)
  {
    fieldE02GLMCLS.setString(newvalue);
  }

  /**
  * Get value of field E02GLMCLS as a String.
  */
  public String getE02GLMCLS()
  {
    return fieldE02GLMCLS.getString();
  }

  /**
  * Set numeric field E02GLMCLS using a BigDecimal value.
  */
  public void setE02GLMCLS(BigDecimal newvalue)
  {
    fieldE02GLMCLS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02GLMCLS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02GLMCLS()
  {
    return fieldE02GLMCLS.getBigDecimal();
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
  * Set field E02GLBBAL using a String value.
  */
  public void setE02GLBBAL(String newvalue)
  {
    fieldE02GLBBAL.setString(newvalue);
  }

  /**
  * Get value of field E02GLBBAL as a String.
  */
  public String getE02GLBBAL()
  {
    return fieldE02GLBBAL.getString();
  }

  /**
  * Set numeric field E02GLBBAL using a BigDecimal value.
  */
  public void setE02GLBBAL(BigDecimal newvalue)
  {
    fieldE02GLBBAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02GLBBAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02GLBBAL()
  {
    return fieldE02GLBBAL.getBigDecimal();
  }

  /**
  * Set field E02GLBAVG using a String value.
  */
  public void setE02GLBAVG(String newvalue)
  {
    fieldE02GLBAVG.setString(newvalue);
  }

  /**
  * Get value of field E02GLBAVG as a String.
  */
  public String getE02GLBAVG()
  {
    return fieldE02GLBAVG.getString();
  }

  /**
  * Set numeric field E02GLBAVG using a BigDecimal value.
  */
  public void setE02GLBAVG(BigDecimal newvalue)
  {
    fieldE02GLBAVG.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02GLBAVG as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02GLBAVG()
  {
    return fieldE02GLBAVG.getBigDecimal();
  }

  /**
  * Set field E02GLBOPM using a String value.
  */
  public void setE02GLBOPM(String newvalue)
  {
    fieldE02GLBOPM.setString(newvalue);
  }

  /**
  * Get value of field E02GLBOPM as a String.
  */
  public String getE02GLBOPM()
  {
    return fieldE02GLBOPM.getString();
  }

  /**
  * Set numeric field E02GLBOPM using a BigDecimal value.
  */
  public void setE02GLBOPM(BigDecimal newvalue)
  {
    fieldE02GLBOPM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02GLBOPM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02GLBOPM()
  {
    return fieldE02GLBOPM.getBigDecimal();
  }

  /**
  * Set field E02GLBOPD using a String value.
  */
  public void setE02GLBOPD(String newvalue)
  {
    fieldE02GLBOPD.setString(newvalue);
  }

  /**
  * Get value of field E02GLBOPD as a String.
  */
  public String getE02GLBOPD()
  {
    return fieldE02GLBOPD.getString();
  }

  /**
  * Set numeric field E02GLBOPD using a BigDecimal value.
  */
  public void setE02GLBOPD(BigDecimal newvalue)
  {
    fieldE02GLBOPD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02GLBOPD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02GLBOPD()
  {
    return fieldE02GLBOPD.getBigDecimal();
  }

  /**
  * Set field E02GLBOPY using a String value.
  */
  public void setE02GLBOPY(String newvalue)
  {
    fieldE02GLBOPY.setString(newvalue);
  }

  /**
  * Get value of field E02GLBOPY as a String.
  */
  public String getE02GLBOPY()
  {
    return fieldE02GLBOPY.getString();
  }

  /**
  * Set numeric field E02GLBOPY using a BigDecimal value.
  */
  public void setE02GLBOPY(BigDecimal newvalue)
  {
    fieldE02GLBOPY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02GLBOPY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02GLBOPY()
  {
    return fieldE02GLBOPY.getBigDecimal();
  }

  /**
  * Set field E02GLBLUM using a String value.
  */
  public void setE02GLBLUM(String newvalue)
  {
    fieldE02GLBLUM.setString(newvalue);
  }

  /**
  * Get value of field E02GLBLUM as a String.
  */
  public String getE02GLBLUM()
  {
    return fieldE02GLBLUM.getString();
  }

  /**
  * Set numeric field E02GLBLUM using a BigDecimal value.
  */
  public void setE02GLBLUM(BigDecimal newvalue)
  {
    fieldE02GLBLUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02GLBLUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02GLBLUM()
  {
    return fieldE02GLBLUM.getBigDecimal();
  }

  /**
  * Set field E02GLBLUD using a String value.
  */
  public void setE02GLBLUD(String newvalue)
  {
    fieldE02GLBLUD.setString(newvalue);
  }

  /**
  * Get value of field E02GLBLUD as a String.
  */
  public String getE02GLBLUD()
  {
    return fieldE02GLBLUD.getString();
  }

  /**
  * Set numeric field E02GLBLUD using a BigDecimal value.
  */
  public void setE02GLBLUD(BigDecimal newvalue)
  {
    fieldE02GLBLUD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02GLBLUD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02GLBLUD()
  {
    return fieldE02GLBLUD.getBigDecimal();
  }

  /**
  * Set field E02GLBLUY using a String value.
  */
  public void setE02GLBLUY(String newvalue)
  {
    fieldE02GLBLUY.setString(newvalue);
  }

  /**
  * Get value of field E02GLBLUY as a String.
  */
  public String getE02GLBLUY()
  {
    return fieldE02GLBLUY.getString();
  }

  /**
  * Set numeric field E02GLBLUY using a BigDecimal value.
  */
  public void setE02GLBLUY(BigDecimal newvalue)
  {
    fieldE02GLBLUY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02GLBLUY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02GLBLUY()
  {
    return fieldE02GLBLUY.getBigDecimal();
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