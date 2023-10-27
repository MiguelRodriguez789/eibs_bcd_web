package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWS001801 physical file definition.
* 
* File level identifier is 1130611113511.
* Record format level identifier is 24335367453EA.
*/

public class EWS001801Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H06USERID",
                                     "H06PROGRM",
                                     "H06TIMSYS",
                                     "H06SCRCOD",
                                     "H06OPECOD",
                                     "H06FLGMAS",
                                     "H06FLGWK1",
                                     "H06FLGWK2",
                                     "H06FLGWK3",
                                     "E06LDMACC",
                                     "E06LDMPRO",
                                     "E06LDMCUN",
                                     "E06LDMCCY",
                                     "E06LDMCDP",
                                     "E06LDMCDA",
                                     "E06LDMKDP",
                                     "E06LDMKDA",
                                     "E06LDMCWD",
                                     "E06LDMCWA",
                                     "E06LDMCPY",
                                     "E06LDMCPA",
                                     "E06LDMTIN",
                                     "E06LDMTIA",
                                     "E06LDMTRV",
                                     "E06LDMTRA",
                                     "E06LDMGAV",
                                     "E06LDMNAV",
                                     "E06LDMMOT",
                                     "E06LDMUSO",
                                     "E06LDMVOL",
                                     "E06LDMDEP",
                                     "E06LDMPMD",
                                     "E06LDMTRF",
                                     "E06LDMCN1",
                                     "E06LDMCN2",
                                     "E06LDMCN3",
                                     "E06LDMCN4",
                                     "E06LDMUC1",
                                     "E06LDMAM1",
                                     "E06LDMFG1",
                                     "E06LDMFG2",
                                     "E06LDMFG3",
                                     "E06LDMFG4",
                                     "E06LDMUC3"
                                   };
  final static String tnames[] = {
                                   "H06USERID",
                                   "H06PROGRM",
                                   "H06TIMSYS",
                                   "H06SCRCOD",
                                   "H06OPECOD",
                                   "H06FLGMAS",
                                   "H06FLGWK1",
                                   "H06FLGWK2",
                                   "H06FLGWK3",
                                   "E06LDMACC",
                                   "E06LDMPRO",
                                   "E06LDMCUN",
                                   "E06LDMCCY",
                                   "E06LDMCDP",
                                   "E06LDMCDA",
                                   "E06LDMKDP",
                                   "E06LDMKDA",
                                   "E06LDMCWD",
                                   "E06LDMCWA",
                                   "E06LDMCPY",
                                   "E06LDMCPA",
                                   "E06LDMTIN",
                                   "E06LDMTIA",
                                   "E06LDMTRV",
                                   "E06LDMTRA",
                                   "E06LDMGAV",
                                   "E06LDMNAV",
                                   "E06LDMMOT",
                                   "E06LDMUSO",
                                   "E06LDMVOL",
                                   "E06LDMDEP",
                                   "E06LDMPMD",
                                   "E06LDMTRF",
                                   "E06LDMCN1",
                                   "E06LDMCN2",
                                   "E06LDMCN3",
                                   "E06LDMCN4",
                                   "E06LDMUC1",
                                   "E06LDMAM1",
                                   "E06LDMFG1",
                                   "E06LDMFG2",
                                   "E06LDMFG3",
                                   "E06LDMFG4",
                                   "E06LDMUC3"
                                 };
  final static String fid = "1130611113511";
  final static String rid = "24335367453EA";
  final static String fmtname = "EWS001801";
  final int FIELDCOUNT = 44;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH06USERID = null;
  private CharacterField fieldH06PROGRM = null;
  private CharacterField fieldH06TIMSYS = null;
  private CharacterField fieldH06SCRCOD = null;
  private CharacterField fieldH06OPECOD = null;
  private CharacterField fieldH06FLGMAS = null;
  private CharacterField fieldH06FLGWK1 = null;
  private CharacterField fieldH06FLGWK2 = null;
  private CharacterField fieldH06FLGWK3 = null;
  private DecimalField fieldE06LDMACC = null;
  private CharacterField fieldE06LDMPRO = null;
  private DecimalField fieldE06LDMCUN = null;
  private CharacterField fieldE06LDMCCY = null;
  private DecimalField fieldE06LDMCDP = null;
  private DecimalField fieldE06LDMCDA = null;
  private DecimalField fieldE06LDMKDP = null;
  private DecimalField fieldE06LDMKDA = null;
  private DecimalField fieldE06LDMCWD = null;
  private DecimalField fieldE06LDMCWA = null;
  private DecimalField fieldE06LDMCPY = null;
  private DecimalField fieldE06LDMCPA = null;
  private DecimalField fieldE06LDMTIN = null;
  private DecimalField fieldE06LDMTIA = null;
  private DecimalField fieldE06LDMTRV = null;
  private DecimalField fieldE06LDMTRA = null;
  private DecimalField fieldE06LDMGAV = null;
  private DecimalField fieldE06LDMNAV = null;
  private CharacterField fieldE06LDMMOT = null;
  private CharacterField fieldE06LDMUSO = null;
  private DecimalField fieldE06LDMVOL = null;
  private DecimalField fieldE06LDMDEP = null;
  private DecimalField fieldE06LDMPMD = null;
  private CharacterField fieldE06LDMTRF = null;
  private CharacterField fieldE06LDMCN1 = null;
  private CharacterField fieldE06LDMCN2 = null;
  private CharacterField fieldE06LDMCN3 = null;
  private CharacterField fieldE06LDMCN4 = null;
  private CharacterField fieldE06LDMUC1 = null;
  private DecimalField fieldE06LDMAM1 = null;
  private CharacterField fieldE06LDMFG1 = null;
  private CharacterField fieldE06LDMFG2 = null;
  private CharacterField fieldE06LDMFG3 = null;
  private CharacterField fieldE06LDMFG4 = null;
  private CharacterField fieldE06LDMUC3 = null;

  /**
  * Constructor for EWS001801Message.
  */
  public EWS001801Message()
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
    recordsize = 343;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH06USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H06USERID");
    fields[1] = fieldH06PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H06PROGRM");
    fields[2] = fieldH06TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H06TIMSYS");
    fields[3] = fieldH06SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H06SCRCOD");
    fields[4] = fieldH06OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H06OPECOD");
    fields[5] = fieldH06FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H06FLGMAS");
    fields[6] = fieldH06FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H06FLGWK1");
    fields[7] = fieldH06FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H06FLGWK2");
    fields[8] = fieldH06FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H06FLGWK3");
    fields[9] = fieldE06LDMACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E06LDMACC");
    fields[10] = fieldE06LDMPRO =
    new CharacterField(message, HEADERSIZE + 55, 4, "E06LDMPRO");
    fields[11] = fieldE06LDMCUN =
    new DecimalField(message, HEADERSIZE + 59, 10, 0, "E06LDMCUN");
    fields[12] = fieldE06LDMCCY =
    new CharacterField(message, HEADERSIZE + 69, 3, "E06LDMCCY");
    fields[13] = fieldE06LDMCDP =
    new DecimalField(message, HEADERSIZE + 72, 6, 0, "E06LDMCDP");
    fields[14] = fieldE06LDMCDA =
    new DecimalField(message, HEADERSIZE + 78, 17, 2, "E06LDMCDA");
    fields[15] = fieldE06LDMKDP =
    new DecimalField(message, HEADERSIZE + 95, 6, 0, "E06LDMKDP");
    fields[16] = fieldE06LDMKDA =
    new DecimalField(message, HEADERSIZE + 101, 17, 2, "E06LDMKDA");
    fields[17] = fieldE06LDMCWD =
    new DecimalField(message, HEADERSIZE + 118, 6, 0, "E06LDMCWD");
    fields[18] = fieldE06LDMCWA =
    new DecimalField(message, HEADERSIZE + 124, 17, 2, "E06LDMCWA");
    fields[19] = fieldE06LDMCPY =
    new DecimalField(message, HEADERSIZE + 141, 6, 0, "E06LDMCPY");
    fields[20] = fieldE06LDMCPA =
    new DecimalField(message, HEADERSIZE + 147, 17, 2, "E06LDMCPA");
    fields[21] = fieldE06LDMTIN =
    new DecimalField(message, HEADERSIZE + 164, 6, 0, "E06LDMTIN");
    fields[22] = fieldE06LDMTIA =
    new DecimalField(message, HEADERSIZE + 170, 17, 2, "E06LDMTIA");
    fields[23] = fieldE06LDMTRV =
    new DecimalField(message, HEADERSIZE + 187, 6, 0, "E06LDMTRV");
    fields[24] = fieldE06LDMTRA =
    new DecimalField(message, HEADERSIZE + 193, 17, 2, "E06LDMTRA");
    fields[25] = fieldE06LDMGAV =
    new DecimalField(message, HEADERSIZE + 210, 17, 2, "E06LDMGAV");
    fields[26] = fieldE06LDMNAV =
    new DecimalField(message, HEADERSIZE + 227, 17, 2, "E06LDMNAV");
    fields[27] = fieldE06LDMMOT =
    new CharacterField(message, HEADERSIZE + 244, 4, "E06LDMMOT");
    fields[28] = fieldE06LDMUSO =
    new CharacterField(message, HEADERSIZE + 248, 4, "E06LDMUSO");
    fields[29] = fieldE06LDMVOL =
    new DecimalField(message, HEADERSIZE + 252, 17, 2, "E06LDMVOL");
    fields[30] = fieldE06LDMDEP =
    new DecimalField(message, HEADERSIZE + 269, 17, 2, "E06LDMDEP");
    fields[31] = fieldE06LDMPMD =
    new DecimalField(message, HEADERSIZE + 286, 11, 6, "E06LDMPMD");
    fields[32] = fieldE06LDMTRF =
    new CharacterField(message, HEADERSIZE + 297, 1, "E06LDMTRF");
    fields[33] = fieldE06LDMCN1 =
    new CharacterField(message, HEADERSIZE + 298, 4, "E06LDMCN1");
    fields[34] = fieldE06LDMCN2 =
    new CharacterField(message, HEADERSIZE + 302, 4, "E06LDMCN2");
    fields[35] = fieldE06LDMCN3 =
    new CharacterField(message, HEADERSIZE + 306, 4, "E06LDMCN3");
    fields[36] = fieldE06LDMCN4 =
    new CharacterField(message, HEADERSIZE + 310, 4, "E06LDMCN4");
    fields[37] = fieldE06LDMUC1 =
    new CharacterField(message, HEADERSIZE + 314, 4, "E06LDMUC1");
    fields[38] = fieldE06LDMAM1 =
    new DecimalField(message, HEADERSIZE + 318, 17, 2, "E06LDMAM1");
    fields[39] = fieldE06LDMFG1 =
    new CharacterField(message, HEADERSIZE + 335, 1, "E06LDMFG1");
    fields[40] = fieldE06LDMFG2 =
    new CharacterField(message, HEADERSIZE + 336, 1, "E06LDMFG2");
    fields[41] = fieldE06LDMFG3 =
    new CharacterField(message, HEADERSIZE + 337, 1, "E06LDMFG3");
    fields[42] = fieldE06LDMFG4 =
    new CharacterField(message, HEADERSIZE + 338, 1, "E06LDMFG4");
    fields[43] = fieldE06LDMUC3 =
    new CharacterField(message, HEADERSIZE + 339, 4, "E06LDMUC3");

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
  * Set field H06USERID using a String value.
  */
  public void setH06USERID(String newvalue)
  {
    fieldH06USERID.setString(newvalue);
  }

  /**
  * Get value of field H06USERID as a String.
  */
  public String getH06USERID()
  {
    return fieldH06USERID.getString();
  }

  /**
  * Set field H06PROGRM using a String value.
  */
  public void setH06PROGRM(String newvalue)
  {
    fieldH06PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H06PROGRM as a String.
  */
  public String getH06PROGRM()
  {
    return fieldH06PROGRM.getString();
  }

  /**
  * Set field H06TIMSYS using a String value.
  */
  public void setH06TIMSYS(String newvalue)
  {
    fieldH06TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H06TIMSYS as a String.
  */
  public String getH06TIMSYS()
  {
    return fieldH06TIMSYS.getString();
  }

  /**
  * Set field H06SCRCOD using a String value.
  */
  public void setH06SCRCOD(String newvalue)
  {
    fieldH06SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H06SCRCOD as a String.
  */
  public String getH06SCRCOD()
  {
    return fieldH06SCRCOD.getString();
  }

  /**
  * Set field H06OPECOD using a String value.
  */
  public void setH06OPECOD(String newvalue)
  {
    fieldH06OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H06OPECOD as a String.
  */
  public String getH06OPECOD()
  {
    return fieldH06OPECOD.getString();
  }

  /**
  * Set field H06FLGMAS using a String value.
  */
  public void setH06FLGMAS(String newvalue)
  {
    fieldH06FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H06FLGMAS as a String.
  */
  public String getH06FLGMAS()
  {
    return fieldH06FLGMAS.getString();
  }

  /**
  * Set field H06FLGWK1 using a String value.
  */
  public void setH06FLGWK1(String newvalue)
  {
    fieldH06FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H06FLGWK1 as a String.
  */
  public String getH06FLGWK1()
  {
    return fieldH06FLGWK1.getString();
  }

  /**
  * Set field H06FLGWK2 using a String value.
  */
  public void setH06FLGWK2(String newvalue)
  {
    fieldH06FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H06FLGWK2 as a String.
  */
  public String getH06FLGWK2()
  {
    return fieldH06FLGWK2.getString();
  }

  /**
  * Set field H06FLGWK3 using a String value.
  */
  public void setH06FLGWK3(String newvalue)
  {
    fieldH06FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H06FLGWK3 as a String.
  */
  public String getH06FLGWK3()
  {
    return fieldH06FLGWK3.getString();
  }

  /**
  * Set field E06LDMACC using a String value.
  */
  public void setE06LDMACC(String newvalue)
  {
    fieldE06LDMACC.setString(newvalue);
  }

  /**
  * Get value of field E06LDMACC as a String.
  */
  public String getE06LDMACC()
  {
    return fieldE06LDMACC.getString();
  }

  /**
  * Set numeric field E06LDMACC using a BigDecimal value.
  */
  public void setE06LDMACC(BigDecimal newvalue)
  {
    fieldE06LDMACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06LDMACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06LDMACC()
  {
    return fieldE06LDMACC.getBigDecimal();
  }

  /**
  * Set field E06LDMPRO using a String value.
  */
  public void setE06LDMPRO(String newvalue)
  {
    fieldE06LDMPRO.setString(newvalue);
  }

  /**
  * Get value of field E06LDMPRO as a String.
  */
  public String getE06LDMPRO()
  {
    return fieldE06LDMPRO.getString();
  }

  /**
  * Set field E06LDMCUN using a String value.
  */
  public void setE06LDMCUN(String newvalue)
  {
    fieldE06LDMCUN.setString(newvalue);
  }

  /**
  * Get value of field E06LDMCUN as a String.
  */
  public String getE06LDMCUN()
  {
    return fieldE06LDMCUN.getString();
  }

  /**
  * Set numeric field E06LDMCUN using a BigDecimal value.
  */
  public void setE06LDMCUN(BigDecimal newvalue)
  {
    fieldE06LDMCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06LDMCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06LDMCUN()
  {
    return fieldE06LDMCUN.getBigDecimal();
  }

  /**
  * Set field E06LDMCCY using a String value.
  */
  public void setE06LDMCCY(String newvalue)
  {
    fieldE06LDMCCY.setString(newvalue);
  }

  /**
  * Get value of field E06LDMCCY as a String.
  */
  public String getE06LDMCCY()
  {
    return fieldE06LDMCCY.getString();
  }

  /**
  * Set field E06LDMCDP using a String value.
  */
  public void setE06LDMCDP(String newvalue)
  {
    fieldE06LDMCDP.setString(newvalue);
  }

  /**
  * Get value of field E06LDMCDP as a String.
  */
  public String getE06LDMCDP()
  {
    return fieldE06LDMCDP.getString();
  }

  /**
  * Set numeric field E06LDMCDP using a BigDecimal value.
  */
  public void setE06LDMCDP(BigDecimal newvalue)
  {
    fieldE06LDMCDP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06LDMCDP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06LDMCDP()
  {
    return fieldE06LDMCDP.getBigDecimal();
  }

  /**
  * Set field E06LDMCDA using a String value.
  */
  public void setE06LDMCDA(String newvalue)
  {
    fieldE06LDMCDA.setString(newvalue);
  }

  /**
  * Get value of field E06LDMCDA as a String.
  */
  public String getE06LDMCDA()
  {
    return fieldE06LDMCDA.getString();
  }

  /**
  * Set numeric field E06LDMCDA using a BigDecimal value.
  */
  public void setE06LDMCDA(BigDecimal newvalue)
  {
    fieldE06LDMCDA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06LDMCDA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06LDMCDA()
  {
    return fieldE06LDMCDA.getBigDecimal();
  }

  /**
  * Set field E06LDMKDP using a String value.
  */
  public void setE06LDMKDP(String newvalue)
  {
    fieldE06LDMKDP.setString(newvalue);
  }

  /**
  * Get value of field E06LDMKDP as a String.
  */
  public String getE06LDMKDP()
  {
    return fieldE06LDMKDP.getString();
  }

  /**
  * Set numeric field E06LDMKDP using a BigDecimal value.
  */
  public void setE06LDMKDP(BigDecimal newvalue)
  {
    fieldE06LDMKDP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06LDMKDP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06LDMKDP()
  {
    return fieldE06LDMKDP.getBigDecimal();
  }

  /**
  * Set field E06LDMKDA using a String value.
  */
  public void setE06LDMKDA(String newvalue)
  {
    fieldE06LDMKDA.setString(newvalue);
  }

  /**
  * Get value of field E06LDMKDA as a String.
  */
  public String getE06LDMKDA()
  {
    return fieldE06LDMKDA.getString();
  }

  /**
  * Set numeric field E06LDMKDA using a BigDecimal value.
  */
  public void setE06LDMKDA(BigDecimal newvalue)
  {
    fieldE06LDMKDA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06LDMKDA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06LDMKDA()
  {
    return fieldE06LDMKDA.getBigDecimal();
  }

  /**
  * Set field E06LDMCWD using a String value.
  */
  public void setE06LDMCWD(String newvalue)
  {
    fieldE06LDMCWD.setString(newvalue);
  }

  /**
  * Get value of field E06LDMCWD as a String.
  */
  public String getE06LDMCWD()
  {
    return fieldE06LDMCWD.getString();
  }

  /**
  * Set numeric field E06LDMCWD using a BigDecimal value.
  */
  public void setE06LDMCWD(BigDecimal newvalue)
  {
    fieldE06LDMCWD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06LDMCWD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06LDMCWD()
  {
    return fieldE06LDMCWD.getBigDecimal();
  }

  /**
  * Set field E06LDMCWA using a String value.
  */
  public void setE06LDMCWA(String newvalue)
  {
    fieldE06LDMCWA.setString(newvalue);
  }

  /**
  * Get value of field E06LDMCWA as a String.
  */
  public String getE06LDMCWA()
  {
    return fieldE06LDMCWA.getString();
  }

  /**
  * Set numeric field E06LDMCWA using a BigDecimal value.
  */
  public void setE06LDMCWA(BigDecimal newvalue)
  {
    fieldE06LDMCWA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06LDMCWA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06LDMCWA()
  {
    return fieldE06LDMCWA.getBigDecimal();
  }

  /**
  * Set field E06LDMCPY using a String value.
  */
  public void setE06LDMCPY(String newvalue)
  {
    fieldE06LDMCPY.setString(newvalue);
  }

  /**
  * Get value of field E06LDMCPY as a String.
  */
  public String getE06LDMCPY()
  {
    return fieldE06LDMCPY.getString();
  }

  /**
  * Set numeric field E06LDMCPY using a BigDecimal value.
  */
  public void setE06LDMCPY(BigDecimal newvalue)
  {
    fieldE06LDMCPY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06LDMCPY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06LDMCPY()
  {
    return fieldE06LDMCPY.getBigDecimal();
  }

  /**
  * Set field E06LDMCPA using a String value.
  */
  public void setE06LDMCPA(String newvalue)
  {
    fieldE06LDMCPA.setString(newvalue);
  }

  /**
  * Get value of field E06LDMCPA as a String.
  */
  public String getE06LDMCPA()
  {
    return fieldE06LDMCPA.getString();
  }

  /**
  * Set numeric field E06LDMCPA using a BigDecimal value.
  */
  public void setE06LDMCPA(BigDecimal newvalue)
  {
    fieldE06LDMCPA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06LDMCPA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06LDMCPA()
  {
    return fieldE06LDMCPA.getBigDecimal();
  }

  /**
  * Set field E06LDMTIN using a String value.
  */
  public void setE06LDMTIN(String newvalue)
  {
    fieldE06LDMTIN.setString(newvalue);
  }

  /**
  * Get value of field E06LDMTIN as a String.
  */
  public String getE06LDMTIN()
  {
    return fieldE06LDMTIN.getString();
  }

  /**
  * Set numeric field E06LDMTIN using a BigDecimal value.
  */
  public void setE06LDMTIN(BigDecimal newvalue)
  {
    fieldE06LDMTIN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06LDMTIN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06LDMTIN()
  {
    return fieldE06LDMTIN.getBigDecimal();
  }

  /**
  * Set field E06LDMTIA using a String value.
  */
  public void setE06LDMTIA(String newvalue)
  {
    fieldE06LDMTIA.setString(newvalue);
  }

  /**
  * Get value of field E06LDMTIA as a String.
  */
  public String getE06LDMTIA()
  {
    return fieldE06LDMTIA.getString();
  }

  /**
  * Set numeric field E06LDMTIA using a BigDecimal value.
  */
  public void setE06LDMTIA(BigDecimal newvalue)
  {
    fieldE06LDMTIA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06LDMTIA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06LDMTIA()
  {
    return fieldE06LDMTIA.getBigDecimal();
  }

  /**
  * Set field E06LDMTRV using a String value.
  */
  public void setE06LDMTRV(String newvalue)
  {
    fieldE06LDMTRV.setString(newvalue);
  }

  /**
  * Get value of field E06LDMTRV as a String.
  */
  public String getE06LDMTRV()
  {
    return fieldE06LDMTRV.getString();
  }

  /**
  * Set numeric field E06LDMTRV using a BigDecimal value.
  */
  public void setE06LDMTRV(BigDecimal newvalue)
  {
    fieldE06LDMTRV.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06LDMTRV as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06LDMTRV()
  {
    return fieldE06LDMTRV.getBigDecimal();
  }

  /**
  * Set field E06LDMTRA using a String value.
  */
  public void setE06LDMTRA(String newvalue)
  {
    fieldE06LDMTRA.setString(newvalue);
  }

  /**
  * Get value of field E06LDMTRA as a String.
  */
  public String getE06LDMTRA()
  {
    return fieldE06LDMTRA.getString();
  }

  /**
  * Set numeric field E06LDMTRA using a BigDecimal value.
  */
  public void setE06LDMTRA(BigDecimal newvalue)
  {
    fieldE06LDMTRA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06LDMTRA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06LDMTRA()
  {
    return fieldE06LDMTRA.getBigDecimal();
  }

  /**
  * Set field E06LDMGAV using a String value.
  */
  public void setE06LDMGAV(String newvalue)
  {
    fieldE06LDMGAV.setString(newvalue);
  }

  /**
  * Get value of field E06LDMGAV as a String.
  */
  public String getE06LDMGAV()
  {
    return fieldE06LDMGAV.getString();
  }

  /**
  * Set numeric field E06LDMGAV using a BigDecimal value.
  */
  public void setE06LDMGAV(BigDecimal newvalue)
  {
    fieldE06LDMGAV.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06LDMGAV as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06LDMGAV()
  {
    return fieldE06LDMGAV.getBigDecimal();
  }

  /**
  * Set field E06LDMNAV using a String value.
  */
  public void setE06LDMNAV(String newvalue)
  {
    fieldE06LDMNAV.setString(newvalue);
  }

  /**
  * Get value of field E06LDMNAV as a String.
  */
  public String getE06LDMNAV()
  {
    return fieldE06LDMNAV.getString();
  }

  /**
  * Set numeric field E06LDMNAV using a BigDecimal value.
  */
  public void setE06LDMNAV(BigDecimal newvalue)
  {
    fieldE06LDMNAV.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06LDMNAV as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06LDMNAV()
  {
    return fieldE06LDMNAV.getBigDecimal();
  }

  /**
  * Set field E06LDMMOT using a String value.
  */
  public void setE06LDMMOT(String newvalue)
  {
    fieldE06LDMMOT.setString(newvalue);
  }

  /**
  * Get value of field E06LDMMOT as a String.
  */
  public String getE06LDMMOT()
  {
    return fieldE06LDMMOT.getString();
  }

  /**
  * Set field E06LDMUSO using a String value.
  */
  public void setE06LDMUSO(String newvalue)
  {
    fieldE06LDMUSO.setString(newvalue);
  }

  /**
  * Get value of field E06LDMUSO as a String.
  */
  public String getE06LDMUSO()
  {
    return fieldE06LDMUSO.getString();
  }

  /**
  * Set field E06LDMVOL using a String value.
  */
  public void setE06LDMVOL(String newvalue)
  {
    fieldE06LDMVOL.setString(newvalue);
  }

  /**
  * Get value of field E06LDMVOL as a String.
  */
  public String getE06LDMVOL()
  {
    return fieldE06LDMVOL.getString();
  }

  /**
  * Set numeric field E06LDMVOL using a BigDecimal value.
  */
  public void setE06LDMVOL(BigDecimal newvalue)
  {
    fieldE06LDMVOL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06LDMVOL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06LDMVOL()
  {
    return fieldE06LDMVOL.getBigDecimal();
  }

  /**
  * Set field E06LDMDEP using a String value.
  */
  public void setE06LDMDEP(String newvalue)
  {
    fieldE06LDMDEP.setString(newvalue);
  }

  /**
  * Get value of field E06LDMDEP as a String.
  */
  public String getE06LDMDEP()
  {
    return fieldE06LDMDEP.getString();
  }

  /**
  * Set numeric field E06LDMDEP using a BigDecimal value.
  */
  public void setE06LDMDEP(BigDecimal newvalue)
  {
    fieldE06LDMDEP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06LDMDEP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06LDMDEP()
  {
    return fieldE06LDMDEP.getBigDecimal();
  }

  /**
  * Set field E06LDMPMD using a String value.
  */
  public void setE06LDMPMD(String newvalue)
  {
    fieldE06LDMPMD.setString(newvalue);
  }

  /**
  * Get value of field E06LDMPMD as a String.
  */
  public String getE06LDMPMD()
  {
    return fieldE06LDMPMD.getString();
  }

  /**
  * Set numeric field E06LDMPMD using a BigDecimal value.
  */
  public void setE06LDMPMD(BigDecimal newvalue)
  {
    fieldE06LDMPMD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06LDMPMD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06LDMPMD()
  {
    return fieldE06LDMPMD.getBigDecimal();
  }

  /**
  * Set field E06LDMTRF using a String value.
  */
  public void setE06LDMTRF(String newvalue)
  {
    fieldE06LDMTRF.setString(newvalue);
  }

  /**
  * Get value of field E06LDMTRF as a String.
  */
  public String getE06LDMTRF()
  {
    return fieldE06LDMTRF.getString();
  }

  /**
  * Set field E06LDMCN1 using a String value.
  */
  public void setE06LDMCN1(String newvalue)
  {
    fieldE06LDMCN1.setString(newvalue);
  }

  /**
  * Get value of field E06LDMCN1 as a String.
  */
  public String getE06LDMCN1()
  {
    return fieldE06LDMCN1.getString();
  }

  /**
  * Set field E06LDMCN2 using a String value.
  */
  public void setE06LDMCN2(String newvalue)
  {
    fieldE06LDMCN2.setString(newvalue);
  }

  /**
  * Get value of field E06LDMCN2 as a String.
  */
  public String getE06LDMCN2()
  {
    return fieldE06LDMCN2.getString();
  }

  /**
  * Set field E06LDMCN3 using a String value.
  */
  public void setE06LDMCN3(String newvalue)
  {
    fieldE06LDMCN3.setString(newvalue);
  }

  /**
  * Get value of field E06LDMCN3 as a String.
  */
  public String getE06LDMCN3()
  {
    return fieldE06LDMCN3.getString();
  }

  /**
  * Set field E06LDMCN4 using a String value.
  */
  public void setE06LDMCN4(String newvalue)
  {
    fieldE06LDMCN4.setString(newvalue);
  }

  /**
  * Get value of field E06LDMCN4 as a String.
  */
  public String getE06LDMCN4()
  {
    return fieldE06LDMCN4.getString();
  }

  /**
  * Set field E06LDMUC1 using a String value.
  */
  public void setE06LDMUC1(String newvalue)
  {
    fieldE06LDMUC1.setString(newvalue);
  }

  /**
  * Get value of field E06LDMUC1 as a String.
  */
  public String getE06LDMUC1()
  {
    return fieldE06LDMUC1.getString();
  }

  /**
  * Set field E06LDMAM1 using a String value.
  */
  public void setE06LDMAM1(String newvalue)
  {
    fieldE06LDMAM1.setString(newvalue);
  }

  /**
  * Get value of field E06LDMAM1 as a String.
  */
  public String getE06LDMAM1()
  {
    return fieldE06LDMAM1.getString();
  }

  /**
  * Set numeric field E06LDMAM1 using a BigDecimal value.
  */
  public void setE06LDMAM1(BigDecimal newvalue)
  {
    fieldE06LDMAM1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06LDMAM1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06LDMAM1()
  {
    return fieldE06LDMAM1.getBigDecimal();
  }

  /**
  * Set field E06LDMFG1 using a String value.
  */
  public void setE06LDMFG1(String newvalue)
  {
    fieldE06LDMFG1.setString(newvalue);
  }

  /**
  * Get value of field E06LDMFG1 as a String.
  */
  public String getE06LDMFG1()
  {
    return fieldE06LDMFG1.getString();
  }

  /**
  * Set field E06LDMFG2 using a String value.
  */
  public void setE06LDMFG2(String newvalue)
  {
    fieldE06LDMFG2.setString(newvalue);
  }

  /**
  * Get value of field E06LDMFG2 as a String.
  */
  public String getE06LDMFG2()
  {
    return fieldE06LDMFG2.getString();
  }

  /**
  * Set field E06LDMFG3 using a String value.
  */
  public void setE06LDMFG3(String newvalue)
  {
    fieldE06LDMFG3.setString(newvalue);
  }

  /**
  * Get value of field E06LDMFG3 as a String.
  */
  public String getE06LDMFG3()
  {
    return fieldE06LDMFG3.getString();
  }

  /**
  * Set field E06LDMFG4 using a String value.
  */
  public void setE06LDMFG4(String newvalue)
  {
    fieldE06LDMFG4.setString(newvalue);
  }

  /**
  * Get value of field E06LDMFG4 as a String.
  */
  public String getE06LDMFG4()
  {
    return fieldE06LDMFG4.getString();
  }

  /**
  * Set field E06LDMUC3 using a String value.
  */
  public void setE06LDMUC3(String newvalue)
  {
    fieldE06LDMUC3.setString(newvalue);
  }

  /**
  * Get value of field E06LDMUC3 as a String.
  */
  public String getE06LDMUC3()
  {
    return fieldE06LDMUC3.getString();
  }

}