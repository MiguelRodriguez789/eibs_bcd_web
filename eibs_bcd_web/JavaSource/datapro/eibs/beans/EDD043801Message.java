package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

/**
* Class generated by AS/400 CRTCLASS command from EDD043801 physical file definition.
* 
* File level identifier is 1021008114051.
* Record format level identifier is 4DDE102E7B959.
*/

public class EDD043801Message extends MessageRecord
{
  final int FIELDCOUNT = 33;
  private CharacterField fieldH01USERID = null;
  private CharacterField fieldH01PROGRM = null;
  private CharacterField fieldH01TIMSYS = null;
  private CharacterField fieldH01SCRCOD = null;
  private CharacterField fieldH01OPECOD = null;
  private CharacterField fieldH01FLGMAS = null;
  private CharacterField fieldH01FLGWK1 = null;
  private CharacterField fieldH01FLGWK2 = null;
  private CharacterField fieldH01FLGWK3 = null;
  private CharacterField fieldE01OVCBNK = null;
  private DecimalField fieldE01OVCMAX = null;
  private DecimalField fieldE01OVCCGL = null;
  private DecimalField fieldE01OVCCOM = null;
  private DecimalField fieldE01OVCMIN = null;
  private CharacterField fieldE01OVCNAR = null;
  private DecimalField fieldE01OVCAVG = null;
  private DecimalField fieldE01OVCINV = null;
  private DecimalField fieldE01OVCTRM = null;
  private DecimalField fieldE01OVCDAY = null;
  private DecimalField fieldE01OVCNUM = null;
  private DecimalField fieldE01OVCLIN = null;
  private CharacterField fieldF01OVCBNK = null;
  private CharacterField fieldF01OVCMAX = null;
  private CharacterField fieldF01OVCCGL = null;
  private CharacterField fieldF01OVCCOM = null;
  private CharacterField fieldF01OVCMIN = null;
  private CharacterField fieldF01OVCNAR = null;
  private CharacterField fieldF01OVCAVG = null;
  private CharacterField fieldF01OVCINV = null;
  private CharacterField fieldF01OVCTRM = null;
  private CharacterField fieldF01OVCDAY = null;
  private CharacterField fieldF01OVCNUM = null;
  private CharacterField fieldF01OVCLIN = null;

  /**
  * Constructor for EDD043801Message.
  */
  public EDD043801Message()
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
    recordsize = 191;
    fileid = "1021008114051";
    recordid = "4DDE102E7B959";
    message = new byte[getByteLength()];
    formatname = "EDD043801";
    fieldnames = new String[FIELDCOUNT];
    tagnames = new String[FIELDCOUNT];
    fields = new MessageField[FIELDCOUNT];

