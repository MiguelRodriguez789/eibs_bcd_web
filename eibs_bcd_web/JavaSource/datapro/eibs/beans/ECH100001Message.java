package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECH100001 physical file definition.
* 
* File level identifier is 1130611112845.
* Record format level identifier is 4AAC7C2AF02E4.
*/

public class ECH100001Message extends MessageRecord
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
                                     "E01CHPACC",
                                     "E01CHPCCY",
                                     "E01CHPACD",
                                     "E01CHPPRO",
                                     "E01CHPCUN",
                                     "E01CHPNA1",
                                     "E01CHPOFC",
                                     "E01DSCOFC",
                                     "E01CHMCKN",
                                     "E01CHMAMT",
                                     "E01CONTLP",
                                     "E01CONNAME",
                                     "E01CONCLAV",
                                     "E01CONCDE",
                                     "E01ACMBRN",
                                     "E01DSCBRN"
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
                                   "E01CHPACC",
                                   "E01CHPCCY",
                                   "E01CHPACD",
                                   "E01CHPPRO",
                                   "E01CHPCUN",
                                   "E01CHPNA1",
                                   "E01CHPOFC",
                                   "E01DSCOFC",
                                   "E01CHMCKN",
                                   "E01CHMAMT",
                                   "E01CONTLP",
                                   "E01CONNAME",
                                   "E01CONCLAV",
                                   "E01CONCDE",
                                   "E01ACMBRN",
                                   "E01DSCBRN"
                                 };
  final static String fid = "1130611112845";
  final static String rid = "4AAC7C2AF02E4";
  final static String fmtname = "ECH100001";
  final int FIELDCOUNT = 25;
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
  private DecimalField fieldE01CHPACC = null;
  private CharacterField fieldE01CHPCCY = null;
  private CharacterField fieldE01CHPACD = null;
  private CharacterField fieldE01CHPPRO = null;
  private DecimalField fieldE01CHPCUN = null;
  private CharacterField fieldE01CHPNA1 = null;
  private CharacterField fieldE01CHPOFC = null;
  private CharacterField fieldE01DSCOFC = null;
  private DecimalField fieldE01CHMCKN = null;
  private DecimalField fieldE01CHMAMT = null;
  private CharacterField fieldE01CONTLP = null;
  private CharacterField fieldE01CONNAME = null;
  private DecimalField fieldE01CONCLAV = null;
  private CharacterField fieldE01CONCDE = null;
  private DecimalField fieldE01ACMBRN = null;
  private CharacterField fieldE01DSCBRN = null;

  /**
  * Constructor for ECH100001Message.
  */
  public ECH100001Message()
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
    recordsize = 369;
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
    fields[9] = fieldE01CHPACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E01CHPACC");
    fields[10] = fieldE01CHPCCY =
    new CharacterField(message, HEADERSIZE + 55, 3, "E01CHPCCY");
    fields[11] = fieldE01CHPACD =
    new CharacterField(message, HEADERSIZE + 58, 2, "E01CHPACD");
    fields[12] = fieldE01CHPPRO =
    new CharacterField(message, HEADERSIZE + 60, 4, "E01CHPPRO");
    fields[13] = fieldE01CHPCUN =
    new DecimalField(message, HEADERSIZE + 64, 10, 0, "E01CHPCUN");
    fields[14] = fieldE01CHPNA1 =
    new CharacterField(message, HEADERSIZE + 74, 60, "E01CHPNA1");
    fields[15] = fieldE01CHPOFC =
    new CharacterField(message, HEADERSIZE + 134, 4, "E01CHPOFC");
    fields[16] = fieldE01DSCOFC =
    new CharacterField(message, HEADERSIZE + 138, 60, "E01DSCOFC");
    fields[17] = fieldE01CHMCKN =
    new DecimalField(message, HEADERSIZE + 198, 12, 0, "E01CHMCKN");
    fields[18] = fieldE01CHMAMT =
    new DecimalField(message, HEADERSIZE + 210, 17, 2, "E01CHMAMT");
    fields[19] = fieldE01CONTLP =
    new CharacterField(message, HEADERSIZE + 227, 15, "E01CONTLP");
    fields[20] = fieldE01CONNAME =
    new CharacterField(message, HEADERSIZE + 242, 45, "E01CONNAME");
    fields[21] = fieldE01CONCLAV =
    new DecimalField(message, HEADERSIZE + 287, 13, 0, "E01CONCLAV");
    fields[22] = fieldE01CONCDE =
    new CharacterField(message, HEADERSIZE + 300, 4, "E01CONCDE");
    fields[23] = fieldE01ACMBRN =
    new DecimalField(message, HEADERSIZE + 304, 5, 0, "E01ACMBRN");
    fields[24] = fieldE01DSCBRN =
    new CharacterField(message, HEADERSIZE + 309, 60, "E01DSCBRN");

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
  * Set field E01CHPACC using a String value.
  */
  public void setE01CHPACC(String newvalue)
  {
    fieldE01CHPACC.setString(newvalue);
  }

  /**
  * Get value of field E01CHPACC as a String.
  */
  public String getE01CHPACC()
  {
    return fieldE01CHPACC.getString();
  }

  /**
  * Set numeric field E01CHPACC using a BigDecimal value.
  */
  public void setE01CHPACC(BigDecimal newvalue)
  {
    fieldE01CHPACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHPACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHPACC()
  {
    return fieldE01CHPACC.getBigDecimal();
  }

  /**
  * Set field E01CHPCCY using a String value.
  */
  public void setE01CHPCCY(String newvalue)
  {
    fieldE01CHPCCY.setString(newvalue);
  }

  /**
  * Get value of field E01CHPCCY as a String.
  */
  public String getE01CHPCCY()
  {
    return fieldE01CHPCCY.getString();
  }

  /**
  * Set field E01CHPACD using a String value.
  */
  public void setE01CHPACD(String newvalue)
  {
    fieldE01CHPACD.setString(newvalue);
  }

  /**
  * Get value of field E01CHPACD as a String.
  */
  public String getE01CHPACD()
  {
    return fieldE01CHPACD.getString();
  }

  /**
  * Set field E01CHPPRO using a String value.
  */
  public void setE01CHPPRO(String newvalue)
  {
    fieldE01CHPPRO.setString(newvalue);
  }

  /**
  * Get value of field E01CHPPRO as a String.
  */
  public String getE01CHPPRO()
  {
    return fieldE01CHPPRO.getString();
  }

  /**
  * Set field E01CHPCUN using a String value.
  */
  public void setE01CHPCUN(String newvalue)
  {
    fieldE01CHPCUN.setString(newvalue);
  }

  /**
  * Get value of field E01CHPCUN as a String.
  */
  public String getE01CHPCUN()
  {
    return fieldE01CHPCUN.getString();
  }

  /**
  * Set numeric field E01CHPCUN using a BigDecimal value.
  */
  public void setE01CHPCUN(BigDecimal newvalue)
  {
    fieldE01CHPCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHPCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHPCUN()
  {
    return fieldE01CHPCUN.getBigDecimal();
  }

  /**
  * Set field E01CHPNA1 using a String value.
  */
  public void setE01CHPNA1(String newvalue)
  {
    fieldE01CHPNA1.setString(newvalue);
  }

  /**
  * Get value of field E01CHPNA1 as a String.
  */
  public String getE01CHPNA1()
  {
    return fieldE01CHPNA1.getString();
  }

  /**
  * Set field E01CHPOFC using a String value.
  */
  public void setE01CHPOFC(String newvalue)
  {
    fieldE01CHPOFC.setString(newvalue);
  }

  /**
  * Get value of field E01CHPOFC as a String.
  */
  public String getE01CHPOFC()
  {
    return fieldE01CHPOFC.getString();
  }

  /**
  * Set field E01DSCOFC using a String value.
  */
  public void setE01DSCOFC(String newvalue)
  {
    fieldE01DSCOFC.setString(newvalue);
  }

  /**
  * Get value of field E01DSCOFC as a String.
  */
  public String getE01DSCOFC()
  {
    return fieldE01DSCOFC.getString();
  }

  /**
  * Set field E01CHMCKN using a String value.
  */
  public void setE01CHMCKN(String newvalue)
  {
    fieldE01CHMCKN.setString(newvalue);
  }

  /**
  * Get value of field E01CHMCKN as a String.
  */
  public String getE01CHMCKN()
  {
    return fieldE01CHMCKN.getString();
  }

  /**
  * Set numeric field E01CHMCKN using a BigDecimal value.
  */
  public void setE01CHMCKN(BigDecimal newvalue)
  {
    fieldE01CHMCKN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHMCKN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHMCKN()
  {
    return fieldE01CHMCKN.getBigDecimal();
  }

  /**
  * Set field E01CHMAMT using a String value.
  */
  public void setE01CHMAMT(String newvalue)
  {
    fieldE01CHMAMT.setString(newvalue);
  }

  /**
  * Get value of field E01CHMAMT as a String.
  */
  public String getE01CHMAMT()
  {
    return fieldE01CHMAMT.getString();
  }

  /**
  * Set numeric field E01CHMAMT using a BigDecimal value.
  */
  public void setE01CHMAMT(BigDecimal newvalue)
  {
    fieldE01CHMAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CHMAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CHMAMT()
  {
    return fieldE01CHMAMT.getBigDecimal();
  }

  /**
  * Set field E01CONTLP using a String value.
  */
  public void setE01CONTLP(String newvalue)
  {
    fieldE01CONTLP.setString(newvalue);
  }

  /**
  * Get value of field E01CONTLP as a String.
  */
  public String getE01CONTLP()
  {
    return fieldE01CONTLP.getString();
  }

  /**
  * Set field E01CONNAME using a String value.
  */
  public void setE01CONNAME(String newvalue)
  {
    fieldE01CONNAME.setString(newvalue);
  }

  /**
  * Get value of field E01CONNAME as a String.
  */
  public String getE01CONNAME()
  {
    return fieldE01CONNAME.getString();
  }

  /**
  * Set field E01CONCLAV using a String value.
  */
  public void setE01CONCLAV(String newvalue)
  {
    fieldE01CONCLAV.setString(newvalue);
  }

  /**
  * Get value of field E01CONCLAV as a String.
  */
  public String getE01CONCLAV()
  {
    return fieldE01CONCLAV.getString();
  }

  /**
  * Set numeric field E01CONCLAV using a BigDecimal value.
  */
  public void setE01CONCLAV(BigDecimal newvalue)
  {
    fieldE01CONCLAV.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CONCLAV as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CONCLAV()
  {
    return fieldE01CONCLAV.getBigDecimal();
  }

  /**
  * Set field E01CONCDE using a String value.
  */
  public void setE01CONCDE(String newvalue)
  {
    fieldE01CONCDE.setString(newvalue);
  }

  /**
  * Get value of field E01CONCDE as a String.
  */
  public String getE01CONCDE()
  {
    return fieldE01CONCDE.getString();
  }

  /**
  * Set field E01ACMBRN using a String value.
  */
  public void setE01ACMBRN(String newvalue)
  {
    fieldE01ACMBRN.setString(newvalue);
  }

  /**
  * Get value of field E01ACMBRN as a String.
  */
  public String getE01ACMBRN()
  {
    return fieldE01ACMBRN.getString();
  }

  /**
  * Set numeric field E01ACMBRN using a BigDecimal value.
  */
  public void setE01ACMBRN(BigDecimal newvalue)
  {
    fieldE01ACMBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACMBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACMBRN()
  {
    return fieldE01ACMBRN.getBigDecimal();
  }

  /**
  * Set field E01DSCBRN using a String value.
  */
  public void setE01DSCBRN(String newvalue)
  {
    fieldE01DSCBRN.setString(newvalue);
  }

  /**
  * Get value of field E01DSCBRN as a String.
  */
  public String getE01DSCBRN()
  {
    return fieldE01DSCBRN.getString();
  }

}
