package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL081201 physical file definition.
* 
* File level identifier is 1170221140732.
* Record format level identifier is 3DCB48697D3F3.
*/

public class EDL081201Message extends MessageRecord
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
                                     "E01DEAPRI",
                                     "E01DEARTE",
                                     "E01MORRTE",
                                     "E01DEABAS",
                                     "E01DEAICT",
                                     "E01OPENDM",
                                     "E01OPENDD",
                                     "E01OPENDY",
                                     "E01MATURM",
                                     "E01MATURD",
                                     "E01MATURY",
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
                                   "E01DEAPRI",
                                   "E01DEARTE",
                                   "E01MORRTE",
                                   "E01DEABAS",
                                   "E01DEAICT",
                                   "E01OPENDM",
                                   "E01OPENDD",
                                   "E01OPENDY",
                                   "E01MATURM",
                                   "E01MATURD",
                                   "E01MATURY",
                                   "E01LSTCLM",
                                   "E01LSTCLD",
                                   "E01LSTCLY"
                                 };
  final static String fid = "1170221140732";
  final static String rid = "3DCB48697D3F3";
  final static String fmtname = "EDL081201";
  final int FIELDCOUNT = 35;
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
  private DecimalField fieldE01DEAPRI = null;
  private DecimalField fieldE01DEARTE = null;
  private DecimalField fieldE01MORRTE = null;
  private DecimalField fieldE01DEABAS = null;
  private CharacterField fieldE01DEAICT = null;
  private DecimalField fieldE01OPENDM = null;
  private DecimalField fieldE01OPENDD = null;
  private DecimalField fieldE01OPENDY = null;
  private DecimalField fieldE01MATURM = null;
  private DecimalField fieldE01MATURD = null;
  private DecimalField fieldE01MATURY = null;
  private DecimalField fieldE01LSTCLM = null;
  private DecimalField fieldE01LSTCLD = null;
  private DecimalField fieldE01LSTCLY = null;

  /**
  * Constructor for EDL081201Message.
  */
  public EDL081201Message()
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
    recordsize = 265;
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
    fields[21] = fieldE01DEAPRI =
    new DecimalField(message, HEADERSIZE + 188, 17, 2, "E01DEAPRI");
    fields[22] = fieldE01DEARTE =
    new DecimalField(message, HEADERSIZE + 205, 11, 6, "E01DEARTE");
    fields[23] = fieldE01MORRTE =
    new DecimalField(message, HEADERSIZE + 216, 11, 6, "E01MORRTE");
    fields[24] = fieldE01DEABAS =
    new DecimalField(message, HEADERSIZE + 227, 4, 0, "E01DEABAS");
    fields[25] = fieldE01DEAICT =
    new CharacterField(message, HEADERSIZE + 231, 1, "E01DEAICT");
    fields[26] = fieldE01OPENDM =
    new DecimalField(message, HEADERSIZE + 232, 3, 0, "E01OPENDM");
    fields[27] = fieldE01OPENDD =
    new DecimalField(message, HEADERSIZE + 235, 3, 0, "E01OPENDD");
    fields[28] = fieldE01OPENDY =
    new DecimalField(message, HEADERSIZE + 238, 5, 0, "E01OPENDY");
    fields[29] = fieldE01MATURM =
    new DecimalField(message, HEADERSIZE + 243, 3, 0, "E01MATURM");
    fields[30] = fieldE01MATURD =
    new DecimalField(message, HEADERSIZE + 246, 3, 0, "E01MATURD");
    fields[31] = fieldE01MATURY =
    new DecimalField(message, HEADERSIZE + 249, 5, 0, "E01MATURY");
    fields[32] = fieldE01LSTCLM =
    new DecimalField(message, HEADERSIZE + 254, 3, 0, "E01LSTCLM");
    fields[33] = fieldE01LSTCLD =
    new DecimalField(message, HEADERSIZE + 257, 3, 0, "E01LSTCLD");
    fields[34] = fieldE01LSTCLY =
    new DecimalField(message, HEADERSIZE + 260, 5, 0, "E01LSTCLY");

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
  * Set field E01DEAPRI using a String value.
  */
  public void setE01DEAPRI(String newvalue)
  {
    fieldE01DEAPRI.setString(newvalue);
  }

  /**
  * Get value of field E01DEAPRI as a String.
  */
  public String getE01DEAPRI()
  {
    return fieldE01DEAPRI.getString();
  }

  /**
  * Set numeric field E01DEAPRI using a BigDecimal value.
  */
  public void setE01DEAPRI(BigDecimal newvalue)
  {
    fieldE01DEAPRI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEAPRI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEAPRI()
  {
    return fieldE01DEAPRI.getBigDecimal();
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
  * Set field E01MORRTE using a String value.
  */
  public void setE01MORRTE(String newvalue)
  {
    fieldE01MORRTE.setString(newvalue);
  }

  /**
  * Get value of field E01MORRTE as a String.
  */
  public String getE01MORRTE()
  {
    return fieldE01MORRTE.getString();
  }

  /**
  * Set numeric field E01MORRTE using a BigDecimal value.
  */
  public void setE01MORRTE(BigDecimal newvalue)
  {
    fieldE01MORRTE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MORRTE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MORRTE()
  {
    return fieldE01MORRTE.getBigDecimal();
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
  * Set field E01OPENDM using a String value.
  */
  public void setE01OPENDM(String newvalue)
  {
    fieldE01OPENDM.setString(newvalue);
  }

  /**
  * Get value of field E01OPENDM as a String.
  */
  public String getE01OPENDM()
  {
    return fieldE01OPENDM.getString();
  }

  /**
  * Set numeric field E01OPENDM using a BigDecimal value.
  */
  public void setE01OPENDM(BigDecimal newvalue)
  {
    fieldE01OPENDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01OPENDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01OPENDM()
  {
    return fieldE01OPENDM.getBigDecimal();
  }

  /**
  * Set field E01OPENDD using a String value.
  */
  public void setE01OPENDD(String newvalue)
  {
    fieldE01OPENDD.setString(newvalue);
  }

  /**
  * Get value of field E01OPENDD as a String.
  */
  public String getE01OPENDD()
  {
    return fieldE01OPENDD.getString();
  }

  /**
  * Set numeric field E01OPENDD using a BigDecimal value.
  */
  public void setE01OPENDD(BigDecimal newvalue)
  {
    fieldE01OPENDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01OPENDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01OPENDD()
  {
    return fieldE01OPENDD.getBigDecimal();
  }

  /**
  * Set field E01OPENDY using a String value.
  */
  public void setE01OPENDY(String newvalue)
  {
    fieldE01OPENDY.setString(newvalue);
  }

  /**
  * Get value of field E01OPENDY as a String.
  */
  public String getE01OPENDY()
  {
    return fieldE01OPENDY.getString();
  }

  /**
  * Set numeric field E01OPENDY using a BigDecimal value.
  */
  public void setE01OPENDY(BigDecimal newvalue)
  {
    fieldE01OPENDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01OPENDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01OPENDY()
  {
    return fieldE01OPENDY.getBigDecimal();
  }

  /**
  * Set field E01MATURM using a String value.
  */
  public void setE01MATURM(String newvalue)
  {
    fieldE01MATURM.setString(newvalue);
  }

  /**
  * Get value of field E01MATURM as a String.
  */
  public String getE01MATURM()
  {
    return fieldE01MATURM.getString();
  }

  /**
  * Set numeric field E01MATURM using a BigDecimal value.
  */
  public void setE01MATURM(BigDecimal newvalue)
  {
    fieldE01MATURM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MATURM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MATURM()
  {
    return fieldE01MATURM.getBigDecimal();
  }

  /**
  * Set field E01MATURD using a String value.
  */
  public void setE01MATURD(String newvalue)
  {
    fieldE01MATURD.setString(newvalue);
  }

  /**
  * Get value of field E01MATURD as a String.
  */
  public String getE01MATURD()
  {
    return fieldE01MATURD.getString();
  }

  /**
  * Set numeric field E01MATURD using a BigDecimal value.
  */
  public void setE01MATURD(BigDecimal newvalue)
  {
    fieldE01MATURD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MATURD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MATURD()
  {
    return fieldE01MATURD.getBigDecimal();
  }

  /**
  * Set field E01MATURY using a String value.
  */
  public void setE01MATURY(String newvalue)
  {
    fieldE01MATURY.setString(newvalue);
  }

  /**
  * Get value of field E01MATURY as a String.
  */
  public String getE01MATURY()
  {
    return fieldE01MATURY.getString();
  }

  /**
  * Set numeric field E01MATURY using a BigDecimal value.
  */
  public void setE01MATURY(BigDecimal newvalue)
  {
    fieldE01MATURY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MATURY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MATURY()
  {
    return fieldE01MATURY.getBigDecimal();
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
