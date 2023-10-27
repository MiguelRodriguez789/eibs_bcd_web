package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ELN011002 physical file definition.
* 
* File level identifier is 1170223164434.
* Record format level identifier is 4DC27642176E9.
*/

public class ELN011002Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H02USERID",
                                     "H02PROGRM",
                                     "H02TIMSYS",
                                     "H02SCRCOD",
                                     "H02OPECOD",
                                     "H02FLGMAS",
                                     "H02FLGWK1",
                                     "H02FLGWK2",
                                     "H02FLGWK3",
                                     "E02LNECUN",
                                     "E02LNENUM",
                                     "E02LNETYL",
                                     "E02LNEOPM",
                                     "E02LNEOPD",
                                     "E02LNEOPY",
                                     "E02LNECRP",
                                     "E02CUSNA1",
                                     "E02LNEMTM",
                                     "E02LNEMTD",
                                     "E02LNEMTY",
                                     "E02LNRETM",
                                     "E02LNERED",
                                     "E02LNEREY",
                                     "E02LNECCY",
                                     "E02LNEAMN",
                                     "E02AVAILA",
                                     "E02USEAMT",
                                     "E02LNEREA",
                                     "E02LNETMA",
                                     "E02LNECAT",
                                     "E02LNEOFA"
                                   };
  final static String tnames[] = {
                                   "H02USERID",
                                   "H02PROGRM",
                                   "H02TIMSYS",
                                   "H02SCRCOD",
                                   "H02OPECOD",
                                   "H02FLGMAS",
                                   "H02FLGWK1",
                                   "H02FLGWK2",
                                   "H02FLGWK3",
                                   "E02LNECUN",
                                   "E02LNENUM",
                                   "E02LNETYL",
                                   "E02LNEOPM",
                                   "E02LNEOPD",
                                   "E02LNEOPY",
                                   "E02LNECRP",
                                   "E02CUSNA1",
                                   "E02LNEMTM",
                                   "E02LNEMTD",
                                   "E02LNEMTY",
                                   "E02LNRETM",
                                   "E02LNERED",
                                   "E02LNEREY",
                                   "E02LNECCY",
                                   "E02LNEAMN",
                                   "E02AVAILA",
                                   "E02USEAMT",
                                   "E02LNEREA",
                                   "E02LNETMA",
                                   "E02LNECAT",
                                   "E02LNEOFA"
                                 };
  final static String fid = "1170223164434";
  final static String rid = "4DC27642176E9";
  final static String fmtname = "ELN011002";
  final int FIELDCOUNT = 31;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH02USERID = null;
  private CharacterField fieldH02PROGRM = null;
  private CharacterField fieldH02TIMSYS = null;
  private CharacterField fieldH02SCRCOD = null;
  private CharacterField fieldH02OPECOD = null;
  private CharacterField fieldH02FLGMAS = null;
  private CharacterField fieldH02FLGWK1 = null;
  private CharacterField fieldH02FLGWK2 = null;
  private CharacterField fieldH02FLGWK3 = null;
  private DecimalField fieldE02LNECUN = null;
  private DecimalField fieldE02LNENUM = null;
  private CharacterField fieldE02LNETYL = null;
  private DecimalField fieldE02LNEOPM = null;
  private DecimalField fieldE02LNEOPD = null;
  private DecimalField fieldE02LNEOPY = null;
  private CharacterField fieldE02LNECRP = null;
  private CharacterField fieldE02CUSNA1 = null;
  private DecimalField fieldE02LNEMTM = null;
  private DecimalField fieldE02LNEMTD = null;
  private DecimalField fieldE02LNEMTY = null;
  private DecimalField fieldE02LNRETM = null;
  private DecimalField fieldE02LNERED = null;
  private DecimalField fieldE02LNEREY = null;
  private CharacterField fieldE02LNECCY = null;
  private DecimalField fieldE02LNEAMN = null;
  private DecimalField fieldE02AVAILA = null;
  private DecimalField fieldE02USEAMT = null;
  private DecimalField fieldE02LNEREA = null;
  private DecimalField fieldE02LNETMA = null;
  private CharacterField fieldE02LNECAT = null;
  private DecimalField fieldE02LNEOFA = null;

  /**
  * Constructor for ELN011002Message.
  */
  public ELN011002Message()
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
    recordsize = 320;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH02USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H02USERID");
    fields[1] = fieldH02PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H02PROGRM");
    fields[2] = fieldH02TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H02TIMSYS");
    fields[3] = fieldH02SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H02SCRCOD");
    fields[4] = fieldH02OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H02OPECOD");
    fields[5] = fieldH02FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H02FLGMAS");
    fields[6] = fieldH02FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H02FLGWK1");
    fields[7] = fieldH02FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H02FLGWK2");
    fields[8] = fieldH02FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H02FLGWK3");
    fields[9] = fieldE02LNECUN =
    new DecimalField(message, HEADERSIZE + 42, 10, 0, "E02LNECUN");
    fields[10] = fieldE02LNENUM =
    new DecimalField(message, HEADERSIZE + 52, 5, 0, "E02LNENUM");
    fields[11] = fieldE02LNETYL =
    new CharacterField(message, HEADERSIZE + 57, 4, "E02LNETYL");
    fields[12] = fieldE02LNEOPM =
    new DecimalField(message, HEADERSIZE + 61, 3, 0, "E02LNEOPM");
    fields[13] = fieldE02LNEOPD =
    new DecimalField(message, HEADERSIZE + 64, 3, 0, "E02LNEOPD");
    fields[14] = fieldE02LNEOPY =
    new DecimalField(message, HEADERSIZE + 67, 5, 0, "E02LNEOPY");
    fields[15] = fieldE02LNECRP =
    new CharacterField(message, HEADERSIZE + 72, 60, "E02LNECRP");
    fields[16] = fieldE02CUSNA1 =
    new CharacterField(message, HEADERSIZE + 132, 60, "E02CUSNA1");
    fields[17] = fieldE02LNEMTM =
    new DecimalField(message, HEADERSIZE + 192, 3, 0, "E02LNEMTM");
    fields[18] = fieldE02LNEMTD =
    new DecimalField(message, HEADERSIZE + 195, 3, 0, "E02LNEMTD");
    fields[19] = fieldE02LNEMTY =
    new DecimalField(message, HEADERSIZE + 198, 5, 0, "E02LNEMTY");
    fields[20] = fieldE02LNRETM =
    new DecimalField(message, HEADERSIZE + 203, 3, 0, "E02LNRETM");
    fields[21] = fieldE02LNERED =
    new DecimalField(message, HEADERSIZE + 206, 3, 0, "E02LNERED");
    fields[22] = fieldE02LNEREY =
    new DecimalField(message, HEADERSIZE + 209, 5, 0, "E02LNEREY");
    fields[23] = fieldE02LNECCY =
    new CharacterField(message, HEADERSIZE + 214, 3, "E02LNECCY");
    fields[24] = fieldE02LNEAMN =
    new DecimalField(message, HEADERSIZE + 217, 17, 2, "E02LNEAMN");
    fields[25] = fieldE02AVAILA =
    new DecimalField(message, HEADERSIZE + 234, 17, 2, "E02AVAILA");
    fields[26] = fieldE02USEAMT =
    new DecimalField(message, HEADERSIZE + 251, 17, 2, "E02USEAMT");
    fields[27] = fieldE02LNEREA =
    new DecimalField(message, HEADERSIZE + 268, 17, 2, "E02LNEREA");
    fields[28] = fieldE02LNETMA =
    new DecimalField(message, HEADERSIZE + 285, 17, 2, "E02LNETMA");
    fields[29] = fieldE02LNECAT =
    new CharacterField(message, HEADERSIZE + 302, 1, "E02LNECAT");
    fields[30] = fieldE02LNEOFA =
    new DecimalField(message, HEADERSIZE + 303, 17, 2, "E02LNEOFA");

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
  * Set field H02USERID using a String value.
  */
  public void setH02USERID(String newvalue)
  {
    fieldH02USERID.setString(newvalue);
  }

  /**
  * Get value of field H02USERID as a String.
  */
  public String getH02USERID()
  {
    return fieldH02USERID.getString();
  }

  /**
  * Set field H02PROGRM using a String value.
  */
  public void setH02PROGRM(String newvalue)
  {
    fieldH02PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H02PROGRM as a String.
  */
  public String getH02PROGRM()
  {
    return fieldH02PROGRM.getString();
  }

  /**
  * Set field H02TIMSYS using a String value.
  */
  public void setH02TIMSYS(String newvalue)
  {
    fieldH02TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H02TIMSYS as a String.
  */
  public String getH02TIMSYS()
  {
    return fieldH02TIMSYS.getString();
  }

  /**
  * Set field H02SCRCOD using a String value.
  */
  public void setH02SCRCOD(String newvalue)
  {
    fieldH02SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H02SCRCOD as a String.
  */
  public String getH02SCRCOD()
  {
    return fieldH02SCRCOD.getString();
  }

  /**
  * Set field H02OPECOD using a String value.
  */
  public void setH02OPECOD(String newvalue)
  {
    fieldH02OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H02OPECOD as a String.
  */
  public String getH02OPECOD()
  {
    return fieldH02OPECOD.getString();
  }

  /**
  * Set field H02FLGMAS using a String value.
  */
  public void setH02FLGMAS(String newvalue)
  {
    fieldH02FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H02FLGMAS as a String.
  */
  public String getH02FLGMAS()
  {
    return fieldH02FLGMAS.getString();
  }

  /**
  * Set field H02FLGWK1 using a String value.
  */
  public void setH02FLGWK1(String newvalue)
  {
    fieldH02FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK1 as a String.
  */
  public String getH02FLGWK1()
  {
    return fieldH02FLGWK1.getString();
  }

  /**
  * Set field H02FLGWK2 using a String value.
  */
  public void setH02FLGWK2(String newvalue)
  {
    fieldH02FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK2 as a String.
  */
  public String getH02FLGWK2()
  {
    return fieldH02FLGWK2.getString();
  }

  /**
  * Set field H02FLGWK3 using a String value.
  */
  public void setH02FLGWK3(String newvalue)
  {
    fieldH02FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H02FLGWK3 as a String.
  */
  public String getH02FLGWK3()
  {
    return fieldH02FLGWK3.getString();
  }

  /**
  * Set field E02LNECUN using a String value.
  */
  public void setE02LNECUN(String newvalue)
  {
    fieldE02LNECUN.setString(newvalue);
  }

  /**
  * Get value of field E02LNECUN as a String.
  */
  public String getE02LNECUN()
  {
    return fieldE02LNECUN.getString();
  }

  /**
  * Set numeric field E02LNECUN using a BigDecimal value.
  */
  public void setE02LNECUN(BigDecimal newvalue)
  {
    fieldE02LNECUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02LNECUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02LNECUN()
  {
    return fieldE02LNECUN.getBigDecimal();
  }

  /**
  * Set field E02LNENUM using a String value.
  */
  public void setE02LNENUM(String newvalue)
  {
    fieldE02LNENUM.setString(newvalue);
  }

  /**
  * Get value of field E02LNENUM as a String.
  */
  public String getE02LNENUM()
  {
    return fieldE02LNENUM.getString();
  }

  /**
  * Set numeric field E02LNENUM using a BigDecimal value.
  */
  public void setE02LNENUM(BigDecimal newvalue)
  {
    fieldE02LNENUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02LNENUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02LNENUM()
  {
    return fieldE02LNENUM.getBigDecimal();
  }

  /**
  * Set field E02LNETYL using a String value.
  */
  public void setE02LNETYL(String newvalue)
  {
    fieldE02LNETYL.setString(newvalue);
  }

  /**
  * Get value of field E02LNETYL as a String.
  */
  public String getE02LNETYL()
  {
    return fieldE02LNETYL.getString();
  }

  /**
  * Set field E02LNEOPM using a String value.
  */
  public void setE02LNEOPM(String newvalue)
  {
    fieldE02LNEOPM.setString(newvalue);
  }

  /**
  * Get value of field E02LNEOPM as a String.
  */
  public String getE02LNEOPM()
  {
    return fieldE02LNEOPM.getString();
  }

  /**
  * Set numeric field E02LNEOPM using a BigDecimal value.
  */
  public void setE02LNEOPM(BigDecimal newvalue)
  {
    fieldE02LNEOPM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02LNEOPM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02LNEOPM()
  {
    return fieldE02LNEOPM.getBigDecimal();
  }

  /**
  * Set field E02LNEOPD using a String value.
  */
  public void setE02LNEOPD(String newvalue)
  {
    fieldE02LNEOPD.setString(newvalue);
  }

  /**
  * Get value of field E02LNEOPD as a String.
  */
  public String getE02LNEOPD()
  {
    return fieldE02LNEOPD.getString();
  }

  /**
  * Set numeric field E02LNEOPD using a BigDecimal value.
  */
  public void setE02LNEOPD(BigDecimal newvalue)
  {
    fieldE02LNEOPD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02LNEOPD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02LNEOPD()
  {
    return fieldE02LNEOPD.getBigDecimal();
  }

  /**
  * Set field E02LNEOPY using a String value.
  */
  public void setE02LNEOPY(String newvalue)
  {
    fieldE02LNEOPY.setString(newvalue);
  }

  /**
  * Get value of field E02LNEOPY as a String.
  */
  public String getE02LNEOPY()
  {
    return fieldE02LNEOPY.getString();
  }

  /**
  * Set numeric field E02LNEOPY using a BigDecimal value.
  */
  public void setE02LNEOPY(BigDecimal newvalue)
  {
    fieldE02LNEOPY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02LNEOPY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02LNEOPY()
  {
    return fieldE02LNEOPY.getBigDecimal();
  }

  /**
  * Set field E02LNECRP using a String value.
  */
  public void setE02LNECRP(String newvalue)
  {
    fieldE02LNECRP.setString(newvalue);
  }

  /**
  * Get value of field E02LNECRP as a String.
  */
  public String getE02LNECRP()
  {
    return fieldE02LNECRP.getString();
  }

  /**
  * Set field E02CUSNA1 using a String value.
  */
  public void setE02CUSNA1(String newvalue)
  {
    fieldE02CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field E02CUSNA1 as a String.
  */
  public String getE02CUSNA1()
  {
    return fieldE02CUSNA1.getString();
  }

  /**
  * Set field E02LNEMTM using a String value.
  */
  public void setE02LNEMTM(String newvalue)
  {
    fieldE02LNEMTM.setString(newvalue);
  }

  /**
  * Get value of field E02LNEMTM as a String.
  */
  public String getE02LNEMTM()
  {
    return fieldE02LNEMTM.getString();
  }

  /**
  * Set numeric field E02LNEMTM using a BigDecimal value.
  */
  public void setE02LNEMTM(BigDecimal newvalue)
  {
    fieldE02LNEMTM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02LNEMTM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02LNEMTM()
  {
    return fieldE02LNEMTM.getBigDecimal();
  }

  /**
  * Set field E02LNEMTD using a String value.
  */
  public void setE02LNEMTD(String newvalue)
  {
    fieldE02LNEMTD.setString(newvalue);
  }

  /**
  * Get value of field E02LNEMTD as a String.
  */
  public String getE02LNEMTD()
  {
    return fieldE02LNEMTD.getString();
  }

  /**
  * Set numeric field E02LNEMTD using a BigDecimal value.
  */
  public void setE02LNEMTD(BigDecimal newvalue)
  {
    fieldE02LNEMTD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02LNEMTD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02LNEMTD()
  {
    return fieldE02LNEMTD.getBigDecimal();
  }

  /**
  * Set field E02LNEMTY using a String value.
  */
  public void setE02LNEMTY(String newvalue)
  {
    fieldE02LNEMTY.setString(newvalue);
  }

  /**
  * Get value of field E02LNEMTY as a String.
  */
  public String getE02LNEMTY()
  {
    return fieldE02LNEMTY.getString();
  }

  /**
  * Set numeric field E02LNEMTY using a BigDecimal value.
  */
  public void setE02LNEMTY(BigDecimal newvalue)
  {
    fieldE02LNEMTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02LNEMTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02LNEMTY()
  {
    return fieldE02LNEMTY.getBigDecimal();
  }

  /**
  * Set field E02LNRETM using a String value.
  */
  public void setE02LNRETM(String newvalue)
  {
    fieldE02LNRETM.setString(newvalue);
  }

  /**
  * Get value of field E02LNRETM as a String.
  */
  public String getE02LNRETM()
  {
    return fieldE02LNRETM.getString();
  }

  /**
  * Set numeric field E02LNRETM using a BigDecimal value.
  */
  public void setE02LNRETM(BigDecimal newvalue)
  {
    fieldE02LNRETM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02LNRETM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02LNRETM()
  {
    return fieldE02LNRETM.getBigDecimal();
  }

  /**
  * Set field E02LNERED using a String value.
  */
  public void setE02LNERED(String newvalue)
  {
    fieldE02LNERED.setString(newvalue);
  }

  /**
  * Get value of field E02LNERED as a String.
  */
  public String getE02LNERED()
  {
    return fieldE02LNERED.getString();
  }

  /**
  * Set numeric field E02LNERED using a BigDecimal value.
  */
  public void setE02LNERED(BigDecimal newvalue)
  {
    fieldE02LNERED.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02LNERED as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02LNERED()
  {
    return fieldE02LNERED.getBigDecimal();
  }

  /**
  * Set field E02LNEREY using a String value.
  */
  public void setE02LNEREY(String newvalue)
  {
    fieldE02LNEREY.setString(newvalue);
  }

  /**
  * Get value of field E02LNEREY as a String.
  */
  public String getE02LNEREY()
  {
    return fieldE02LNEREY.getString();
  }

  /**
  * Set numeric field E02LNEREY using a BigDecimal value.
  */
  public void setE02LNEREY(BigDecimal newvalue)
  {
    fieldE02LNEREY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02LNEREY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02LNEREY()
  {
    return fieldE02LNEREY.getBigDecimal();
  }

  /**
  * Set field E02LNECCY using a String value.
  */
  public void setE02LNECCY(String newvalue)
  {
    fieldE02LNECCY.setString(newvalue);
  }

  /**
  * Get value of field E02LNECCY as a String.
  */
  public String getE02LNECCY()
  {
    return fieldE02LNECCY.getString();
  }

  /**
  * Set field E02LNEAMN using a String value.
  */
  public void setE02LNEAMN(String newvalue)
  {
    fieldE02LNEAMN.setString(newvalue);
  }

  /**
  * Get value of field E02LNEAMN as a String.
  */
  public String getE02LNEAMN()
  {
    return fieldE02LNEAMN.getString();
  }

  /**
  * Set numeric field E02LNEAMN using a BigDecimal value.
  */
  public void setE02LNEAMN(BigDecimal newvalue)
  {
    fieldE02LNEAMN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02LNEAMN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02LNEAMN()
  {
    return fieldE02LNEAMN.getBigDecimal();
  }

  /**
  * Set field E02AVAILA using a String value.
  */
  public void setE02AVAILA(String newvalue)
  {
    fieldE02AVAILA.setString(newvalue);
  }

  /**
  * Get value of field E02AVAILA as a String.
  */
  public String getE02AVAILA()
  {
    return fieldE02AVAILA.getString();
  }

  /**
  * Set numeric field E02AVAILA using a BigDecimal value.
  */
  public void setE02AVAILA(BigDecimal newvalue)
  {
    fieldE02AVAILA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02AVAILA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02AVAILA()
  {
    return fieldE02AVAILA.getBigDecimal();
  }

  /**
  * Set field E02USEAMT using a String value.
  */
  public void setE02USEAMT(String newvalue)
  {
    fieldE02USEAMT.setString(newvalue);
  }

  /**
  * Get value of field E02USEAMT as a String.
  */
  public String getE02USEAMT()
  {
    return fieldE02USEAMT.getString();
  }

  /**
  * Set numeric field E02USEAMT using a BigDecimal value.
  */
  public void setE02USEAMT(BigDecimal newvalue)
  {
    fieldE02USEAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02USEAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02USEAMT()
  {
    return fieldE02USEAMT.getBigDecimal();
  }

  /**
  * Set field E02LNEREA using a String value.
  */
  public void setE02LNEREA(String newvalue)
  {
    fieldE02LNEREA.setString(newvalue);
  }

  /**
  * Get value of field E02LNEREA as a String.
  */
  public String getE02LNEREA()
  {
    return fieldE02LNEREA.getString();
  }

  /**
  * Set numeric field E02LNEREA using a BigDecimal value.
  */
  public void setE02LNEREA(BigDecimal newvalue)
  {
    fieldE02LNEREA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02LNEREA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02LNEREA()
  {
    return fieldE02LNEREA.getBigDecimal();
  }

  /**
  * Set field E02LNETMA using a String value.
  */
  public void setE02LNETMA(String newvalue)
  {
    fieldE02LNETMA.setString(newvalue);
  }

  /**
  * Get value of field E02LNETMA as a String.
  */
  public String getE02LNETMA()
  {
    return fieldE02LNETMA.getString();
  }

  /**
  * Set numeric field E02LNETMA using a BigDecimal value.
  */
  public void setE02LNETMA(BigDecimal newvalue)
  {
    fieldE02LNETMA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02LNETMA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02LNETMA()
  {
    return fieldE02LNETMA.getBigDecimal();
  }

  /**
  * Set field E02LNECAT using a String value.
  */
  public void setE02LNECAT(String newvalue)
  {
    fieldE02LNECAT.setString(newvalue);
  }

  /**
  * Get value of field E02LNECAT as a String.
  */
  public String getE02LNECAT()
  {
    return fieldE02LNECAT.getString();
  }

  /**
  * Set field E02LNEOFA using a String value.
  */
  public void setE02LNEOFA(String newvalue)
  {
    fieldE02LNEOFA.setString(newvalue);
  }

  /**
  * Get value of field E02LNEOFA as a String.
  */
  public String getE02LNEOFA()
  {
    return fieldE02LNEOFA.getString();
  }

  /**
  * Set numeric field E02LNEOFA using a BigDecimal value.
  */
  public void setE02LNEOFA(BigDecimal newvalue)
  {
    fieldE02LNEOFA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02LNEOFA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02LNEOFA()
  {
    return fieldE02LNEOFA.getBigDecimal();
  }

}
