package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ELC500004 physical file definition.
* 
* File level identifier is 1160930132949.
* Record format level identifier is 43A615822B0BD.
*/

public class ELC500004Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H04USERID",
                                     "H04PROGRM",
                                     "H04TIMSYS",
                                     "H04SCRCOD",
                                     "H04OPECOD",
                                     "H04FLGMAS",
                                     "H04FLGWK1",
                                     "H04FLGWK2",
                                     "H04FLGWK3",
                                     "E04LCMACC",
                                     "E04LCMPRO",
                                     "E04CUSNA1",
                                     "E04DSCPRO",
                                     "E04LCMEXM",
                                     "E04LCMEXD",
                                     "E04LCMEXY",
                                     "E04LCMCNM",
                                     "E04LCMCND",
                                     "E04LCMCNY",
                                     "E04LCMAMN",
                                     "E04PYMDYS",
                                     "E04LCMAB6",
                                     "F04LCMEVF",
                                     "E04LCMFCO",
                                     "F04LCMFDI"
                                   };
  final static String tnames[] = {
                                   "H04USERID",
                                   "H04PROGRM",
                                   "H04TIMSYS",
                                   "H04SCRCOD",
                                   "H04OPECOD",
                                   "H04FLGMAS",
                                   "H04FLGWK1",
                                   "H04FLGWK2",
                                   "H04FLGWK3",
                                   "E04LCMACC",
                                   "E04LCMPRO",
                                   "E04CUSNA1",
                                   "E04DSCPRO",
                                   "E04LCMEXM",
                                   "E04LCMEXD",
                                   "E04LCMEXY",
                                   "E04LCMCNM",
                                   "E04LCMCND",
                                   "E04LCMCNY",
                                   "E04LCMAMN",
                                   "E04PYMDYS",
                                   "E04LCMAB6",
                                   "F04LCMEVF",
                                   "E04LCMFCO",
                                   "F04LCMFDI"
                                 };
  final static String fid = "1160930132949";
  final static String rid = "43A615822B0BD";
  final static String fmtname = "ELC500004";
  final int FIELDCOUNT = 25;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH04USERID = null;
  private CharacterField fieldH04PROGRM = null;
  private CharacterField fieldH04TIMSYS = null;
  private CharacterField fieldH04SCRCOD = null;
  private CharacterField fieldH04OPECOD = null;
  private CharacterField fieldH04FLGMAS = null;
  private CharacterField fieldH04FLGWK1 = null;
  private CharacterField fieldH04FLGWK2 = null;
  private CharacterField fieldH04FLGWK3 = null;
  private DecimalField fieldE04LCMACC = null;
  private CharacterField fieldE04LCMPRO = null;
  private CharacterField fieldE04CUSNA1 = null;
  private CharacterField fieldE04DSCPRO = null;
  private DecimalField fieldE04LCMEXM = null;
  private DecimalField fieldE04LCMEXD = null;
  private DecimalField fieldE04LCMEXY = null;
  private DecimalField fieldE04LCMCNM = null;
  private DecimalField fieldE04LCMCND = null;
  private DecimalField fieldE04LCMCNY = null;
  private DecimalField fieldE04LCMAMN = null;
  private DecimalField fieldE04PYMDYS = null;
  private CharacterField fieldE04LCMAB6 = null;
  private CharacterField fieldF04LCMEVF = null;
  private DecimalField fieldE04LCMFCO = null;
  private CharacterField fieldF04LCMFDI = null;

  /**
  * Constructor for ELC500004Message.
  */
  public ELC500004Message()
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
    recordsize = 223;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH04USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H04USERID");
    fields[1] = fieldH04PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H04PROGRM");
    fields[2] = fieldH04TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H04TIMSYS");
    fields[3] = fieldH04SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H04SCRCOD");
    fields[4] = fieldH04OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H04OPECOD");
    fields[5] = fieldH04FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H04FLGMAS");
    fields[6] = fieldH04FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H04FLGWK1");
    fields[7] = fieldH04FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H04FLGWK2");
    fields[8] = fieldH04FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H04FLGWK3");
    fields[9] = fieldE04LCMACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E04LCMACC");
    fields[10] = fieldE04LCMPRO =
    new CharacterField(message, HEADERSIZE + 55, 4, "E04LCMPRO");
    fields[11] = fieldE04CUSNA1 =
    new CharacterField(message, HEADERSIZE + 59, 60, "E04CUSNA1");
    fields[12] = fieldE04DSCPRO =
    new CharacterField(message, HEADERSIZE + 119, 45, "E04DSCPRO");
    fields[13] = fieldE04LCMEXM =
    new DecimalField(message, HEADERSIZE + 164, 3, 0, "E04LCMEXM");
    fields[14] = fieldE04LCMEXD =
    new DecimalField(message, HEADERSIZE + 167, 3, 0, "E04LCMEXD");
    fields[15] = fieldE04LCMEXY =
    new DecimalField(message, HEADERSIZE + 170, 5, 0, "E04LCMEXY");
    fields[16] = fieldE04LCMCNM =
    new DecimalField(message, HEADERSIZE + 175, 3, 0, "E04LCMCNM");
    fields[17] = fieldE04LCMCND =
    new DecimalField(message, HEADERSIZE + 178, 3, 0, "E04LCMCND");
    fields[18] = fieldE04LCMCNY =
    new DecimalField(message, HEADERSIZE + 181, 5, 0, "E04LCMCNY");
    fields[19] = fieldE04LCMAMN =
    new DecimalField(message, HEADERSIZE + 186, 17, 2, "E04LCMAMN");
    fields[20] = fieldE04PYMDYS =
    new DecimalField(message, HEADERSIZE + 203, 4, 0, "E04PYMDYS");
    fields[21] = fieldE04LCMAB6 =
    new CharacterField(message, HEADERSIZE + 207, 10, "E04LCMAB6");
    fields[22] = fieldF04LCMEVF =
    new CharacterField(message, HEADERSIZE + 217, 1, "F04LCMEVF");
    fields[23] = fieldE04LCMFCO =
    new DecimalField(message, HEADERSIZE + 218, 4, 0, "E04LCMFCO");
    fields[24] = fieldF04LCMFDI =
    new CharacterField(message, HEADERSIZE + 222, 1, "F04LCMFDI");

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
  * Set field H04USERID using a String value.
  */
  public void setH04USERID(String newvalue)
  {
    fieldH04USERID.setString(newvalue);
  }

  /**
  * Get value of field H04USERID as a String.
  */
  public String getH04USERID()
  {
    return fieldH04USERID.getString();
  }

  /**
  * Set field H04PROGRM using a String value.
  */
  public void setH04PROGRM(String newvalue)
  {
    fieldH04PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H04PROGRM as a String.
  */
  public String getH04PROGRM()
  {
    return fieldH04PROGRM.getString();
  }

  /**
  * Set field H04TIMSYS using a String value.
  */
  public void setH04TIMSYS(String newvalue)
  {
    fieldH04TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H04TIMSYS as a String.
  */
  public String getH04TIMSYS()
  {
    return fieldH04TIMSYS.getString();
  }

  /**
  * Set field H04SCRCOD using a String value.
  */
  public void setH04SCRCOD(String newvalue)
  {
    fieldH04SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H04SCRCOD as a String.
  */
  public String getH04SCRCOD()
  {
    return fieldH04SCRCOD.getString();
  }

  /**
  * Set field H04OPECOD using a String value.
  */
  public void setH04OPECOD(String newvalue)
  {
    fieldH04OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H04OPECOD as a String.
  */
  public String getH04OPECOD()
  {
    return fieldH04OPECOD.getString();
  }

  /**
  * Set field H04FLGMAS using a String value.
  */
  public void setH04FLGMAS(String newvalue)
  {
    fieldH04FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H04FLGMAS as a String.
  */
  public String getH04FLGMAS()
  {
    return fieldH04FLGMAS.getString();
  }

  /**
  * Set field H04FLGWK1 using a String value.
  */
  public void setH04FLGWK1(String newvalue)
  {
    fieldH04FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H04FLGWK1 as a String.
  */
  public String getH04FLGWK1()
  {
    return fieldH04FLGWK1.getString();
  }

  /**
  * Set field H04FLGWK2 using a String value.
  */
  public void setH04FLGWK2(String newvalue)
  {
    fieldH04FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H04FLGWK2 as a String.
  */
  public String getH04FLGWK2()
  {
    return fieldH04FLGWK2.getString();
  }

  /**
  * Set field H04FLGWK3 using a String value.
  */
  public void setH04FLGWK3(String newvalue)
  {
    fieldH04FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H04FLGWK3 as a String.
  */
  public String getH04FLGWK3()
  {
    return fieldH04FLGWK3.getString();
  }

  /**
  * Set field E04LCMACC using a String value.
  */
  public void setE04LCMACC(String newvalue)
  {
    fieldE04LCMACC.setString(newvalue);
  }

  /**
  * Get value of field E04LCMACC as a String.
  */
  public String getE04LCMACC()
  {
    return fieldE04LCMACC.getString();
  }

  /**
  * Set numeric field E04LCMACC using a BigDecimal value.
  */
  public void setE04LCMACC(BigDecimal newvalue)
  {
    fieldE04LCMACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04LCMACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04LCMACC()
  {
    return fieldE04LCMACC.getBigDecimal();
  }

  /**
  * Set field E04LCMPRO using a String value.
  */
  public void setE04LCMPRO(String newvalue)
  {
    fieldE04LCMPRO.setString(newvalue);
  }

  /**
  * Get value of field E04LCMPRO as a String.
  */
  public String getE04LCMPRO()
  {
    return fieldE04LCMPRO.getString();
  }

  /**
  * Set field E04CUSNA1 using a String value.
  */
  public void setE04CUSNA1(String newvalue)
  {
    fieldE04CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E04CUSNA1 as a String.
  */
  public String getE04CUSNA1()
  {
    return fieldE04CUSNA1.getString();
  }

  /**
  * Set field E04DSCPRO using a String value.
  */
  public void setE04DSCPRO(String newvalue)
  {
    fieldE04DSCPRO.setString(newvalue);
  }

  /**
  * Get value of field E04DSCPRO as a String.
  */
  public String getE04DSCPRO()
  {
    return fieldE04DSCPRO.getString();
  }

  /**
  * Set field E04LCMEXM using a String value.
  */
  public void setE04LCMEXM(String newvalue)
  {
    fieldE04LCMEXM.setString(newvalue);
  }

  /**
  * Get value of field E04LCMEXM as a String.
  */
  public String getE04LCMEXM()
  {
    return fieldE04LCMEXM.getString();
  }

  /**
  * Set numeric field E04LCMEXM using a BigDecimal value.
  */
  public void setE04LCMEXM(BigDecimal newvalue)
  {
    fieldE04LCMEXM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04LCMEXM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04LCMEXM()
  {
    return fieldE04LCMEXM.getBigDecimal();
  }

  /**
  * Set field E04LCMEXD using a String value.
  */
  public void setE04LCMEXD(String newvalue)
  {
    fieldE04LCMEXD.setString(newvalue);
  }

  /**
  * Get value of field E04LCMEXD as a String.
  */
  public String getE04LCMEXD()
  {
    return fieldE04LCMEXD.getString();
  }

  /**
  * Set numeric field E04LCMEXD using a BigDecimal value.
  */
  public void setE04LCMEXD(BigDecimal newvalue)
  {
    fieldE04LCMEXD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04LCMEXD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04LCMEXD()
  {
    return fieldE04LCMEXD.getBigDecimal();
  }

  /**
  * Set field E04LCMEXY using a String value.
  */
  public void setE04LCMEXY(String newvalue)
  {
    fieldE04LCMEXY.setString(newvalue);
  }

  /**
  * Get value of field E04LCMEXY as a String.
  */
  public String getE04LCMEXY()
  {
    return fieldE04LCMEXY.getString();
  }

  /**
  * Set numeric field E04LCMEXY using a BigDecimal value.
  */
  public void setE04LCMEXY(BigDecimal newvalue)
  {
    fieldE04LCMEXY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04LCMEXY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04LCMEXY()
  {
    return fieldE04LCMEXY.getBigDecimal();
  }

  /**
  * Set field E04LCMCNM using a String value.
  */
  public void setE04LCMCNM(String newvalue)
  {
    fieldE04LCMCNM.setString(newvalue);
  }

  /**
  * Get value of field E04LCMCNM as a String.
  */
  public String getE04LCMCNM()
  {
    return fieldE04LCMCNM.getString();
  }

  /**
  * Set numeric field E04LCMCNM using a BigDecimal value.
  */
  public void setE04LCMCNM(BigDecimal newvalue)
  {
    fieldE04LCMCNM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04LCMCNM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04LCMCNM()
  {
    return fieldE04LCMCNM.getBigDecimal();
  }

  /**
  * Set field E04LCMCND using a String value.
  */
  public void setE04LCMCND(String newvalue)
  {
    fieldE04LCMCND.setString(newvalue);
  }

  /**
  * Get value of field E04LCMCND as a String.
  */
  public String getE04LCMCND()
  {
    return fieldE04LCMCND.getString();
  }

  /**
  * Set numeric field E04LCMCND using a BigDecimal value.
  */
  public void setE04LCMCND(BigDecimal newvalue)
  {
    fieldE04LCMCND.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04LCMCND as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04LCMCND()
  {
    return fieldE04LCMCND.getBigDecimal();
  }

  /**
  * Set field E04LCMCNY using a String value.
  */
  public void setE04LCMCNY(String newvalue)
  {
    fieldE04LCMCNY.setString(newvalue);
  }

  /**
  * Get value of field E04LCMCNY as a String.
  */
  public String getE04LCMCNY()
  {
    return fieldE04LCMCNY.getString();
  }

  /**
  * Set numeric field E04LCMCNY using a BigDecimal value.
  */
  public void setE04LCMCNY(BigDecimal newvalue)
  {
    fieldE04LCMCNY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04LCMCNY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04LCMCNY()
  {
    return fieldE04LCMCNY.getBigDecimal();
  }

  /**
  * Set field E04LCMAMN using a String value.
  */
  public void setE04LCMAMN(String newvalue)
  {
    fieldE04LCMAMN.setString(newvalue);
  }

  /**
  * Get value of field E04LCMAMN as a String.
  */
  public String getE04LCMAMN()
  {
    return fieldE04LCMAMN.getString();
  }

  /**
  * Set numeric field E04LCMAMN using a BigDecimal value.
  */
  public void setE04LCMAMN(BigDecimal newvalue)
  {
    fieldE04LCMAMN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04LCMAMN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04LCMAMN()
  {
    return fieldE04LCMAMN.getBigDecimal();
  }

  /**
  * Set field E04PYMDYS using a String value.
  */
  public void setE04PYMDYS(String newvalue)
  {
    fieldE04PYMDYS.setString(newvalue);
  }

  /**
  * Get value of field E04PYMDYS as a String.
  */
  public String getE04PYMDYS()
  {
    return fieldE04PYMDYS.getString();
  }

  /**
  * Set numeric field E04PYMDYS using a BigDecimal value.
  */
  public void setE04PYMDYS(BigDecimal newvalue)
  {
    fieldE04PYMDYS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04PYMDYS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04PYMDYS()
  {
    return fieldE04PYMDYS.getBigDecimal();
  }

  /**
  * Set field E04LCMAB6 using a String value.
  */
  public void setE04LCMAB6(String newvalue)
  {
    fieldE04LCMAB6.setString(newvalue);
  }

  /**
  * Get value of field E04LCMAB6 as a String.
  */
  public String getE04LCMAB6()
  {
    return fieldE04LCMAB6.getString();
  }

  /**
  * Set field F04LCMEVF using a String value.
  */
  public void setF04LCMEVF(String newvalue)
  {
    fieldF04LCMEVF.setString(newvalue);
  }

  /**
  * Get value of field F04LCMEVF as a String.
  */
  public String getF04LCMEVF()
  {
    return fieldF04LCMEVF.getString();
  }

  /**
  * Set field E04LCMFCO using a String value.
  */
  public void setE04LCMFCO(String newvalue)
  {
    fieldE04LCMFCO.setString(newvalue);
  }

  /**
  * Get value of field E04LCMFCO as a String.
  */
  public String getE04LCMFCO()
  {
    return fieldE04LCMFCO.getString();
  }

  /**
  * Set numeric field E04LCMFCO using a BigDecimal value.
  */
  public void setE04LCMFCO(BigDecimal newvalue)
  {
    fieldE04LCMFCO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E04LCMFCO as a BigDecimal.
  */
  public BigDecimal getBigDecimalE04LCMFCO()
  {
    return fieldE04LCMFCO.getBigDecimal();
  }

  /**
  * Set field F04LCMFDI using a String value.
  */
  public void setF04LCMFDI(String newvalue)
  {
    fieldF04LCMFDI.setString(newvalue);
  }

  /**
  * Get value of field F04LCMFDI as a String.
  */
  public String getF04LCMFDI()
  {
    return fieldF04LCMFDI.getString();
  }

}