package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ELC051501 physical file definition.
* 
* File level identifier is 1160711073858.
* Record format level identifier is 34BF1F8CE940E.
*/

public class ELC051501Message extends MessageRecord
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
                                     "E01WAPRBK",
                                     "E01WAPSBK",
                                     "E01WAPSRF",
                                     "E01WAPRNO",
                                     "E01WAPDTM",
                                     "E01WAPDTD",
                                     "E01WAPDTY",
                                     "E01WAPBEN",
                                     "E01WAPFMT",
                                     "E01WAPCCY",
                                     "E01WAPAMT",
                                     "E01WAPRRF",
                                     "E01NUMREC",
                                     "E01INDOPE",
                                     "E01LCMACC",
                                     "E01LCMPRO"
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
                                   "E01WAPRBK",
                                   "E01WAPSBK",
                                   "E01WAPSRF",
                                   "E01WAPRNO",
                                   "E01WAPDTM",
                                   "E01WAPDTD",
                                   "E01WAPDTY",
                                   "E01WAPBEN",
                                   "E01WAPFMT",
                                   "E01WAPCCY",
                                   "E01WAPAMT",
                                   "E01WAPRRF",
                                   "E01NUMREC",
                                   "E01INDOPE",
                                   "E01LCMACC",
                                   "E01LCMPRO"
                                 };
  final static String fid = "1160711073858";
  final static String rid = "34BF1F8CE940E";
  final static String fmtname = "ELC051501";
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
  private CharacterField fieldE01WAPRBK = null;
  private CharacterField fieldE01WAPSBK = null;
  private CharacterField fieldE01WAPSRF = null;
  private CharacterField fieldE01WAPRNO = null;
  private DecimalField fieldE01WAPDTM = null;
  private DecimalField fieldE01WAPDTD = null;
  private DecimalField fieldE01WAPDTY = null;
  private CharacterField fieldE01WAPBEN = null;
  private DecimalField fieldE01WAPFMT = null;
  private CharacterField fieldE01WAPCCY = null;
  private DecimalField fieldE01WAPAMT = null;
  private CharacterField fieldE01WAPRRF = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;
  private DecimalField fieldE01LCMACC = null;
  private CharacterField fieldE01LCMPRO = null;

  /**
  * Constructor for ELC051501Message.
  */
  public ELC051501Message()
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
    recordsize = 224;
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
    fields[9] = fieldE01WAPRBK =
    new CharacterField(message, HEADERSIZE + 42, 12, "E01WAPRBK");
    fields[10] = fieldE01WAPSBK =
    new CharacterField(message, HEADERSIZE + 54, 12, "E01WAPSBK");
    fields[11] = fieldE01WAPSRF =
    new CharacterField(message, HEADERSIZE + 66, 16, "E01WAPSRF");
    fields[12] = fieldE01WAPRNO =
    new CharacterField(message, HEADERSIZE + 82, 6, "E01WAPRNO");
    fields[13] = fieldE01WAPDTM =
    new DecimalField(message, HEADERSIZE + 88, 3, 0, "E01WAPDTM");
    fields[14] = fieldE01WAPDTD =
    new DecimalField(message, HEADERSIZE + 91, 3, 0, "E01WAPDTD");
    fields[15] = fieldE01WAPDTY =
    new DecimalField(message, HEADERSIZE + 94, 5, 0, "E01WAPDTY");
    fields[16] = fieldE01WAPBEN =
    new CharacterField(message, HEADERSIZE + 99, 60, "E01WAPBEN");
    fields[17] = fieldE01WAPFMT =
    new DecimalField(message, HEADERSIZE + 159, 4, 0, "E01WAPFMT");
    fields[18] = fieldE01WAPCCY =
    new CharacterField(message, HEADERSIZE + 163, 3, "E01WAPCCY");
    fields[19] = fieldE01WAPAMT =
    new DecimalField(message, HEADERSIZE + 166, 16, 0, "E01WAPAMT");
    fields[20] = fieldE01WAPRRF =
    new CharacterField(message, HEADERSIZE + 182, 16, "E01WAPRRF");
    fields[21] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 198, 8, 0, "E01NUMREC");
    fields[22] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 206, 1, "E01INDOPE");
    fields[23] = fieldE01LCMACC =
    new DecimalField(message, HEADERSIZE + 207, 13, 0, "E01LCMACC");
    fields[24] = fieldE01LCMPRO =
    new CharacterField(message, HEADERSIZE + 220, 4, "E01LCMPRO");

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
  * Set field E01WAPRBK using a String value.
  */
  public void setE01WAPRBK(String newvalue)
  {
    fieldE01WAPRBK.setString(newvalue);
  }

  /**
  * Get value of field E01WAPRBK as a String.
  */
  public String getE01WAPRBK()
  {
    return fieldE01WAPRBK.getString();
  }

  /**
  * Set field E01WAPSBK using a String value.
  */
  public void setE01WAPSBK(String newvalue)
  {
    fieldE01WAPSBK.setString(newvalue);
  }

  /**
  * Get value of field E01WAPSBK as a String.
  */
  public String getE01WAPSBK()
  {
    return fieldE01WAPSBK.getString();
  }

  /**
  * Set field E01WAPSRF using a String value.
  */
  public void setE01WAPSRF(String newvalue)
  {
    fieldE01WAPSRF.setString(newvalue);
  }

  /**
  * Get value of field E01WAPSRF as a String.
  */
  public String getE01WAPSRF()
  {
    return fieldE01WAPSRF.getString();
  }

  /**
  * Set field E01WAPRNO using a String value.
  */
  public void setE01WAPRNO(String newvalue)
  {
    fieldE01WAPRNO.setString(newvalue);
  }

  /**
  * Get value of field E01WAPRNO as a String.
  */
  public String getE01WAPRNO()
  {
    return fieldE01WAPRNO.getString();
  }

  /**
  * Set field E01WAPDTM using a String value.
  */
  public void setE01WAPDTM(String newvalue)
  {
    fieldE01WAPDTM.setString(newvalue);
  }

  /**
  * Get value of field E01WAPDTM as a String.
  */
  public String getE01WAPDTM()
  {
    return fieldE01WAPDTM.getString();
  }

  /**
  * Set numeric field E01WAPDTM using a BigDecimal value.
  */
  public void setE01WAPDTM(BigDecimal newvalue)
  {
    fieldE01WAPDTM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01WAPDTM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01WAPDTM()
  {
    return fieldE01WAPDTM.getBigDecimal();
  }

  /**
  * Set field E01WAPDTD using a String value.
  */
  public void setE01WAPDTD(String newvalue)
  {
    fieldE01WAPDTD.setString(newvalue);
  }

  /**
  * Get value of field E01WAPDTD as a String.
  */
  public String getE01WAPDTD()
  {
    return fieldE01WAPDTD.getString();
  }

  /**
  * Set numeric field E01WAPDTD using a BigDecimal value.
  */
  public void setE01WAPDTD(BigDecimal newvalue)
  {
    fieldE01WAPDTD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01WAPDTD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01WAPDTD()
  {
    return fieldE01WAPDTD.getBigDecimal();
  }

  /**
  * Set field E01WAPDTY using a String value.
  */
  public void setE01WAPDTY(String newvalue)
  {
    fieldE01WAPDTY.setString(newvalue);
  }

  /**
  * Get value of field E01WAPDTY as a String.
  */
  public String getE01WAPDTY()
  {
    return fieldE01WAPDTY.getString();
  }

  /**
  * Set numeric field E01WAPDTY using a BigDecimal value.
  */
  public void setE01WAPDTY(BigDecimal newvalue)
  {
    fieldE01WAPDTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01WAPDTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01WAPDTY()
  {
    return fieldE01WAPDTY.getBigDecimal();
  }

  /**
  * Set field E01WAPBEN using a String value.
  */
  public void setE01WAPBEN(String newvalue)
  {
    fieldE01WAPBEN.setString(newvalue);
  }

  /**
  * Get value of field E01WAPBEN as a String.
  */
  public String getE01WAPBEN()
  {
    return fieldE01WAPBEN.getString();
  }

  /**
  * Set field E01WAPFMT using a String value.
  */
  public void setE01WAPFMT(String newvalue)
  {
    fieldE01WAPFMT.setString(newvalue);
  }

  /**
  * Get value of field E01WAPFMT as a String.
  */
  public String getE01WAPFMT()
  {
    return fieldE01WAPFMT.getString();
  }

  /**
  * Set numeric field E01WAPFMT using a BigDecimal value.
  */
  public void setE01WAPFMT(BigDecimal newvalue)
  {
    fieldE01WAPFMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01WAPFMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01WAPFMT()
  {
    return fieldE01WAPFMT.getBigDecimal();
  }

  /**
  * Set field E01WAPCCY using a String value.
  */
  public void setE01WAPCCY(String newvalue)
  {
    fieldE01WAPCCY.setString(newvalue);
  }

  /**
  * Get value of field E01WAPCCY as a String.
  */
  public String getE01WAPCCY()
  {
    return fieldE01WAPCCY.getString();
  }

  /**
  * Set field E01WAPAMT using a String value.
  */
  public void setE01WAPAMT(String newvalue)
  {
    fieldE01WAPAMT.setString(newvalue);
  }

  /**
  * Get value of field E01WAPAMT as a String.
  */
  public String getE01WAPAMT()
  {
    return fieldE01WAPAMT.getString();
  }

  /**
  * Set numeric field E01WAPAMT using a BigDecimal value.
  */
  public void setE01WAPAMT(BigDecimal newvalue)
  {
    fieldE01WAPAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01WAPAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01WAPAMT()
  {
    return fieldE01WAPAMT.getBigDecimal();
  }

  /**
  * Set field E01WAPRRF using a String value.
  */
  public void setE01WAPRRF(String newvalue)
  {
    fieldE01WAPRRF.setString(newvalue);
  }

  /**
  * Get value of field E01WAPRRF as a String.
  */
  public String getE01WAPRRF()
  {
    return fieldE01WAPRRF.getString();
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

  /**
  * Set field E01LCMACC using a String value.
  */
  public void setE01LCMACC(String newvalue)
  {
    fieldE01LCMACC.setString(newvalue);
  }

  /**
  * Get value of field E01LCMACC as a String.
  */
  public String getE01LCMACC()
  {
    return fieldE01LCMACC.getString();
  }

  /**
  * Set numeric field E01LCMACC using a BigDecimal value.
  */
  public void setE01LCMACC(BigDecimal newvalue)
  {
    fieldE01LCMACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LCMACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LCMACC()
  {
    return fieldE01LCMACC.getBigDecimal();
  }

  /**
  * Set field E01LCMPRO using a String value.
  */
  public void setE01LCMPRO(String newvalue)
  {
    fieldE01LCMPRO.setString(newvalue);
  }

  /**
  * Get value of field E01LCMPRO as a String.
  */
  public String getE01LCMPRO()
  {
    return fieldE01LCMPRO.getString();
  }

}