    fieldnames[0] = "H01USERID";
    tagnames[0] = "H01USERID";
    fields[0] = fieldH01USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H01USERID");
    fieldnames[1] = "H01PROGRM";
    tagnames[1] = "H01PROGRM";
    fields[1] = fieldH01PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H01PROGRM");
    fieldnames[2] = "H01TIMSYS";
    tagnames[2] = "H01TIMSYS";
    fields[2] = fieldH01TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H01TIMSYS");
    fieldnames[3] = "H01SCRCOD";
    tagnames[3] = "H01SCRCOD";
    fields[3] = fieldH01SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H01SCRCOD");
    fieldnames[4] = "H01OPECOD";
    tagnames[4] = "H01OPECOD";
    fields[4] = fieldH01OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H01OPECOD");
    fieldnames[5] = "H01FLGMAS";
    tagnames[5] = "H01FLGMAS";
    fields[5] = fieldH01FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H01FLGMAS");
    fieldnames[6] = "H01FLGWK1";
    tagnames[6] = "H01FLGWK1";
    fields[6] = fieldH01FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H01FLGWK1");
    fieldnames[7] = "H01FLGWK2";
    tagnames[7] = "H01FLGWK2";
    fields[7] = fieldH01FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H01FLGWK2");
    fieldnames[8] = "H01FLGWK3";
    tagnames[8] = "H01FLGWK3";
    fields[8] = fieldH01FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H01FLGWK3");
    fieldnames[9] = "E01OVCBNK";
    tagnames[9] = "E01OVCBNK";
    fields[9] = fieldE01OVCBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01OVCBNK");
    fieldnames[10] = "E01OVCMAX";
    tagnames[10] = "E01OVCMAX";
    fields[10] = fieldE01OVCMAX =
    new DecimalField(message, HEADERSIZE + 44, 17, 2, "E01OVCMAX");
    fieldnames[11] = "E01OVCCGL";
    tagnames[11] = "E01OVCCGL";
    fields[11] = fieldE01OVCCGL =
    new DecimalField(message, HEADERSIZE + 61, 17, 0, "E01OVCCGL");
    fieldnames[12] = "E01OVCCOM";
    tagnames[12] = "E01OVCCOM";
    fields[12] = fieldE01OVCCOM =
    new DecimalField(message, HEADERSIZE + 78, 11, 6, "E01OVCCOM");
    fieldnames[13] = "E01OVCMIN";
    tagnames[13] = "E01OVCMIN";
    fields[13] = fieldE01OVCMIN =
    new DecimalField(message, HEADERSIZE + 89, 17, 2, "E01OVCMIN");
    fieldnames[14] = "E01OVCNAR";
    tagnames[14] = "E01OVCNAR";
    fields[14] = fieldE01OVCNAR =
    new CharacterField(message, HEADERSIZE + 106, 30, "E01OVCNAR");
    fieldnames[15] = "E01OVCAVG";
    tagnames[15] = "E01OVCAVG";
    fields[15] = fieldE01OVCAVG =
    new DecimalField(message, HEADERSIZE + 136, 11, 6, "E01OVCAVG");
    fieldnames[16] = "E01OVCINV";
    tagnames[16] = "E01OVCINV";
    fields[16] = fieldE01OVCINV =
    new DecimalField(message, HEADERSIZE + 147, 11, 6, "E01OVCINV");
    fieldnames[17] = "E01OVCTRM";
    tagnames[17] = "E01OVCTRM";
    fields[17] = fieldE01OVCTRM =
    new DecimalField(message, HEADERSIZE + 158, 5, 0, "E01OVCTRM");
    fieldnames[18] = "E01OVCDAY";
    tagnames[18] = "E01OVCDAY";
    fields[18] = fieldE01OVCDAY =
    new DecimalField(message, HEADERSIZE + 163, 5, 0, "E01OVCDAY");
    fieldnames[19] = "E01OVCNUM";
    tagnames[19] = "E01OVCNUM";
    fields[19] = fieldE01OVCNUM =
    new DecimalField(message, HEADERSIZE + 168, 6, 0, "E01OVCNUM");
    fieldnames[20] = "E01OVCLIN";
    tagnames[20] = "E01OVCLIN";
    fields[20] = fieldE01OVCLIN =
    new DecimalField(message, HEADERSIZE + 174, 5, 0, "E01OVCLIN");
    fieldnames[21] = "F01OVCBNK";
    tagnames[21] = "F01OVCBNK";
    fields[21] = fieldF01OVCBNK =
    new CharacterField(message, HEADERSIZE + 179, 1, "F01OVCBNK");
    fieldnames[22] = "F01OVCMAX";
    tagnames[22] = "F01OVCMAX";
    fields[22] = fieldF01OVCMAX =
    new CharacterField(message, HEADERSIZE + 180, 1, "F01OVCMAX");
    fieldnames[23] = "F01OVCCGL";
    tagnames[23] = "F01OVCCGL";
    fields[23] = fieldF01OVCCGL =
    new CharacterField(message, HEADERSIZE + 181, 1, "F01OVCCGL");
    fieldnames[24] = "F01OVCCOM";
    tagnames[24] = "F01OVCCOM";
    fields[24] = fieldF01OVCCOM =
    new CharacterField(message, HEADERSIZE + 182, 1, "F01OVCCOM");
    fieldnames[25] = "F01OVCMIN";
    tagnames[25] = "F01OVCMIN";
    fields[25] = fieldF01OVCMIN =
    new CharacterField(message, HEADERSIZE + 183, 1, "F01OVCMIN");
    fieldnames[26] = "F01OVCNAR";
    tagnames[26] = "F01OVCNAR";
    fields[26] = fieldF01OVCNAR =
    new CharacterField(message, HEADERSIZE + 184, 1, "F01OVCNAR");
    fieldnames[27] = "F01OVCAVG";
    tagnames[27] = "F01OVCAVG";
    fields[27] = fieldF01OVCAVG =
    new CharacterField(message, HEADERSIZE + 185, 1, "F01OVCAVG");
    fieldnames[28] = "F01OVCINV";
    tagnames[28] = "F01OVCINV";
    fields[28] = fieldF01OVCINV =
    new CharacterField(message, HEADERSIZE + 186, 1, "F01OVCINV");
    fieldnames[29] = "F01OVCTRM";
    tagnames[29] = "F01OVCTRM";
    fields[29] = fieldF01OVCTRM =
    new CharacterField(message, HEADERSIZE + 187, 1, "F01OVCTRM");
    fieldnames[30] = "F01OVCDAY";
    tagnames[30] = "F01OVCDAY";
    fields[30] = fieldF01OVCDAY =
    new CharacterField(message, HEADERSIZE + 188, 1, "F01OVCDAY");
    fieldnames[31] = "F01OVCNUM";
    tagnames[31] = "F01OVCNUM";
    fields[31] = fieldF01OVCNUM =
    new CharacterField(message, HEADERSIZE + 189, 1, "F01OVCNUM");
    fieldnames[32] = "F01OVCLIN";
    tagnames[32] = "F01OVCLIN";
    fields[32] = fieldF01OVCLIN =
    new CharacterField(message, HEADERSIZE + 190, 1, "F01OVCLIN");
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
  * Set field E01OVCBNK using a String value.
  */
  public void setE01OVCBNK(String newvalue)
  {
    fieldE01OVCBNK.setString(newvalue);
  }

