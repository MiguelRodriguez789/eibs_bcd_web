package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EIE030001T physical file definition.
* 
* File level identifier is 1100706173627.
* Record format level identifier is 47609391D2977.
*/

public class EIE030001TMessage extends MessageRecord
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
                                     "E01PRFCUN",
                                     "E01CUSNME",
                                     "E01PRFNUM",
                                     "E01PRFDSC",
                                     "E01PRFBNK",
                                     "E01PRFOFC",
                                     "E01OFCNME",
                                     "E01PRFOP1",
                                     "E01PRFOP2",
                                     "E01PRFOP3",
                                     "E01PRFVCY",
                                     "E01PRFTYP",
                                     "E01TYPDSC",
                                     "E01TOTQTY",
                                     "E01TOTNVA",
                                     "E01TOTBAL",
                                     "E01TOTINT",
                                     "E01TOTDIS",
                                     "E01TOTNDI",
                                     "E01TOTOQY",
                                     "E01TOTOVN",
                                     "E01TOTBOK",
                                     "E01TOTOIN",
                                     "E01DISINI",
                                     "E01NDSINI",
                                     "E01BSECCY",
                                     "E01BSEBAL",
                                     "E01BSEBOK",
                                     "E01BSEEXR",
                                     "E01TOTFL1",
                                     "E01TOTFL2",
                                     "E01TOTFL3",
                                     "E01TOTFL4",
                                     "E01TOTFL5",
                                     "E01TOTFL6",
                                     "E01TOTFL7",
                                     "E01TOTFL8",
                                     "E01HLDNME"
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
                                   "E01PRFCUN",
                                   "E01CUSNME",
                                   "E01PRFNUM",
                                   "E01PRFDSC",
                                   "E01PRFBNK",
                                   "E01PRFOFC",
                                   "E01OFCNME",
                                   "E01PRFOP1",
                                   "E01PRFOP2",
                                   "E01PRFOP3",
                                   "E01PRFVCY",
                                   "E01PRFTYP",
                                   "E01TYPDSC",
                                   "E01TOTQTY",
                                   "E01TOTNVA",
                                   "E01TOTBAL",
                                   "E01TOTINT",
                                   "E01TOTDIS",
                                   "E01TOTNDI",
                                   "E01TOTOQY",
                                   "E01TOTOVN",
                                   "E01TOTBOK",
                                   "E01TOTOIN",
                                   "E01DISINI",
                                   "E01NDSINI",
                                   "E01BSECCY",
                                   "E01BSEBAL",
                                   "E01BSEBOK",
                                   "E01BSEEXR",
                                   "E01TOTFL1",
                                   "E01TOTFL2",
                                   "E01TOTFL3",
                                   "E01TOTFL4",
                                   "E01TOTFL5",
                                   "E01TOTFL6",
                                   "E01TOTFL7",
                                   "E01TOTFL8",
                                   "E01HLDNME"
                                 };
  final static String fid = "1100706173627";
  final static String rid = "47609391D2977";
  final static String fmtname = "EIE030001T";
  final int FIELDCOUNT = 47;
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
  private DecimalField fieldE01PRFCUN = null;
  private CharacterField fieldE01CUSNME = null;
  private DecimalField fieldE01PRFNUM = null;
  private CharacterField fieldE01PRFDSC = null;
  private CharacterField fieldE01PRFBNK = null;
  private CharacterField fieldE01PRFOFC = null;
  private CharacterField fieldE01OFCNME = null;
  private DecimalField fieldE01PRFOP1 = null;
  private DecimalField fieldE01PRFOP2 = null;
  private DecimalField fieldE01PRFOP3 = null;
  private CharacterField fieldE01PRFVCY = null;
  private CharacterField fieldE01PRFTYP = null;
  private CharacterField fieldE01TYPDSC = null;
  private DecimalField fieldE01TOTQTY = null;
  private DecimalField fieldE01TOTNVA = null;
  private DecimalField fieldE01TOTBAL = null;
  private DecimalField fieldE01TOTINT = null;
  private DecimalField fieldE01TOTDIS = null;
  private DecimalField fieldE01TOTNDI = null;
  private DecimalField fieldE01TOTOQY = null;
  private DecimalField fieldE01TOTOVN = null;
  private DecimalField fieldE01TOTBOK = null;
  private DecimalField fieldE01TOTOIN = null;
  private DecimalField fieldE01DISINI = null;
  private DecimalField fieldE01NDSINI = null;
  private CharacterField fieldE01BSECCY = null;
  private DecimalField fieldE01BSEBAL = null;
  private DecimalField fieldE01BSEBOK = null;
  private DecimalField fieldE01BSEEXR = null;
  private DecimalField fieldE01TOTFL1 = null;
  private DecimalField fieldE01TOTFL2 = null;
  private DecimalField fieldE01TOTFL3 = null;
  private DecimalField fieldE01TOTFL4 = null;
  private DecimalField fieldE01TOTFL5 = null;
  private DecimalField fieldE01TOTFL6 = null;
  private DecimalField fieldE01TOTFL7 = null;
  private DecimalField fieldE01TOTFL8 = null;
  private CharacterField fieldE01HLDNME = null;

  /**
  * Constructor for EIE030001TMessage.
  */
  public EIE030001TMessage()
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
    recordsize = 774;
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
    fields[9] = fieldE01PRFCUN =
    new DecimalField(message, HEADERSIZE + 42, 10, 0, "E01PRFCUN");
    fields[10] = fieldE01CUSNME =
    new CharacterField(message, HEADERSIZE + 52, 45, "E01CUSNME");
    fields[11] = fieldE01PRFNUM =
    new DecimalField(message, HEADERSIZE + 97, 13, 0, "E01PRFNUM");
    fields[12] = fieldE01PRFDSC =
    new CharacterField(message, HEADERSIZE + 110, 30, "E01PRFDSC");
    fields[13] = fieldE01PRFBNK =
    new CharacterField(message, HEADERSIZE + 140, 2, "E01PRFBNK");
    fields[14] = fieldE01PRFOFC =
    new CharacterField(message, HEADERSIZE + 142, 4, "E01PRFOFC");
    fields[15] = fieldE01OFCNME =
    new CharacterField(message, HEADERSIZE + 146, 35, "E01OFCNME");
    fields[16] = fieldE01PRFOP1 =
    new DecimalField(message, HEADERSIZE + 181, 3, 0, "E01PRFOP1");
    fields[17] = fieldE01PRFOP2 =
    new DecimalField(message, HEADERSIZE + 184, 3, 0, "E01PRFOP2");
    fields[18] = fieldE01PRFOP3 =
    new DecimalField(message, HEADERSIZE + 187, 3, 0, "E01PRFOP3");
    fields[19] = fieldE01PRFVCY =
    new CharacterField(message, HEADERSIZE + 190, 3, "E01PRFVCY");
    fields[20] = fieldE01PRFTYP =
    new CharacterField(message, HEADERSIZE + 193, 1, "E01PRFTYP");
    fields[21] = fieldE01TYPDSC =
    new CharacterField(message, HEADERSIZE + 194, 20, "E01TYPDSC");
    fields[22] = fieldE01TOTQTY =
    new DecimalField(message, HEADERSIZE + 214, 18, 6, "E01TOTQTY");
    fields[23] = fieldE01TOTNVA =
    new DecimalField(message, HEADERSIZE + 232, 14, 2, "E01TOTNVA");
    fields[24] = fieldE01TOTBAL =
    new DecimalField(message, HEADERSIZE + 246, 14, 2, "E01TOTBAL");
    fields[25] = fieldE01TOTINT =
    new DecimalField(message, HEADERSIZE + 260, 14, 2, "E01TOTINT");
    fields[26] = fieldE01TOTDIS =
    new DecimalField(message, HEADERSIZE + 274, 14, 2, "E01TOTDIS");
    fields[27] = fieldE01TOTNDI =
    new DecimalField(message, HEADERSIZE + 288, 14, 2, "E01TOTNDI");
    fields[28] = fieldE01TOTOQY =
    new DecimalField(message, HEADERSIZE + 302, 18, 6, "E01TOTOQY");
    fields[29] = fieldE01TOTOVN =
    new DecimalField(message, HEADERSIZE + 320, 14, 2, "E01TOTOVN");
    fields[30] = fieldE01TOTBOK =
    new DecimalField(message, HEADERSIZE + 334, 14, 2, "E01TOTBOK");
    fields[31] = fieldE01TOTOIN =
    new DecimalField(message, HEADERSIZE + 348, 14, 2, "E01TOTOIN");
    fields[32] = fieldE01DISINI =
    new DecimalField(message, HEADERSIZE + 362, 14, 2, "E01DISINI");
    fields[33] = fieldE01NDSINI =
    new DecimalField(message, HEADERSIZE + 376, 14, 2, "E01NDSINI");
    fields[34] = fieldE01BSECCY =
    new CharacterField(message, HEADERSIZE + 390, 3, "E01BSECCY");
    fields[35] = fieldE01BSEBAL =
    new DecimalField(message, HEADERSIZE + 393, 14, 2, "E01BSEBAL");
    fields[36] = fieldE01BSEBOK =
    new DecimalField(message, HEADERSIZE + 407, 14, 2, "E01BSEBOK");
    fields[37] = fieldE01BSEEXR =
    new DecimalField(message, HEADERSIZE + 421, 11, 6, "E01BSEEXR");
    fields[38] = fieldE01TOTFL1 =
    new DecimalField(message, HEADERSIZE + 432, 14, 2, "E01TOTFL1");
    fields[39] = fieldE01TOTFL2 =
    new DecimalField(message, HEADERSIZE + 446, 14, 2, "E01TOTFL2");
    fields[40] = fieldE01TOTFL3 =
    new DecimalField(message, HEADERSIZE + 460, 14, 2, "E01TOTFL3");
    fields[41] = fieldE01TOTFL4 =
    new DecimalField(message, HEADERSIZE + 474, 18, 6, "E01TOTFL4");
    fields[42] = fieldE01TOTFL5 =
    new DecimalField(message, HEADERSIZE + 492, 18, 6, "E01TOTFL5");
    fields[43] = fieldE01TOTFL6 =
    new DecimalField(message, HEADERSIZE + 510, 8, 0, "E01TOTFL6");
    fields[44] = fieldE01TOTFL7 =
    new DecimalField(message, HEADERSIZE + 518, 8, 0, "E01TOTFL7");
    fields[45] = fieldE01TOTFL8 =
    new DecimalField(message, HEADERSIZE + 526, 8, 0, "E01TOTFL8");
    fields[46] = fieldE01HLDNME =
    new CharacterField(message, HEADERSIZE + 534, 240, "E01HLDNME");

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
  * Set field E01PRFCUN using a String value.
  */
  public void setE01PRFCUN(String newvalue)
  {
    fieldE01PRFCUN.setString(newvalue);
  }

  /**
  * Get value of field E01PRFCUN as a String.
  */
  public String getE01PRFCUN()
  {
    return fieldE01PRFCUN.getString();
  }

  /**
  * Set numeric field E01PRFCUN using a BigDecimal value.
  */
  public void setE01PRFCUN(BigDecimal newvalue)
  {
    fieldE01PRFCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRFCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRFCUN()
  {
    return fieldE01PRFCUN.getBigDecimal();
  }

  /**
  * Set field E01CUSNME using a String value.
  */
  public void setE01CUSNME(String newvalue)
  {
    fieldE01CUSNME.setString(newvalue);
  }

  /**
  * Get value of field E01CUSNME as a String.
  */
  public String getE01CUSNME()
  {
    return fieldE01CUSNME.getString();
  }

  /**
  * Set field E01PRFNUM using a String value.
  */
  public void setE01PRFNUM(String newvalue)
  {
    fieldE01PRFNUM.setString(newvalue);
  }

  /**
  * Get value of field E01PRFNUM as a String.
  */
  public String getE01PRFNUM()
  {
    return fieldE01PRFNUM.getString();
  }

  /**
  * Set numeric field E01PRFNUM using a BigDecimal value.
  */
  public void setE01PRFNUM(BigDecimal newvalue)
  {
    fieldE01PRFNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRFNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRFNUM()
  {
    return fieldE01PRFNUM.getBigDecimal();
  }

  /**
  * Set field E01PRFDSC using a String value.
  */
  public void setE01PRFDSC(String newvalue)
  {
    fieldE01PRFDSC.setString(newvalue);
  }

  /**
  * Get value of field E01PRFDSC as a String.
  */
  public String getE01PRFDSC()
  {
    return fieldE01PRFDSC.getString();
  }

  /**
  * Set field E01PRFBNK using a String value.
  */
  public void setE01PRFBNK(String newvalue)
  {
    fieldE01PRFBNK.setString(newvalue);
  }

  /**
  * Get value of field E01PRFBNK as a String.
  */
  public String getE01PRFBNK()
  {
    return fieldE01PRFBNK.getString();
  }

  /**
  * Set field E01PRFOFC using a String value.
  */
  public void setE01PRFOFC(String newvalue)
  {
    fieldE01PRFOFC.setString(newvalue);
  }

  /**
  * Get value of field E01PRFOFC as a String.
  */
  public String getE01PRFOFC()
  {
    return fieldE01PRFOFC.getString();
  }

  /**
  * Set field E01OFCNME using a String value.
  */
  public void setE01OFCNME(String newvalue)
  {
    fieldE01OFCNME.setString(newvalue);
  }

  /**
  * Get value of field E01OFCNME as a String.
  */
  public String getE01OFCNME()
  {
    return fieldE01OFCNME.getString();
  }

  /**
  * Set field E01PRFOP1 using a String value.
  */
  public void setE01PRFOP1(String newvalue)
  {
    fieldE01PRFOP1.setString(newvalue);
  }

  /**
  * Get value of field E01PRFOP1 as a String.
  */
  public String getE01PRFOP1()
  {
    return fieldE01PRFOP1.getString();
  }

  /**
  * Set numeric field E01PRFOP1 using a BigDecimal value.
  */
  public void setE01PRFOP1(BigDecimal newvalue)
  {
    fieldE01PRFOP1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRFOP1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRFOP1()
  {
    return fieldE01PRFOP1.getBigDecimal();
  }

  /**
  * Set field E01PRFOP2 using a String value.
  */
  public void setE01PRFOP2(String newvalue)
  {
    fieldE01PRFOP2.setString(newvalue);
  }

  /**
  * Get value of field E01PRFOP2 as a String.
  */
  public String getE01PRFOP2()
  {
    return fieldE01PRFOP2.getString();
  }

  /**
  * Set numeric field E01PRFOP2 using a BigDecimal value.
  */
  public void setE01PRFOP2(BigDecimal newvalue)
  {
    fieldE01PRFOP2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRFOP2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRFOP2()
  {
    return fieldE01PRFOP2.getBigDecimal();
  }

  /**
  * Set field E01PRFOP3 using a String value.
  */
  public void setE01PRFOP3(String newvalue)
  {
    fieldE01PRFOP3.setString(newvalue);
  }

  /**
  * Get value of field E01PRFOP3 as a String.
  */
  public String getE01PRFOP3()
  {
    return fieldE01PRFOP3.getString();
  }

  /**
  * Set numeric field E01PRFOP3 using a BigDecimal value.
  */
  public void setE01PRFOP3(BigDecimal newvalue)
  {
    fieldE01PRFOP3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRFOP3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRFOP3()
  {
    return fieldE01PRFOP3.getBigDecimal();
  }

  /**
  * Set field E01PRFVCY using a String value.
  */
  public void setE01PRFVCY(String newvalue)
  {
    fieldE01PRFVCY.setString(newvalue);
  }

  /**
  * Get value of field E01PRFVCY as a String.
  */
  public String getE01PRFVCY()
  {
    return fieldE01PRFVCY.getString();
  }

  /**
  * Set field E01PRFTYP using a String value.
  */
  public void setE01PRFTYP(String newvalue)
  {
    fieldE01PRFTYP.setString(newvalue);
  }

  /**
  * Get value of field E01PRFTYP as a String.
  */
  public String getE01PRFTYP()
  {
    return fieldE01PRFTYP.getString();
  }

  /**
  * Set field E01TYPDSC using a String value.
  */
  public void setE01TYPDSC(String newvalue)
  {
    fieldE01TYPDSC.setString(newvalue);
  }

  /**
  * Get value of field E01TYPDSC as a String.
  */
  public String getE01TYPDSC()
  {
    return fieldE01TYPDSC.getString();
  }

  /**
  * Set field E01TOTQTY using a String value.
  */
  public void setE01TOTQTY(String newvalue)
  {
    fieldE01TOTQTY.setString(newvalue);
  }

  /**
  * Get value of field E01TOTQTY as a String.
  */
  public String getE01TOTQTY()
  {
    return fieldE01TOTQTY.getString();
  }

  /**
  * Set numeric field E01TOTQTY using a BigDecimal value.
  */
  public void setE01TOTQTY(BigDecimal newvalue)
  {
    fieldE01TOTQTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TOTQTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TOTQTY()
  {
    return fieldE01TOTQTY.getBigDecimal();
  }

  /**
  * Set field E01TOTNVA using a String value.
  */
  public void setE01TOTNVA(String newvalue)
  {
    fieldE01TOTNVA.setString(newvalue);
  }

  /**
  * Get value of field E01TOTNVA as a String.
  */
  public String getE01TOTNVA()
  {
    return fieldE01TOTNVA.getString();
  }

  /**
  * Set numeric field E01TOTNVA using a BigDecimal value.
  */
  public void setE01TOTNVA(BigDecimal newvalue)
  {
    fieldE01TOTNVA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TOTNVA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TOTNVA()
  {
    return fieldE01TOTNVA.getBigDecimal();
  }

  /**
  * Set field E01TOTBAL using a String value.
  */
  public void setE01TOTBAL(String newvalue)
  {
    fieldE01TOTBAL.setString(newvalue);
  }

  /**
  * Get value of field E01TOTBAL as a String.
  */
  public String getE01TOTBAL()
  {
    return fieldE01TOTBAL.getString();
  }

  /**
  * Set numeric field E01TOTBAL using a BigDecimal value.
  */
  public void setE01TOTBAL(BigDecimal newvalue)
  {
    fieldE01TOTBAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TOTBAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TOTBAL()
  {
    return fieldE01TOTBAL.getBigDecimal();
  }

  /**
  * Set field E01TOTINT using a String value.
  */
  public void setE01TOTINT(String newvalue)
  {
    fieldE01TOTINT.setString(newvalue);
  }

  /**
  * Get value of field E01TOTINT as a String.
  */
  public String getE01TOTINT()
  {
    return fieldE01TOTINT.getString();
  }

  /**
  * Set numeric field E01TOTINT using a BigDecimal value.
  */
  public void setE01TOTINT(BigDecimal newvalue)
  {
    fieldE01TOTINT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TOTINT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TOTINT()
  {
    return fieldE01TOTINT.getBigDecimal();
  }

  /**
  * Set field E01TOTDIS using a String value.
  */
  public void setE01TOTDIS(String newvalue)
  {
    fieldE01TOTDIS.setString(newvalue);
  }

  /**
  * Get value of field E01TOTDIS as a String.
  */
  public String getE01TOTDIS()
  {
    return fieldE01TOTDIS.getString();
  }

  /**
  * Set numeric field E01TOTDIS using a BigDecimal value.
  */
  public void setE01TOTDIS(BigDecimal newvalue)
  {
    fieldE01TOTDIS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TOTDIS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TOTDIS()
  {
    return fieldE01TOTDIS.getBigDecimal();
  }

  /**
  * Set field E01TOTNDI using a String value.
  */
  public void setE01TOTNDI(String newvalue)
  {
    fieldE01TOTNDI.setString(newvalue);
  }

  /**
  * Get value of field E01TOTNDI as a String.
  */
  public String getE01TOTNDI()
  {
    return fieldE01TOTNDI.getString();
  }

  /**
  * Set numeric field E01TOTNDI using a BigDecimal value.
  */
  public void setE01TOTNDI(BigDecimal newvalue)
  {
    fieldE01TOTNDI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TOTNDI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TOTNDI()
  {
    return fieldE01TOTNDI.getBigDecimal();
  }

  /**
  * Set field E01TOTOQY using a String value.
  */
  public void setE01TOTOQY(String newvalue)
  {
    fieldE01TOTOQY.setString(newvalue);
  }

  /**
  * Get value of field E01TOTOQY as a String.
  */
  public String getE01TOTOQY()
  {
    return fieldE01TOTOQY.getString();
  }

  /**
  * Set numeric field E01TOTOQY using a BigDecimal value.
  */
  public void setE01TOTOQY(BigDecimal newvalue)
  {
    fieldE01TOTOQY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TOTOQY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TOTOQY()
  {
    return fieldE01TOTOQY.getBigDecimal();
  }

  /**
  * Set field E01TOTOVN using a String value.
  */
  public void setE01TOTOVN(String newvalue)
  {
    fieldE01TOTOVN.setString(newvalue);
  }

  /**
  * Get value of field E01TOTOVN as a String.
  */
  public String getE01TOTOVN()
  {
    return fieldE01TOTOVN.getString();
  }

  /**
  * Set numeric field E01TOTOVN using a BigDecimal value.
  */
  public void setE01TOTOVN(BigDecimal newvalue)
  {
    fieldE01TOTOVN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TOTOVN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TOTOVN()
  {
    return fieldE01TOTOVN.getBigDecimal();
  }

  /**
  * Set field E01TOTBOK using a String value.
  */
  public void setE01TOTBOK(String newvalue)
  {
    fieldE01TOTBOK.setString(newvalue);
  }

  /**
  * Get value of field E01TOTBOK as a String.
  */
  public String getE01TOTBOK()
  {
    return fieldE01TOTBOK.getString();
  }

  /**
  * Set numeric field E01TOTBOK using a BigDecimal value.
  */
  public void setE01TOTBOK(BigDecimal newvalue)
  {
    fieldE01TOTBOK.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TOTBOK as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TOTBOK()
  {
    return fieldE01TOTBOK.getBigDecimal();
  }

  /**
  * Set field E01TOTOIN using a String value.
  */
  public void setE01TOTOIN(String newvalue)
  {
    fieldE01TOTOIN.setString(newvalue);
  }

  /**
  * Get value of field E01TOTOIN as a String.
  */
  public String getE01TOTOIN()
  {
    return fieldE01TOTOIN.getString();
  }

  /**
  * Set numeric field E01TOTOIN using a BigDecimal value.
  */
  public void setE01TOTOIN(BigDecimal newvalue)
  {
    fieldE01TOTOIN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TOTOIN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TOTOIN()
  {
    return fieldE01TOTOIN.getBigDecimal();
  }

  /**
  * Set field E01DISINI using a String value.
  */
  public void setE01DISINI(String newvalue)
  {
    fieldE01DISINI.setString(newvalue);
  }

  /**
  * Get value of field E01DISINI as a String.
  */
  public String getE01DISINI()
  {
    return fieldE01DISINI.getString();
  }

  /**
  * Set numeric field E01DISINI using a BigDecimal value.
  */
  public void setE01DISINI(BigDecimal newvalue)
  {
    fieldE01DISINI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DISINI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DISINI()
  {
    return fieldE01DISINI.getBigDecimal();
  }

  /**
  * Set field E01NDSINI using a String value.
  */
  public void setE01NDSINI(String newvalue)
  {
    fieldE01NDSINI.setString(newvalue);
  }

  /**
  * Get value of field E01NDSINI as a String.
  */
  public String getE01NDSINI()
  {
    return fieldE01NDSINI.getString();
  }

  /**
  * Set numeric field E01NDSINI using a BigDecimal value.
  */
  public void setE01NDSINI(BigDecimal newvalue)
  {
    fieldE01NDSINI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01NDSINI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01NDSINI()
  {
    return fieldE01NDSINI.getBigDecimal();
  }

  /**
  * Set field E01BSECCY using a String value.
  */
  public void setE01BSECCY(String newvalue)
  {
    fieldE01BSECCY.setString(newvalue);
  }

  /**
  * Get value of field E01BSECCY as a String.
  */
  public String getE01BSECCY()
  {
    return fieldE01BSECCY.getString();
  }

  /**
  * Set field E01BSEBAL using a String value.
  */
  public void setE01BSEBAL(String newvalue)
  {
    fieldE01BSEBAL.setString(newvalue);
  }

  /**
  * Get value of field E01BSEBAL as a String.
  */
  public String getE01BSEBAL()
  {
    return fieldE01BSEBAL.getString();
  }

  /**
  * Set numeric field E01BSEBAL using a BigDecimal value.
  */
  public void setE01BSEBAL(BigDecimal newvalue)
  {
    fieldE01BSEBAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BSEBAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BSEBAL()
  {
    return fieldE01BSEBAL.getBigDecimal();
  }

  /**
  * Set field E01BSEBOK using a String value.
  */
  public void setE01BSEBOK(String newvalue)
  {
    fieldE01BSEBOK.setString(newvalue);
  }

  /**
  * Get value of field E01BSEBOK as a String.
  */
  public String getE01BSEBOK()
  {
    return fieldE01BSEBOK.getString();
  }

  /**
  * Set numeric field E01BSEBOK using a BigDecimal value.
  */
  public void setE01BSEBOK(BigDecimal newvalue)
  {
    fieldE01BSEBOK.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BSEBOK as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BSEBOK()
  {
    return fieldE01BSEBOK.getBigDecimal();
  }

  /**
  * Set field E01BSEEXR using a String value.
  */
  public void setE01BSEEXR(String newvalue)
  {
    fieldE01BSEEXR.setString(newvalue);
  }

  /**
  * Get value of field E01BSEEXR as a String.
  */
  public String getE01BSEEXR()
  {
    return fieldE01BSEEXR.getString();
  }

  /**
  * Set numeric field E01BSEEXR using a BigDecimal value.
  */
  public void setE01BSEEXR(BigDecimal newvalue)
  {
    fieldE01BSEEXR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BSEEXR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BSEEXR()
  {
    return fieldE01BSEEXR.getBigDecimal();
  }

  /**
  * Set field E01TOTFL1 using a String value.
  */
  public void setE01TOTFL1(String newvalue)
  {
    fieldE01TOTFL1.setString(newvalue);
  }

  /**
  * Get value of field E01TOTFL1 as a String.
  */
  public String getE01TOTFL1()
  {
    return fieldE01TOTFL1.getString();
  }

  /**
  * Set numeric field E01TOTFL1 using a BigDecimal value.
  */
  public void setE01TOTFL1(BigDecimal newvalue)
  {
    fieldE01TOTFL1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TOTFL1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TOTFL1()
  {
    return fieldE01TOTFL1.getBigDecimal();
  }

  /**
  * Set field E01TOTFL2 using a String value.
  */
  public void setE01TOTFL2(String newvalue)
  {
    fieldE01TOTFL2.setString(newvalue);
  }

  /**
  * Get value of field E01TOTFL2 as a String.
  */
  public String getE01TOTFL2()
  {
    return fieldE01TOTFL2.getString();
  }

  /**
  * Set numeric field E01TOTFL2 using a BigDecimal value.
  */
  public void setE01TOTFL2(BigDecimal newvalue)
  {
    fieldE01TOTFL2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TOTFL2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TOTFL2()
  {
    return fieldE01TOTFL2.getBigDecimal();
  }

  /**
  * Set field E01TOTFL3 using a String value.
  */
  public void setE01TOTFL3(String newvalue)
  {
    fieldE01TOTFL3.setString(newvalue);
  }

  /**
  * Get value of field E01TOTFL3 as a String.
  */
  public String getE01TOTFL3()
  {
    return fieldE01TOTFL3.getString();
  }

  /**
  * Set numeric field E01TOTFL3 using a BigDecimal value.
  */
  public void setE01TOTFL3(BigDecimal newvalue)
  {
    fieldE01TOTFL3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TOTFL3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TOTFL3()
  {
    return fieldE01TOTFL3.getBigDecimal();
  }

  /**
  * Set field E01TOTFL4 using a String value.
  */
  public void setE01TOTFL4(String newvalue)
  {
    fieldE01TOTFL4.setString(newvalue);
  }

  /**
  * Get value of field E01TOTFL4 as a String.
  */
  public String getE01TOTFL4()
  {
    return fieldE01TOTFL4.getString();
  }

  /**
  * Set numeric field E01TOTFL4 using a BigDecimal value.
  */
  public void setE01TOTFL4(BigDecimal newvalue)
  {
    fieldE01TOTFL4.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TOTFL4 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TOTFL4()
  {
    return fieldE01TOTFL4.getBigDecimal();
  }

  /**
  * Set field E01TOTFL5 using a String value.
  */
  public void setE01TOTFL5(String newvalue)
  {
    fieldE01TOTFL5.setString(newvalue);
  }

  /**
  * Get value of field E01TOTFL5 as a String.
  */
  public String getE01TOTFL5()
  {
    return fieldE01TOTFL5.getString();
  }

  /**
  * Set numeric field E01TOTFL5 using a BigDecimal value.
  */
  public void setE01TOTFL5(BigDecimal newvalue)
  {
    fieldE01TOTFL5.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TOTFL5 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TOTFL5()
  {
    return fieldE01TOTFL5.getBigDecimal();
  }

  /**
  * Set field E01TOTFL6 using a String value.
  */
  public void setE01TOTFL6(String newvalue)
  {
    fieldE01TOTFL6.setString(newvalue);
  }

  /**
  * Get value of field E01TOTFL6 as a String.
  */
  public String getE01TOTFL6()
  {
    return fieldE01TOTFL6.getString();
  }

  /**
  * Set numeric field E01TOTFL6 using a BigDecimal value.
  */
  public void setE01TOTFL6(BigDecimal newvalue)
  {
    fieldE01TOTFL6.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TOTFL6 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TOTFL6()
  {
    return fieldE01TOTFL6.getBigDecimal();
  }

  /**
  * Set field E01TOTFL7 using a String value.
  */
  public void setE01TOTFL7(String newvalue)
  {
    fieldE01TOTFL7.setString(newvalue);
  }

  /**
  * Get value of field E01TOTFL7 as a String.
  */
  public String getE01TOTFL7()
  {
    return fieldE01TOTFL7.getString();
  }

  /**
  * Set numeric field E01TOTFL7 using a BigDecimal value.
  */
  public void setE01TOTFL7(BigDecimal newvalue)
  {
    fieldE01TOTFL7.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TOTFL7 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TOTFL7()
  {
    return fieldE01TOTFL7.getBigDecimal();
  }

  /**
  * Set field E01TOTFL8 using a String value.
  */
  public void setE01TOTFL8(String newvalue)
  {
    fieldE01TOTFL8.setString(newvalue);
  }

  /**
  * Get value of field E01TOTFL8 as a String.
  */
  public String getE01TOTFL8()
  {
    return fieldE01TOTFL8.getString();
  }

  /**
  * Set numeric field E01TOTFL8 using a BigDecimal value.
  */
  public void setE01TOTFL8(BigDecimal newvalue)
  {
    fieldE01TOTFL8.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TOTFL8 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TOTFL8()
  {
    return fieldE01TOTFL8.getBigDecimal();
  }

  /**
  * Set field E01HLDNME using a String value.
  */
  public void setE01HLDNME(String newvalue)
  {
    fieldE01HLDNME.setString(newvalue);
  }

  /**
  * Get value of field E01HLDNME as a String.
  */
  public String getE01HLDNME()
  {
    return fieldE01HLDNME.getString();
  }

}
