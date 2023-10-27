package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECD0017DS physical file definition.
* 
* File level identifier is 1130611112843.
* Record format level identifier is 3F872A280AAD0.
*/

public class ECD0017DSMessage extends MessageRecord
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
                                     "E01CDPCOD",
                                     "E01CDPDSC",
                                     "E01CDPBNK",
                                     "E01CDPCCY",
                                     "E01CDPPRD",
                                     "E01CDPTPL",
                                     "E01CDPNPL",
                                     "E01CDPTYP",
                                     "E01CDPINI",
                                     "E01CDPFIN",
                                     "E01CDPMIN",
                                     "E01CDPMAX",
                                     "E01CDPPTO",
                                     "E01CDPMTO",
                                     "E01CDPUSR",
                                     "E01CDPFEC",
                                     "E01CDPHOR"
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
                                   "E01CDPCOD",
                                   "E01CDPDSC",
                                   "E01CDPBNK",
                                   "E01CDPCCY",
                                   "E01CDPPRD",
                                   "E01CDPTPL",
                                   "E01CDPNPL",
                                   "E01CDPTYP",
                                   "E01CDPINI",
                                   "E01CDPFIN",
                                   "E01CDPMIN",
                                   "E01CDPMAX",
                                   "E01CDPPTO",
                                   "E01CDPMTO",
                                   "E01CDPUSR",
                                   "E01CDPFEC",
                                   "E01CDPHOR"
                                 };
  final static String fid = "1130611112843";
  final static String rid = "3F872A280AAD0";
  final static String fmtname = "ECD0017DS";
  final int FIELDCOUNT = 26;
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
  private CharacterField fieldE01CDPCOD = null;
  private CharacterField fieldE01CDPDSC = null;
  private CharacterField fieldE01CDPBNK = null;
  private CharacterField fieldE01CDPCCY = null;
  private CharacterField fieldE01CDPPRD = null;
  private CharacterField fieldE01CDPTPL = null;
  private CharacterField fieldE01CDPNPL = null;
  private CharacterField fieldE01CDPTYP = null;
  private DecimalField fieldE01CDPINI = null;
  private DecimalField fieldE01CDPFIN = null;
  private DecimalField fieldE01CDPMIN = null;
  private DecimalField fieldE01CDPMAX = null;
  private DecimalField fieldE01CDPPTO = null;
  private DecimalField fieldE01CDPMTO = null;
  private CharacterField fieldE01CDPUSR = null;
  private DecimalField fieldE01CDPFEC = null;
  private CharacterField fieldE01CDPHOR = null;

  /**
  * Constructor for ECD0017DSMessage.
  */
  public ECD0017DSMessage()
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
    recordsize = 269;
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
    fields[9] = fieldE01CDPCOD =
    new CharacterField(message, HEADERSIZE + 42, 4, "E01CDPCOD");
    fields[10] = fieldE01CDPDSC =
    new CharacterField(message, HEADERSIZE + 46, 45, "E01CDPDSC");
    fields[11] = fieldE01CDPBNK =
    new CharacterField(message, HEADERSIZE + 91, 2, "E01CDPBNK");
    fields[12] = fieldE01CDPCCY =
    new CharacterField(message, HEADERSIZE + 93, 3, "E01CDPCCY");
    fields[13] = fieldE01CDPPRD =
    new CharacterField(message, HEADERSIZE + 96, 4, "E01CDPPRD");
    fields[14] = fieldE01CDPTPL =
    new CharacterField(message, HEADERSIZE + 100, 2, "E01CDPTPL");
    fields[15] = fieldE01CDPNPL =
    new CharacterField(message, HEADERSIZE + 102, 45, "E01CDPNPL");
    fields[16] = fieldE01CDPTYP =
    new CharacterField(message, HEADERSIZE + 147, 1, "E01CDPTYP");
    fields[17] = fieldE01CDPINI =
    new DecimalField(message, HEADERSIZE + 148, 9, 0, "E01CDPINI");
    fields[18] = fieldE01CDPFIN =
    new DecimalField(message, HEADERSIZE + 157, 9, 0, "E01CDPFIN");
    fields[19] = fieldE01CDPMIN =
    new DecimalField(message, HEADERSIZE + 166, 17, 2, "E01CDPMIN");
    fields[20] = fieldE01CDPMAX =
    new DecimalField(message, HEADERSIZE + 183, 17, 2, "E01CDPMAX");
    fields[21] = fieldE01CDPPTO =
    new DecimalField(message, HEADERSIZE + 200, 7, 0, "E01CDPPTO");
    fields[22] = fieldE01CDPMTO =
    new DecimalField(message, HEADERSIZE + 207, 17, 2, "E01CDPMTO");
    fields[23] = fieldE01CDPUSR =
    new CharacterField(message, HEADERSIZE + 224, 10, "E01CDPUSR");
    fields[24] = fieldE01CDPFEC =
    new DecimalField(message, HEADERSIZE + 234, 9, 0, "E01CDPFEC");
    fields[25] = fieldE01CDPHOR =
    new CharacterField(message, HEADERSIZE + 243, 26, "E01CDPHOR");

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
  * Set field E01CDPCOD using a String value.
  */
  public void setE01CDPCOD(String newvalue)
  {
    fieldE01CDPCOD.setString(newvalue);
  }

  /**
  * Get value of field E01CDPCOD as a String.
  */
  public String getE01CDPCOD()
  {
    return fieldE01CDPCOD.getString();
  }

  /**
  * Set field E01CDPDSC using a String value.
  */
  public void setE01CDPDSC(String newvalue)
  {
    fieldE01CDPDSC.setString(newvalue);
  }

  /**
  * Get value of field E01CDPDSC as a String.
  */
  public String getE01CDPDSC()
  {
    return fieldE01CDPDSC.getString();
  }

  /**
  * Set field E01CDPBNK using a String value.
  */
  public void setE01CDPBNK(String newvalue)
  {
    fieldE01CDPBNK.setString(newvalue);
  }

  /**
  * Get value of field E01CDPBNK as a String.
  */
  public String getE01CDPBNK()
  {
    return fieldE01CDPBNK.getString();
  }

  /**
  * Set field E01CDPCCY using a String value.
  */
  public void setE01CDPCCY(String newvalue)
  {
    fieldE01CDPCCY.setString(newvalue);
  }

  /**
  * Get value of field E01CDPCCY as a String.
  */
  public String getE01CDPCCY()
  {
    return fieldE01CDPCCY.getString();
  }

  /**
  * Set field E01CDPPRD using a String value.
  */
  public void setE01CDPPRD(String newvalue)
  {
    fieldE01CDPPRD.setString(newvalue);
  }

  /**
  * Get value of field E01CDPPRD as a String.
  */
  public String getE01CDPPRD()
  {
    return fieldE01CDPPRD.getString();
  }

  /**
  * Set field E01CDPTPL using a String value.
  */
  public void setE01CDPTPL(String newvalue)
  {
    fieldE01CDPTPL.setString(newvalue);
  }

  /**
  * Get value of field E01CDPTPL as a String.
  */
  public String getE01CDPTPL()
  {
    return fieldE01CDPTPL.getString();
  }

  /**
  * Set field E01CDPNPL using a String value.
  */
  public void setE01CDPNPL(String newvalue)
  {
    fieldE01CDPNPL.setString(newvalue);
  }

  /**
  * Get value of field E01CDPNPL as a String.
  */
  public String getE01CDPNPL()
  {
    return fieldE01CDPNPL.getString();
  }

  /**
  * Set field E01CDPTYP using a String value.
  */
  public void setE01CDPTYP(String newvalue)
  {
    fieldE01CDPTYP.setString(newvalue);
  }

  /**
  * Get value of field E01CDPTYP as a String.
  */
  public String getE01CDPTYP()
  {
    return fieldE01CDPTYP.getString();
  }

  /**
  * Set field E01CDPINI using a String value.
  */
  public void setE01CDPINI(String newvalue)
  {
    fieldE01CDPINI.setString(newvalue);
  }

  /**
  * Get value of field E01CDPINI as a String.
  */
  public String getE01CDPINI()
  {
    return fieldE01CDPINI.getString();
  }

  /**
  * Set numeric field E01CDPINI using a BigDecimal value.
  */
  public void setE01CDPINI(BigDecimal newvalue)
  {
    fieldE01CDPINI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDPINI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDPINI()
  {
    return fieldE01CDPINI.getBigDecimal();
  }

  /**
  * Set field E01CDPFIN using a String value.
  */
  public void setE01CDPFIN(String newvalue)
  {
    fieldE01CDPFIN.setString(newvalue);
  }

  /**
  * Get value of field E01CDPFIN as a String.
  */
  public String getE01CDPFIN()
  {
    return fieldE01CDPFIN.getString();
  }

  /**
  * Set numeric field E01CDPFIN using a BigDecimal value.
  */
  public void setE01CDPFIN(BigDecimal newvalue)
  {
    fieldE01CDPFIN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDPFIN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDPFIN()
  {
    return fieldE01CDPFIN.getBigDecimal();
  }

  /**
  * Set field E01CDPMIN using a String value.
  */
  public void setE01CDPMIN(String newvalue)
  {
    fieldE01CDPMIN.setString(newvalue);
  }

  /**
  * Get value of field E01CDPMIN as a String.
  */
  public String getE01CDPMIN()
  {
    return fieldE01CDPMIN.getString();
  }

  /**
  * Set numeric field E01CDPMIN using a BigDecimal value.
  */
  public void setE01CDPMIN(BigDecimal newvalue)
  {
    fieldE01CDPMIN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDPMIN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDPMIN()
  {
    return fieldE01CDPMIN.getBigDecimal();
  }

  /**
  * Set field E01CDPMAX using a String value.
  */
  public void setE01CDPMAX(String newvalue)
  {
    fieldE01CDPMAX.setString(newvalue);
  }

  /**
  * Get value of field E01CDPMAX as a String.
  */
  public String getE01CDPMAX()
  {
    return fieldE01CDPMAX.getString();
  }

  /**
  * Set numeric field E01CDPMAX using a BigDecimal value.
  */
  public void setE01CDPMAX(BigDecimal newvalue)
  {
    fieldE01CDPMAX.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDPMAX as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDPMAX()
  {
    return fieldE01CDPMAX.getBigDecimal();
  }

  /**
  * Set field E01CDPPTO using a String value.
  */
  public void setE01CDPPTO(String newvalue)
  {
    fieldE01CDPPTO.setString(newvalue);
  }

  /**
  * Get value of field E01CDPPTO as a String.
  */
  public String getE01CDPPTO()
  {
    return fieldE01CDPPTO.getString();
  }

  /**
  * Set numeric field E01CDPPTO using a BigDecimal value.
  */
  public void setE01CDPPTO(BigDecimal newvalue)
  {
    fieldE01CDPPTO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDPPTO as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDPPTO()
  {
    return fieldE01CDPPTO.getBigDecimal();
  }

  /**
  * Set field E01CDPMTO using a String value.
  */
  public void setE01CDPMTO(String newvalue)
  {
    fieldE01CDPMTO.setString(newvalue);
  }

  /**
  * Get value of field E01CDPMTO as a String.
  */
  public String getE01CDPMTO()
  {
    return fieldE01CDPMTO.getString();
  }

  /**
  * Set numeric field E01CDPMTO using a BigDecimal value.
  */
  public void setE01CDPMTO(BigDecimal newvalue)
  {
    fieldE01CDPMTO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDPMTO as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDPMTO()
  {
    return fieldE01CDPMTO.getBigDecimal();
  }

  /**
  * Set field E01CDPUSR using a String value.
  */
  public void setE01CDPUSR(String newvalue)
  {
    fieldE01CDPUSR.setString(newvalue);
  }

  /**
  * Get value of field E01CDPUSR as a String.
  */
  public String getE01CDPUSR()
  {
    return fieldE01CDPUSR.getString();
  }

  /**
  * Set field E01CDPFEC using a String value.
  */
  public void setE01CDPFEC(String newvalue)
  {
    fieldE01CDPFEC.setString(newvalue);
  }

  /**
  * Get value of field E01CDPFEC as a String.
  */
  public String getE01CDPFEC()
  {
    return fieldE01CDPFEC.getString();
  }

  /**
  * Set numeric field E01CDPFEC using a BigDecimal value.
  */
  public void setE01CDPFEC(BigDecimal newvalue)
  {
    fieldE01CDPFEC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CDPFEC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CDPFEC()
  {
    return fieldE01CDPFEC.getBigDecimal();
  }

  /**
  * Set field E01CDPHOR using a String value.
  */
  public void setE01CDPHOR(String newvalue)
  {
    fieldE01CDPHOR.setString(newvalue);
  }

  /**
  * Get value of field E01CDPHOR as a String.
  */
  public String getE01CDPHOR()
  {
    return fieldE01CDPHOR.getString();
  }

}