  /**
  * Get value of field E01OVCBNK as a String.
  */
  public String getE01OVCBNK()
  {
    return fieldE01OVCBNK.getString();
  }

  /**
  * Set field E01OVCMAX using a String value.
  */
  public void setE01OVCMAX(String newvalue)
  {
    fieldE01OVCMAX.setString(newvalue);
  }

  /**
  * Get value of field E01OVCMAX as a String.
  */
  public String getE01OVCMAX()
  {
    return fieldE01OVCMAX.getString();
  }

  /**
  * Set numeric field E01OVCMAX using a BigDecimal value.
  */
  public void setE01OVCMAX(BigDecimal newvalue)
  {
    fieldE01OVCMAX.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01OVCMAX as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01OVCMAX()
  {
    return fieldE01OVCMAX.getBigDecimal();
  }

  /**
  * Set field E01OVCCGL using a String value.
  */
  public void setE01OVCCGL(String newvalue)
  {
    fieldE01OVCCGL.setString(newvalue);
  }

  /**
  * Get value of field E01OVCCGL as a String.
  */
  public String getE01OVCCGL()
  {
    return fieldE01OVCCGL.getString();
  }

  /**
  * Set numeric field E01OVCCGL using a BigDecimal value.
  */
  public void setE01OVCCGL(BigDecimal newvalue)
  {
    fieldE01OVCCGL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01OVCCGL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01OVCCGL()
  {
    return fieldE01OVCCGL.getBigDecimal();
  }

  /**
  * Set field E01OVCCOM using a String value.
  */
  public void setE01OVCCOM(String newvalue)
  {
    fieldE01OVCCOM.setString(newvalue);
  }

  /**
  * Get value of field E01OVCCOM as a String.
  */
  public String getE01OVCCOM()
  {
    return fieldE01OVCCOM.getString();
  }

  /**
  * Set numeric field E01OVCCOM using a BigDecimal value.
  */
  public void setE01OVCCOM(BigDecimal newvalue)
  {
    fieldE01OVCCOM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01OVCCOM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01OVCCOM()
  {
    return fieldE01OVCCOM.getBigDecimal();
  }

  /**
  * Set field E01OVCMIN using a String value.
  */
  public void setE01OVCMIN(String newvalue)
  {
    fieldE01OVCMIN.setString(newvalue);
  }

  /**
  * Get value of field E01OVCMIN as a String.
  */
  public String getE01OVCMIN()
  {
    return fieldE01OVCMIN.getString();
  }

  /**
  * Set numeric field E01OVCMIN using a BigDecimal value.
  */
  public void setE01OVCMIN(BigDecimal newvalue)
  {
    fieldE01OVCMIN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01OVCMIN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01OVCMIN()
  {
    return fieldE01OVCMIN.getBigDecimal();
  }

  /**
  * Set field E01OVCNAR using a String value.
  */
  public void setE01OVCNAR(String newvalue)
  {
    fieldE01OVCNAR.setString(newvalue);
  }

  /**
  * Get value of field E01OVCNAR as a String.
  */
  public String getE01OVCNAR()
  {
    return fieldE01OVCNAR.getString();
  }

  /**
  * Set field E01OVCAVG using a String value.
  */
  public void setE01OVCAVG(String newvalue)
  {
    fieldE01OVCAVG.setString(newvalue);
  }

  /**
  * Get value of field E01OVCAVG as a String.
  */
  public String getE01OVCAVG()
  {
    return fieldE01OVCAVG.getString();
  }

  /**
  * Set numeric field E01OVCAVG using a BigDecimal value.
  */
  public void setE01OVCAVG(BigDecimal newvalue)
  {
    fieldE01OVCAVG.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01OVCAVG as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01OVCAVG()
  {
    return fieldE01OVCAVG.getBigDecimal();
  }

  /**
  * Set field E01OVCINV using a String value.
  */
  public void setE01OVCINV(String newvalue)
  {
    fieldE01OVCINV.setString(newvalue);
  }

  /**
  * Get value of field E01OVCINV as a String.
  */
  public String getE01OVCINV()
  {
    return fieldE01OVCINV.getString();
  }

  /**
  * Set numeric field E01OVCINV using a BigDecimal value.
  */
  public void setE01OVCINV(BigDecimal newvalue)
  {
    fieldE01OVCINV.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01OVCINV as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01OVCINV()
  {
    return fieldE01OVCINV.getBigDecimal();
  }

  /**
  * Set field E01OVCTRM using a String value.
  */
  public void setE01OVCTRM(String newvalue)
  {
    fieldE01OVCTRM.setString(newvalue);
  }

  /**
  * Get value of field E01OVCTRM as a String.
  */
  public String getE01OVCTRM()
  {
    return fieldE01OVCTRM.getString();
  }

  /**
  * Set numeric field E01OVCTRM using a BigDecimal value.
  */
  public void setE01OVCTRM(BigDecimal newvalue)
  {
    fieldE01OVCTRM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01OVCTRM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01OVCTRM()
  {
    return fieldE01OVCTRM.getBigDecimal();
  }

  /**
  * Set field E01OVCDAY using a String value.
  */
  public void setE01OVCDAY(String newvalue)
  {
    fieldE01OVCDAY.setString(newvalue);
  }

  /**
  * Get value of field E01OVCDAY as a String.
  */
  public String getE01OVCDAY()
  {
    return fieldE01OVCDAY.getString();
  }

  /**
  * Set numeric field E01OVCDAY using a BigDecimal value.
  */
  public void setE01OVCDAY(BigDecimal newvalue)
  {
    fieldE01OVCDAY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01OVCDAY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01OVCDAY()
  {
    return fieldE01OVCDAY.getBigDecimal();
  }

  /**
  * Set field E01OVCNUM using a String value.
  */
  public void setE01OVCNUM(String newvalue)
  {
    fieldE01OVCNUM.setString(newvalue);
  }

  /**
  * Get value of field E01OVCNUM as a String.
  */
  public String getE01OVCNUM()
  {
    return fieldE01OVCNUM.getString();
  }

  /**
  * Set numeric field E01OVCNUM using a BigDecimal value.
  */
  public void setE01OVCNUM(BigDecimal newvalue)
  {
    fieldE01OVCNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01OVCNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01OVCNUM()
  {
    return fieldE01OVCNUM.getBigDecimal();
  }

  /**
  * Set field E01OVCLIN using a String value.
  */
  public void setE01OVCLIN(String newvalue)
  {
    fieldE01OVCLIN.setString(newvalue);
  }

  /**
  * Get value of field E01OVCLIN as a String.
  */
  public String getE01OVCLIN()
  {
    return fieldE01OVCLIN.getString();
  }

  /**
  * Set numeric field E01OVCLIN using a BigDecimal value.
  */
  public void setE01OVCLIN(BigDecimal newvalue)
  {
    fieldE01OVCLIN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01OVCLIN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01OVCLIN()
  {
    return fieldE01OVCLIN.getBigDecimal();
  }

  /**
  * Set field F01OVCBNK using a String value.
  */
  public void setF01OVCBNK(String newvalue)
  {
    fieldF01OVCBNK.setString(newvalue);
  }

  /**
  * Get value of field F01OVCBNK as a String.
  */
  public String getF01OVCBNK()
  {
    return fieldF01OVCBNK.getString();
  }

  /**
  * Set field F01OVCMAX using a String value.
  */
  public void setF01OVCMAX(String newvalue)
  {
    fieldF01OVCMAX.setString(newvalue);
  }

  /**
  * Get value of field F01OVCMAX as a String.
  */
  public String getF01OVCMAX()
  {
    return fieldF01OVCMAX.getString();
  }

  /**
  * Set field F01OVCCGL using a String value.
  */
  public void setF01OVCCGL(String newvalue)
  {
    fieldF01OVCCGL.setString(newvalue);
  }

  /**
  * Get value of field F01OVCCGL as a String.
  */
  public String getF01OVCCGL()
  {
    return fieldF01OVCCGL.getString();
  }

  /**
  * Set field F01OVCCOM using a String value.
  */
  public void setF01OVCCOM(String newvalue)
  {
    fieldF01OVCCOM.setString(newvalue);
  }

  /**
  * Get value of field F01OVCCOM as a String.
  */
  public String getF01OVCCOM()
  {
    return fieldF01OVCCOM.getString();
  }

  /**
  * Set field F01OVCMIN using a String value.
  */
  public void setF01OVCMIN(String newvalue)
  {
    fieldF01OVCMIN.setString(newvalue);
  }

  /**
  * Get value of field F01OVCMIN as a String.
  */
  public String getF01OVCMIN()
  {
    return fieldF01OVCMIN.getString();
  }

  /**
  * Set field F01OVCNAR using a String value.
  */
  public void setF01OVCNAR(String newvalue)
  {
    fieldF01OVCNAR.setString(newvalue);
  }

  /**
  * Get value of field F01OVCNAR as a String.
  */
  public String getF01OVCNAR()
  {
    return fieldF01OVCNAR.getString();
  }

  /**
  * Set field F01OVCAVG using a String value.
  */
  public void setF01OVCAVG(String newvalue)
  {
    fieldF01OVCAVG.setString(newvalue);
  }

  /**
  * Get value of field F01OVCAVG as a String.
  */
  public String getF01OVCAVG()
  {
    return fieldF01OVCAVG.getString();
  }

  /**
  * Set field F01OVCINV using a String value.
  */
  public void setF01OVCINV(String newvalue)
  {
    fieldF01OVCINV.setString(newvalue);
  }

  /**
  * Get value of field F01OVCINV as a String.
  */
  public String getF01OVCINV()
  {
    return fieldF01OVCINV.getString();
  }

  /**
  * Set field F01OVCTRM using a String value.
  */
  public void setF01OVCTRM(String newvalue)
  {
    fieldF01OVCTRM.setString(newvalue);
  }

  /**
  * Get value of field F01OVCTRM as a String.
  */
  public String getF01OVCTRM()
  {
    return fieldF01OVCTRM.getString();
  }

  /**
  * Set field F01OVCDAY using a String value.
  */
  public void setF01OVCDAY(String newvalue)
  {
    fieldF01OVCDAY.setString(newvalue);
  }

  /**
  * Get value of field F01OVCDAY as a String.
  */
  public String getF01OVCDAY()
  {
    return fieldF01OVCDAY.getString();
  }

  /**
  * Set field F01OVCNUM using a String value.
  */
  public void setF01OVCNUM(String newvalue)
  {
    fieldF01OVCNUM.setString(newvalue);
  }

  /**
  * Get value of field F01OVCNUM as a String.
  */
  public String getF01OVCNUM()
  {
    return fieldF01OVCNUM.getString();
  }

  /**
  * Set field F01OVCLIN using a String value.
  */
  public void setF01OVCLIN(String newvalue)
  {
    fieldF01OVCLIN.setString(newvalue);
  }

  /**
  * Get value of field F01OVCLIN as a String.
  */
  public String getF01OVCLIN()
  {
    return fieldF01OVCLIN.getString();
  }

}
