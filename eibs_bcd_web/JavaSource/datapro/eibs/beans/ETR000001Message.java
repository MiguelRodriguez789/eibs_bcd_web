package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ETR000001 physical file definition.
* 
* File level identifier is 1160915110706.
* Record format level identifier is 4AD4C78175C3D.
*/

public class ETR000001Message extends MessageRecord
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
                                     "R01TREACC",
                                     "R01TRETYP",
                                     "R01TREACD",
                                     "R01TRECUN",
                                     "R01TRENA1",
                                     "R01TREDSC",
                                     "R01TREPGM",
                                     "R01TREPRD",
                                     "R01TREPDS",
                                     "R01TRECCY",
                                     "E01TRELEV",
                                     "E01TRETYP",
                                     "E01TREACD",
                                     "E01TREDSC",
                                     "E01TREPGM",
                                     "E01TREPRD",
                                     "E01TREPDS",
                                     "E01TRECCY",
                                     "E01ACT",
                                     "E01NUMREC",
                                     "E01INDOPE"
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
                                   "R01TREACC",
                                   "R01TRETYP",
                                   "R01TREACD",
                                   "R01TRECUN",
                                   "R01TRENA1",
                                   "R01TREDSC",
                                   "R01TREPGM",
                                   "R01TREPRD",
                                   "R01TREPDS",
                                   "R01TRECCY",
                                   "E01TRELEV",
                                   "E01TRETYP",
                                   "E01TREACD",
                                   "E01TREDSC",
                                   "E01TREPGM",
                                   "E01TREPRD",
                                   "E01TREPDS",
                                   "E01TRECCY",
                                   "E01ACT",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1160915110706";
  final static String rid = "4AD4C78175C3D";
  final static String fmtname = "ETR000001";
  final int FIELDCOUNT = 30;
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
  private DecimalField fieldR01TREACC = null;
  private CharacterField fieldR01TRETYP = null;
  private CharacterField fieldR01TREACD = null;
  private DecimalField fieldR01TRECUN = null;
  private CharacterField fieldR01TRENA1 = null;
  private CharacterField fieldR01TREDSC = null;
  private CharacterField fieldR01TREPGM = null;
  private CharacterField fieldR01TREPRD = null;
  private CharacterField fieldR01TREPDS = null;
  private CharacterField fieldR01TRECCY = null;
  private CharacterField fieldE01TRELEV = null;
  private CharacterField fieldE01TRETYP = null;
  private CharacterField fieldE01TREACD = null;
  private CharacterField fieldE01TREDSC = null;
  private CharacterField fieldE01TREPGM = null;
  private CharacterField fieldE01TREPRD = null;
  private CharacterField fieldE01TREPDS = null;
  private CharacterField fieldE01TRECCY = null;
  private CharacterField fieldE01ACT = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for ETR000001Message.
  */
  public ETR000001Message()
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
    recordsize = 362;
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
    fields[9] = fieldR01TREACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "R01TREACC");
    fields[10] = fieldR01TRETYP =
    new CharacterField(message, HEADERSIZE + 55, 4, "R01TRETYP");
    fields[11] = fieldR01TREACD =
    new CharacterField(message, HEADERSIZE + 59, 2, "R01TREACD");
    fields[12] = fieldR01TRECUN =
    new DecimalField(message, HEADERSIZE + 61, 10, 0, "R01TRECUN");
    fields[13] = fieldR01TRENA1 =
    new CharacterField(message, HEADERSIZE + 71, 60, "R01TRENA1");
    fields[14] = fieldR01TREDSC =
    new CharacterField(message, HEADERSIZE + 131, 45, "R01TREDSC");
    fields[15] = fieldR01TREPGM =
    new CharacterField(message, HEADERSIZE + 176, 10, "R01TREPGM");
    fields[16] = fieldR01TREPRD =
    new CharacterField(message, HEADERSIZE + 186, 4, "R01TREPRD");
    fields[17] = fieldR01TREPDS =
    new CharacterField(message, HEADERSIZE + 190, 45, "R01TREPDS");
    fields[18] = fieldR01TRECCY =
    new CharacterField(message, HEADERSIZE + 235, 3, "R01TRECCY");
    fields[19] = fieldE01TRELEV =
    new CharacterField(message, HEADERSIZE + 238, 1, "E01TRELEV");
    fields[20] = fieldE01TRETYP =
    new CharacterField(message, HEADERSIZE + 239, 4, "E01TRETYP");
    fields[21] = fieldE01TREACD =
    new CharacterField(message, HEADERSIZE + 243, 2, "E01TREACD");
    fields[22] = fieldE01TREDSC =
    new CharacterField(message, HEADERSIZE + 245, 45, "E01TREDSC");
    fields[23] = fieldE01TREPGM =
    new CharacterField(message, HEADERSIZE + 290, 10, "E01TREPGM");
    fields[24] = fieldE01TREPRD =
    new CharacterField(message, HEADERSIZE + 300, 4, "E01TREPRD");
    fields[25] = fieldE01TREPDS =
    new CharacterField(message, HEADERSIZE + 304, 45, "E01TREPDS");
    fields[26] = fieldE01TRECCY =
    new CharacterField(message, HEADERSIZE + 349, 3, "E01TRECCY");
    fields[27] = fieldE01ACT =
    new CharacterField(message, HEADERSIZE + 352, 1, "E01ACT");
    fields[28] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 353, 8, 0, "E01NUMREC");
    fields[29] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 361, 1, "E01INDOPE");

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
  * Set field R01TREACC using a String value.
  */
  public void setR01TREACC(String newvalue)
  {
    fieldR01TREACC.setString(newvalue);
  }

  /**
  * Get value of field R01TREACC as a String.
  */
  public String getR01TREACC()
  {
    return fieldR01TREACC.getString();
  }

  /**
  * Set numeric field R01TREACC using a BigDecimal value.
  */
  public void setR01TREACC(BigDecimal newvalue)
  {
    fieldR01TREACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field R01TREACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalR01TREACC()
  {
    return fieldR01TREACC.getBigDecimal();
  }

  /**
  * Set field R01TRETYP using a String value.
  */
  public void setR01TRETYP(String newvalue)
  {
    fieldR01TRETYP.setString(newvalue);
  }

  /**
  * Get value of field R01TRETYP as a String.
  */
  public String getR01TRETYP()
  {
    return fieldR01TRETYP.getString();
  }

  /**
  * Set field R01TREACD using a String value.
  */
  public void setR01TREACD(String newvalue)
  {
    fieldR01TREACD.setString(newvalue);
  }

  /**
  * Get value of field R01TREACD as a String.
  */
  public String getR01TREACD()
  {
    return fieldR01TREACD.getString();
  }

  /**
  * Set field R01TRECUN using a String value.
  */
  public void setR01TRECUN(String newvalue)
  {
    fieldR01TRECUN.setString(newvalue);
  }

  /**
  * Get value of field R01TRECUN as a String.
  */
  public String getR01TRECUN()
  {
    return fieldR01TRECUN.getString();
  }

  /**
  * Set numeric field R01TRECUN using a BigDecimal value.
  */
  public void setR01TRECUN(BigDecimal newvalue)
  {
    fieldR01TRECUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field R01TRECUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalR01TRECUN()
  {
    return fieldR01TRECUN.getBigDecimal();
  }

  /**
  * Set field R01TRENA1 using a String value.
  */
  public void setR01TRENA1(String newvalue)
  {
    fieldR01TRENA1.setString(newvalue);
  }

  /**
  * Get value of field R01TRENA1 as a String.
  */
  public String getR01TRENA1()
  {
    return fieldR01TRENA1.getString();
  }

  /**
  * Set field R01TREDSC using a String value.
  */
  public void setR01TREDSC(String newvalue)
  {
    fieldR01TREDSC.setString(newvalue);
  }

  /**
  * Get value of field R01TREDSC as a String.
  */
  public String getR01TREDSC()
  {
    return fieldR01TREDSC.getString();
  }

  /**
  * Set field R01TREPGM using a String value.
  */
  public void setR01TREPGM(String newvalue)
  {
    fieldR01TREPGM.setString(newvalue);
  }

  /**
  * Get value of field R01TREPGM as a String.
  */
  public String getR01TREPGM()
  {
    return fieldR01TREPGM.getString();
  }

  /**
  * Set field R01TREPRD using a String value.
  */
  public void setR01TREPRD(String newvalue)
  {
    fieldR01TREPRD.setString(newvalue);
  }

  /**
  * Get value of field R01TREPRD as a String.
  */
  public String getR01TREPRD()
  {
    return fieldR01TREPRD.getString();
  }

  /**
  * Set field R01TREPDS using a String value.
  */
  public void setR01TREPDS(String newvalue)
  {
    fieldR01TREPDS.setString(newvalue);
  }

  /**
  * Get value of field R01TREPDS as a String.
  */
  public String getR01TREPDS()
  {
    return fieldR01TREPDS.getString();
  }

  /**
  * Set field R01TRECCY using a String value.
  */
  public void setR01TRECCY(String newvalue)
  {
    fieldR01TRECCY.setString(newvalue);
  }

  /**
  * Get value of field R01TRECCY as a String.
  */
  public String getR01TRECCY()
  {
    return fieldR01TRECCY.getString();
  }

  /**
  * Set field E01TRELEV using a String value.
  */
  public void setE01TRELEV(String newvalue)
  {
    fieldE01TRELEV.setString(newvalue);
  }

  /**
  * Get value of field E01TRELEV as a String.
  */
  public String getE01TRELEV()
  {
    return fieldE01TRELEV.getString();
  }

  /**
  * Set field E01TRETYP using a String value.
  */
  public void setE01TRETYP(String newvalue)
  {
    fieldE01TRETYP.setString(newvalue);
  }

  /**
  * Get value of field E01TRETYP as a String.
  */
  public String getE01TRETYP()
  {
    return fieldE01TRETYP.getString();
  }

  /**
  * Set field E01TREACD using a String value.
  */
  public void setE01TREACD(String newvalue)
  {
    fieldE01TREACD.setString(newvalue);
  }

  /**
  * Get value of field E01TREACD as a String.
  */
  public String getE01TREACD()
  {
    return fieldE01TREACD.getString();
  }

  /**
  * Set field E01TREDSC using a String value.
  */
  public void setE01TREDSC(String newvalue)
  {
    fieldE01TREDSC.setString(newvalue);
  }

  /**
  * Get value of field E01TREDSC as a String.
  */
  public String getE01TREDSC()
  {
    return fieldE01TREDSC.getString();
  }

  /**
  * Set field E01TREPGM using a String value.
  */
  public void setE01TREPGM(String newvalue)
  {
    fieldE01TREPGM.setString(newvalue);
  }

  /**
  * Get value of field E01TREPGM as a String.
  */
  public String getE01TREPGM()
  {
    return fieldE01TREPGM.getString();
  }

  /**
  * Set field E01TREPRD using a String value.
  */
  public void setE01TREPRD(String newvalue)
  {
    fieldE01TREPRD.setString(newvalue);
  }

  /**
  * Get value of field E01TREPRD as a String.
  */
  public String getE01TREPRD()
  {
    return fieldE01TREPRD.getString();
  }

  /**
  * Set field E01TREPDS using a String value.
  */
  public void setE01TREPDS(String newvalue)
  {
    fieldE01TREPDS.setString(newvalue);
  }

  /**
  * Get value of field E01TREPDS as a String.
  */
  public String getE01TREPDS()
  {
    return fieldE01TREPDS.getString();
  }

  /**
  * Set field E01TRECCY using a String value.
  */
  public void setE01TRECCY(String newvalue)
  {
    fieldE01TRECCY.setString(newvalue);
  }

  /**
  * Get value of field E01TRECCY as a String.
  */
  public String getE01TRECCY()
  {
    return fieldE01TRECCY.getString();
  }

  /**
  * Set field E01ACT using a String value.
  */
  public void setE01ACT(String newvalue)
  {
    fieldE01ACT.setString(newvalue);
  }

  /**
  * Get value of field E01ACT as a String.
  */
  public String getE01ACT()
  {
    return fieldE01ACT.getString();
  }

  /**
  * Set field E01NUMREC using a String value.
  */
  public void setE01NUMREC(String newvalue)
  {
    fieldE01NUMREC.setString(newvalue);
  }

  /**
  * Get value of field E01NUMREC as a String.
  */
  public String getE01NUMREC()
  {
    return fieldE01NUMREC.getString();
  }

  /**
  * Set numeric field E01NUMREC using a BigDecimal value.
  */
  public void setE01NUMREC(BigDecimal newvalue)
  {
    fieldE01NUMREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01NUMREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01NUMREC()
  {
    return fieldE01NUMREC.getBigDecimal();
  }

  /**
  * Set field E01INDOPE using a String value.
  */
  public void setE01INDOPE(String newvalue)
  {
    fieldE01INDOPE.setString(newvalue);
  }

  /**
  * Get value of field E01INDOPE as a String.
  */
  public String getE01INDOPE()
  {
    return fieldE01INDOPE.getString();
  }

}
 