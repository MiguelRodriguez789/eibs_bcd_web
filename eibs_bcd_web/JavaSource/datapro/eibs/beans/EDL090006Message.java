package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL090006 physical file definition.
* 
* File level identifier is 1210527165456.
* Record format level identifier is 3F02BA48DE79F.
*/

public class EDL090006Message extends MessageRecord
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
                                     "E06RESCUP",
                                     "E06RESAPC",
                                     "E06RESRTE",
                                     "E06RESACC",
                                     "E06RESPNU",
                                     "E06RESREF",
                                     "E06RESPDM",
                                     "E06RESPDD",
                                     "E06RESPDY",
                                     "E06RESVAL",
                                     "E06RESFVM",
                                     "E06RESFVD",
                                     "E06RESFVY",
                                     "E06RESVAV",
                                     "E06RESVAP",
                                     "E06RESSDO",
                                     "E06RESTOT",
                                     "E06RESTOP",
                                     "E06RESTOV",
                                     "E06RESUSR",
                                     "E06RESUTM",
                                     "E06RESUTD",
                                     "E06RESUTY",
                                     "E06ENDFLD"
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
                                   "E06RESCUP",
                                   "E06RESAPC",
                                   "E06RESRTE",
                                   "E06RESACC",
                                   "E06RESPNU",
                                   "E06RESREF",
                                   "E06RESPDM",
                                   "E06RESPDD",
                                   "E06RESPDY",
                                   "E06RESVAL",
                                   "E06RESFVM",
                                   "E06RESFVD",
                                   "E06RESFVY",
                                   "E06RESVAV",
                                   "E06RESVAP",
                                   "E06RESSDO",
                                   "E06RESTOT",
                                   "E06RESTOP",
                                   "E06RESTOV",
                                   "E06RESUSR",
                                   "E06RESUTM",
                                   "E06RESUTD",
                                   "E06RESUTY",
                                   "E06ENDFLD"
                                 };
  final static String fid = "1210527165456";
  final static String rid = "3F02BA48DE79F";
  final static String fmtname = "EDL090006";
  final int FIELDCOUNT = 33;
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
  private DecimalField fieldE06RESCUP = null;
  private CharacterField fieldE06RESAPC = null;
  private DecimalField fieldE06RESRTE = null;
  private DecimalField fieldE06RESACC = null;
  private DecimalField fieldE06RESPNU = null;
  private CharacterField fieldE06RESREF = null;
  private DecimalField fieldE06RESPDM = null;
  private DecimalField fieldE06RESPDD = null;
  private DecimalField fieldE06RESPDY = null;
  private DecimalField fieldE06RESVAL = null;
  private DecimalField fieldE06RESFVM = null;
  private DecimalField fieldE06RESFVD = null;
  private DecimalField fieldE06RESFVY = null;
  private DecimalField fieldE06RESVAV = null;
  private DecimalField fieldE06RESVAP = null;
  private DecimalField fieldE06RESSDO = null;
  private DecimalField fieldE06RESTOT = null;
  private DecimalField fieldE06RESTOP = null;
  private DecimalField fieldE06RESTOV = null;
  private CharacterField fieldE06RESUSR = null;
  private DecimalField fieldE06RESUTM = null;
  private DecimalField fieldE06RESUTD = null;
  private DecimalField fieldE06RESUTY = null;
  private CharacterField fieldE06ENDFLD = null;

  /**
  * Constructor for EDL090006Message.
  */
  public EDL090006Message()
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
    recordsize = 241;
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
    fields[9] = fieldE06RESCUP =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E06RESCUP");
    fields[10] = fieldE06RESAPC =
    new CharacterField(message, HEADERSIZE + 55, 1, "E06RESAPC");
    fields[11] = fieldE06RESRTE =
    new DecimalField(message, HEADERSIZE + 56, 11, 6, "E06RESRTE");
    fields[12] = fieldE06RESACC =
    new DecimalField(message, HEADERSIZE + 67, 13, 0, "E06RESACC");
    fields[13] = fieldE06RESPNU =
    new DecimalField(message, HEADERSIZE + 80, 6, 0, "E06RESPNU");
    fields[14] = fieldE06RESREF =
    new CharacterField(message, HEADERSIZE + 86, 25, "E06RESREF");
    fields[15] = fieldE06RESPDM =
    new DecimalField(message, HEADERSIZE + 111, 3, 0, "E06RESPDM");
    fields[16] = fieldE06RESPDD =
    new DecimalField(message, HEADERSIZE + 114, 3, 0, "E06RESPDD");
    fields[17] = fieldE06RESPDY =
    new DecimalField(message, HEADERSIZE + 117, 5, 0, "E06RESPDY");
    fields[18] = fieldE06RESVAL =
    new DecimalField(message, HEADERSIZE + 122, 17, 2, "E06RESVAL");
    fields[19] = fieldE06RESFVM =
    new DecimalField(message, HEADERSIZE + 139, 3, 0, "E06RESFVM");
    fields[20] = fieldE06RESFVD =
    new DecimalField(message, HEADERSIZE + 142, 3, 0, "E06RESFVD");
    fields[21] = fieldE06RESFVY =
    new DecimalField(message, HEADERSIZE + 145, 5, 0, "E06RESFVY");
    fields[22] = fieldE06RESVAV =
    new DecimalField(message, HEADERSIZE + 150, 17, 2, "E06RESVAV");
    fields[23] = fieldE06RESVAP =
    new DecimalField(message, HEADERSIZE + 167, 17, 2, "E06RESVAP");
    fields[24] = fieldE06RESSDO =
    new DecimalField(message, HEADERSIZE + 184, 17, 2, "E06RESSDO");
    fields[25] = fieldE06RESTOT =
    new DecimalField(message, HEADERSIZE + 201, 6, 0, "E06RESTOT");
    fields[26] = fieldE06RESTOP =
    new DecimalField(message, HEADERSIZE + 207, 6, 0, "E06RESTOP");
    fields[27] = fieldE06RESTOV =
    new DecimalField(message, HEADERSIZE + 213, 6, 0, "E06RESTOV");
    fields[28] = fieldE06RESUSR =
    new CharacterField(message, HEADERSIZE + 219, 10, "E06RESUSR");
    fields[29] = fieldE06RESUTM =
    new DecimalField(message, HEADERSIZE + 229, 3, 0, "E06RESUTM");
    fields[30] = fieldE06RESUTD =
    new DecimalField(message, HEADERSIZE + 232, 3, 0, "E06RESUTD");
    fields[31] = fieldE06RESUTY =
    new DecimalField(message, HEADERSIZE + 235, 5, 0, "E06RESUTY");
    fields[32] = fieldE06ENDFLD =
    new CharacterField(message, HEADERSIZE + 240, 1, "E06ENDFLD");

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
  * Set field E06RESCUP using a String value.
  */
  public void setE06RESCUP(String newvalue)
  {
    fieldE06RESCUP.setString(newvalue);
  }

  /**
  * Get value of field E06RESCUP as a String.
  */
  public String getE06RESCUP()
  {
    return fieldE06RESCUP.getString();
  }

  /**
  * Set numeric field E06RESCUP using a BigDecimal value.
  */
  public void setE06RESCUP(BigDecimal newvalue)
  {
    fieldE06RESCUP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06RESCUP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06RESCUP()
  {
    return fieldE06RESCUP.getBigDecimal();
  }

  /**
  * Set field E06RESAPC using a String value.
  */
  public void setE06RESAPC(String newvalue)
  {
    fieldE06RESAPC.setString(newvalue);
  }

  /**
  * Get value of field E06RESAPC as a String.
  */
  public String getE06RESAPC()
  {
    return fieldE06RESAPC.getString();
  }

  /**
  * Set field E06RESRTE using a String value.
  */
  public void setE06RESRTE(String newvalue)
  {
    fieldE06RESRTE.setString(newvalue);
  }

  /**
  * Get value of field E06RESRTE as a String.
  */
  public String getE06RESRTE()
  {
    return fieldE06RESRTE.getString();
  }

  /**
  * Set numeric field E06RESRTE using a BigDecimal value.
  */
  public void setE06RESRTE(BigDecimal newvalue)
  {
    fieldE06RESRTE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06RESRTE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06RESRTE()
  {
    return fieldE06RESRTE.getBigDecimal();
  }

  /**
  * Set field E06RESACC using a String value.
  */
  public void setE06RESACC(String newvalue)
  {
    fieldE06RESACC.setString(newvalue);
  }

  /**
  * Get value of field E06RESACC as a String.
  */
  public String getE06RESACC()
  {
    return fieldE06RESACC.getString();
  }

  /**
  * Set numeric field E06RESACC using a BigDecimal value.
  */
  public void setE06RESACC(BigDecimal newvalue)
  {
    fieldE06RESACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06RESACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06RESACC()
  {
    return fieldE06RESACC.getBigDecimal();
  }

  /**
  * Set field E06RESPNU using a String value.
  */
  public void setE06RESPNU(String newvalue)
  {
    fieldE06RESPNU.setString(newvalue);
  }

  /**
  * Get value of field E06RESPNU as a String.
  */
  public String getE06RESPNU()
  {
    return fieldE06RESPNU.getString();
  }

  /**
  * Set numeric field E06RESPNU using a BigDecimal value.
  */
  public void setE06RESPNU(BigDecimal newvalue)
  {
    fieldE06RESPNU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06RESPNU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06RESPNU()
  {
    return fieldE06RESPNU.getBigDecimal();
  }

  /**
  * Set field E06RESREF using a String value.
  */
  public void setE06RESREF(String newvalue)
  {
    fieldE06RESREF.setString(newvalue);
  }

  /**
  * Get value of field E06RESREF as a String.
  */
  public String getE06RESREF()
  {
    return fieldE06RESREF.getString();
  }

  /**
  * Set field E06RESPDM using a String value.
  */
  public void setE06RESPDM(String newvalue)
  {
    fieldE06RESPDM.setString(newvalue);
  }

  /**
  * Get value of field E06RESPDM as a String.
  */
  public String getE06RESPDM()
  {
    return fieldE06RESPDM.getString();
  }

  /**
  * Set numeric field E06RESPDM using a BigDecimal value.
  */
  public void setE06RESPDM(BigDecimal newvalue)
  {
    fieldE06RESPDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06RESPDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06RESPDM()
  {
    return fieldE06RESPDM.getBigDecimal();
  }

  /**
  * Set field E06RESPDD using a String value.
  */
  public void setE06RESPDD(String newvalue)
  {
    fieldE06RESPDD.setString(newvalue);
  }

  /**
  * Get value of field E06RESPDD as a String.
  */
  public String getE06RESPDD()
  {
    return fieldE06RESPDD.getString();
  }

  /**
  * Set numeric field E06RESPDD using a BigDecimal value.
  */
  public void setE06RESPDD(BigDecimal newvalue)
  {
    fieldE06RESPDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06RESPDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06RESPDD()
  {
    return fieldE06RESPDD.getBigDecimal();
  }

  /**
  * Set field E06RESPDY using a String value.
  */
  public void setE06RESPDY(String newvalue)
  {
    fieldE06RESPDY.setString(newvalue);
  }

  /**
  * Get value of field E06RESPDY as a String.
  */
  public String getE06RESPDY()
  {
    return fieldE06RESPDY.getString();
  }

  /**
  * Set numeric field E06RESPDY using a BigDecimal value.
  */
  public void setE06RESPDY(BigDecimal newvalue)
  {
    fieldE06RESPDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06RESPDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06RESPDY()
  {
    return fieldE06RESPDY.getBigDecimal();
  }

  /**
  * Set field E06RESVAL using a String value.
  */
  public void setE06RESVAL(String newvalue)
  {
    fieldE06RESVAL.setString(newvalue);
  }

  /**
  * Get value of field E06RESVAL as a String.
  */
  public String getE06RESVAL()
  {
    return fieldE06RESVAL.getString();
  }

  /**
  * Set numeric field E06RESVAL using a BigDecimal value.
  */
  public void setE06RESVAL(BigDecimal newvalue)
  {
    fieldE06RESVAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06RESVAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06RESVAL()
  {
    return fieldE06RESVAL.getBigDecimal();
  }

  /**
  * Set field E06RESFVM using a String value.
  */
  public void setE06RESFVM(String newvalue)
  {
    fieldE06RESFVM.setString(newvalue);
  }

  /**
  * Get value of field E06RESFVM as a String.
  */
  public String getE06RESFVM()
  {
    return fieldE06RESFVM.getString();
  }

  /**
  * Set numeric field E06RESFVM using a BigDecimal value.
  */
  public void setE06RESFVM(BigDecimal newvalue)
  {
    fieldE06RESFVM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06RESFVM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06RESFVM()
  {
    return fieldE06RESFVM.getBigDecimal();
  }

  /**
  * Set field E06RESFVD using a String value.
  */
  public void setE06RESFVD(String newvalue)
  {
    fieldE06RESFVD.setString(newvalue);
  }

  /**
  * Get value of field E06RESFVD as a String.
  */
  public String getE06RESFVD()
  {
    return fieldE06RESFVD.getString();
  }

  /**
  * Set numeric field E06RESFVD using a BigDecimal value.
  */
  public void setE06RESFVD(BigDecimal newvalue)
  {
    fieldE06RESFVD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06RESFVD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06RESFVD()
  {
    return fieldE06RESFVD.getBigDecimal();
  }

  /**
  * Set field E06RESFVY using a String value.
  */
  public void setE06RESFVY(String newvalue)
  {
    fieldE06RESFVY.setString(newvalue);
  }

  /**
  * Get value of field E06RESFVY as a String.
  */
  public String getE06RESFVY()
  {
    return fieldE06RESFVY.getString();
  }

  /**
  * Set numeric field E06RESFVY using a BigDecimal value.
  */
  public void setE06RESFVY(BigDecimal newvalue)
  {
    fieldE06RESFVY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06RESFVY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06RESFVY()
  {
    return fieldE06RESFVY.getBigDecimal();
  }

  /**
  * Set field E06RESVAV using a String value.
  */
  public void setE06RESVAV(String newvalue)
  {
    fieldE06RESVAV.setString(newvalue);
  }

  /**
  * Get value of field E06RESVAV as a String.
  */
  public String getE06RESVAV()
  {
    return fieldE06RESVAV.getString();
  }

  /**
  * Set numeric field E06RESVAV using a BigDecimal value.
  */
  public void setE06RESVAV(BigDecimal newvalue)
  {
    fieldE06RESVAV.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06RESVAV as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06RESVAV()
  {
    return fieldE06RESVAV.getBigDecimal();
  }

  /**
  * Set field E06RESVAP using a String value.
  */
  public void setE06RESVAP(String newvalue)
  {
    fieldE06RESVAP.setString(newvalue);
  }

  /**
  * Get value of field E06RESVAP as a String.
  */
  public String getE06RESVAP()
  {
    return fieldE06RESVAP.getString();
  }

  /**
  * Set numeric field E06RESVAP using a BigDecimal value.
  */
  public void setE06RESVAP(BigDecimal newvalue)
  {
    fieldE06RESVAP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06RESVAP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06RESVAP()
  {
    return fieldE06RESVAP.getBigDecimal();
  }

  /**
  * Set field E06RESSDO using a String value.
  */
  public void setE06RESSDO(String newvalue)
  {
    fieldE06RESSDO.setString(newvalue);
  }

  /**
  * Get value of field E06RESSDO as a String.
  */
  public String getE06RESSDO()
  {
    return fieldE06RESSDO.getString();
  }

  /**
  * Set numeric field E06RESSDO using a BigDecimal value.
  */
  public void setE06RESSDO(BigDecimal newvalue)
  {
    fieldE06RESSDO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06RESSDO as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06RESSDO()
  {
    return fieldE06RESSDO.getBigDecimal();
  }

  /**
  * Set field E06RESTOT using a String value.
  */
  public void setE06RESTOT(String newvalue)
  {
    fieldE06RESTOT.setString(newvalue);
  }

  /**
  * Get value of field E06RESTOT as a String.
  */
  public String getE06RESTOT()
  {
    return fieldE06RESTOT.getString();
  }

  /**
  * Set numeric field E06RESTOT using a BigDecimal value.
  */
  public void setE06RESTOT(BigDecimal newvalue)
  {
    fieldE06RESTOT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06RESTOT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06RESTOT()
  {
    return fieldE06RESTOT.getBigDecimal();
  }

  /**
  * Set field E06RESTOP using a String value.
  */
  public void setE06RESTOP(String newvalue)
  {
    fieldE06RESTOP.setString(newvalue);
  }

  /**
  * Get value of field E06RESTOP as a String.
  */
  public String getE06RESTOP()
  {
    return fieldE06RESTOP.getString();
  }

  /**
  * Set numeric field E06RESTOP using a BigDecimal value.
  */
  public void setE06RESTOP(BigDecimal newvalue)
  {
    fieldE06RESTOP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06RESTOP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06RESTOP()
  {
    return fieldE06RESTOP.getBigDecimal();
  }

  /**
  * Set field E06RESTOV using a String value.
  */
  public void setE06RESTOV(String newvalue)
  {
    fieldE06RESTOV.setString(newvalue);
  }

  /**
  * Get value of field E06RESTOV as a String.
  */
  public String getE06RESTOV()
  {
    return fieldE06RESTOV.getString();
  }

  /**
  * Set numeric field E06RESTOV using a BigDecimal value.
  */
  public void setE06RESTOV(BigDecimal newvalue)
  {
    fieldE06RESTOV.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06RESTOV as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06RESTOV()
  {
    return fieldE06RESTOV.getBigDecimal();
  }

  /**
  * Set field E06RESUSR using a String value.
  */
  public void setE06RESUSR(String newvalue)
  {
    fieldE06RESUSR.setString(newvalue);
  }

  /**
  * Get value of field E06RESUSR as a String.
  */
  public String getE06RESUSR()
  {
    return fieldE06RESUSR.getString();
  }

  /**
  * Set field E06RESUTM using a String value.
  */
  public void setE06RESUTM(String newvalue)
  {
    fieldE06RESUTM.setString(newvalue);
  }

  /**
  * Get value of field E06RESUTM as a String.
  */
  public String getE06RESUTM()
  {
    return fieldE06RESUTM.getString();
  }

  /**
  * Set numeric field E06RESUTM using a BigDecimal value.
  */
  public void setE06RESUTM(BigDecimal newvalue)
  {
    fieldE06RESUTM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06RESUTM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06RESUTM()
  {
    return fieldE06RESUTM.getBigDecimal();
  }

  /**
  * Set field E06RESUTD using a String value.
  */
  public void setE06RESUTD(String newvalue)
  {
    fieldE06RESUTD.setString(newvalue);
  }

  /**
  * Get value of field E06RESUTD as a String.
  */
  public String getE06RESUTD()
  {
    return fieldE06RESUTD.getString();
  }

  /**
  * Set numeric field E06RESUTD using a BigDecimal value.
  */
  public void setE06RESUTD(BigDecimal newvalue)
  {
    fieldE06RESUTD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06RESUTD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06RESUTD()
  {
    return fieldE06RESUTD.getBigDecimal();
  }

  /**
  * Set field E06RESUTY using a String value.
  */
  public void setE06RESUTY(String newvalue)
  {
    fieldE06RESUTY.setString(newvalue);
  }

  /**
  * Get value of field E06RESUTY as a String.
  */
  public String getE06RESUTY()
  {
    return fieldE06RESUTY.getString();
  }

  /**
  * Set numeric field E06RESUTY using a BigDecimal value.
  */
  public void setE06RESUTY(BigDecimal newvalue)
  {
    fieldE06RESUTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E06RESUTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE06RESUTY()
  {
    return fieldE06RESUTY.getBigDecimal();
  }

  /**
  * Set field E06ENDFLD using a String value.
  */
  public void setE06ENDFLD(String newvalue)
  {
    fieldE06ENDFLD.setString(newvalue);
  }

  /**
  * Get value of field E06ENDFLD as a String.
  */
  public String getE06ENDFLD()
  {
    return fieldE06ENDFLD.getString();
  }

}