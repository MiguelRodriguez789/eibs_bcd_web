package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL914002 physical file definition.
* 
* File level identifier is 1020830193354.
* Record format level identifier is 40CE7B88C8B7B.
*/

public class EDL914002Message extends MessageRecord
{
  final int FIELDCOUNT = 17;
  private CharacterField fieldH02USERID = null;
  private CharacterField fieldH02PROGRM = null;
  private CharacterField fieldH02TIMSYS = null;
  private CharacterField fieldH02SCRCOD = null;
  private CharacterField fieldH02OPECOD = null;
  private CharacterField fieldH02FLGMAS = null;
  private CharacterField fieldH02FLGWK1 = null;
  private CharacterField fieldH02FLGWK2 = null;
  private CharacterField fieldH02FLGWK3 = null;
  private DecimalField fieldE02LGRACC = null;
  private DecimalField fieldE02LGRRDC = null;
  private DecimalField fieldE02LGRRDY = null;
  private DecimalField fieldE02LGRRDM = null;
  private DecimalField fieldE02LGRRDD = null;
  private DecimalField fieldE02LGRTIM = null;
  private CharacterField fieldE02ACTION = null;
  private CharacterField fieldE02MSGTXT = null;

  /**
  * Constructor for EDL914002Message.
  */
  public EDL914002Message()
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
    recordsize = 1074;
    fileid = "1020830193354";
    recordid = "40CE7B88C8B7B";
    message = new byte[getByteLength()];
    formatname = "EDL914002";
    fieldnames = new String[FIELDCOUNT];
    tagnames = new String[FIELDCOUNT];
    fields = new MessageField[FIELDCOUNT];

    fieldnames[0] = "H02USERID";
    tagnames[0] = "H02USERID";
    fields[0] = fieldH02USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H02USERID");
    fieldnames[1] = "H02PROGRM";
    tagnames[1] = "H02PROGRM";
    fields[1] = fieldH02PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H02PROGRM");
    fieldnames[2] = "H02TIMSYS";
    tagnames[2] = "H02TIMSYS";
    fields[2] = fieldH02TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H02TIMSYS");
    fieldnames[3] = "H02SCRCOD";
    tagnames[3] = "H02SCRCOD";
    fields[3] = fieldH02SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H02SCRCOD");
    fieldnames[4] = "H02OPECOD";
    tagnames[4] = "H02OPECOD";
    fields[4] = fieldH02OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H02OPECOD");
    fieldnames[5] = "H02FLGMAS";
    tagnames[5] = "H02FLGMAS";
    fields[5] = fieldH02FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H02FLGMAS");
    fieldnames[6] = "H02FLGWK1";
    tagnames[6] = "H02FLGWK1";
    fields[6] = fieldH02FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H02FLGWK1");
    fieldnames[7] = "H02FLGWK2";
    tagnames[7] = "H02FLGWK2";
    fields[7] = fieldH02FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H02FLGWK2");
    fieldnames[8] = "H02FLGWK3";
    tagnames[8] = "H02FLGWK3";
    fields[8] = fieldH02FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H02FLGWK3");
    fieldnames[9] = "E02LGRACC";
    tagnames[9] = "E02LGRACC";
    fields[9] = fieldE02LGRACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E02LGRACC");
    fieldnames[10] = "E02LGRRDC";
    tagnames[10] = "E02LGRRDC";
    fields[10] = fieldE02LGRRDC =
    new DecimalField(message, HEADERSIZE + 55, 2, 0, "E02LGRRDC");
    fieldnames[11] = "E02LGRRDY";
    tagnames[11] = "E02LGRRDY";
    fields[11] = fieldE02LGRRDY =
    new DecimalField(message, HEADERSIZE + 57, 3, 0, "E02LGRRDY");
    fieldnames[12] = "E02LGRRDM";
    tagnames[12] = "E02LGRRDM";
    fields[12] = fieldE02LGRRDM =
    new DecimalField(message, HEADERSIZE + 60, 3, 0, "E02LGRRDM");
    fieldnames[13] = "E02LGRRDD";
    tagnames[13] = "E02LGRRDD";
    fields[13] = fieldE02LGRRDD =
    new DecimalField(message, HEADERSIZE + 63, 3, 0, "E02LGRRDD");
    fieldnames[14] = "E02LGRTIM";
    tagnames[14] = "E02LGRTIM";
    fields[14] = fieldE02LGRTIM =
    new DecimalField(message, HEADERSIZE + 66, 7, 0, "E02LGRTIM");
    fieldnames[15] = "E02ACTION";
    tagnames[15] = "E02ACTION";
    fields[15] = fieldE02ACTION =
    new CharacterField(message, HEADERSIZE + 73, 1, "E02ACTION");
    fieldnames[16] = "E02MSGTXT";
    tagnames[16] = "E02MSGTXT";
    fields[16] = fieldE02MSGTXT =
    new CharacterField(message, HEADERSIZE + 74, 1000, "E02MSGTXT");
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
  * Set field E02LGRACC using a String value.
  */
  public void setE02LGRACC(String newvalue)
  {
    fieldE02LGRACC.setString(newvalue);
  }

