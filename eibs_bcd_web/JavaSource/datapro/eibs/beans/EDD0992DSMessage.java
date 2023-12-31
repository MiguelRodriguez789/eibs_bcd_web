package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDD0992DS physical file definition.
* 
* File level identifier is 1170113170559.
* Record format level identifier is 3A0EA7619ABE4.
*/

public class EDD0992DSMessage extends MessageRecord
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
                                     "E01CUSCUN",
                                     "E01CUSNA1",
                                     "E01ACMCCY",
                                     "E01ACMPRO",
                                     "E01DESPRO",
                                     "E01BOKBAL",
                                     "E01TOTDEB",
                                     "E01TOTCRE",
                                     "E01PBTACC",
                                     "E01PBTDTM",
                                     "E01PBTDTD",
                                     "E01PBTDTY",
                                     "E01PBTCDE",
                                     "E01PBTNAR",
                                     "E01PBTAMT",
                                     "E01PBTDCC",
                                     "E01PBTTIM",
                                     "E01PBTREF",
                                     "E01PBTRLR",
                                     "E01BEGBAL",
                                     "E01ENDBAL",
                                     "E01RECPOS"
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
                                   "E01CUSCUN",
                                   "E01CUSNA1",
                                   "E01ACMCCY",
                                   "E01ACMPRO",
                                   "E01DESPRO",
                                   "E01BOKBAL",
                                   "E01TOTDEB",
                                   "E01TOTCRE",
                                   "E01PBTACC",
                                   "E01PBTDTM",
                                   "E01PBTDTD",
                                   "E01PBTDTY",
                                   "E01PBTCDE",
                                   "E01PBTNAR",
                                   "E01PBTAMT",
                                   "E01PBTDCC",
                                   "E01PBTTIM",
                                   "E01PBTREF",
                                   "E01PBTRLR",
                                   "E01BEGBAL",
                                   "E01ENDBAL",
                                   "E01RECPOS"
                                 };
  final static String fid = "1170113170559";
  final static String rid = "3A0EA7619ABE4";
  final static String fmtname = "EDD0992DS";
  final int FIELDCOUNT = 31;
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
  private DecimalField fieldE01CUSCUN = null;
  private CharacterField fieldE01CUSNA1 = null;
  private CharacterField fieldE01ACMCCY = null;
  private CharacterField fieldE01ACMPRO = null;
  private CharacterField fieldE01DESPRO = null;
  private DecimalField fieldE01BOKBAL = null;
  private DecimalField fieldE01TOTDEB = null;
  private DecimalField fieldE01TOTCRE = null;
  private DecimalField fieldE01PBTACC = null;
  private DecimalField fieldE01PBTDTM = null;
  private DecimalField fieldE01PBTDTD = null;
  private DecimalField fieldE01PBTDTY = null;
  private CharacterField fieldE01PBTCDE = null;
  private CharacterField fieldE01PBTNAR = null;
  private DecimalField fieldE01PBTAMT = null;
  private CharacterField fieldE01PBTDCC = null;
  private CharacterField fieldE01PBTTIM = null;
  private DecimalField fieldE01PBTREF = null;
  private CharacterField fieldE01PBTRLR = null;
  private DecimalField fieldE01BEGBAL = null;
  private DecimalField fieldE01ENDBAL = null;
  private DecimalField fieldE01RECPOS = null;

  /**
  * Constructor for EDD0992DSMessage.
  */
  public EDD0992DSMessage()
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
    recordsize = 411;
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
    fields[9] = fieldE01CUSCUN =
    new DecimalField(message, HEADERSIZE + 42, 10, 0, "E01CUSCUN");
    fields[10] = fieldE01CUSNA1 =
    new CharacterField(message, HEADERSIZE + 52, 60, "E01CUSNA1");
    fields[11] = fieldE01ACMCCY =
    new CharacterField(message, HEADERSIZE + 112, 3, "E01ACMCCY");
    fields[12] = fieldE01ACMPRO =
    new CharacterField(message, HEADERSIZE + 115, 4, "E01ACMPRO");
    fields[13] = fieldE01DESPRO =
    new CharacterField(message, HEADERSIZE + 119, 45, "E01DESPRO");
    fields[14] = fieldE01BOKBAL =
    new DecimalField(message, HEADERSIZE + 164, 17, 2, "E01BOKBAL");
    fields[15] = fieldE01TOTDEB =
    new DecimalField(message, HEADERSIZE + 181, 17, 2, "E01TOTDEB");
    fields[16] = fieldE01TOTCRE =
    new DecimalField(message, HEADERSIZE + 198, 17, 2, "E01TOTCRE");
    fields[17] = fieldE01PBTACC =
    new DecimalField(message, HEADERSIZE + 215, 13, 0, "E01PBTACC");
    fields[18] = fieldE01PBTDTM =
    new DecimalField(message, HEADERSIZE + 228, 3, 0, "E01PBTDTM");
    fields[19] = fieldE01PBTDTD =
    new DecimalField(message, HEADERSIZE + 231, 3, 0, "E01PBTDTD");
    fields[20] = fieldE01PBTDTY =
    new DecimalField(message, HEADERSIZE + 234, 5, 0, "E01PBTDTY");
    fields[21] = fieldE01PBTCDE =
    new CharacterField(message, HEADERSIZE + 239, 4, "E01PBTCDE");
    fields[22] = fieldE01PBTNAR =
    new CharacterField(message, HEADERSIZE + 243, 60, "E01PBTNAR");
    fields[23] = fieldE01PBTAMT =
    new DecimalField(message, HEADERSIZE + 303, 17, 2, "E01PBTAMT");
    fields[24] = fieldE01PBTDCC =
    new CharacterField(message, HEADERSIZE + 320, 1, "E01PBTDCC");
    fields[25] = fieldE01PBTTIM =
    new CharacterField(message, HEADERSIZE + 321, 26, "E01PBTTIM");
    fields[26] = fieldE01PBTREF =
    new DecimalField(message, HEADERSIZE + 347, 12, 0, "E01PBTREF");
    fields[27] = fieldE01PBTRLR =
    new CharacterField(message, HEADERSIZE + 359, 10, "E01PBTRLR");
    fields[28] = fieldE01BEGBAL =
    new DecimalField(message, HEADERSIZE + 369, 17, 2, "E01BEGBAL");
    fields[29] = fieldE01ENDBAL =
    new DecimalField(message, HEADERSIZE + 386, 17, 2, "E01ENDBAL");
    fields[30] = fieldE01RECPOS =
    new DecimalField(message, HEADERSIZE + 403, 8, 0, "E01RECPOS");

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
  * Set field E01CUSCUN using a String value.
  */
  public void setE01CUSCUN(String newvalue)
  {
    fieldE01CUSCUN.setString(newvalue);
  }

  /**
  * Get value of field E01CUSCUN as a String.
  */
  public String getE01CUSCUN()
  {
    return fieldE01CUSCUN.getString();
  }

  /**
  * Set numeric field E01CUSCUN using a BigDecimal value.
  */
  public void setE01CUSCUN(BigDecimal newvalue)
  {
    fieldE01CUSCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUSCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUSCUN()
  {
    return fieldE01CUSCUN.getBigDecimal();
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
  * Set field E01ACMCCY using a String value.
  */
  public void setE01ACMCCY(String newvalue)
  {
    fieldE01ACMCCY.setString(newvalue);
  }

  /**
  * Get value of field E01ACMCCY as a String.
  */
  public String getE01ACMCCY()
  {
    return fieldE01ACMCCY.getString();
  }

  /**
  * Set field E01ACMPRO using a String value.
  */
  public void setE01ACMPRO(String newvalue)
  {
    fieldE01ACMPRO.setString(newvalue);
  }

  /**
  * Get value of field E01ACMPRO as a String.
  */
  public String getE01ACMPRO()
  {
    return fieldE01ACMPRO.getString();
  }

  /**
  * Set field E01DESPRO using a String value.
  */
  public void setE01DESPRO(String newvalue)
  {
    fieldE01DESPRO.setString(newvalue);
  }

  /**
  * Get value of field E01DESPRO as a String.
  */
  public String getE01DESPRO()
  {
    return fieldE01DESPRO.getString();
  }

  /**
  * Set field E01BOKBAL using a String value.
  */
  public void setE01BOKBAL(String newvalue)
  {
    fieldE01BOKBAL.setString(newvalue);
  }

  /**
  * Get value of field E01BOKBAL as a String.
  */
  public String getE01BOKBAL()
  {
    return fieldE01BOKBAL.getString();
  }

  /**
  * Set numeric field E01BOKBAL using a BigDecimal value.
  */
  public void setE01BOKBAL(BigDecimal newvalue)
  {
    fieldE01BOKBAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BOKBAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BOKBAL()
  {
    return fieldE01BOKBAL.getBigDecimal();
  }

  /**
  * Set field E01TOTDEB using a String value.
  */
  public void setE01TOTDEB(String newvalue)
  {
    fieldE01TOTDEB.setString(newvalue);
  }

  /**
  * Get value of field E01TOTDEB as a String.
  */
  public String getE01TOTDEB()
  {
    return fieldE01TOTDEB.getString();
  }

  /**
  * Set numeric field E01TOTDEB using a BigDecimal value.
  */
  public void setE01TOTDEB(BigDecimal newvalue)
  {
    fieldE01TOTDEB.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TOTDEB as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TOTDEB()
  {
    return fieldE01TOTDEB.getBigDecimal();
  }

  /**
  * Set field E01TOTCRE using a String value.
  */
  public void setE01TOTCRE(String newvalue)
  {
    fieldE01TOTCRE.setString(newvalue);
  }

  /**
  * Get value of field E01TOTCRE as a String.
  */
  public String getE01TOTCRE()
  {
    return fieldE01TOTCRE.getString();
  }

  /**
  * Set numeric field E01TOTCRE using a BigDecimal value.
  */
  public void setE01TOTCRE(BigDecimal newvalue)
  {
    fieldE01TOTCRE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TOTCRE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TOTCRE()
  {
    return fieldE01TOTCRE.getBigDecimal();
  }

  /**
  * Set field E01PBTACC using a String value.
  */
  public void setE01PBTACC(String newvalue)
  {
    fieldE01PBTACC.setString(newvalue);
  }

  /**
  * Get value of field E01PBTACC as a String.
  */
  public String getE01PBTACC()
  {
    return fieldE01PBTACC.getString();
  }

  /**
  * Set numeric field E01PBTACC using a BigDecimal value.
  */
  public void setE01PBTACC(BigDecimal newvalue)
  {
    fieldE01PBTACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PBTACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PBTACC()
  {
    return fieldE01PBTACC.getBigDecimal();
  }

  /**
  * Set field E01PBTDTM using a String value.
  */
  public void setE01PBTDTM(String newvalue)
  {
    fieldE01PBTDTM.setString(newvalue);
  }

  /**
  * Get value of field E01PBTDTM as a String.
  */
  public String getE01PBTDTM()
  {
    return fieldE01PBTDTM.getString();
  }

  /**
  * Set numeric field E01PBTDTM using a BigDecimal value.
  */
  public void setE01PBTDTM(BigDecimal newvalue)
  {
    fieldE01PBTDTM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PBTDTM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PBTDTM()
  {
    return fieldE01PBTDTM.getBigDecimal();
  }

  /**
  * Set field E01PBTDTD using a String value.
  */
  public void setE01PBTDTD(String newvalue)
  {
    fieldE01PBTDTD.setString(newvalue);
  }

  /**
  * Get value of field E01PBTDTD as a String.
  */
  public String getE01PBTDTD()
  {
    return fieldE01PBTDTD.getString();
  }

  /**
  * Set numeric field E01PBTDTD using a BigDecimal value.
  */
  public void setE01PBTDTD(BigDecimal newvalue)
  {
    fieldE01PBTDTD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PBTDTD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PBTDTD()
  {
    return fieldE01PBTDTD.getBigDecimal();
  }

  /**
  * Set field E01PBTDTY using a String value.
  */
  public void setE01PBTDTY(String newvalue)
  {
    fieldE01PBTDTY.setString(newvalue);
  }

  /**
  * Get value of field E01PBTDTY as a String.
  */
  public String getE01PBTDTY()
  {
    return fieldE01PBTDTY.getString();
  }

  /**
  * Set numeric field E01PBTDTY using a BigDecimal value.
  */
  public void setE01PBTDTY(BigDecimal newvalue)
  {
    fieldE01PBTDTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PBTDTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PBTDTY()
  {
    return fieldE01PBTDTY.getBigDecimal();
  }

  /**
  * Set field E01PBTCDE using a String value.
  */
  public void setE01PBTCDE(String newvalue)
  {
    fieldE01PBTCDE.setString(newvalue);
  }

  /**
  * Get value of field E01PBTCDE as a String.
  */
  public String getE01PBTCDE()
  {
    return fieldE01PBTCDE.getString();
  }

  /**
  * Set field E01PBTNAR using a String value.
  */
  public void setE01PBTNAR(String newvalue)
  {
    fieldE01PBTNAR.setString(newvalue);
  }

  /**
  * Get value of field E01PBTNAR as a String.
  */
  public String getE01PBTNAR()
  {
    return fieldE01PBTNAR.getString();
  }

  /**
  * Set field E01PBTAMT using a String value.
  */
  public void setE01PBTAMT(String newvalue)
  {
    fieldE01PBTAMT.setString(newvalue);
  }

  /**
  * Get value of field E01PBTAMT as a String.
  */
  public String getE01PBTAMT()
  {
    return fieldE01PBTAMT.getString();
  }

  /**
  * Set numeric field E01PBTAMT using a BigDecimal value.
  */
  public void setE01PBTAMT(BigDecimal newvalue)
  {
    fieldE01PBTAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PBTAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PBTAMT()
  {
    return fieldE01PBTAMT.getBigDecimal();
  }

  /**
  * Set field E01PBTDCC using a String value.
  */
  public void setE01PBTDCC(String newvalue)
  {
    fieldE01PBTDCC.setString(newvalue);
  }

  /**
  * Get value of field E01PBTDCC as a String.
  */
  public String getE01PBTDCC()
  {
    return fieldE01PBTDCC.getString();
  }

  /**
  * Set field E01PBTTIM using a String value.
  */
  public void setE01PBTTIM(String newvalue)
  {
    fieldE01PBTTIM.setString(newvalue);
  }

  /**
  * Get value of field E01PBTTIM as a String.
  */
  public String getE01PBTTIM()
  {
    return fieldE01PBTTIM.getString();
  }

  /**
  * Set field E01PBTREF using a String value.
  */
  public void setE01PBTREF(String newvalue)
  {
    fieldE01PBTREF.setString(newvalue);
  }

  /**
  * Get value of field E01PBTREF as a String.
  */
  public String getE01PBTREF()
  {
    return fieldE01PBTREF.getString();
  }

  /**
  * Set numeric field E01PBTREF using a BigDecimal value.
  */
  public void setE01PBTREF(BigDecimal newvalue)
  {
    fieldE01PBTREF.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PBTREF as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PBTREF()
  {
    return fieldE01PBTREF.getBigDecimal();
  }

  /**
  * Set field E01PBTRLR using a String value.
  */
  public void setE01PBTRLR(String newvalue)
  {
    fieldE01PBTRLR.setString(newvalue);
  }

  /**
  * Get value of field E01PBTRLR as a String.
  */
  public String getE01PBTRLR()
  {
    return fieldE01PBTRLR.getString();
  }

  /**
  * Set field E01BEGBAL using a String value.
  */
  public void setE01BEGBAL(String newvalue)
  {
    fieldE01BEGBAL.setString(newvalue);
  }

  /**
  * Get value of field E01BEGBAL as a String.
  */
  public String getE01BEGBAL()
  {
    return fieldE01BEGBAL.getString();
  }

  /**
  * Set numeric field E01BEGBAL using a BigDecimal value.
  */
  public void setE01BEGBAL(BigDecimal newvalue)
  {
    fieldE01BEGBAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BEGBAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BEGBAL()
  {
    return fieldE01BEGBAL.getBigDecimal();
  }

  /**
  * Set field E01ENDBAL using a String value.
  */
  public void setE01ENDBAL(String newvalue)
  {
    fieldE01ENDBAL.setString(newvalue);
  }

  /**
  * Get value of field E01ENDBAL as a String.
  */
  public String getE01ENDBAL()
  {
    return fieldE01ENDBAL.getString();
  }

  /**
  * Set numeric field E01ENDBAL using a BigDecimal value.
  */
  public void setE01ENDBAL(BigDecimal newvalue)
  {
    fieldE01ENDBAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ENDBAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ENDBAL()
  {
    return fieldE01ENDBAL.getBigDecimal();
  }

  /**
  * Set field E01RECPOS using a String value.
  */
  public void setE01RECPOS(String newvalue)
  {
    fieldE01RECPOS.setString(newvalue);
  }

  /**
  * Get value of field E01RECPOS as a String.
  */
  public String getE01RECPOS()
  {
    return fieldE01RECPOS.getString();
  }

  /**
  * Set numeric field E01RECPOS using a BigDecimal value.
  */
  public void setE01RECPOS(BigDecimal newvalue)
  {
    fieldE01RECPOS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RECPOS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RECPOS()
  {
    return fieldE01RECPOS.getBigDecimal();
  }

}
