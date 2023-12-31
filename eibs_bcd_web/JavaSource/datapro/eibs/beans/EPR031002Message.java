package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EPR031002 physical file definition.
* 
* File level identifier is 1151005060620.
* Record format level identifier is 45491BBCF38D0.
*/

public class EPR031002Message extends MessageRecord
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
                                     "E02FETBNK",
                                     "E02FETBNN",
                                     "E02FETBRN",
                                     "E02FETBRM",
                                     "E02FETCCY",
                                     "E02FETCCN",
                                     "E02FETLIC",
                                     "E02FETPMD",
                                     "E02FETPMM",
                                     "E02FETPMS",
                                     "E02FETPMY",
                                     "E02FETSMD",
                                     "E02FETSMM",
                                     "E02FETSMS",
                                     "E02FETSMY",
                                     "E02FETPST",
                                     "E02FETSST"
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
                                   "E02FETBNK",
                                   "E02FETBNN",
                                   "E02FETBRN",
                                   "E02FETBRM",
                                   "E02FETCCY",
                                   "E02FETCCN",
                                   "E02FETLIC",
                                   "E02FETPMD",
                                   "E02FETPMM",
                                   "E02FETPMS",
                                   "E02FETPMY",
                                   "E02FETSMD",
                                   "E02FETSMM",
                                   "E02FETSMS",
                                   "E02FETSMY",
                                   "E02FETPST",
                                   "E02FETSST"
                                 };
  final static String fid = "1151005060620";
  final static String rid = "45491BBCF38D0";
  final static String fmtname = "EPR031002";
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
  private CharacterField fieldE02FETBNK = null;
  private CharacterField fieldE02FETBNN = null;
  private DecimalField fieldE02FETBRN = null;
  private CharacterField fieldE02FETBRM = null;
  private CharacterField fieldE02FETCCY = null;
  private CharacterField fieldE02FETCCN = null;
  private CharacterField fieldE02FETLIC = null;
  private DecimalField fieldE02FETPMD = null;
  private DecimalField fieldE02FETPMM = null;
  private DecimalField fieldE02FETPMS = null;
  private DecimalField fieldE02FETPMY = null;
  private DecimalField fieldE02FETSMD = null;
  private DecimalField fieldE02FETSMM = null;
  private DecimalField fieldE02FETSMS = null;
  private DecimalField fieldE02FETSMY = null;
  private CharacterField fieldE02FETPST = null;
  private CharacterField fieldE02FETSST = null;

  /**
  * Constructor for EPR031002Message.
  */
  public EPR031002Message()
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
    recordsize = 285;
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
    fields[9] = fieldE02FETBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E02FETBNK");
    fields[10] = fieldE02FETBNN =
    new CharacterField(message, HEADERSIZE + 44, 2, "E02FETBNN");
    fields[11] = fieldE02FETBRN =
    new DecimalField(message, HEADERSIZE + 46, 5, 0, "E02FETBRN");
    fields[12] = fieldE02FETBRM =
    new CharacterField(message, HEADERSIZE + 51, 45, "E02FETBRM");
    fields[13] = fieldE02FETCCY =
    new CharacterField(message, HEADERSIZE + 96, 3, "E02FETCCY");
    fields[14] = fieldE02FETCCN =
    new CharacterField(message, HEADERSIZE + 99, 45, "E02FETCCN");
    fields[15] = fieldE02FETLIC =
    new CharacterField(message, HEADERSIZE + 144, 3, "E02FETLIC");
    fields[16] = fieldE02FETPMD =
    new DecimalField(message, HEADERSIZE + 147, 17, 2, "E02FETPMD");
    fields[17] = fieldE02FETPMM =
    new DecimalField(message, HEADERSIZE + 164, 17, 2, "E02FETPMM");
    fields[18] = fieldE02FETPMS =
    new DecimalField(message, HEADERSIZE + 181, 17, 2, "E02FETPMS");
    fields[19] = fieldE02FETPMY =
    new DecimalField(message, HEADERSIZE + 198, 17, 2, "E02FETPMY");
    fields[20] = fieldE02FETSMD =
    new DecimalField(message, HEADERSIZE + 215, 17, 2, "E02FETSMD");
    fields[21] = fieldE02FETSMM =
    new DecimalField(message, HEADERSIZE + 232, 17, 2, "E02FETSMM");
    fields[22] = fieldE02FETSMS =
    new DecimalField(message, HEADERSIZE + 249, 17, 2, "E02FETSMS");
    fields[23] = fieldE02FETSMY =
    new DecimalField(message, HEADERSIZE + 266, 17, 2, "E02FETSMY");
    fields[24] = fieldE02FETPST =
    new CharacterField(message, HEADERSIZE + 283, 1, "E02FETPST");
    fields[25] = fieldE02FETSST =
    new CharacterField(message, HEADERSIZE + 284, 1, "E02FETSST");

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
  * Set field E02FETBNK using a String value.
  */
  public void setE02FETBNK(String newvalue)
  {
    fieldE02FETBNK.setString(newvalue);
  }

  /**
  * Get value of field E02FETBNK as a String.
  */
  public String getE02FETBNK()
  {
    return fieldE02FETBNK.getString();
  }

  /**
  * Set field E02FETBNN using a String value.
  */
  public void setE02FETBNN(String newvalue)
  {
    fieldE02FETBNN.setString(newvalue);
  }

  /**
  * Get value of field E02FETBNN as a String.
  */
  public String getE02FETBNN()
  {
    return fieldE02FETBNN.getString();
  }

  /**
  * Set field E02FETBRN using a String value.
  */
  public void setE02FETBRN(String newvalue)
  {
    fieldE02FETBRN.setString(newvalue);
  }

  /**
  * Get value of field E02FETBRN as a String.
  */
  public String getE02FETBRN()
  {
    return fieldE02FETBRN.getString();
  }

  /**
  * Set numeric field E02FETBRN using a BigDecimal value.
  */
  public void setE02FETBRN(BigDecimal newvalue)
  {
    fieldE02FETBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02FETBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02FETBRN()
  {
    return fieldE02FETBRN.getBigDecimal();
  }

  /**
  * Set field E02FETBRM using a String value.
  */
  public void setE02FETBRM(String newvalue)
  {
    fieldE02FETBRM.setString(newvalue);
  }

  /**
  * Get value of field E02FETBRM as a String.
  */
  public String getE02FETBRM()
  {
    return fieldE02FETBRM.getString();
  }

  /**
  * Set field E02FETCCY using a String value.
  */
  public void setE02FETCCY(String newvalue)
  {
    fieldE02FETCCY.setString(newvalue);
  }

  /**
  * Get value of field E02FETCCY as a String.
  */
  public String getE02FETCCY()
  {
    return fieldE02FETCCY.getString();
  }

  /**
  * Set field E02FETCCN using a String value.
  */
  public void setE02FETCCN(String newvalue)
  {
    fieldE02FETCCN.setString(newvalue);
  }

  /**
  * Get value of field E02FETCCN as a String.
  */
  public String getE02FETCCN()
  {
    return fieldE02FETCCN.getString();
  }

  /**
  * Set field E02FETLIC using a String value.
  */
  public void setE02FETLIC(String newvalue)
  {
    fieldE02FETLIC.setString(newvalue);
  }

  /**
  * Get value of field E02FETLIC as a String.
  */
  public String getE02FETLIC()
  {
    return fieldE02FETLIC.getString();
  }

  /**
  * Set field E02FETPMD using a String value.
  */
  public void setE02FETPMD(String newvalue)
  {
    fieldE02FETPMD.setString(newvalue);
  }

  /**
  * Get value of field E02FETPMD as a String.
  */
  public String getE02FETPMD()
  {
    return fieldE02FETPMD.getString();
  }

  /**
  * Set numeric field E02FETPMD using a BigDecimal value.
  */
  public void setE02FETPMD(BigDecimal newvalue)
  {
    fieldE02FETPMD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02FETPMD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02FETPMD()
  {
    return fieldE02FETPMD.getBigDecimal();
  }

  /**
  * Set field E02FETPMM using a String value.
  */
  public void setE02FETPMM(String newvalue)
  {
    fieldE02FETPMM.setString(newvalue);
  }

  /**
  * Get value of field E02FETPMM as a String.
  */
  public String getE02FETPMM()
  {
    return fieldE02FETPMM.getString();
  }

  /**
  * Set numeric field E02FETPMM using a BigDecimal value.
  */
  public void setE02FETPMM(BigDecimal newvalue)
  {
    fieldE02FETPMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02FETPMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02FETPMM()
  {
    return fieldE02FETPMM.getBigDecimal();
  }

  /**
  * Set field E02FETPMS using a String value.
  */
  public void setE02FETPMS(String newvalue)
  {
    fieldE02FETPMS.setString(newvalue);
  }

  /**
  * Get value of field E02FETPMS as a String.
  */
  public String getE02FETPMS()
  {
    return fieldE02FETPMS.getString();
  }

  /**
  * Set numeric field E02FETPMS using a BigDecimal value.
  */
  public void setE02FETPMS(BigDecimal newvalue)
  {
    fieldE02FETPMS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02FETPMS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02FETPMS()
  {
    return fieldE02FETPMS.getBigDecimal();
  }

  /**
  * Set field E02FETPMY using a String value.
  */
  public void setE02FETPMY(String newvalue)
  {
    fieldE02FETPMY.setString(newvalue);
  }

  /**
  * Get value of field E02FETPMY as a String.
  */
  public String getE02FETPMY()
  {
    return fieldE02FETPMY.getString();
  }

  /**
  * Set numeric field E02FETPMY using a BigDecimal value.
  */
  public void setE02FETPMY(BigDecimal newvalue)
  {
    fieldE02FETPMY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02FETPMY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02FETPMY()
  {
    return fieldE02FETPMY.getBigDecimal();
  }

  /**
  * Set field E02FETSMD using a String value.
  */
  public void setE02FETSMD(String newvalue)
  {
    fieldE02FETSMD.setString(newvalue);
  }

  /**
  * Get value of field E02FETSMD as a String.
  */
  public String getE02FETSMD()
  {
    return fieldE02FETSMD.getString();
  }

  /**
  * Set numeric field E02FETSMD using a BigDecimal value.
  */
  public void setE02FETSMD(BigDecimal newvalue)
  {
    fieldE02FETSMD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02FETSMD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02FETSMD()
  {
    return fieldE02FETSMD.getBigDecimal();
  }

  /**
  * Set field E02FETSMM using a String value.
  */
  public void setE02FETSMM(String newvalue)
  {
    fieldE02FETSMM.setString(newvalue);
  }

  /**
  * Get value of field E02FETSMM as a String.
  */
  public String getE02FETSMM()
  {
    return fieldE02FETSMM.getString();
  }

  /**
  * Set numeric field E02FETSMM using a BigDecimal value.
  */
  public void setE02FETSMM(BigDecimal newvalue)
  {
    fieldE02FETSMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02FETSMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02FETSMM()
  {
    return fieldE02FETSMM.getBigDecimal();
  }

  /**
  * Set field E02FETSMS using a String value.
  */
  public void setE02FETSMS(String newvalue)
  {
    fieldE02FETSMS.setString(newvalue);
  }

  /**
  * Get value of field E02FETSMS as a String.
  */
  public String getE02FETSMS()
  {
    return fieldE02FETSMS.getString();
  }

  /**
  * Set numeric field E02FETSMS using a BigDecimal value.
  */
  public void setE02FETSMS(BigDecimal newvalue)
  {
    fieldE02FETSMS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02FETSMS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02FETSMS()
  {
    return fieldE02FETSMS.getBigDecimal();
  }

  /**
  * Set field E02FETSMY using a String value.
  */
  public void setE02FETSMY(String newvalue)
  {
    fieldE02FETSMY.setString(newvalue);
  }

  /**
  * Get value of field E02FETSMY as a String.
  */
  public String getE02FETSMY()
  {
    return fieldE02FETSMY.getString();
  }

  /**
  * Set numeric field E02FETSMY using a BigDecimal value.
  */
  public void setE02FETSMY(BigDecimal newvalue)
  {
    fieldE02FETSMY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02FETSMY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02FETSMY()
  {
    return fieldE02FETSMY.getBigDecimal();
  }

  /**
  * Set field E02FETPST using a String value.
  */
  public void setE02FETPST(String newvalue)
  {
    fieldE02FETPST.setString(newvalue);
  }

  /**
  * Get value of field E02FETPST as a String.
  */
  public String getE02FETPST()
  {
    return fieldE02FETPST.getString();
  }

  /**
  * Set field E02FETSST using a String value.
  */
  public void setE02FETSST(String newvalue)
  {
    fieldE02FETSST.setString(newvalue);
  }

  /**
  * Get value of field E02FETSST as a String.
  */
  public String getE02FETSST()
  {
    return fieldE02FETSST.getString();
  }

}
