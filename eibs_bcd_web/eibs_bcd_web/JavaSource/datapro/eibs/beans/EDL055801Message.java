package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL055801 physical file definition.
* 
* File level identifier is 1180823083607.
* Record format level identifier is 386565EF47B9E.
*/

public class EDL055801Message extends MessageRecord
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
                                     "E01MNPCON",
                                     "E01MNPBRN",
                                     "E01MNPMDT",
                                     "E01MNPMDD",
                                     "E01MNPMDC",
                                     "E01MNPMDM",
                                     "E01MNPREC",
                                     "E01MNPREM",
                                     "E01MNPFL1",
                                     "E01MNPFL2",
                                     "E01MNPFL3",
                                     "E01MNPOPE"
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
                                   "E01MNPCON",
                                   "E01MNPBRN",
                                   "E01MNPMDT",
                                   "E01MNPMDD",
                                   "E01MNPMDC",
                                   "E01MNPMDM",
                                   "E01MNPREC",
                                   "E01MNPREM",
                                   "E01MNPFL1",
                                   "E01MNPFL2",
                                   "E01MNPFL3",
                                   "E01MNPOPE"
                                 };
  final static String fid = "1180823083607";
  final static String rid = "386565EF47B9E";
  final static String fmtname = "EDL055801";
  final int FIELDCOUNT = 21;
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
  private CharacterField fieldE01MNPCON = null;
  private DecimalField fieldE01MNPBRN = null;
  private DecimalField fieldE01MNPMDT = null;
  private DecimalField fieldE01MNPMDD = null;
  private DecimalField fieldE01MNPMDC = null;
  private DecimalField fieldE01MNPMDM = null;
  private DecimalField fieldE01MNPREC = null;
  private DecimalField fieldE01MNPREM = null;
  private CharacterField fieldE01MNPFL1 = null;
  private CharacterField fieldE01MNPFL2 = null;
  private CharacterField fieldE01MNPFL3 = null;
  private CharacterField fieldE01MNPOPE = null;

  /**
  * Constructor for EDL055801Message.
  */
  public EDL055801Message()
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
    recordsize = 88;
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
    fields[9] = fieldE01MNPCON =
    new CharacterField(message, HEADERSIZE + 42, 1, "E01MNPCON");
    fields[10] = fieldE01MNPBRN =
    new DecimalField(message, HEADERSIZE + 43, 5, 0, "E01MNPBRN");
    fields[11] = fieldE01MNPMDT =
    new DecimalField(message, HEADERSIZE + 48, 6, 0, "E01MNPMDT");
    fields[12] = fieldE01MNPMDD =
    new DecimalField(message, HEADERSIZE + 54, 6, 0, "E01MNPMDD");
    fields[13] = fieldE01MNPMDC =
    new DecimalField(message, HEADERSIZE + 60, 6, 0, "E01MNPMDC");
    fields[14] = fieldE01MNPMDM =
    new DecimalField(message, HEADERSIZE + 66, 6, 0, "E01MNPMDM");
    fields[15] = fieldE01MNPREC =
    new DecimalField(message, HEADERSIZE + 72, 6, 0, "E01MNPREC");
    fields[16] = fieldE01MNPREM =
    new DecimalField(message, HEADERSIZE + 78, 6, 0, "E01MNPREM");
    fields[17] = fieldE01MNPFL1 =
    new CharacterField(message, HEADERSIZE + 84, 1, "E01MNPFL1");
    fields[18] = fieldE01MNPFL2 =
    new CharacterField(message, HEADERSIZE + 85, 1, "E01MNPFL2");
    fields[19] = fieldE01MNPFL3 =
    new CharacterField(message, HEADERSIZE + 86, 1, "E01MNPFL3");
    fields[20] = fieldE01MNPOPE =
    new CharacterField(message, HEADERSIZE + 87, 1, "E01MNPOPE");

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
  * Set field E01MNPCON using a String value.
  */
  public void setE01MNPCON(String newvalue)
  {
    fieldE01MNPCON.setString(newvalue);
  }

  /**
  * Get value of field E01MNPCON as a String.
  */
  public String getE01MNPCON()
  {
    return fieldE01MNPCON.getString();
  }

  /**
  * Set field E01MNPBRN using a String value.
  */
  public void setE01MNPBRN(String newvalue)
  {
    fieldE01MNPBRN.setString(newvalue);
  }

  /**
  * Get value of field E01MNPBRN as a String.
  */
  public String getE01MNPBRN()
  {
    return fieldE01MNPBRN.getString();
  }

  /**
  * Set numeric field E01MNPBRN using a BigDecimal value.
  */
  public void setE01MNPBRN(BigDecimal newvalue)
  {
    fieldE01MNPBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MNPBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MNPBRN()
  {
    return fieldE01MNPBRN.getBigDecimal();
  }

  /**
  * Set field E01MNPMDT using a String value.
  */
  public void setE01MNPMDT(String newvalue)
  {
    fieldE01MNPMDT.setString(newvalue);
  }

  /**
  * Get value of field E01MNPMDT as a String.
  */
  public String getE01MNPMDT()
  {
    return fieldE01MNPMDT.getString();
  }

  /**
  * Set numeric field E01MNPMDT using a BigDecimal value.
  */
  public void setE01MNPMDT(BigDecimal newvalue)
  {
    fieldE01MNPMDT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MNPMDT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MNPMDT()
  {
    return fieldE01MNPMDT.getBigDecimal();
  }

  /**
  * Set field E01MNPMDD using a String value.
  */
  public void setE01MNPMDD(String newvalue)
  {
    fieldE01MNPMDD.setString(newvalue);
  }

  /**
  * Get value of field E01MNPMDD as a String.
  */
  public String getE01MNPMDD()
  {
    return fieldE01MNPMDD.getString();
  }

  /**
  * Set numeric field E01MNPMDD using a BigDecimal value.
  */
  public void setE01MNPMDD(BigDecimal newvalue)
  {
    fieldE01MNPMDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MNPMDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MNPMDD()
  {
    return fieldE01MNPMDD.getBigDecimal();
  }

  /**
  * Set field E01MNPMDC using a String value.
  */
  public void setE01MNPMDC(String newvalue)
  {
    fieldE01MNPMDC.setString(newvalue);
  }

  /**
  * Get value of field E01MNPMDC as a String.
  */
  public String getE01MNPMDC()
  {
    return fieldE01MNPMDC.getString();
  }

  /**
  * Set numeric field E01MNPMDC using a BigDecimal value.
  */
  public void setE01MNPMDC(BigDecimal newvalue)
  {
    fieldE01MNPMDC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MNPMDC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MNPMDC()
  {
    return fieldE01MNPMDC.getBigDecimal();
  }

  /**
  * Set field E01MNPMDM using a String value.
  */
  public void setE01MNPMDM(String newvalue)
  {
    fieldE01MNPMDM.setString(newvalue);
  }

  /**
  * Get value of field E01MNPMDM as a String.
  */
  public String getE01MNPMDM()
  {
    return fieldE01MNPMDM.getString();
  }

  /**
  * Set numeric field E01MNPMDM using a BigDecimal value.
  */
  public void setE01MNPMDM(BigDecimal newvalue)
  {
    fieldE01MNPMDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MNPMDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MNPMDM()
  {
    return fieldE01MNPMDM.getBigDecimal();
  }

  /**
  * Set field E01MNPREC using a String value.
  */
  public void setE01MNPREC(String newvalue)
  {
    fieldE01MNPREC.setString(newvalue);
  }

  /**
  * Get value of field E01MNPREC as a String.
  */
  public String getE01MNPREC()
  {
    return fieldE01MNPREC.getString();
  }

  /**
  * Set numeric field E01MNPREC using a BigDecimal value.
  */
  public void setE01MNPREC(BigDecimal newvalue)
  {
    fieldE01MNPREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MNPREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MNPREC()
  {
    return fieldE01MNPREC.getBigDecimal();
  }

  /**
  * Set field E01MNPREM using a String value.
  */
  public void setE01MNPREM(String newvalue)
  {
    fieldE01MNPREM.setString(newvalue);
  }

  /**
  * Get value of field E01MNPREM as a String.
  */
  public String getE01MNPREM()
  {
    return fieldE01MNPREM.getString();
  }

  /**
  * Set numeric field E01MNPREM using a BigDecimal value.
  */
  public void setE01MNPREM(BigDecimal newvalue)
  {
    fieldE01MNPREM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MNPREM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MNPREM()
  {
    return fieldE01MNPREM.getBigDecimal();
  }

  /**
  * Set field E01MNPFL1 using a String value.
  */
  public void setE01MNPFL1(String newvalue)
  {
    fieldE01MNPFL1.setString(newvalue);
  }

  /**
  * Get value of field E01MNPFL1 as a String.
  */
  public String getE01MNPFL1()
  {
    return fieldE01MNPFL1.getString();
  }

  /**
  * Set field E01MNPFL2 using a String value.
  */
  public void setE01MNPFL2(String newvalue)
  {
    fieldE01MNPFL2.setString(newvalue);
  }

  /**
  * Get value of field E01MNPFL2 as a String.
  */
  public String getE01MNPFL2()
  {
    return fieldE01MNPFL2.getString();
  }

  /**
  * Set field E01MNPFL3 using a String value.
  */
  public void setE01MNPFL3(String newvalue)
  {
    fieldE01MNPFL3.setString(newvalue);
  }

  /**
  * Get value of field E01MNPFL3 as a String.
  */
  public String getE01MNPFL3()
  {
    return fieldE01MNPFL3.getString();
  }

  /**
  * Set field E01MNPOPE using a String value.
  */
  public void setE01MNPOPE(String newvalue)
  {
    fieldE01MNPOPE.setString(newvalue);
  }

  /**
  * Get value of field E01MNPOPE as a String.
  */
  public String getE01MNPOPE()
  {
    return fieldE01MNPOPE.getString();
  }

}