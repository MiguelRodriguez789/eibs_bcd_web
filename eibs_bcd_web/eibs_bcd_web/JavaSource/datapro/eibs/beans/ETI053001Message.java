package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ETI053001 physical file definition.
* 
* File level identifier is 1100706173702.
* Record format level identifier is 543D3B0BD4ED8.
*/

public class ETI053001Message extends MessageRecord
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
                                     "E01TLDBNK",
                                     "E01TLDCCY",
                                     "E01TLDBRN",
                                     "D01TLDBRN",
                                     "E01TLDTLR",
                                     "D01TLDTLR",
                                     "E01TLDRD1",
                                     "E01TLDRH1",
                                     "E01TLDGL1",
                                     "D01GL1DSC",
                                     "E01TLDRD2",
                                     "E01TLDRH2",
                                     "E01TLDGL2",
                                     "D01GL2DSC",
                                     "E01TLDRD3",
                                     "E01TLDRH3",
                                     "E01TLDGL3",
                                     "D01GL3DSC",
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
                                   "E01TLDBNK",
                                   "E01TLDCCY",
                                   "E01TLDBRN",
                                   "D01TLDBRN",
                                   "E01TLDTLR",
                                   "D01TLDTLR",
                                   "E01TLDRD1",
                                   "E01TLDRH1",
                                   "E01TLDGL1",
                                   "D01GL1DSC",
                                   "E01TLDRD2",
                                   "E01TLDRH2",
                                   "E01TLDGL2",
                                   "D01GL2DSC",
                                   "E01TLDRD3",
                                   "E01TLDRH3",
                                   "E01TLDGL3",
                                   "D01GL3DSC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1100706173702";
  final static String rid = "543D3B0BD4ED8";
  final static String fmtname = "ETI053001";
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
  private CharacterField fieldE01TLDBNK = null;
  private CharacterField fieldE01TLDCCY = null;
  private DecimalField fieldE01TLDBRN = null;
  private CharacterField fieldD01TLDBRN = null;
  private CharacterField fieldE01TLDTLR = null;
  private CharacterField fieldD01TLDTLR = null;
  private DecimalField fieldE01TLDRD1 = null;
  private DecimalField fieldE01TLDRH1 = null;
  private DecimalField fieldE01TLDGL1 = null;
  private CharacterField fieldD01GL1DSC = null;
  private DecimalField fieldE01TLDRD2 = null;
  private DecimalField fieldE01TLDRH2 = null;
  private DecimalField fieldE01TLDGL2 = null;
  private CharacterField fieldD01GL2DSC = null;
  private DecimalField fieldE01TLDRD3 = null;
  private DecimalField fieldE01TLDRH3 = null;
  private DecimalField fieldE01TLDGL3 = null;
  private CharacterField fieldD01GL3DSC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for ETI053001Message.
  */
  public ETI053001Message()
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
    recordsize = 387;
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
    fields[9] = fieldE01TLDBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01TLDBNK");
    fields[10] = fieldE01TLDCCY =
    new CharacterField(message, HEADERSIZE + 44, 3, "E01TLDCCY");
    fields[11] = fieldE01TLDBRN =
    new DecimalField(message, HEADERSIZE + 47, 4, 0, "E01TLDBRN");
    fields[12] = fieldD01TLDBRN =
    new CharacterField(message, HEADERSIZE + 51, 35, "D01TLDBRN");
    fields[13] = fieldE01TLDTLR =
    new CharacterField(message, HEADERSIZE + 86, 7, "E01TLDTLR");
    fields[14] = fieldD01TLDTLR =
    new CharacterField(message, HEADERSIZE + 93, 35, "D01TLDTLR");
    fields[15] = fieldE01TLDRD1 =
    new DecimalField(message, HEADERSIZE + 128, 17, 2, "E01TLDRD1");
    fields[16] = fieldE01TLDRH1 =
    new DecimalField(message, HEADERSIZE + 145, 17, 2, "E01TLDRH1");
    fields[17] = fieldE01TLDGL1 =
    new DecimalField(message, HEADERSIZE + 162, 17, 0, "E01TLDGL1");
    fields[18] = fieldD01GL1DSC =
    new CharacterField(message, HEADERSIZE + 179, 35, "D01GL1DSC");
    fields[19] = fieldE01TLDRD2 =
    new DecimalField(message, HEADERSIZE + 214, 17, 2, "E01TLDRD2");
    fields[20] = fieldE01TLDRH2 =
    new DecimalField(message, HEADERSIZE + 231, 17, 2, "E01TLDRH2");
    fields[21] = fieldE01TLDGL2 =
    new DecimalField(message, HEADERSIZE + 248, 17, 0, "E01TLDGL2");
    fields[22] = fieldD01GL2DSC =
    new CharacterField(message, HEADERSIZE + 265, 35, "D01GL2DSC");
    fields[23] = fieldE01TLDRD3 =
    new DecimalField(message, HEADERSIZE + 300, 17, 2, "E01TLDRD3");
    fields[24] = fieldE01TLDRH3 =
    new DecimalField(message, HEADERSIZE + 317, 17, 2, "E01TLDRH3");
    fields[25] = fieldE01TLDGL3 =
    new DecimalField(message, HEADERSIZE + 334, 17, 0, "E01TLDGL3");
    fields[26] = fieldD01GL3DSC =
    new CharacterField(message, HEADERSIZE + 351, 35, "D01GL3DSC");
    fields[27] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 386, 1, "E01INDOPE");

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
  * Set field E01TLDBNK using a String value.
  */
  public void setE01TLDBNK(String newvalue)
  {
    fieldE01TLDBNK.setString(newvalue);
  }

  /**
  * Get value of field E01TLDBNK as a String.
  */
  public String getE01TLDBNK()
  {
    return fieldE01TLDBNK.getString();
  }

  /**
  * Set field E01TLDCCY using a String value.
  */
  public void setE01TLDCCY(String newvalue)
  {
    fieldE01TLDCCY.setString(newvalue);
  }

  /**
  * Get value of field E01TLDCCY as a String.
  */
  public String getE01TLDCCY()
  {
    return fieldE01TLDCCY.getString();
  }

  /**
  * Set field E01TLDBRN using a String value.
  */
  public void setE01TLDBRN(String newvalue)
  {
    fieldE01TLDBRN.setString(newvalue);
  }

  /**
  * Get value of field E01TLDBRN as a String.
  */
  public String getE01TLDBRN()
  {
    return fieldE01TLDBRN.getString();
  }

  /**
  * Set numeric field E01TLDBRN using a BigDecimal value.
  */
  public void setE01TLDBRN(BigDecimal newvalue)
  {
    fieldE01TLDBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TLDBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TLDBRN()
  {
    return fieldE01TLDBRN.getBigDecimal();
  }

  /**
  * Set field D01TLDBRN using a String value.
  */
  public void setD01TLDBRN(String newvalue)
  {
    fieldD01TLDBRN.setString(newvalue);
  }

  /**
  * Get value of field D01TLDBRN as a String.
  */
  public String getD01TLDBRN()
  {
    return fieldD01TLDBRN.getString();
  }

  /**
  * Set field E01TLDTLR using a String value.
  */
  public void setE01TLDTLR(String newvalue)
  {
    fieldE01TLDTLR.setString(newvalue);
  }

  /**
  * Get value of field E01TLDTLR as a String.
  */
  public String getE01TLDTLR()
  {
    return fieldE01TLDTLR.getString();
  }

  /**
  * Set field D01TLDTLR using a String value.
  */
  public void setD01TLDTLR(String newvalue)
  {
    fieldD01TLDTLR.setString(newvalue);
  }

  /**
  * Get value of field D01TLDTLR as a String.
  */
  public String getD01TLDTLR()
  {
    return fieldD01TLDTLR.getString();
  }

  /**
  * Set field E01TLDRD1 using a String value.
  */
  public void setE01TLDRD1(String newvalue)
  {
    fieldE01TLDRD1.setString(newvalue);
  }

  /**
  * Get value of field E01TLDRD1 as a String.
  */
  public String getE01TLDRD1()
  {
    return fieldE01TLDRD1.getString();
  }

  /**
  * Set numeric field E01TLDRD1 using a BigDecimal value.
  */
  public void setE01TLDRD1(BigDecimal newvalue)
  {
    fieldE01TLDRD1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TLDRD1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TLDRD1()
  {
    return fieldE01TLDRD1.getBigDecimal();
  }

  /**
  * Set field E01TLDRH1 using a String value.
  */
  public void setE01TLDRH1(String newvalue)
  {
    fieldE01TLDRH1.setString(newvalue);
  }

  /**
  * Get value of field E01TLDRH1 as a String.
  */
  public String getE01TLDRH1()
  {
    return fieldE01TLDRH1.getString();
  }

  /**
  * Set numeric field E01TLDRH1 using a BigDecimal value.
  */
  public void setE01TLDRH1(BigDecimal newvalue)
  {
    fieldE01TLDRH1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TLDRH1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TLDRH1()
  {
    return fieldE01TLDRH1.getBigDecimal();
  }

  /**
  * Set field E01TLDGL1 using a String value.
  */
  public void setE01TLDGL1(String newvalue)
  {
    fieldE01TLDGL1.setString(newvalue);
  }

  /**
  * Get value of field E01TLDGL1 as a String.
  */
  public String getE01TLDGL1()
  {
    return fieldE01TLDGL1.getString();
  }

  /**
  * Set numeric field E01TLDGL1 using a BigDecimal value.
  */
  public void setE01TLDGL1(BigDecimal newvalue)
  {
    fieldE01TLDGL1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TLDGL1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TLDGL1()
  {
    return fieldE01TLDGL1.getBigDecimal();
  }

  /**
  * Set field D01GL1DSC using a String value.
  */
  public void setD01GL1DSC(String newvalue)
  {
    fieldD01GL1DSC.setString(newvalue);
  }

  /**
  * Get value of field D01GL1DSC as a String.
  */
  public String getD01GL1DSC()
  {
    return fieldD01GL1DSC.getString();
  }

  /**
  * Set field E01TLDRD2 using a String value.
  */
  public void setE01TLDRD2(String newvalue)
  {
    fieldE01TLDRD2.setString(newvalue);
  }

  /**
  * Get value of field E01TLDRD2 as a String.
  */
  public String getE01TLDRD2()
  {
    return fieldE01TLDRD2.getString();
  }

  /**
  * Set numeric field E01TLDRD2 using a BigDecimal value.
  */
  public void setE01TLDRD2(BigDecimal newvalue)
  {
    fieldE01TLDRD2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TLDRD2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TLDRD2()
  {
    return fieldE01TLDRD2.getBigDecimal();
  }

  /**
  * Set field E01TLDRH2 using a String value.
  */
  public void setE01TLDRH2(String newvalue)
  {
    fieldE01TLDRH2.setString(newvalue);
  }

  /**
  * Get value of field E01TLDRH2 as a String.
  */
  public String getE01TLDRH2()
  {
    return fieldE01TLDRH2.getString();
  }

  /**
  * Set numeric field E01TLDRH2 using a BigDecimal value.
  */
  public void setE01TLDRH2(BigDecimal newvalue)
  {
    fieldE01TLDRH2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TLDRH2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TLDRH2()
  {
    return fieldE01TLDRH2.getBigDecimal();
  }

  /**
  * Set field E01TLDGL2 using a String value.
  */
  public void setE01TLDGL2(String newvalue)
  {
    fieldE01TLDGL2.setString(newvalue);
  }

  /**
  * Get value of field E01TLDGL2 as a String.
  */
  public String getE01TLDGL2()
  {
    return fieldE01TLDGL2.getString();
  }

  /**
  * Set numeric field E01TLDGL2 using a BigDecimal value.
  */
  public void setE01TLDGL2(BigDecimal newvalue)
  {
    fieldE01TLDGL2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TLDGL2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TLDGL2()
  {
    return fieldE01TLDGL2.getBigDecimal();
  }

  /**
  * Set field D01GL2DSC using a String value.
  */
  public void setD01GL2DSC(String newvalue)
  {
    fieldD01GL2DSC.setString(newvalue);
  }

  /**
  * Get value of field D01GL2DSC as a String.
  */
  public String getD01GL2DSC()
  {
    return fieldD01GL2DSC.getString();
  }

  /**
  * Set field E01TLDRD3 using a String value.
  */
  public void setE01TLDRD3(String newvalue)
  {
    fieldE01TLDRD3.setString(newvalue);
  }

  /**
  * Get value of field E01TLDRD3 as a String.
  */
  public String getE01TLDRD3()
  {
    return fieldE01TLDRD3.getString();
  }

  /**
  * Set numeric field E01TLDRD3 using a BigDecimal value.
  */
  public void setE01TLDRD3(BigDecimal newvalue)
  {
    fieldE01TLDRD3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TLDRD3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TLDRD3()
  {
    return fieldE01TLDRD3.getBigDecimal();
  }

  /**
  * Set field E01TLDRH3 using a String value.
  */
  public void setE01TLDRH3(String newvalue)
  {
    fieldE01TLDRH3.setString(newvalue);
  }

  /**
  * Get value of field E01TLDRH3 as a String.
  */
  public String getE01TLDRH3()
  {
    return fieldE01TLDRH3.getString();
  }

  /**
  * Set numeric field E01TLDRH3 using a BigDecimal value.
  */
  public void setE01TLDRH3(BigDecimal newvalue)
  {
    fieldE01TLDRH3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TLDRH3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TLDRH3()
  {
    return fieldE01TLDRH3.getBigDecimal();
  }

  /**
  * Set field E01TLDGL3 using a String value.
  */
  public void setE01TLDGL3(String newvalue)
  {
    fieldE01TLDGL3.setString(newvalue);
  }

  /**
  * Get value of field E01TLDGL3 as a String.
  */
  public String getE01TLDGL3()
  {
    return fieldE01TLDGL3.getString();
  }

  /**
  * Set numeric field E01TLDGL3 using a BigDecimal value.
  */
  public void setE01TLDGL3(BigDecimal newvalue)
  {
    fieldE01TLDGL3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TLDGL3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TLDGL3()
  {
    return fieldE01TLDGL3.getBigDecimal();
  }

  /**
  * Set field D01GL3DSC using a String value.
  */
  public void setD01GL3DSC(String newvalue)
  {
    fieldD01GL3DSC.setString(newvalue);
  }

  /**
  * Get value of field D01GL3DSC as a String.
  */
  public String getD01GL3DSC()
  {
    return fieldD01GL3DSC.getString();
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