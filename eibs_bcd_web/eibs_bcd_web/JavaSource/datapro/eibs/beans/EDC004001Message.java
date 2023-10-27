package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDC004001 physical file definition.
* 
* File level identifier is 1130611112855.
* Record format level identifier is 471C9BAF6E31C.
*/

public class EDC004001Message extends MessageRecord
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
                                     "E01DCMACC",
                                     "E01DCMACD",
                                     "E01DCMPRO",
                                     "E01DCMCUN",
                                     "E01CUSNA1",
                                     "E01DCMBNK",
                                     "E01DCMBRN",
                                     "E01DCMCCY",
                                     "E01DCMGLN",
                                     "E01DCMCCN",
                                     "E01DCMAMN",
                                     "E01DCMUBT",
                                     "E01DCMOPR",
                                     "E01DCMATY",
                                     "E01DCMTYP",
                                     "E01DCMSTY",
                                     "E01DCMOPT",
                                     "E01REMARK",
                                     "E01DSCPRO"
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
                                   "E01DCMACC",
                                   "E01DCMACD",
                                   "E01DCMPRO",
                                   "E01DCMCUN",
                                   "E01CUSNA1",
                                   "E01DCMBNK",
                                   "E01DCMBRN",
                                   "E01DCMCCY",
                                   "E01DCMGLN",
                                   "E01DCMCCN",
                                   "E01DCMAMN",
                                   "E01DCMUBT",
                                   "E01DCMOPR",
                                   "E01DCMATY",
                                   "E01DCMTYP",
                                   "E01DCMSTY",
                                   "E01DCMOPT",
                                   "E01REMARK",
                                   "E01DSCPRO"
                                 };
  final static String fid = "1130611112855";
  final static String rid = "471C9BAF6E31C";
  final static String fmtname = "EDC004001";
  final int FIELDCOUNT = 28;
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
  private DecimalField fieldE01DCMACC = null;
  private CharacterField fieldE01DCMACD = null;
  private CharacterField fieldE01DCMPRO = null;
  private DecimalField fieldE01DCMCUN = null;
  private CharacterField fieldE01CUSNA1 = null;
  private CharacterField fieldE01DCMBNK = null;
  private DecimalField fieldE01DCMBRN = null;
  private CharacterField fieldE01DCMCCY = null;
  private DecimalField fieldE01DCMGLN = null;
  private DecimalField fieldE01DCMCCN = null;
  private DecimalField fieldE01DCMAMN = null;
  private DecimalField fieldE01DCMUBT = null;
  private CharacterField fieldE01DCMOPR = null;
  private CharacterField fieldE01DCMATY = null;
  private CharacterField fieldE01DCMTYP = null;
  private CharacterField fieldE01DCMSTY = null;
  private CharacterField fieldE01DCMOPT = null;
  private CharacterField fieldE01REMARK = null;
  private CharacterField fieldE01DSCPRO = null;

  /**
  * Constructor for EDC004001Message.
  */
  public EDC004001Message()
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
    recordsize = 312;
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
    fields[9] = fieldE01DCMACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E01DCMACC");
    fields[10] = fieldE01DCMACD =
    new CharacterField(message, HEADERSIZE + 55, 2, "E01DCMACD");
    fields[11] = fieldE01DCMPRO =
    new CharacterField(message, HEADERSIZE + 57, 4, "E01DCMPRO");
    fields[12] = fieldE01DCMCUN =
    new DecimalField(message, HEADERSIZE + 61, 10, 0, "E01DCMCUN");
    fields[13] = fieldE01CUSNA1 =
    new CharacterField(message, HEADERSIZE + 71, 60, "E01CUSNA1");
    fields[14] = fieldE01DCMBNK =
    new CharacterField(message, HEADERSIZE + 131, 2, "E01DCMBNK");
    fields[15] = fieldE01DCMBRN =
    new DecimalField(message, HEADERSIZE + 133, 5, 0, "E01DCMBRN");
    fields[16] = fieldE01DCMCCY =
    new CharacterField(message, HEADERSIZE + 138, 3, "E01DCMCCY");
    fields[17] = fieldE01DCMGLN =
    new DecimalField(message, HEADERSIZE + 141, 17, 0, "E01DCMGLN");
    fields[18] = fieldE01DCMCCN =
    new DecimalField(message, HEADERSIZE + 158, 9, 0, "E01DCMCCN");
    fields[19] = fieldE01DCMAMN =
    new DecimalField(message, HEADERSIZE + 167, 17, 2, "E01DCMAMN");
    fields[20] = fieldE01DCMUBT =
    new DecimalField(message, HEADERSIZE + 184, 6, 0, "E01DCMUBT");
    fields[21] = fieldE01DCMOPR =
    new CharacterField(message, HEADERSIZE + 190, 10, "E01DCMOPR");
    fields[22] = fieldE01DCMATY =
    new CharacterField(message, HEADERSIZE + 200, 4, "E01DCMATY");
    fields[23] = fieldE01DCMTYP =
    new CharacterField(message, HEADERSIZE + 204, 1, "E01DCMTYP");
    fields[24] = fieldE01DCMSTY =
    new CharacterField(message, HEADERSIZE + 205, 1, "E01DCMSTY");
    fields[25] = fieldE01DCMOPT =
    new CharacterField(message, HEADERSIZE + 206, 1, "E01DCMOPT");
    fields[26] = fieldE01REMARK =
    new CharacterField(message, HEADERSIZE + 207, 60, "E01REMARK");
    fields[27] = fieldE01DSCPRO =
    new CharacterField(message, HEADERSIZE + 267, 45, "E01DSCPRO");

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
  * Set field E01DCMACC using a String value.
  */
  public void setE01DCMACC(String newvalue)
  {
    fieldE01DCMACC.setString(newvalue);
  }

  /**
  * Get value of field E01DCMACC as a String.
  */
  public String getE01DCMACC()
  {
    return fieldE01DCMACC.getString();
  }

  /**
  * Set numeric field E01DCMACC using a BigDecimal value.
  */
  public void setE01DCMACC(BigDecimal newvalue)
  {
    fieldE01DCMACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DCMACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DCMACC()
  {
    return fieldE01DCMACC.getBigDecimal();
  }

  /**
  * Set field E01DCMACD using a String value.
  */
  public void setE01DCMACD(String newvalue)
  {
    fieldE01DCMACD.setString(newvalue);
  }

  /**
  * Get value of field E01DCMACD as a String.
  */
  public String getE01DCMACD()
  {
    return fieldE01DCMACD.getString();
  }

  /**
  * Set field E01DCMPRO using a String value.
  */
  public void setE01DCMPRO(String newvalue)
  {
    fieldE01DCMPRO.setString(newvalue);
  }

  /**
  * Get value of field E01DCMPRO as a String.
  */
  public String getE01DCMPRO()
  {
    return fieldE01DCMPRO.getString();
  }

  /**
  * Set field E01DCMCUN using a String value.
  */
  public void setE01DCMCUN(String newvalue)
  {
    fieldE01DCMCUN.setString(newvalue);
  }

  /**
  * Get value of field E01DCMCUN as a String.
  */
  public String getE01DCMCUN()
  {
    return fieldE01DCMCUN.getString();
  }

  /**
  * Set numeric field E01DCMCUN using a BigDecimal value.
  */
  public void setE01DCMCUN(BigDecimal newvalue)
  {
    fieldE01DCMCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DCMCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DCMCUN()
  {
    return fieldE01DCMCUN.getBigDecimal();
  }

  /**
  * Set field E01CUSNA1 using a String value.
  */
  public void setE01CUSNA1(String newvalue)
  {
    fieldE01CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E01CUSNA1 as a String.
  */
  public String getE01CUSNA1()
  {
    return fieldE01CUSNA1.getString();
  }

  /**
  * Set field E01DCMBNK using a String value.
  */
  public void setE01DCMBNK(String newvalue)
  {
    fieldE01DCMBNK.setString(newvalue);
  }

  /**
  * Get value of field E01DCMBNK as a String.
  */
  public String getE01DCMBNK()
  {
    return fieldE01DCMBNK.getString();
  }

  /**
  * Set field E01DCMBRN using a String value.
  */
  public void setE01DCMBRN(String newvalue)
  {
    fieldE01DCMBRN.setString(newvalue);
  }

  /**
  * Get value of field E01DCMBRN as a String.
  */
  public String getE01DCMBRN()
  {
    return fieldE01DCMBRN.getString();
  }

  /**
  * Set numeric field E01DCMBRN using a BigDecimal value.
  */
  public void setE01DCMBRN(BigDecimal newvalue)
  {
    fieldE01DCMBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DCMBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DCMBRN()
  {
    return fieldE01DCMBRN.getBigDecimal();
  }

  /**
  * Set field E01DCMCCY using a String value.
  */
  public void setE01DCMCCY(String newvalue)
  {
    fieldE01DCMCCY.setString(newvalue);
  }

  /**
  * Get value of field E01DCMCCY as a String.
  */
  public String getE01DCMCCY()
  {
    return fieldE01DCMCCY.getString();
  }

  /**
  * Set field E01DCMGLN using a String value.
  */
  public void setE01DCMGLN(String newvalue)
  {
    fieldE01DCMGLN.setString(newvalue);
  }

  /**
  * Get value of field E01DCMGLN as a String.
  */
  public String getE01DCMGLN()
  {
    return fieldE01DCMGLN.getString();
  }

  /**
  * Set numeric field E01DCMGLN using a BigDecimal value.
  */
  public void setE01DCMGLN(BigDecimal newvalue)
  {
    fieldE01DCMGLN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DCMGLN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DCMGLN()
  {
    return fieldE01DCMGLN.getBigDecimal();
  }

  /**
  * Set field E01DCMCCN using a String value.
  */
  public void setE01DCMCCN(String newvalue)
  {
    fieldE01DCMCCN.setString(newvalue);
  }

  /**
  * Get value of field E01DCMCCN as a String.
  */
  public String getE01DCMCCN()
  {
    return fieldE01DCMCCN.getString();
  }

  /**
  * Set numeric field E01DCMCCN using a BigDecimal value.
  */
  public void setE01DCMCCN(BigDecimal newvalue)
  {
    fieldE01DCMCCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DCMCCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DCMCCN()
  {
    return fieldE01DCMCCN.getBigDecimal();
  }

  /**
  * Set field E01DCMAMN using a String value.
  */
  public void setE01DCMAMN(String newvalue)
  {
    fieldE01DCMAMN.setString(newvalue);
  }

  /**
  * Get value of field E01DCMAMN as a String.
  */
  public String getE01DCMAMN()
  {
    return fieldE01DCMAMN.getString();
  }

  /**
  * Set numeric field E01DCMAMN using a BigDecimal value.
  */
  public void setE01DCMAMN(BigDecimal newvalue)
  {
    fieldE01DCMAMN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DCMAMN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DCMAMN()
  {
    return fieldE01DCMAMN.getBigDecimal();
  }

  /**
  * Set field E01DCMUBT using a String value.
  */
  public void setE01DCMUBT(String newvalue)
  {
    fieldE01DCMUBT.setString(newvalue);
  }

  /**
  * Get value of field E01DCMUBT as a String.
  */
  public String getE01DCMUBT()
  {
    return fieldE01DCMUBT.getString();
  }

  /**
  * Set numeric field E01DCMUBT using a BigDecimal value.
  */
  public void setE01DCMUBT(BigDecimal newvalue)
  {
    fieldE01DCMUBT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DCMUBT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DCMUBT()
  {
    return fieldE01DCMUBT.getBigDecimal();
  }

  /**
  * Set field E01DCMOPR using a String value.
  */
  public void setE01DCMOPR(String newvalue)
  {
    fieldE01DCMOPR.setString(newvalue);
  }

  /**
  * Get value of field E01DCMOPR as a String.
  */
  public String getE01DCMOPR()
  {
    return fieldE01DCMOPR.getString();
  }

  /**
  * Set field E01DCMATY using a String value.
  */
  public void setE01DCMATY(String newvalue)
  {
    fieldE01DCMATY.setString(newvalue);
  }

  /**
  * Get value of field E01DCMATY as a String.
  */
  public String getE01DCMATY()
  {
    return fieldE01DCMATY.getString();
  }

  /**
  * Set field E01DCMTYP using a String value.
  */
  public void setE01DCMTYP(String newvalue)
  {
    fieldE01DCMTYP.setString(newvalue);
  }

  /**
  * Get value of field E01DCMTYP as a String.
  */
  public String getE01DCMTYP()
  {
    return fieldE01DCMTYP.getString();
  }

  /**
  * Set field E01DCMSTY using a String value.
  */
  public void setE01DCMSTY(String newvalue)
  {
    fieldE01DCMSTY.setString(newvalue);
  }

  /**
  * Get value of field E01DCMSTY as a String.
  */
  public String getE01DCMSTY()
  {
    return fieldE01DCMSTY.getString();
  }

  /**
  * Set field E01DCMOPT using a String value.
  */
  public void setE01DCMOPT(String newvalue)
  {
    fieldE01DCMOPT.setString(newvalue);
  }

  /**
  * Get value of field E01DCMOPT as a String.
  */
  public String getE01DCMOPT()
  {
    return fieldE01DCMOPT.getString();
  }

  /**
  * Set field E01REMARK using a String value.
  */
  public void setE01REMARK(String newvalue)
  {
    fieldE01REMARK.setString(newvalue);
  }

  /**
  * Get value of field E01REMARK as a String.
  */
  public String getE01REMARK()
  {
    return fieldE01REMARK.getString();
  }

  /**
  * Set field E01DSCPRO using a String value.
  */
  public void setE01DSCPRO(String newvalue)
  {
    fieldE01DSCPRO.setString(newvalue);
  }

  /**
  * Get value of field E01DSCPRO as a String.
  */
  public String getE01DSCPRO()
  {
    return fieldE01DSCPRO.getString();
  }

}
