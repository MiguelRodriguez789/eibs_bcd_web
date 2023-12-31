package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EPV015501 physical file definition.
* 
* File level identifier is 1150930093324.
* Record format level identifier is 3222E3319B535.
*/

public class EPV015501Message extends MessageRecord
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
                                     "E01DEAACC",
                                     "E01DEAACD",
                                     "E01DEAPRO",
                                     "E01DEACUN",
                                     "E01CUSNA1",
                                     "E01DEABNK",
                                     "E01DEABRN",
                                     "E01DEACCY",
                                     "E01DEAGLN",
                                     "E01DEACCN",
                                     "E01DEATYP",
                                     "E01DEAOAM",
                                     "E01DEARTE",
                                     "E01DEAFRT",
                                     "E01DEABAS",
                                     "E01DEAICT",
                                     "E01DEASPR",
                                     "E01DEAIFL",
                                     "E01DEAPCL",
                                     "E01DEA2TC",
                                     "E01DEAODM",
                                     "E01DEAODD",
                                     "E01DEAODY",
                                     "E01DEAMAM",
                                     "E01DEAMAD",
                                     "E01DEAMAY",
                                     "E01LSTCLM",
                                     "E01LSTCLD",
                                     "E01LSTCLY"
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
                                   "E01DEAACC",
                                   "E01DEAACD",
                                   "E01DEAPRO",
                                   "E01DEACUN",
                                   "E01CUSNA1",
                                   "E01DEABNK",
                                   "E01DEABRN",
                                   "E01DEACCY",
                                   "E01DEAGLN",
                                   "E01DEACCN",
                                   "E01DEATYP",
                                   "E01DEAOAM",
                                   "E01DEARTE",
                                   "E01DEAFRT",
                                   "E01DEABAS",
                                   "E01DEAICT",
                                   "E01DEASPR",
                                   "E01DEAIFL",
                                   "E01DEAPCL",
                                   "E01DEA2TC",
                                   "E01DEAODM",
                                   "E01DEAODD",
                                   "E01DEAODY",
                                   "E01DEAMAM",
                                   "E01DEAMAD",
                                   "E01DEAMAY",
                                   "E01LSTCLM",
                                   "E01LSTCLD",
                                   "E01LSTCLY"
                                 };
  final static String fid = "1150930093324";
  final static String rid = "3222E3319B535";
  final static String fmtname = "EPV015501";
  final int FIELDCOUNT = 38;
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
  private DecimalField fieldE01DEAACC = null;
  private CharacterField fieldE01DEAACD = null;
  private CharacterField fieldE01DEAPRO = null;
  private DecimalField fieldE01DEACUN = null;
  private CharacterField fieldE01CUSNA1 = null;
  private CharacterField fieldE01DEABNK = null;
  private DecimalField fieldE01DEABRN = null;
  private CharacterField fieldE01DEACCY = null;
  private DecimalField fieldE01DEAGLN = null;
  private DecimalField fieldE01DEACCN = null;
  private CharacterField fieldE01DEATYP = null;
  private DecimalField fieldE01DEAOAM = null;
  private DecimalField fieldE01DEARTE = null;
  private DecimalField fieldE01DEAFRT = null;
  private DecimalField fieldE01DEABAS = null;
  private CharacterField fieldE01DEAICT = null;
  private DecimalField fieldE01DEASPR = null;
  private CharacterField fieldE01DEAIFL = null;
  private CharacterField fieldE01DEAPCL = null;
  private CharacterField fieldE01DEA2TC = null;
  private DecimalField fieldE01DEAODM = null;
  private DecimalField fieldE01DEAODD = null;
  private DecimalField fieldE01DEAODY = null;
  private DecimalField fieldE01DEAMAM = null;
  private DecimalField fieldE01DEAMAD = null;
  private DecimalField fieldE01DEAMAY = null;
  private DecimalField fieldE01LSTCLM = null;
  private DecimalField fieldE01LSTCLD = null;
  private DecimalField fieldE01LSTCLY = null;

  /**
  * Constructor for EPV015501Message.
  */
  public EPV015501Message()
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
    recordsize = 262;
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
    fields[9] = fieldE01DEAACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E01DEAACC");
    fields[10] = fieldE01DEAACD =
    new CharacterField(message, HEADERSIZE + 55, 2, "E01DEAACD");
    fields[11] = fieldE01DEAPRO =
    new CharacterField(message, HEADERSIZE + 57, 4, "E01DEAPRO");
    fields[12] = fieldE01DEACUN =
    new DecimalField(message, HEADERSIZE + 61, 10, 0, "E01DEACUN");
    fields[13] = fieldE01CUSNA1 =
    new CharacterField(message, HEADERSIZE + 71, 60, "E01CUSNA1");
    fields[14] = fieldE01DEABNK =
    new CharacterField(message, HEADERSIZE + 131, 2, "E01DEABNK");
    fields[15] = fieldE01DEABRN =
    new DecimalField(message, HEADERSIZE + 133, 5, 0, "E01DEABRN");
    fields[16] = fieldE01DEACCY =
    new CharacterField(message, HEADERSIZE + 138, 3, "E01DEACCY");
    fields[17] = fieldE01DEAGLN =
    new DecimalField(message, HEADERSIZE + 141, 17, 0, "E01DEAGLN");
    fields[18] = fieldE01DEACCN =
    new DecimalField(message, HEADERSIZE + 158, 9, 0, "E01DEACCN");
    fields[19] = fieldE01DEATYP =
    new CharacterField(message, HEADERSIZE + 167, 4, "E01DEATYP");
    fields[20] = fieldE01DEAOAM =
    new DecimalField(message, HEADERSIZE + 171, 17, 2, "E01DEAOAM");
    fields[21] = fieldE01DEARTE =
    new DecimalField(message, HEADERSIZE + 188, 11, 6, "E01DEARTE");
    fields[22] = fieldE01DEAFRT =
    new DecimalField(message, HEADERSIZE + 199, 11, 6, "E01DEAFRT");
    fields[23] = fieldE01DEABAS =
    new DecimalField(message, HEADERSIZE + 210, 4, 0, "E01DEABAS");
    fields[24] = fieldE01DEAICT =
    new CharacterField(message, HEADERSIZE + 214, 1, "E01DEAICT");
    fields[25] = fieldE01DEASPR =
    new DecimalField(message, HEADERSIZE + 215, 11, 6, "E01DEASPR");
    fields[26] = fieldE01DEAIFL =
    new CharacterField(message, HEADERSIZE + 226, 1, "E01DEAIFL");
    fields[27] = fieldE01DEAPCL =
    new CharacterField(message, HEADERSIZE + 227, 1, "E01DEAPCL");
    fields[28] = fieldE01DEA2TC =
    new CharacterField(message, HEADERSIZE + 228, 1, "E01DEA2TC");
    fields[29] = fieldE01DEAODM =
    new DecimalField(message, HEADERSIZE + 229, 3, 0, "E01DEAODM");
    fields[30] = fieldE01DEAODD =
    new DecimalField(message, HEADERSIZE + 232, 3, 0, "E01DEAODD");
    fields[31] = fieldE01DEAODY =
    new DecimalField(message, HEADERSIZE + 235, 5, 0, "E01DEAODY");
    fields[32] = fieldE01DEAMAM =
    new DecimalField(message, HEADERSIZE + 240, 3, 0, "E01DEAMAM");
    fields[33] = fieldE01DEAMAD =
    new DecimalField(message, HEADERSIZE + 243, 3, 0, "E01DEAMAD");
    fields[34] = fieldE01DEAMAY =
    new DecimalField(message, HEADERSIZE + 246, 5, 0, "E01DEAMAY");
    fields[35] = fieldE01LSTCLM =
    new DecimalField(message, HEADERSIZE + 251, 3, 0, "E01LSTCLM");
    fields[36] = fieldE01LSTCLD =
    new DecimalField(message, HEADERSIZE + 254, 3, 0, "E01LSTCLD");
    fields[37] = fieldE01LSTCLY =
    new DecimalField(message, HEADERSIZE + 257, 5, 0, "E01LSTCLY");

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
  * Set field E01DEAACC using a String value.
  */
  public void setE01DEAACC(String newvalue)
  {
    fieldE01DEAACC.setString(newvalue);
  }

  /**
  * Get value of field E01DEAACC as a String.
  */
  public String getE01DEAACC()
  {
    return fieldE01DEAACC.getString();
  }

  /**
  * Set numeric field E01DEAACC using a BigDecimal value.
  */
  public void setE01DEAACC(BigDecimal newvalue)
  {
    fieldE01DEAACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAACC()
  {
    return fieldE01DEAACC.getBigDecimal();
  }

  /**
  * Set field E01DEAACD using a String value.
  */
  public void setE01DEAACD(String newvalue)
  {
    fieldE01DEAACD.setString(newvalue);
  }

  /**
  * Get value of field E01DEAACD as a String.
  */
  public String getE01DEAACD()
  {
    return fieldE01DEAACD.getString();
  }

  /**
  * Set field E01DEAPRO using a String value.
  */
  public void setE01DEAPRO(String newvalue)
  {
    fieldE01DEAPRO.setString(newvalue);
  }

  /**
  * Get value of field E01DEAPRO as a String.
  */
  public String getE01DEAPRO()
  {
    return fieldE01DEAPRO.getString();
  }

  /**
  * Set field E01DEACUN using a String value.
  */
  public void setE01DEACUN(String newvalue)
  {
    fieldE01DEACUN.setString(newvalue);
  }

  /**
  * Get value of field E01DEACUN as a String.
  */
  public String getE01DEACUN()
  {
    return fieldE01DEACUN.getString();
  }

  /**
  * Set numeric field E01DEACUN using a BigDecimal value.
  */
  public void setE01DEACUN(BigDecimal newvalue)
  {
    fieldE01DEACUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEACUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEACUN()
  {
    return fieldE01DEACUN.getBigDecimal();
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
  * Set field E01DEABNK using a String value.
  */
  public void setE01DEABNK(String newvalue)
  {
    fieldE01DEABNK.setString(newvalue);
  }

  /**
  * Get value of field E01DEABNK as a String.
  */
  public String getE01DEABNK()
  {
    return fieldE01DEABNK.getString();
  }

  /**
  * Set field E01DEABRN using a String value.
  */
  public void setE01DEABRN(String newvalue)
  {
    fieldE01DEABRN.setString(newvalue);
  }

  /**
  * Get value of field E01DEABRN as a String.
  */
  public String getE01DEABRN()
  {
    return fieldE01DEABRN.getString();
  }

  /**
  * Set numeric field E01DEABRN using a BigDecimal value.
  */
  public void setE01DEABRN(BigDecimal newvalue)
  {
    fieldE01DEABRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEABRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEABRN()
  {
    return fieldE01DEABRN.getBigDecimal();
  }

  /**
  * Set field E01DEACCY using a String value.
  */
  public void setE01DEACCY(String newvalue)
  {
    fieldE01DEACCY.setString(newvalue);
  }

  /**
  * Get value of field E01DEACCY as a String.
  */
  public String getE01DEACCY()
  {
    return fieldE01DEACCY.getString();
  }

  /**
  * Set field E01DEAGLN using a String value.
  */
  public void setE01DEAGLN(String newvalue)
  {
    fieldE01DEAGLN.setString(newvalue);
  }

  /**
  * Get value of field E01DEAGLN as a String.
  */
  public String getE01DEAGLN()
  {
    return fieldE01DEAGLN.getString();
  }

  /**
  * Set numeric field E01DEAGLN using a BigDecimal value.
  */
  public void setE01DEAGLN(BigDecimal newvalue)
  {
    fieldE01DEAGLN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAGLN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAGLN()
  {
    return fieldE01DEAGLN.getBigDecimal();
  }

  /**
  * Set field E01DEACCN using a String value.
  */
  public void setE01DEACCN(String newvalue)
  {
    fieldE01DEACCN.setString(newvalue);
  }

  /**
  * Get value of field E01DEACCN as a String.
  */
  public String getE01DEACCN()
  {
    return fieldE01DEACCN.getString();
  }

  /**
  * Set numeric field E01DEACCN using a BigDecimal value.
  */
  public void setE01DEACCN(BigDecimal newvalue)
  {
    fieldE01DEACCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEACCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEACCN()
  {
    return fieldE01DEACCN.getBigDecimal();
  }

  /**
  * Set field E01DEATYP using a String value.
  */
  public void setE01DEATYP(String newvalue)
  {
    fieldE01DEATYP.setString(newvalue);
  }

  /**
  * Get value of field E01DEATYP as a String.
  */
  public String getE01DEATYP()
  {
    return fieldE01DEATYP.getString();
  }

  /**
  * Set field E01DEAOAM using a String value.
  */
  public void setE01DEAOAM(String newvalue)
  {
    fieldE01DEAOAM.setString(newvalue);
  }

  /**
  * Get value of field E01DEAOAM as a String.
  */
  public String getE01DEAOAM()
  {
    return fieldE01DEAOAM.getString();
  }

  /**
  * Set numeric field E01DEAOAM using a BigDecimal value.
  */
  public void setE01DEAOAM(BigDecimal newvalue)
  {
    fieldE01DEAOAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAOAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAOAM()
  {
    return fieldE01DEAOAM.getBigDecimal();
  }

  /**
  * Set field E01DEARTE using a String value.
  */
  public void setE01DEARTE(String newvalue)
  {
    fieldE01DEARTE.setString(newvalue);
  }

  /**
  * Get value of field E01DEARTE as a String.
  */
  public String getE01DEARTE()
  {
    return fieldE01DEARTE.getString();
  }

  /**
  * Set numeric field E01DEARTE using a BigDecimal value.
  */
  public void setE01DEARTE(BigDecimal newvalue)
  {
    fieldE01DEARTE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEARTE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEARTE()
  {
    return fieldE01DEARTE.getBigDecimal();
  }

  /**
  * Set field E01DEAFRT using a String value.
  */
  public void setE01DEAFRT(String newvalue)
  {
    fieldE01DEAFRT.setString(newvalue);
  }

  /**
  * Get value of field E01DEAFRT as a String.
  */
  public String getE01DEAFRT()
  {
    return fieldE01DEAFRT.getString();
  }

  /**
  * Set numeric field E01DEAFRT using a BigDecimal value.
  */
  public void setE01DEAFRT(BigDecimal newvalue)
  {
    fieldE01DEAFRT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAFRT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAFRT()
  {
    return fieldE01DEAFRT.getBigDecimal();
  }

  /**
  * Set field E01DEABAS using a String value.
  */
  public void setE01DEABAS(String newvalue)
  {
    fieldE01DEABAS.setString(newvalue);
  }

  /**
  * Get value of field E01DEABAS as a String.
  */
  public String getE01DEABAS()
  {
    return fieldE01DEABAS.getString();
  }

  /**
  * Set numeric field E01DEABAS using a BigDecimal value.
  */
  public void setE01DEABAS(BigDecimal newvalue)
  {
    fieldE01DEABAS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEABAS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEABAS()
  {
    return fieldE01DEABAS.getBigDecimal();
  }

  /**
  * Set field E01DEAICT using a String value.
  */
  public void setE01DEAICT(String newvalue)
  {
    fieldE01DEAICT.setString(newvalue);
  }

  /**
  * Get value of field E01DEAICT as a String.
  */
  public String getE01DEAICT()
  {
    return fieldE01DEAICT.getString();
  }

  /**
  * Set field E01DEASPR using a String value.
  */
  public void setE01DEASPR(String newvalue)
  {
    fieldE01DEASPR.setString(newvalue);
  }

  /**
  * Get value of field E01DEASPR as a String.
  */
  public String getE01DEASPR()
  {
    return fieldE01DEASPR.getString();
  }

  /**
  * Set numeric field E01DEASPR using a BigDecimal value.
  */
  public void setE01DEASPR(BigDecimal newvalue)
  {
    fieldE01DEASPR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEASPR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEASPR()
  {
    return fieldE01DEASPR.getBigDecimal();
  }

  /**
  * Set field E01DEAIFL using a String value.
  */
  public void setE01DEAIFL(String newvalue)
  {
    fieldE01DEAIFL.setString(newvalue);
  }

  /**
  * Get value of field E01DEAIFL as a String.
  */
  public String getE01DEAIFL()
  {
    return fieldE01DEAIFL.getString();
  }

  /**
  * Set field E01DEAPCL using a String value.
  */
  public void setE01DEAPCL(String newvalue)
  {
    fieldE01DEAPCL.setString(newvalue);
  }

  /**
  * Get value of field E01DEAPCL as a String.
  */
  public String getE01DEAPCL()
  {
    return fieldE01DEAPCL.getString();
  }

  /**
  * Set field E01DEA2TC using a String value.
  */
  public void setE01DEA2TC(String newvalue)
  {
    fieldE01DEA2TC.setString(newvalue);
  }

  /**
  * Get value of field E01DEA2TC as a String.
  */
  public String getE01DEA2TC()
  {
    return fieldE01DEA2TC.getString();
  }

  /**
  * Set field E01DEAODM using a String value.
  */
  public void setE01DEAODM(String newvalue)
  {
    fieldE01DEAODM.setString(newvalue);
  }

  /**
  * Get value of field E01DEAODM as a String.
  */
  public String getE01DEAODM()
  {
    return fieldE01DEAODM.getString();
  }

  /**
  * Set numeric field E01DEAODM using a BigDecimal value.
  */
  public void setE01DEAODM(BigDecimal newvalue)
  {
    fieldE01DEAODM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAODM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAODM()
  {
    return fieldE01DEAODM.getBigDecimal();
  }

  /**
  * Set field E01DEAODD using a String value.
  */
  public void setE01DEAODD(String newvalue)
  {
    fieldE01DEAODD.setString(newvalue);
  }

  /**
  * Get value of field E01DEAODD as a String.
  */
  public String getE01DEAODD()
  {
    return fieldE01DEAODD.getString();
  }

  /**
  * Set numeric field E01DEAODD using a BigDecimal value.
  */
  public void setE01DEAODD(BigDecimal newvalue)
  {
    fieldE01DEAODD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAODD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAODD()
  {
    return fieldE01DEAODD.getBigDecimal();
  }

  /**
  * Set field E01DEAODY using a String value.
  */
  public void setE01DEAODY(String newvalue)
  {
    fieldE01DEAODY.setString(newvalue);
  }

  /**
  * Get value of field E01DEAODY as a String.
  */
  public String getE01DEAODY()
  {
    return fieldE01DEAODY.getString();
  }

  /**
  * Set numeric field E01DEAODY using a BigDecimal value.
  */
  public void setE01DEAODY(BigDecimal newvalue)
  {
    fieldE01DEAODY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAODY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAODY()
  {
    return fieldE01DEAODY.getBigDecimal();
  }

  /**
  * Set field E01DEAMAM using a String value.
  */
  public void setE01DEAMAM(String newvalue)
  {
    fieldE01DEAMAM.setString(newvalue);
  }

  /**
  * Get value of field E01DEAMAM as a String.
  */
  public String getE01DEAMAM()
  {
    return fieldE01DEAMAM.getString();
  }

  /**
  * Set numeric field E01DEAMAM using a BigDecimal value.
  */
  public void setE01DEAMAM(BigDecimal newvalue)
  {
    fieldE01DEAMAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAMAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAMAM()
  {
    return fieldE01DEAMAM.getBigDecimal();
  }

  /**
  * Set field E01DEAMAD using a String value.
  */
  public void setE01DEAMAD(String newvalue)
  {
    fieldE01DEAMAD.setString(newvalue);
  }

  /**
  * Get value of field E01DEAMAD as a String.
  */
  public String getE01DEAMAD()
  {
    return fieldE01DEAMAD.getString();
  }

  /**
  * Set numeric field E01DEAMAD using a BigDecimal value.
  */
  public void setE01DEAMAD(BigDecimal newvalue)
  {
    fieldE01DEAMAD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAMAD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAMAD()
  {
    return fieldE01DEAMAD.getBigDecimal();
  }

  /**
  * Set field E01DEAMAY using a String value.
  */
  public void setE01DEAMAY(String newvalue)
  {
    fieldE01DEAMAY.setString(newvalue);
  }

  /**
  * Get value of field E01DEAMAY as a String.
  */
  public String getE01DEAMAY()
  {
    return fieldE01DEAMAY.getString();
  }

  /**
  * Set numeric field E01DEAMAY using a BigDecimal value.
  */
  public void setE01DEAMAY(BigDecimal newvalue)
  {
    fieldE01DEAMAY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAMAY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAMAY()
  {
    return fieldE01DEAMAY.getBigDecimal();
  }

  /**
  * Set field E01LSTCLM using a String value.
  */
  public void setE01LSTCLM(String newvalue)
  {
    fieldE01LSTCLM.setString(newvalue);
  }

  /**
  * Get value of field E01LSTCLM as a String.
  */
  public String getE01LSTCLM()
  {
    return fieldE01LSTCLM.getString();
  }

  /**
  * Set numeric field E01LSTCLM using a BigDecimal value.
  */
  public void setE01LSTCLM(BigDecimal newvalue)
  {
    fieldE01LSTCLM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LSTCLM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LSTCLM()
  {
    return fieldE01LSTCLM.getBigDecimal();
  }

  /**
  * Set field E01LSTCLD using a String value.
  */
  public void setE01LSTCLD(String newvalue)
  {
    fieldE01LSTCLD.setString(newvalue);
  }

  /**
  * Get value of field E01LSTCLD as a String.
  */
  public String getE01LSTCLD()
  {
    return fieldE01LSTCLD.getString();
  }

  /**
  * Set numeric field E01LSTCLD using a BigDecimal value.
  */
  public void setE01LSTCLD(BigDecimal newvalue)
  {
    fieldE01LSTCLD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LSTCLD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LSTCLD()
  {
    return fieldE01LSTCLD.getBigDecimal();
  }

  /**
  * Set field E01LSTCLY using a String value.
  */
  public void setE01LSTCLY(String newvalue)
  {
    fieldE01LSTCLY.setString(newvalue);
  }

  /**
  * Get value of field E01LSTCLY as a String.
  */
  public String getE01LSTCLY()
  {
    return fieldE01LSTCLY.getString();
  }

  /**
  * Set numeric field E01LSTCLY using a BigDecimal value.
  */
  public void setE01LSTCLY(BigDecimal newvalue)
  {
    fieldE01LSTCLY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LSTCLY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LSTCLY()
  {
    return fieldE01LSTCLY.getBigDecimal();
  }

}
