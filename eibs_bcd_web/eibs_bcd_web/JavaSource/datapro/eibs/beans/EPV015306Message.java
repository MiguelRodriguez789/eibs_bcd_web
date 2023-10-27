package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EPV015306 physical file definition.
* 
* File level identifier is 1160715081712.
* Record format level identifier is 43D06B63B3FF4.
*/

public class EPV015306Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H06USERID",
                                     "H06PROGRM",
                                     "H06TIMSYS",
                                     "H06SCRCOD",
                                     "H06OPECOD",
                                     "H06FLGMAS",
                                     "H06FLGWK1",
                                     "H06FLGWK2",
                                     "H06FLGWK3",
                                     "E06DEAACC",
                                     "E06DEAACD",
                                     "E06DEAPRO",
                                     "E06DEATYP",
                                     "E06DEACUN",
                                     "E06DEABNK",
                                     "E06DEABRN",
                                     "E06DEACCY",
                                     "E06DEAGLN",
                                     "E06CUSNA1",
                                     "E06DSCPRO",
                                     "E06CPAMNT",
                                     "E06CPUSED",
                                     "E06CPDIFE",
                                     "E06CPBALN",
                                     "E06CPLTDM",
                                     "E06CPLTDD",
                                     "E06CPLTDY",
                                     "E06DIAMOR",
                                     "E06BALPRI",
                                     "E06BALINT",
                                     "E06BALMOR",
                                     "E06BALOTH",
                                     "E06BALTOT",
                                     "E06OLDSTS",
                                     "E06NEWSTS",
                                     "E06CODMTV",
                                     "E06REMARK"
                                   };
  final static String tnames[] = {
                                   "H06USERID",
                                   "H06PROGRM",
                                   "H06TIMSYS",
                                   "H06SCRCOD",
                                   "H06OPECOD",
                                   "H06FLGMAS",
                                   "H06FLGWK1",
                                   "H06FLGWK2",
                                   "H06FLGWK3",
                                   "E06DEAACC",
                                   "E06DEAACD",
                                   "E06DEAPRO",
                                   "E06DEATYP",
                                   "E06DEACUN",
                                   "E06DEABNK",
                                   "E06DEABRN",
                                   "E06DEACCY",
                                   "E06DEAGLN",
                                   "E06CUSNA1",
                                   "E06DSCPRO",
                                   "E06CPAMNT",
                                   "E06CPUSED",
                                   "E06CPDIFE",
                                   "E06CPBALN",
                                   "E06CPLTDM",
                                   "E06CPLTDD",
                                   "E06CPLTDY",
                                   "E06DIAMOR",
                                   "E06BALPRI",
                                   "E06BALINT",
                                   "E06BALMOR",
                                   "E06BALOTH",
                                   "E06BALTOT",
                                   "E06OLDSTS",
                                   "E06NEWSTS",
                                   "E06CODMTV",
                                   "E06REMARK"
                                 };
  final static String fid = "1160715081712";
  final static String rid = "43D06B63B3FF4";
  final static String fmtname = "EPV015306";
  final int FIELDCOUNT = 37;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH06USERID = null;
  private CharacterField fieldH06PROGRM = null;
  private CharacterField fieldH06TIMSYS = null;
  private CharacterField fieldH06SCRCOD = null;
  private CharacterField fieldH06OPECOD = null;
  private CharacterField fieldH06FLGMAS = null;
  private CharacterField fieldH06FLGWK1 = null;
  private CharacterField fieldH06FLGWK2 = null;
  private CharacterField fieldH06FLGWK3 = null;
  private DecimalField fieldE06DEAACC = null;
  private CharacterField fieldE06DEAACD = null;
  private CharacterField fieldE06DEAPRO = null;
  private CharacterField fieldE06DEATYP = null;
  private DecimalField fieldE06DEACUN = null;
  private CharacterField fieldE06DEABNK = null;
  private DecimalField fieldE06DEABRN = null;
  private CharacterField fieldE06DEACCY = null;
  private DecimalField fieldE06DEAGLN = null;
  private CharacterField fieldE06CUSNA1 = null;
  private CharacterField fieldE06DSCPRO = null;
  private DecimalField fieldE06CPAMNT = null;
  private DecimalField fieldE06CPUSED = null;
  private DecimalField fieldE06CPDIFE = null;
  private DecimalField fieldE06CPBALN = null;
  private DecimalField fieldE06CPLTDM = null;
  private DecimalField fieldE06CPLTDD = null;
  private DecimalField fieldE06CPLTDY = null;
  private DecimalField fieldE06DIAMOR = null;
  private DecimalField fieldE06BALPRI = null;
  private DecimalField fieldE06BALINT = null;
  private DecimalField fieldE06BALMOR = null;
  private DecimalField fieldE06BALOTH = null;
  private DecimalField fieldE06BALTOT = null;
  private CharacterField fieldE06OLDSTS = null;
  private CharacterField fieldE06NEWSTS = null;
  private CharacterField fieldE06CODMTV = null;
  private CharacterField fieldE06REMARK = null;

  /**
  * Constructor for EPV015306Message.
  */
  public EPV015306Message()
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
    recordsize = 639;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH06USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H06USERID");
    fields[1] = fieldH06PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H06PROGRM");
    fields[2] = fieldH06TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H06TIMSYS");
    fields[3] = fieldH06SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H06SCRCOD");
    fields[4] = fieldH06OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H06OPECOD");
    fields[5] = fieldH06FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H06FLGMAS");
    fields[6] = fieldH06FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H06FLGWK1");
    fields[7] = fieldH06FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H06FLGWK2");
    fields[8] = fieldH06FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H06FLGWK3");
    fields[9] = fieldE06DEAACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E06DEAACC");
    fields[10] = fieldE06DEAACD =
    new CharacterField(message, HEADERSIZE + 55, 2, "E06DEAACD");
    fields[11] = fieldE06DEAPRO =
    new CharacterField(message, HEADERSIZE + 57, 4, "E06DEAPRO");
    fields[12] = fieldE06DEATYP =
    new CharacterField(message, HEADERSIZE + 61, 4, "E06DEATYP");
    fields[13] = fieldE06DEACUN =
    new DecimalField(message, HEADERSIZE + 65, 10, 0, "E06DEACUN");
    fields[14] = fieldE06DEABNK =
    new CharacterField(message, HEADERSIZE + 75, 2, "E06DEABNK");
    fields[15] = fieldE06DEABRN =
    new DecimalField(message, HEADERSIZE + 77, 5, 0, "E06DEABRN");
    fields[16] = fieldE06DEACCY =
    new CharacterField(message, HEADERSIZE + 82, 3, "E06DEACCY");
    fields[17] = fieldE06DEAGLN =
    new DecimalField(message, HEADERSIZE + 85, 17, 0, "E06DEAGLN");
    fields[18] = fieldE06CUSNA1 =
    new CharacterField(message, HEADERSIZE + 102, 60, "E06CUSNA1");
    fields[19] = fieldE06DSCPRO =
    new CharacterField(message, HEADERSIZE + 162, 45, "E06DSCPRO");
    fields[20] = fieldE06CPAMNT =
    new DecimalField(message, HEADERSIZE + 207, 17, 2, "E06CPAMNT");
    fields[21] = fieldE06CPUSED =
    new DecimalField(message, HEADERSIZE + 224, 17, 2, "E06CPUSED");
    fields[22] = fieldE06CPDIFE =
    new DecimalField(message, HEADERSIZE + 241, 17, 2, "E06CPDIFE");
    fields[23] = fieldE06CPBALN =
    new DecimalField(message, HEADERSIZE + 258, 17, 2, "E06CPBALN");
    fields[24] = fieldE06CPLTDM =
    new DecimalField(message, HEADERSIZE + 275, 3, 0, "E06CPLTDM");
    fields[25] = fieldE06CPLTDD =
    new DecimalField(message, HEADERSIZE + 278, 3, 0, "E06CPLTDD");
    fields[26] = fieldE06CPLTDY =
    new DecimalField(message, HEADERSIZE + 281, 5, 0, "E06CPLTDY");
    fields[27] = fieldE06DIAMOR =
    new DecimalField(message, HEADERSIZE + 286, 6, 0, "E06DIAMOR");
    fields[28] = fieldE06BALPRI =
    new DecimalField(message, HEADERSIZE + 292, 17, 2, "E06BALPRI");
    fields[29] = fieldE06BALINT =
    new DecimalField(message, HEADERSIZE + 309, 17, 2, "E06BALINT");
    fields[30] = fieldE06BALMOR =
    new DecimalField(message, HEADERSIZE + 326, 17, 2, "E06BALMOR");
    fields[31] = fieldE06BALOTH =
    new DecimalField(message, HEADERSIZE + 343, 17, 2, "E06BALOTH");
    fields[32] = fieldE06BALTOT =
    new DecimalField(message, HEADERSIZE + 360, 17, 2, "E06BALTOT");
    fields[33] = fieldE06OLDSTS =
    new CharacterField(message, HEADERSIZE + 377, 1, "E06OLDSTS");
    fields[34] = fieldE06NEWSTS =
    new CharacterField(message, HEADERSIZE + 378, 1, "E06NEWSTS");
    fields[35] = fieldE06CODMTV =
    new CharacterField(message, HEADERSIZE + 379, 4, "E06CODMTV");
    fields[36] = fieldE06REMARK =
    new CharacterField(message, HEADERSIZE + 383, 256, "E06REMARK");

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
  * Set field H06USERID using a String value.
  */
  public void setH06USERID(String newvalue)
  {
    fieldH06USERID.setString(newvalue);
  }

  /**
  * Get value of field H06USERID as a String.
  */
  public String getH06USERID()
  {
    return fieldH06USERID.getString();
  }

  /**
  * Set field H06PROGRM using a String value.
  */
  public void setH06PROGRM(String newvalue)
  {
    fieldH06PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H06PROGRM as a String.
  */
  public String getH06PROGRM()
  {
    return fieldH06PROGRM.getString();
  }

  /**
  * Set field H06TIMSYS using a String value.
  */
  public void setH06TIMSYS(String newvalue)
  {
    fieldH06TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H06TIMSYS as a String.
  */
  public String getH06TIMSYS()
  {
    return fieldH06TIMSYS.getString();
  }

  /**
  * Set field H06SCRCOD using a String value.
  */
  public void setH06SCRCOD(String newvalue)
  {
    fieldH06SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H06SCRCOD as a String.
  */
  public String getH06SCRCOD()
  {
    return fieldH06SCRCOD.getString();
  }

  /**
  * Set field H06OPECOD using a String value.
  */
  public void setH06OPECOD(String newvalue)
  {
    fieldH06OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H06OPECOD as a String.
  */
  public String getH06OPECOD()
  {
    return fieldH06OPECOD.getString();
  }

  /**
  * Set field H06FLGMAS using a String value.
  */
  public void setH06FLGMAS(String newvalue)
  {
    fieldH06FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H06FLGMAS as a String.
  */
  public String getH06FLGMAS()
  {
    return fieldH06FLGMAS.getString();
  }

  /**
  * Set field H06FLGWK1 using a String value.
  */
  public void setH06FLGWK1(String newvalue)
  {
    fieldH06FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H06FLGWK1 as a String.
  */
  public String getH06FLGWK1()
  {
    return fieldH06FLGWK1.getString();
  }

  /**
  * Set field H06FLGWK2 using a String value.
  */
  public void setH06FLGWK2(String newvalue)
  {
    fieldH06FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H06FLGWK2 as a String.
  */
  public String getH06FLGWK2()
  {
    return fieldH06FLGWK2.getString();
  }

  /**
  * Set field H06FLGWK3 using a String value.
  */
  public void setH06FLGWK3(String newvalue)
  {
    fieldH06FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H06FLGWK3 as a String.
  */
  public String getH06FLGWK3()
  {
    return fieldH06FLGWK3.getString();
  }

  /**
  * Set field E06DEAACC using a String value.
  */
  public void setE06DEAACC(String newvalue)
  {
    fieldE06DEAACC.setString(newvalue);
  }

  /**
  * Get value of field E06DEAACC as a String.
  */
  public String getE06DEAACC()
  {
    return fieldE06DEAACC.getString();
  }

  /**
  * Set numeric field E06DEAACC using a BigDecimal value.
  */
  public void setE06DEAACC(BigDecimal newvalue)
  {
    fieldE06DEAACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06DEAACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06DEAACC()
  {
    return fieldE06DEAACC.getBigDecimal();
  }

  /**
  * Set field E06DEAACD using a String value.
  */
  public void setE06DEAACD(String newvalue)
  {
    fieldE06DEAACD.setString(newvalue);
  }

  /**
  * Get value of field E06DEAACD as a String.
  */
  public String getE06DEAACD()
  {
    return fieldE06DEAACD.getString();
  }

  /**
  * Set field E06DEAPRO using a String value.
  */
  public void setE06DEAPRO(String newvalue)
  {
    fieldE06DEAPRO.setString(newvalue);
  }

  /**
  * Get value of field E06DEAPRO as a String.
  */
  public String getE06DEAPRO()
  {
    return fieldE06DEAPRO.getString();
  }

  /**
  * Set field E06DEATYP using a String value.
  */
  public void setE06DEATYP(String newvalue)
  {
    fieldE06DEATYP.setString(newvalue);
  }

  /**
  * Get value of field E06DEATYP as a String.
  */
  public String getE06DEATYP()
  {
    return fieldE06DEATYP.getString();
  }

  /**
  * Set field E06DEACUN using a String value.
  */
  public void setE06DEACUN(String newvalue)
  {
    fieldE06DEACUN.setString(newvalue);
  }

  /**
  * Get value of field E06DEACUN as a String.
  */
  public String getE06DEACUN()
  {
    return fieldE06DEACUN.getString();
  }

  /**
  * Set numeric field E06DEACUN using a BigDecimal value.
  */
  public void setE06DEACUN(BigDecimal newvalue)
  {
    fieldE06DEACUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06DEACUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06DEACUN()
  {
    return fieldE06DEACUN.getBigDecimal();
  }

  /**
  * Set field E06DEABNK using a String value.
  */
  public void setE06DEABNK(String newvalue)
  {
    fieldE06DEABNK.setString(newvalue);
  }

  /**
  * Get value of field E06DEABNK as a String.
  */
  public String getE06DEABNK()
  {
    return fieldE06DEABNK.getString();
  }

  /**
  * Set field E06DEABRN using a String value.
  */
  public void setE06DEABRN(String newvalue)
  {
    fieldE06DEABRN.setString(newvalue);
  }

  /**
  * Get value of field E06DEABRN as a String.
  */
  public String getE06DEABRN()
  {
    return fieldE06DEABRN.getString();
  }

  /**
  * Set numeric field E06DEABRN using a BigDecimal value.
  */
  public void setE06DEABRN(BigDecimal newvalue)
  {
    fieldE06DEABRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06DEABRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06DEABRN()
  {
    return fieldE06DEABRN.getBigDecimal();
  }

  /**
  * Set field E06DEACCY using a String value.
  */
  public void setE06DEACCY(String newvalue)
  {
    fieldE06DEACCY.setString(newvalue);
  }

  /**
  * Get value of field E06DEACCY as a String.
  */
  public String getE06DEACCY()
  {
    return fieldE06DEACCY.getString();
  }

  /**
  * Set field E06DEAGLN using a String value.
  */
  public void setE06DEAGLN(String newvalue)
  {
    fieldE06DEAGLN.setString(newvalue);
  }

  /**
  * Get value of field E06DEAGLN as a String.
  */
  public String getE06DEAGLN()
  {
    return fieldE06DEAGLN.getString();
  }

  /**
  * Set numeric field E06DEAGLN using a BigDecimal value.
  */
  public void setE06DEAGLN(BigDecimal newvalue)
  {
    fieldE06DEAGLN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06DEAGLN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06DEAGLN()
  {
    return fieldE06DEAGLN.getBigDecimal();
  }

  /**
  * Set field E06CUSNA1 using a String value.
  */
  public void setE06CUSNA1(String newvalue)
  {
    fieldE06CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E06CUSNA1 as a String.
  */
  public String getE06CUSNA1()
  {
    return fieldE06CUSNA1.getString();
  }

  /**
  * Set field E06DSCPRO using a String value.
  */
  public void setE06DSCPRO(String newvalue)
  {
    fieldE06DSCPRO.setString(newvalue);
  }

  /**
  * Get value of field E06DSCPRO as a String.
  */
  public String getE06DSCPRO()
  {
    return fieldE06DSCPRO.getString();
  }

  /**
  * Set field E06CPAMNT using a String value.
  */
  public void setE06CPAMNT(String newvalue)
  {
    fieldE06CPAMNT.setString(newvalue);
  }

  /**
  * Get value of field E06CPAMNT as a String.
  */
  public String getE06CPAMNT()
  {
    return fieldE06CPAMNT.getString();
  }

  /**
  * Set numeric field E06CPAMNT using a BigDecimal value.
  */
  public void setE06CPAMNT(BigDecimal newvalue)
  {
    fieldE06CPAMNT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06CPAMNT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06CPAMNT()
  {
    return fieldE06CPAMNT.getBigDecimal();
  }

  /**
  * Set field E06CPUSED using a String value.
  */
  public void setE06CPUSED(String newvalue)
  {
    fieldE06CPUSED.setString(newvalue);
  }

  /**
  * Get value of field E06CPUSED as a String.
  */
  public String getE06CPUSED()
  {
    return fieldE06CPUSED.getString();
  }

  /**
  * Set numeric field E06CPUSED using a BigDecimal value.
  */
  public void setE06CPUSED(BigDecimal newvalue)
  {
    fieldE06CPUSED.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06CPUSED as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06CPUSED()
  {
    return fieldE06CPUSED.getBigDecimal();
  }

  /**
  * Set field E06CPDIFE using a String value.
  */
  public void setE06CPDIFE(String newvalue)
  {
    fieldE06CPDIFE.setString(newvalue);
  }

  /**
  * Get value of field E06CPDIFE as a String.
  */
  public String getE06CPDIFE()
  {
    return fieldE06CPDIFE.getString();
  }

  /**
  * Set numeric field E06CPDIFE using a BigDecimal value.
  */
  public void setE06CPDIFE(BigDecimal newvalue)
  {
    fieldE06CPDIFE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06CPDIFE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06CPDIFE()
  {
    return fieldE06CPDIFE.getBigDecimal();
  }

  /**
  * Set field E06CPBALN using a String value.
  */
  public void setE06CPBALN(String newvalue)
  {
    fieldE06CPBALN.setString(newvalue);
  }

  /**
  * Get value of field E06CPBALN as a String.
  */
  public String getE06CPBALN()
  {
    return fieldE06CPBALN.getString();
  }

  /**
  * Set numeric field E06CPBALN using a BigDecimal value.
  */
  public void setE06CPBALN(BigDecimal newvalue)
  {
    fieldE06CPBALN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06CPBALN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06CPBALN()
  {
    return fieldE06CPBALN.getBigDecimal();
  }

  /**
  * Set field E06CPLTDM using a String value.
  */
  public void setE06CPLTDM(String newvalue)
  {
    fieldE06CPLTDM.setString(newvalue);
  }

  /**
  * Get value of field E06CPLTDM as a String.
  */
  public String getE06CPLTDM()
  {
    return fieldE06CPLTDM.getString();
  }

  /**
  * Set numeric field E06CPLTDM using a BigDecimal value.
  */
  public void setE06CPLTDM(BigDecimal newvalue)
  {
    fieldE06CPLTDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06CPLTDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06CPLTDM()
  {
    return fieldE06CPLTDM.getBigDecimal();
  }

  /**
  * Set field E06CPLTDD using a String value.
  */
  public void setE06CPLTDD(String newvalue)
  {
    fieldE06CPLTDD.setString(newvalue);
  }

  /**
  * Get value of field E06CPLTDD as a String.
  */
  public String getE06CPLTDD()
  {
    return fieldE06CPLTDD.getString();
  }

  /**
  * Set numeric field E06CPLTDD using a BigDecimal value.
  */
  public void setE06CPLTDD(BigDecimal newvalue)
  {
    fieldE06CPLTDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06CPLTDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06CPLTDD()
  {
    return fieldE06CPLTDD.getBigDecimal();
  }

  /**
  * Set field E06CPLTDY using a String value.
  */
  public void setE06CPLTDY(String newvalue)
  {
    fieldE06CPLTDY.setString(newvalue);
  }

  /**
  * Get value of field E06CPLTDY as a String.
  */
  public String getE06CPLTDY()
  {
    return fieldE06CPLTDY.getString();
  }

  /**
  * Set numeric field E06CPLTDY using a BigDecimal value.
  */
  public void setE06CPLTDY(BigDecimal newvalue)
  {
    fieldE06CPLTDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06CPLTDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06CPLTDY()
  {
    return fieldE06CPLTDY.getBigDecimal();
  }

  /**
  * Set field E06DIAMOR using a String value.
  */
  public void setE06DIAMOR(String newvalue)
  {
    fieldE06DIAMOR.setString(newvalue);
  }

  /**
  * Get value of field E06DIAMOR as a String.
  */
  public String getE06DIAMOR()
  {
    return fieldE06DIAMOR.getString();
  }

  /**
  * Set numeric field E06DIAMOR using a BigDecimal value.
  */
  public void setE06DIAMOR(BigDecimal newvalue)
  {
    fieldE06DIAMOR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06DIAMOR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06DIAMOR()
  {
    return fieldE06DIAMOR.getBigDecimal();
  }

  /**
  * Set field E06BALPRI using a String value.
  */
  public void setE06BALPRI(String newvalue)
  {
    fieldE06BALPRI.setString(newvalue);
  }

  /**
  * Get value of field E06BALPRI as a String.
  */
  public String getE06BALPRI()
  {
    return fieldE06BALPRI.getString();
  }

  /**
  * Set numeric field E06BALPRI using a BigDecimal value.
  */
  public void setE06BALPRI(BigDecimal newvalue)
  {
    fieldE06BALPRI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06BALPRI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06BALPRI()
  {
    return fieldE06BALPRI.getBigDecimal();
  }

  /**
  * Set field E06BALINT using a String value.
  */
  public void setE06BALINT(String newvalue)
  {
    fieldE06BALINT.setString(newvalue);
  }

  /**
  * Get value of field E06BALINT as a String.
  */
  public String getE06BALINT()
  {
    return fieldE06BALINT.getString();
  }

  /**
  * Set numeric field E06BALINT using a BigDecimal value.
  */
  public void setE06BALINT(BigDecimal newvalue)
  {
    fieldE06BALINT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06BALINT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06BALINT()
  {
    return fieldE06BALINT.getBigDecimal();
  }

  /**
  * Set field E06BALMOR using a String value.
  */
  public void setE06BALMOR(String newvalue)
  {
    fieldE06BALMOR.setString(newvalue);
  }

  /**
  * Get value of field E06BALMOR as a String.
  */
  public String getE06BALMOR()
  {
    return fieldE06BALMOR.getString();
  }

  /**
  * Set numeric field E06BALMOR using a BigDecimal value.
  */
  public void setE06BALMOR(BigDecimal newvalue)
  {
    fieldE06BALMOR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06BALMOR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06BALMOR()
  {
    return fieldE06BALMOR.getBigDecimal();
  }

  /**
  * Set field E06BALOTH using a String value.
  */
  public void setE06BALOTH(String newvalue)
  {
    fieldE06BALOTH.setString(newvalue);
  }

  /**
  * Get value of field E06BALOTH as a String.
  */
  public String getE06BALOTH()
  {
    return fieldE06BALOTH.getString();
  }

  /**
  * Set numeric field E06BALOTH using a BigDecimal value.
  */
  public void setE06BALOTH(BigDecimal newvalue)
  {
    fieldE06BALOTH.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06BALOTH as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06BALOTH()
  {
    return fieldE06BALOTH.getBigDecimal();
  }

  /**
  * Set field E06BALTOT using a String value.
  */
  public void setE06BALTOT(String newvalue)
  {
    fieldE06BALTOT.setString(newvalue);
  }

  /**
  * Get value of field E06BALTOT as a String.
  */
  public String getE06BALTOT()
  {
    return fieldE06BALTOT.getString();
  }

  /**
  * Set numeric field E06BALTOT using a BigDecimal value.
  */
  public void setE06BALTOT(BigDecimal newvalue)
  {
    fieldE06BALTOT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06BALTOT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06BALTOT()
  {
    return fieldE06BALTOT.getBigDecimal();
  }

  /**
  * Set field E06OLDSTS using a String value.
  */
  public void setE06OLDSTS(String newvalue)
  {
    fieldE06OLDSTS.setString(newvalue);
  }

  /**
  * Get value of field E06OLDSTS as a String.
  */
  public String getE06OLDSTS()
  {
    return fieldE06OLDSTS.getString();
  }

  /**
  * Set field E06NEWSTS using a String value.
  */
  public void setE06NEWSTS(String newvalue)
  {
    fieldE06NEWSTS.setString(newvalue);
  }

  /**
  * Get value of field E06NEWSTS as a String.
  */
  public String getE06NEWSTS()
  {
    return fieldE06NEWSTS.getString();
  }

  /**
  * Set field E06CODMTV using a String value.
  */
  public void setE06CODMTV(String newvalue)
  {
    fieldE06CODMTV.setString(newvalue);
  }

  /**
  * Get value of field E06CODMTV as a String.
  */
  public String getE06CODMTV()
  {
    return fieldE06CODMTV.getString();
  }

  /**
  * Set field E06REMARK using a String value.
  */
  public void setE06REMARK(String newvalue)
  {
    fieldE06REMARK.setString(newvalue);
  }

  /**
  * Get value of field E06REMARK as a String.
  */
  public String getE06REMARK()
  {
    return fieldE06REMARK.getString();
  }

}