  /**
  * Get value of field E02LGRACC as a String.
  */
  public String getE02LGRACC()
  {
    return fieldE02LGRACC.getString();
  }

  /**
  * Set numeric field E02LGRACC using a BigDecimal value.
  */
  public void setE02LGRACC(BigDecimal newvalue)
  {
    fieldE02LGRACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02LGRACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02LGRACC()
  {
    return fieldE02LGRACC.getBigDecimal();
  }

  /**
  * Set field E02LGRRDC using a String value.
  */
  public void setE02LGRRDC(String newvalue)
  {
    fieldE02LGRRDC.setString(newvalue);
  }

  /**
  * Get value of field E02LGRRDC as a String.
  */
  public String getE02LGRRDC()
  {
    return fieldE02LGRRDC.getString();
  }

  /**
  * Set numeric field E02LGRRDC using a BigDecimal value.
  */
  public void setE02LGRRDC(BigDecimal newvalue)
  {
    fieldE02LGRRDC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02LGRRDC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02LGRRDC()
  {
    return fieldE02LGRRDC.getBigDecimal();
  }

  /**
  * Set field E02LGRRDY using a String value.
  */
  public void setE02LGRRDY(String newvalue)
  {
    fieldE02LGRRDY.setString(newvalue);
  }

  /**
  * Get value of field E02LGRRDY as a String.
  */
  public String getE02LGRRDY()
  {
    return fieldE02LGRRDY.getString();
  }

  /**
  * Set numeric field E02LGRRDY using a BigDecimal value.
  */
  public void setE02LGRRDY(BigDecimal newvalue)
  {
    fieldE02LGRRDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02LGRRDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02LGRRDY()
  {
    return fieldE02LGRRDY.getBigDecimal();
  }

  /**
  * Set field E02LGRRDM using a String value.
  */
  public void setE02LGRRDM(String newvalue)
  {
    fieldE02LGRRDM.setString(newvalue);
  }

  /**
  * Get value of field E02LGRRDM as a String.
  */
  public String getE02LGRRDM()
  {
    return fieldE02LGRRDM.getString();
  }

  /**
  * Set numeric field E02LGRRDM using a BigDecimal value.
  */
  public void setE02LGRRDM(BigDecimal newvalue)
  {
    fieldE02LGRRDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02LGRRDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02LGRRDM()
  {
    return fieldE02LGRRDM.getBigDecimal();
  }

  /**
  * Set field E02LGRRDD using a String value.
  */
  public void setE02LGRRDD(String newvalue)
  {
    fieldE02LGRRDD.setString(newvalue);
  }

  /**
  * Get value of field E02LGRRDD as a String.
  */
  public String getE02LGRRDD()
  {
    return fieldE02LGRRDD.getString();
  }

  /**
  * Set numeric field E02LGRRDD using a BigDecimal value.
  */
  public void setE02LGRRDD(BigDecimal newvalue)
  {
    fieldE02LGRRDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02LGRRDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02LGRRDD()
  {
    return fieldE02LGRRDD.getBigDecimal();
  }

  /**
  * Set field E02LGRTIM using a String value.
  */
  public void setE02LGRTIM(String newvalue)
  {
    fieldE02LGRTIM.setString(newvalue);
  }

  /**
  * Get value of field E02LGRTIM as a String.
  */
  public String getE02LGRTIM()
  {
    return fieldE02LGRTIM.getString();
  }

  /**
  * Set numeric field E02LGRTIM using a BigDecimal value.
  */
  public void setE02LGRTIM(BigDecimal newvalue)
  {
    fieldE02LGRTIM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02LGRTIM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02LGRTIM()
  {
    return fieldE02LGRTIM.getBigDecimal();
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

  /**
  * Set field E02MSGTXT using a String value.
  */
  public void setE02MSGTXT(String newvalue)
  {
    fieldE02MSGTXT.setString(newvalue);
  }

  /**
  * Get value of field E02MSGTXT as a String.
  */
  public String getE02MSGTXT()
  {
    return fieldE02MSGTXT.getString();
  }

}