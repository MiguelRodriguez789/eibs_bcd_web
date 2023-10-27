package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESO001001 physical file definition.
* 
* File level identifier is 1170224120420.
* Record format level identifier is 3ED6308C05EC9.
*/

public class ESO001001Message extends MessageRecord
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
                                     "E01SELUSR",
                                     "E01SELACC",
                                     "E01USERID",
                                     "E01SOLACC",
                                     "E01SOLACD",
                                     "E01SOLCUN",
                                     "E01CUSNA1",
                                     "E01SOLPRO",
                                     "E01SOLPRI",
                                     "E01SOLTRM",
                                     "E01SOLTRC",
                                     "E01SOLOPE",
                                     "E01SOLRTE",
                                     "E01SOLART",
                                     "E01DEAMAM",
                                     "E01DEAMAD",
                                     "E01DEAMAY",
                                     "E01SOLPVI",
                                     "E01SOLABY",
                                     "E01SOLNME",
                                     "E01SOLFCK",
                                     "E01SOLTCK",
                                     "E01ACTION",
                                     "E01FINDAT"
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
                                   "E01SELUSR",
                                   "E01SELACC",
                                   "E01USERID",
                                   "E01SOLACC",
                                   "E01SOLACD",
                                   "E01SOLCUN",
                                   "E01CUSNA1",
                                   "E01SOLPRO",
                                   "E01SOLPRI",
                                   "E01SOLTRM",
                                   "E01SOLTRC",
                                   "E01SOLOPE",
                                   "E01SOLRTE",
                                   "E01SOLART",
                                   "E01DEAMAM",
                                   "E01DEAMAD",
                                   "E01DEAMAY",
                                   "E01SOLPVI",
                                   "E01SOLABY",
                                   "E01SOLNME",
                                   "E01SOLFCK",
                                   "E01SOLTCK",
                                   "E01ACTION",
                                   "E01FINDAT"
                                 };
  final static String fid = "1170224120420";
  final static String rid = "3ED6308C05EC9";
  final static String fmtname = "ESO001001";
  final int FIELDCOUNT = 33;
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
  private CharacterField fieldE01SELUSR = null;
  private DecimalField fieldE01SELACC = null;
  private CharacterField fieldE01USERID = null;
  private DecimalField fieldE01SOLACC = null;
  private CharacterField fieldE01SOLACD = null;
  private DecimalField fieldE01SOLCUN = null;
  private CharacterField fieldE01CUSNA1 = null;
  private CharacterField fieldE01SOLPRO = null;
  private DecimalField fieldE01SOLPRI = null;
  private DecimalField fieldE01SOLTRM = null;
  private CharacterField fieldE01SOLTRC = null;
  private CharacterField fieldE01SOLOPE = null;
  private DecimalField fieldE01SOLRTE = null;
  private DecimalField fieldE01SOLART = null;
  private DecimalField fieldE01DEAMAM = null;
  private DecimalField fieldE01DEAMAD = null;
  private DecimalField fieldE01DEAMAY = null;
  private CharacterField fieldE01SOLPVI = null;
  private CharacterField fieldE01SOLABY = null;
  private CharacterField fieldE01SOLNME = null;
  private DecimalField fieldE01SOLFCK = null;
  private DecimalField fieldE01SOLTCK = null;
  private CharacterField fieldE01ACTION = null;
  private CharacterField fieldE01FINDAT = null;

  /**
  * Constructor for ESO001001Message.
  */
  public ESO001001Message()
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
    recordsize = 304;
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
    fields[9] = fieldE01SELUSR =
    new CharacterField(message, HEADERSIZE + 42, 10, "E01SELUSR");
    fields[10] = fieldE01SELACC =
    new DecimalField(message, HEADERSIZE + 52, 13, 0, "E01SELACC");
    fields[11] = fieldE01USERID =
    new CharacterField(message, HEADERSIZE + 65, 10, "E01USERID");
    fields[12] = fieldE01SOLACC =
    new DecimalField(message, HEADERSIZE + 75, 13, 0, "E01SOLACC");
    fields[13] = fieldE01SOLACD =
    new CharacterField(message, HEADERSIZE + 88, 2, "E01SOLACD");
    fields[14] = fieldE01SOLCUN =
    new DecimalField(message, HEADERSIZE + 90, 10, 0, "E01SOLCUN");
    fields[15] = fieldE01CUSNA1 =
    new CharacterField(message, HEADERSIZE + 100, 60, "E01CUSNA1");
    fields[16] = fieldE01SOLPRO =
    new CharacterField(message, HEADERSIZE + 160, 4, "E01SOLPRO");
    fields[17] = fieldE01SOLPRI =
    new DecimalField(message, HEADERSIZE + 164, 17, 2, "E01SOLPRI");
    fields[18] = fieldE01SOLTRM =
    new DecimalField(message, HEADERSIZE + 181, 5, 0, "E01SOLTRM");
    fields[19] = fieldE01SOLTRC =
    new CharacterField(message, HEADERSIZE + 186, 1, "E01SOLTRC");
    fields[20] = fieldE01SOLOPE =
    new CharacterField(message, HEADERSIZE + 187, 2, "E01SOLOPE");
    fields[21] = fieldE01SOLRTE =
    new DecimalField(message, HEADERSIZE + 189, 11, 6, "E01SOLRTE");
    fields[22] = fieldE01SOLART =
    new DecimalField(message, HEADERSIZE + 200, 11, 6, "E01SOLART");
    fields[23] = fieldE01DEAMAM =
    new DecimalField(message, HEADERSIZE + 211, 3, 0, "E01DEAMAM");
    fields[24] = fieldE01DEAMAD =
    new DecimalField(message, HEADERSIZE + 214, 3, 0, "E01DEAMAD");
    fields[25] = fieldE01DEAMAY =
    new DecimalField(message, HEADERSIZE + 217, 5, 0, "E01DEAMAY");
    fields[26] = fieldE01SOLPVI =
    new CharacterField(message, HEADERSIZE + 222, 1, "E01SOLPVI");
    fields[27] = fieldE01SOLABY =
    new CharacterField(message, HEADERSIZE + 223, 10, "E01SOLABY");
    fields[28] = fieldE01SOLNME =
    new CharacterField(message, HEADERSIZE + 233, 45, "E01SOLNME");
    fields[29] = fieldE01SOLFCK =
    new DecimalField(message, HEADERSIZE + 278, 12, 0, "E01SOLFCK");
    fields[30] = fieldE01SOLTCK =
    new DecimalField(message, HEADERSIZE + 290, 12, 0, "E01SOLTCK");
    fields[31] = fieldE01ACTION =
    new CharacterField(message, HEADERSIZE + 302, 1, "E01ACTION");
    fields[32] = fieldE01FINDAT =
    new CharacterField(message, HEADERSIZE + 303, 1, "E01FINDAT");

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
  * Set field E01SELUSR using a String value.
  */
  public void setE01SELUSR(String newvalue)
  {
    fieldE01SELUSR.setString(newvalue);
  }

  /**
  * Get value of field E01SELUSR as a String.
  */
  public String getE01SELUSR()
  {
    return fieldE01SELUSR.getString();
  }

  /**
  * Set field E01SELACC using a String value.
  */
  public void setE01SELACC(String newvalue)
  {
    fieldE01SELACC.setString(newvalue);
  }

  /**
  * Get value of field E01SELACC as a String.
  */
  public String getE01SELACC()
  {
    return fieldE01SELACC.getString();
  }

  /**
  * Set numeric field E01SELACC using a BigDecimal value.
  */
  public void setE01SELACC(BigDecimal newvalue)
  {
    fieldE01SELACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SELACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SELACC()
  {
    return fieldE01SELACC.getBigDecimal();
  }

  /**
  * Set field E01USERID using a String value.
  */
  public void setE01USERID(String newvalue)
  {
    fieldE01USERID.setString(newvalue);
  }

  /**
  * Get value of field E01USERID as a String.
  */
  public String getE01USERID()
  {
    return fieldE01USERID.getString();
  }

  /**
  * Set field E01SOLACC using a String value.
  */
  public void setE01SOLACC(String newvalue)
  {
    fieldE01SOLACC.setString(newvalue);
  }

  /**
  * Get value of field E01SOLACC as a String.
  */
  public String getE01SOLACC()
  {
    return fieldE01SOLACC.getString();
  }

  /**
  * Set numeric field E01SOLACC using a BigDecimal value.
  */
  public void setE01SOLACC(BigDecimal newvalue)
  {
    fieldE01SOLACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SOLACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SOLACC()
  {
    return fieldE01SOLACC.getBigDecimal();
  }

  /**
  * Set field E01SOLACD using a String value.
  */
  public void setE01SOLACD(String newvalue)
  {
    fieldE01SOLACD.setString(newvalue);
  }

  /**
  * Get value of field E01SOLACD as a String.
  */
  public String getE01SOLACD()
  {
    return fieldE01SOLACD.getString();
  }

  /**
  * Set field E01SOLCUN using a String value.
  */
  public void setE01SOLCUN(String newvalue)
  {
    fieldE01SOLCUN.setString(newvalue);
  }

  /**
  * Get value of field E01SOLCUN as a String.
  */
  public String getE01SOLCUN()
  {
    return fieldE01SOLCUN.getString();
  }

  /**
  * Set numeric field E01SOLCUN using a BigDecimal value.
  */
  public void setE01SOLCUN(BigDecimal newvalue)
  {
    fieldE01SOLCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SOLCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SOLCUN()
  {
    return fieldE01SOLCUN.getBigDecimal();
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
  * Set field E01SOLPRO using a String value.
  */
  public void setE01SOLPRO(String newvalue)
  {
    fieldE01SOLPRO.setString(newvalue);
  }

  /**
  * Get value of field E01SOLPRO as a String.
  */
  public String getE01SOLPRO()
  {
    return fieldE01SOLPRO.getString();
  }

  /**
  * Set field E01SOLPRI using a String value.
  */
  public void setE01SOLPRI(String newvalue)
  {
    fieldE01SOLPRI.setString(newvalue);
  }

  /**
  * Get value of field E01SOLPRI as a String.
  */
  public String getE01SOLPRI()
  {
    return fieldE01SOLPRI.getString();
  }

  /**
  * Set numeric field E01SOLPRI using a BigDecimal value.
  */
  public void setE01SOLPRI(BigDecimal newvalue)
  {
    fieldE01SOLPRI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SOLPRI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SOLPRI()
  {
    return fieldE01SOLPRI.getBigDecimal();
  }

  /**
  * Set field E01SOLTRM using a String value.
  */
  public void setE01SOLTRM(String newvalue)
  {
    fieldE01SOLTRM.setString(newvalue);
  }

  /**
  * Get value of field E01SOLTRM as a String.
  */
  public String getE01SOLTRM()
  {
    return fieldE01SOLTRM.getString();
  }

  /**
  * Set numeric field E01SOLTRM using a BigDecimal value.
  */
  public void setE01SOLTRM(BigDecimal newvalue)
  {
    fieldE01SOLTRM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SOLTRM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SOLTRM()
  {
    return fieldE01SOLTRM.getBigDecimal();
  }

  /**
  * Set field E01SOLTRC using a String value.
  */
  public void setE01SOLTRC(String newvalue)
  {
    fieldE01SOLTRC.setString(newvalue);
  }

  /**
  * Get value of field E01SOLTRC as a String.
  */
  public String getE01SOLTRC()
  {
    return fieldE01SOLTRC.getString();
  }

  /**
  * Set field E01SOLOPE using a String value.
  */
  public void setE01SOLOPE(String newvalue)
  {
    fieldE01SOLOPE.setString(newvalue);
  }

  /**
  * Get value of field E01SOLOPE as a String.
  */
  public String getE01SOLOPE()
  {
    return fieldE01SOLOPE.getString();
  }

  /**
  * Set field E01SOLRTE using a String value.
  */
  public void setE01SOLRTE(String newvalue)
  {
    fieldE01SOLRTE.setString(newvalue);
  }

  /**
  * Get value of field E01SOLRTE as a String.
  */
  public String getE01SOLRTE()
  {
    return fieldE01SOLRTE.getString();
  }

  /**
  * Set numeric field E01SOLRTE using a BigDecimal value.
  */
  public void setE01SOLRTE(BigDecimal newvalue)
  {
    fieldE01SOLRTE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SOLRTE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SOLRTE()
  {
    return fieldE01SOLRTE.getBigDecimal();
  }

  /**
  * Set field E01SOLART using a String value.
  */
  public void setE01SOLART(String newvalue)
  {
    fieldE01SOLART.setString(newvalue);
  }

  /**
  * Get value of field E01SOLART as a String.
  */
  public String getE01SOLART()
  {
    return fieldE01SOLART.getString();
  }

  /**
  * Set numeric field E01SOLART using a BigDecimal value.
  */
  public void setE01SOLART(BigDecimal newvalue)
  {
    fieldE01SOLART.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SOLART as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SOLART()
  {
    return fieldE01SOLART.getBigDecimal();
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
  * Set field E01SOLPVI using a String value.
  */
  public void setE01SOLPVI(String newvalue)
  {
    fieldE01SOLPVI.setString(newvalue);
  }

  /**
  * Get value of field E01SOLPVI as a String.
  */
  public String getE01SOLPVI()
  {
    return fieldE01SOLPVI.getString();
  }

  /**
  * Set field E01SOLABY using a String value.
  */
  public void setE01SOLABY(String newvalue)
  {
    fieldE01SOLABY.setString(newvalue);
  }

  /**
  * Get value of field E01SOLABY as a String.
  */
  public String getE01SOLABY()
  {
    return fieldE01SOLABY.getString();
  }

  /**
  * Set field E01SOLNME using a String value.
  */
  public void setE01SOLNME(String newvalue)
  {
    fieldE01SOLNME.setString(newvalue);
  }

  /**
  * Get value of field E01SOLNME as a String.
  */
  public String getE01SOLNME()
  {
    return fieldE01SOLNME.getString();
  }

  /**
  * Set field E01SOLFCK using a String value.
  */
  public void setE01SOLFCK(String newvalue)
  {
    fieldE01SOLFCK.setString(newvalue);
  }

  /**
  * Get value of field E01SOLFCK as a String.
  */
  public String getE01SOLFCK()
  {
    return fieldE01SOLFCK.getString();
  }

  /**
  * Set numeric field E01SOLFCK using a BigDecimal value.
  */
  public void setE01SOLFCK(BigDecimal newvalue)
  {
    fieldE01SOLFCK.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SOLFCK as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SOLFCK()
  {
    return fieldE01SOLFCK.getBigDecimal();
  }

  /**
  * Set field E01SOLTCK using a String value.
  */
  public void setE01SOLTCK(String newvalue)
  {
    fieldE01SOLTCK.setString(newvalue);
  }

  /**
  * Get value of field E01SOLTCK as a String.
  */
  public String getE01SOLTCK()
  {
    return fieldE01SOLTCK.getString();
  }

  /**
  * Set numeric field E01SOLTCK using a BigDecimal value.
  */
  public void setE01SOLTCK(BigDecimal newvalue)
  {
    fieldE01SOLTCK.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01SOLTCK as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01SOLTCK()
  {
    return fieldE01SOLTCK.getBigDecimal();
  }

  /**
  * Set field E01ACTION using a String value.
  */
  public void setE01ACTION(String newvalue)
  {
    fieldE01ACTION.setString(newvalue);
  }

  /**
  * Get value of field E01ACTION as a String.
  */
  public String getE01ACTION()
  {
    return fieldE01ACTION.getString();
  }

  /**
  * Set field E01FINDAT using a String value.
  */
  public void setE01FINDAT(String newvalue)
  {
    fieldE01FINDAT.setString(newvalue);
  }

  /**
  * Get value of field E01FINDAT as a String.
  */
  public String getE01FINDAT()
  {
    return fieldE01FINDAT.getString();
  }

}