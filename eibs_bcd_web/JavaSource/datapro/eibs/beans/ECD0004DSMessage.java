package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECD0004DS physical file definition.
* 
* File level identifier is 1130611112842.
* Record format level identifier is 30360246264CB.
*/

public class ECD0004DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "H04USERID",
                                     "H04PROGRM",
                                     "H04TIMSYS",
                                     "H04SCRCOD",
                                     "H04OPECOD",
                                     "H04FLGMAS",
                                     "H04FLGWK1",
                                     "H04FLGWK2",
                                     "H04FLGWK3",
                                     "E04CDRTPL",
                                     "E04CDRNPL",
                                     "E04CDRTRS",
                                     "E04CDRTRD",
                                     "E04CDRLOI",
                                     "E04CDRADV",
                                     "E04CDRATM",
                                     "E04CDRTMD",
                                     "E04CDRTMM",
                                     "E04CDRMAT",
                                     "E04CDRXAT",
                                     "E04CDRMAD",
                                     "E04CDRMAM",
                                     "E04CDRPIN",
                                     "E04CDRPED",
                                     "E04CDRERR",
                                     "E04CDRERD",
                                     "E04CDRFEE",
                                     "E04CDRFED",
                                     "E04CDRFFE",
                                     "E04CDRISA",
                                     "E04CDRACC",
                                     "E04CDRGLN",
                                     "E04CDRUSR",
                                     "E04CDRDAY",
                                     "E04CDRMON",
                                     "E04CDRYEA",
                                     "E04CDRTIM"
                                   };
  final static String tnames[] = {
                                   "H04USERID",
                                   "H04PROGRM",
                                   "H04TIMSYS",
                                   "H04SCRCOD",
                                   "H04OPECOD",
                                   "H04FLGMAS",
                                   "H04FLGWK1",
                                   "H04FLGWK2",
                                   "H04FLGWK3",
                                   "E04CDRTPL",
                                   "E04CDRNPL",
                                   "E04CDRTRS",
                                   "E04CDRTRD",
                                   "E04CDRLOI",
                                   "E04CDRADV",
                                   "E04CDRATM",
                                   "E04CDRTMD",
                                   "E04CDRTMM",
                                   "E04CDRMAT",
                                   "E04CDRXAT",
                                   "E04CDRMAD",
                                   "E04CDRMAM",
                                   "E04CDRPIN",
                                   "E04CDRPED",
                                   "E04CDRERR",
                                   "E04CDRERD",
                                   "E04CDRFEE",
                                   "E04CDRFED",
                                   "E04CDRFFE",
                                   "E04CDRISA",
                                   "E04CDRACC",
                                   "E04CDRGLN",
                                   "E04CDRUSR",
                                   "E04CDRDAY",
                                   "E04CDRMON",
                                   "E04CDRYEA",
                                   "E04CDRTIM"
                                 };
  final static String fid = "1130611112842";
  final static String rid = "30360246264CB";
  final static String fmtname = "ECD0004DS";
  final int FIELDCOUNT = 37;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH04USERID = null;
  private CharacterField fieldH04PROGRM = null;
  private CharacterField fieldH04TIMSYS = null;
  private CharacterField fieldH04SCRCOD = null;
  private CharacterField fieldH04OPECOD = null;
  private CharacterField fieldH04FLGMAS = null;
  private CharacterField fieldH04FLGWK1 = null;
  private CharacterField fieldH04FLGWK2 = null;
  private CharacterField fieldH04FLGWK3 = null;
  private CharacterField fieldE04CDRTPL = null;
  private CharacterField fieldE04CDRNPL = null;
  private CharacterField fieldE04CDRTRS = null;
  private CharacterField fieldE04CDRTRD = null;
  private CharacterField fieldE04CDRLOI = null;
  private CharacterField fieldE04CDRADV = null;
  private CharacterField fieldE04CDRATM = null;
  private DecimalField fieldE04CDRTMD = null;
  private DecimalField fieldE04CDRTMM = null;
  private DecimalField fieldE04CDRMAT = null;
  private DecimalField fieldE04CDRXAT = null;
  private DecimalField fieldE04CDRMAD = null;
  private DecimalField fieldE04CDRMAM = null;
  private DecimalField fieldE04CDRPIN = null;
  private DecimalField fieldE04CDRPED = null;
  private DecimalField fieldE04CDRERR = null;
  private DecimalField fieldE04CDRERD = null;
  private CharacterField fieldE04CDRFEE = null;
  private CharacterField fieldE04CDRFED = null;
  private DecimalField fieldE04CDRFFE = null;
  private CharacterField fieldE04CDRISA = null;
  private DecimalField fieldE04CDRACC = null;
  private CharacterField fieldE04CDRGLN = null;
  private CharacterField fieldE04CDRUSR = null;
  private DecimalField fieldE04CDRDAY = null;
  private DecimalField fieldE04CDRMON = null;
  private DecimalField fieldE04CDRYEA = null;
  private CharacterField fieldE04CDRTIM = null;

  /**
  * Constructor for ECD0004DSMessage.
  */
  public ECD0004DSMessage()
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
    recordsize = 383;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH04USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H04USERID");
    fields[1] = fieldH04PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H04PROGRM");
    fields[2] = fieldH04TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H04TIMSYS");
    fields[3] = fieldH04SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H04SCRCOD");
    fields[4] = fieldH04OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H04OPECOD");
    fields[5] = fieldH04FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H04FLGMAS");
    fields[6] = fieldH04FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H04FLGWK1");
    fields[7] = fieldH04FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H04FLGWK2");
    fields[8] = fieldH04FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H04FLGWK3");
    fields[9] = fieldE04CDRTPL =
    new CharacterField(message, HEADERSIZE + 42, 2, "E04CDRTPL");
    fields[10] = fieldE04CDRNPL =
    new CharacterField(message, HEADERSIZE + 44, 45, "E04CDRNPL");
    fields[11] = fieldE04CDRTRS =
    new CharacterField(message, HEADERSIZE + 89, 4, "E04CDRTRS");
    fields[12] = fieldE04CDRTRD =
    new CharacterField(message, HEADERSIZE + 93, 45, "E04CDRTRD");
    fields[13] = fieldE04CDRLOI =
    new CharacterField(message, HEADERSIZE + 138, 1, "E04CDRLOI");
    fields[14] = fieldE04CDRADV =
    new CharacterField(message, HEADERSIZE + 139, 1, "E04CDRADV");
    fields[15] = fieldE04CDRATM =
    new CharacterField(message, HEADERSIZE + 140, 4, "E04CDRATM");
    fields[16] = fieldE04CDRTMD =
    new DecimalField(message, HEADERSIZE + 144, 4, 0, "E04CDRTMD");
    fields[17] = fieldE04CDRTMM =
    new DecimalField(message, HEADERSIZE + 148, 5, 0, "E04CDRTMM");
    fields[18] = fieldE04CDRMAT =
    new DecimalField(message, HEADERSIZE + 153, 17, 2, "E04CDRMAT");
    fields[19] = fieldE04CDRXAT =
    new DecimalField(message, HEADERSIZE + 170, 17, 2, "E04CDRXAT");
    fields[20] = fieldE04CDRMAD =
    new DecimalField(message, HEADERSIZE + 187, 17, 2, "E04CDRMAD");
    fields[21] = fieldE04CDRMAM =
    new DecimalField(message, HEADERSIZE + 204, 17, 2, "E04CDRMAM");
    fields[22] = fieldE04CDRPIN =
    new DecimalField(message, HEADERSIZE + 221, 3, 0, "E04CDRPIN");
    fields[23] = fieldE04CDRPED =
    new DecimalField(message, HEADERSIZE + 224, 5, 0, "E04CDRPED");
    fields[24] = fieldE04CDRERR =
    new DecimalField(message, HEADERSIZE + 229, 3, 0, "E04CDRERR");
    fields[25] = fieldE04CDRERD =
    new DecimalField(message, HEADERSIZE + 232, 5, 0, "E04CDRERD");
    fields[26] = fieldE04CDRFEE =
    new CharacterField(message, HEADERSIZE + 237, 4, "E04CDRFEE");
    fields[27] = fieldE04CDRFED =
    new CharacterField(message, HEADERSIZE + 241, 45, "E04CDRFED");
    fields[28] = fieldE04CDRFFE =
    new DecimalField(message, HEADERSIZE + 286, 5, 0, "E04CDRFFE");
    fields[29] = fieldE04CDRISA =
    new CharacterField(message, HEADERSIZE + 291, 4, "E04CDRISA");
    fields[30] = fieldE04CDRACC =
    new DecimalField(message, HEADERSIZE + 295, 21, 0, "E04CDRACC");
    fields[31] = fieldE04CDRGLN =
    new CharacterField(message, HEADERSIZE + 316, 20, "E04CDRGLN");
    fields[32] = fieldE04CDRUSR =
    new CharacterField(message, HEADERSIZE + 336, 10, "E04CDRUSR");
    fields[33] = fieldE04CDRDAY =
    new DecimalField(message, HEADERSIZE + 346, 3, 0, "E04CDRDAY");
    fields[34] = fieldE04CDRMON =
    new DecimalField(message, HEADERSIZE + 349, 3, 0, "E04CDRMON");
    fields[35] = fieldE04CDRYEA =
    new DecimalField(message, HEADERSIZE + 352, 5, 0, "E04CDRYEA");
    fields[36] = fieldE04CDRTIM =
    new CharacterField(message, HEADERSIZE + 357, 26, "E04CDRTIM");

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
  * Set field H04USERID using a String value.
  */
  public void setH04USERID(String newvalue)
  {
    fieldH04USERID.setString(newvalue);
  }

  /**
  * Get value of field H04USERID as a String.
  */
  public String getH04USERID()
  {
    return fieldH04USERID.getString();
  }

  /**
  * Set field H04PROGRM using a String value.
  */
  public void setH04PROGRM(String newvalue)
  {
    fieldH04PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H04PROGRM as a String.
  */
  public String getH04PROGRM()
  {
    return fieldH04PROGRM.getString();
  }

  /**
  * Set field H04TIMSYS using a String value.
  */
  public void setH04TIMSYS(String newvalue)
  {
    fieldH04TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H04TIMSYS as a String.
  */
  public String getH04TIMSYS()
  {
    return fieldH04TIMSYS.getString();
  }

  /**
  * Set field H04SCRCOD using a String value.
  */
  public void setH04SCRCOD(String newvalue)
  {
    fieldH04SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H04SCRCOD as a String.
  */
  public String getH04SCRCOD()
  {
    return fieldH04SCRCOD.getString();
  }

  /**
  * Set field H04OPECOD using a String value.
  */
  public void setH04OPECOD(String newvalue)
  {
    fieldH04OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H04OPECOD as a String.
  */
  public String getH04OPECOD()
  {
    return fieldH04OPECOD.getString();
  }

  /**
  * Set field H04FLGMAS using a String value.
  */
  public void setH04FLGMAS(String newvalue)
  {
    fieldH04FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H04FLGMAS as a String.
  */
  public String getH04FLGMAS()
  {
    return fieldH04FLGMAS.getString();
  }

  /**
  * Set field H04FLGWK1 using a String value.
  */
  public void setH04FLGWK1(String newvalue)
  {
    fieldH04FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H04FLGWK1 as a String.
  */
  public String getH04FLGWK1()
  {
    return fieldH04FLGWK1.getString();
  }

  /**
  * Set field H04FLGWK2 using a String value.
  */
  public void setH04FLGWK2(String newvalue)
  {
    fieldH04FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H04FLGWK2 as a String.
  */
  public String getH04FLGWK2()
  {
    return fieldH04FLGWK2.getString();
  }

  /**
  * Set field H04FLGWK3 using a String value.
  */
  public void setH04FLGWK3(String newvalue)
  {
    fieldH04FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H04FLGWK3 as a String.
  */
  public String getH04FLGWK3()
  {
    return fieldH04FLGWK3.getString();
  }

  /**
  * Set field E04CDRTPL using a String value.
  */
  public void setE04CDRTPL(String newvalue)
  {
    fieldE04CDRTPL.setString(newvalue);
  }

  /**
  * Get value of field E04CDRTPL as a String.
  */
  public String getE04CDRTPL()
  {
    return fieldE04CDRTPL.getString();
  }

  /**
  * Set field E04CDRNPL using a String value.
  */
  public void setE04CDRNPL(String newvalue)
  {
    fieldE04CDRNPL.setString(newvalue);
  }

  /**
  * Get value of field E04CDRNPL as a String.
  */
  public String getE04CDRNPL()
  {
    return fieldE04CDRNPL.getString();
  }

  /**
  * Set field E04CDRTRS using a String value.
  */
  public void setE04CDRTRS(String newvalue)
  {
    fieldE04CDRTRS.setString(newvalue);
  }

  /**
  * Get value of field E04CDRTRS as a String.
  */
  public String getE04CDRTRS()
  {
    return fieldE04CDRTRS.getString();
  }

  /**
  * Set field E04CDRTRD using a String value.
  */
  public void setE04CDRTRD(String newvalue)
  {
    fieldE04CDRTRD.setString(newvalue);
  }

  /**
  * Get value of field E04CDRTRD as a String.
  */
  public String getE04CDRTRD()
  {
    return fieldE04CDRTRD.getString();
  }

  /**
  * Set field E04CDRLOI using a String value.
  */
  public void setE04CDRLOI(String newvalue)
  {
    fieldE04CDRLOI.setString(newvalue);
  }

  /**
  * Get value of field E04CDRLOI as a String.
  */
  public String getE04CDRLOI()
  {
    return fieldE04CDRLOI.getString();
  }

  /**
  * Set field E04CDRADV using a String value.
  */
  public void setE04CDRADV(String newvalue)
  {
    fieldE04CDRADV.setString(newvalue);
  }

  /**
  * Get value of field E04CDRADV as a String.
  */
  public String getE04CDRADV()
  {
    return fieldE04CDRADV.getString();
  }

  /**
  * Set field E04CDRATM using a String value.
  */
  public void setE04CDRATM(String newvalue)
  {
    fieldE04CDRATM.setString(newvalue);
  }

  /**
  * Get value of field E04CDRATM as a String.
  */
  public String getE04CDRATM()
  {
    return fieldE04CDRATM.getString();
  }

  /**
  * Set field E04CDRTMD using a String value.
  */
  public void setE04CDRTMD(String newvalue)
  {
    fieldE04CDRTMD.setString(newvalue);
  }

  /**
  * Get value of field E04CDRTMD as a String.
  */
  public String getE04CDRTMD()
  {
    return fieldE04CDRTMD.getString();
  }

  /**
  * Set numeric field E04CDRTMD using a BigDecimal value.
  */
  public void setE04CDRTMD(BigDecimal newvalue)
  {
    fieldE04CDRTMD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04CDRTMD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04CDRTMD()
  {
    return fieldE04CDRTMD.getBigDecimal();
  }

  /**
  * Set field E04CDRTMM using a String value.
  */
  public void setE04CDRTMM(String newvalue)
  {
    fieldE04CDRTMM.setString(newvalue);
  }

  /**
  * Get value of field E04CDRTMM as a String.
  */
  public String getE04CDRTMM()
  {
    return fieldE04CDRTMM.getString();
  }

  /**
  * Set numeric field E04CDRTMM using a BigDecimal value.
  */
  public void setE04CDRTMM(BigDecimal newvalue)
  {
    fieldE04CDRTMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04CDRTMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04CDRTMM()
  {
    return fieldE04CDRTMM.getBigDecimal();
  }

  /**
  * Set field E04CDRMAT using a String value.
  */
  public void setE04CDRMAT(String newvalue)
  {
    fieldE04CDRMAT.setString(newvalue);
  }

  /**
  * Get value of field E04CDRMAT as a String.
  */
  public String getE04CDRMAT()
  {
    return fieldE04CDRMAT.getString();
  }

  /**
  * Set numeric field E04CDRMAT using a BigDecimal value.
  */
  public void setE04CDRMAT(BigDecimal newvalue)
  {
    fieldE04CDRMAT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04CDRMAT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04CDRMAT()
  {
    return fieldE04CDRMAT.getBigDecimal();
  }

  /**
  * Set field E04CDRXAT using a String value.
  */
  public void setE04CDRXAT(String newvalue)
  {
    fieldE04CDRXAT.setString(newvalue);
  }

  /**
  * Get value of field E04CDRXAT as a String.
  */
  public String getE04CDRXAT()
  {
    return fieldE04CDRXAT.getString();
  }

  /**
  * Set numeric field E04CDRXAT using a BigDecimal value.
  */
  public void setE04CDRXAT(BigDecimal newvalue)
  {
    fieldE04CDRXAT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04CDRXAT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04CDRXAT()
  {
    return fieldE04CDRXAT.getBigDecimal();
  }

  /**
  * Set field E04CDRMAD using a String value.
  */
  public void setE04CDRMAD(String newvalue)
  {
    fieldE04CDRMAD.setString(newvalue);
  }

  /**
  * Get value of field E04CDRMAD as a String.
  */
  public String getE04CDRMAD()
  {
    return fieldE04CDRMAD.getString();
  }

  /**
  * Set numeric field E04CDRMAD using a BigDecimal value.
  */
  public void setE04CDRMAD(BigDecimal newvalue)
  {
    fieldE04CDRMAD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04CDRMAD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04CDRMAD()
  {
    return fieldE04CDRMAD.getBigDecimal();
  }

  /**
  * Set field E04CDRMAM using a String value.
  */
  public void setE04CDRMAM(String newvalue)
  {
    fieldE04CDRMAM.setString(newvalue);
  }

  /**
  * Get value of field E04CDRMAM as a String.
  */
  public String getE04CDRMAM()
  {
    return fieldE04CDRMAM.getString();
  }

  /**
  * Set numeric field E04CDRMAM using a BigDecimal value.
  */
  public void setE04CDRMAM(BigDecimal newvalue)
  {
    fieldE04CDRMAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04CDRMAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04CDRMAM()
  {
    return fieldE04CDRMAM.getBigDecimal();
  }

  /**
  * Set field E04CDRPIN using a String value.
  */
  public void setE04CDRPIN(String newvalue)
  {
    fieldE04CDRPIN.setString(newvalue);
  }

  /**
  * Get value of field E04CDRPIN as a String.
  */
  public String getE04CDRPIN()
  {
    return fieldE04CDRPIN.getString();
  }

  /**
  * Set numeric field E04CDRPIN using a BigDecimal value.
  */
  public void setE04CDRPIN(BigDecimal newvalue)
  {
    fieldE04CDRPIN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04CDRPIN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04CDRPIN()
  {
    return fieldE04CDRPIN.getBigDecimal();
  }

  /**
  * Set field E04CDRPED using a String value.
  */
  public void setE04CDRPED(String newvalue)
  {
    fieldE04CDRPED.setString(newvalue);
  }

  /**
  * Get value of field E04CDRPED as a String.
  */
  public String getE04CDRPED()
  {
    return fieldE04CDRPED.getString();
  }

  /**
  * Set numeric field E04CDRPED using a BigDecimal value.
  */
  public void setE04CDRPED(BigDecimal newvalue)
  {
    fieldE04CDRPED.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04CDRPED as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04CDRPED()
  {
    return fieldE04CDRPED.getBigDecimal();
  }

  /**
  * Set field E04CDRERR using a String value.
  */
  public void setE04CDRERR(String newvalue)
  {
    fieldE04CDRERR.setString(newvalue);
  }

  /**
  * Get value of field E04CDRERR as a String.
  */
  public String getE04CDRERR()
  {
    return fieldE04CDRERR.getString();
  }

  /**
  * Set numeric field E04CDRERR using a BigDecimal value.
  */
  public void setE04CDRERR(BigDecimal newvalue)
  {
    fieldE04CDRERR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04CDRERR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04CDRERR()
  {
    return fieldE04CDRERR.getBigDecimal();
  }

  /**
  * Set field E04CDRERD using a String value.
  */
  public void setE04CDRERD(String newvalue)
  {
    fieldE04CDRERD.setString(newvalue);
  }

  /**
  * Get value of field E04CDRERD as a String.
  */
  public String getE04CDRERD()
  {
    return fieldE04CDRERD.getString();
  }

  /**
  * Set numeric field E04CDRERD using a BigDecimal value.
  */
  public void setE04CDRERD(BigDecimal newvalue)
  {
    fieldE04CDRERD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04CDRERD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04CDRERD()
  {
    return fieldE04CDRERD.getBigDecimal();
  }

  /**
  * Set field E04CDRFEE using a String value.
  */
  public void setE04CDRFEE(String newvalue)
  {
    fieldE04CDRFEE.setString(newvalue);
  }

  /**
  * Get value of field E04CDRFEE as a String.
  */
  public String getE04CDRFEE()
  {
    return fieldE04CDRFEE.getString();
  }

  /**
  * Set field E04CDRFED using a String value.
  */
  public void setE04CDRFED(String newvalue)
  {
    fieldE04CDRFED.setString(newvalue);
  }

  /**
  * Get value of field E04CDRFED as a String.
  */
  public String getE04CDRFED()
  {
    return fieldE04CDRFED.getString();
  }

  /**
  * Set field E04CDRFFE using a String value.
  */
  public void setE04CDRFFE(String newvalue)
  {
    fieldE04CDRFFE.setString(newvalue);
  }

  /**
  * Get value of field E04CDRFFE as a String.
  */
  public String getE04CDRFFE()
  {
    return fieldE04CDRFFE.getString();
  }

  /**
  * Set numeric field E04CDRFFE using a BigDecimal value.
  */
  public void setE04CDRFFE(BigDecimal newvalue)
  {
    fieldE04CDRFFE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04CDRFFE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04CDRFFE()
  {
    return fieldE04CDRFFE.getBigDecimal();
  }

  /**
  * Set field E04CDRISA using a String value.
  */
  public void setE04CDRISA(String newvalue)
  {
    fieldE04CDRISA.setString(newvalue);
  }

  /**
  * Get value of field E04CDRISA as a String.
  */
  public String getE04CDRISA()
  {
    return fieldE04CDRISA.getString();
  }

  /**
  * Set field E04CDRACC using a String value.
  */
  public void setE04CDRACC(String newvalue)
  {
    fieldE04CDRACC.setString(newvalue);
  }

  /**
  * Get value of field E04CDRACC as a String.
  */
  public String getE04CDRACC()
  {
    return fieldE04CDRACC.getString();
  }

  /**
  * Set numeric field E04CDRACC using a BigDecimal value.
  */
  public void setE04CDRACC(BigDecimal newvalue)
  {
    fieldE04CDRACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04CDRACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04CDRACC()
  {
    return fieldE04CDRACC.getBigDecimal();
  }

  /**
  * Set field E04CDRGLN using a String value.
  */
  public void setE04CDRGLN(String newvalue)
  {
    fieldE04CDRGLN.setString(newvalue);
  }

  /**
  * Get value of field E04CDRGLN as a String.
  */
  public String getE04CDRGLN()
  {
    return fieldE04CDRGLN.getString();
  }

  /**
  * Set field E04CDRUSR using a String value.
  */
  public void setE04CDRUSR(String newvalue)
  {
    fieldE04CDRUSR.setString(newvalue);
  }

  /**
  * Get value of field E04CDRUSR as a String.
  */
  public String getE04CDRUSR()
  {
    return fieldE04CDRUSR.getString();
  }

  /**
  * Set field E04CDRDAY using a String value.
  */
  public void setE04CDRDAY(String newvalue)
  {
    fieldE04CDRDAY.setString(newvalue);
  }

  /**
  * Get value of field E04CDRDAY as a String.
  */
  public String getE04CDRDAY()
  {
    return fieldE04CDRDAY.getString();
  }

  /**
  * Set numeric field E04CDRDAY using a BigDecimal value.
  */
  public void setE04CDRDAY(BigDecimal newvalue)
  {
    fieldE04CDRDAY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04CDRDAY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04CDRDAY()
  {
    return fieldE04CDRDAY.getBigDecimal();
  }

  /**
  * Set field E04CDRMON using a String value.
  */
  public void setE04CDRMON(String newvalue)
  {
    fieldE04CDRMON.setString(newvalue);
  }

  /**
  * Get value of field E04CDRMON as a String.
  */
  public String getE04CDRMON()
  {
    return fieldE04CDRMON.getString();
  }

  /**
  * Set numeric field E04CDRMON using a BigDecimal value.
  */
  public void setE04CDRMON(BigDecimal newvalue)
  {
    fieldE04CDRMON.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04CDRMON as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04CDRMON()
  {
    return fieldE04CDRMON.getBigDecimal();
  }

  /**
  * Set field E04CDRYEA using a String value.
  */
  public void setE04CDRYEA(String newvalue)
  {
    fieldE04CDRYEA.setString(newvalue);
  }

  /**
  * Get value of field E04CDRYEA as a String.
  */
  public String getE04CDRYEA()
  {
    return fieldE04CDRYEA.getString();
  }

  /**
  * Set numeric field E04CDRYEA using a BigDecimal value.
  */
  public void setE04CDRYEA(BigDecimal newvalue)
  {
    fieldE04CDRYEA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04CDRYEA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04CDRYEA()
  {
    return fieldE04CDRYEA.getBigDecimal();
  }

  /**
  * Set field E04CDRTIM using a String value.
  */
  public void setE04CDRTIM(String newvalue)
  {
    fieldE04CDRTIM.setString(newvalue);
  }

  /**
  * Get value of field E04CDRTIM as a String.
  */
  public String getE04CDRTIM()
  {
    return fieldE04CDRTIM.getString();
  }

}
