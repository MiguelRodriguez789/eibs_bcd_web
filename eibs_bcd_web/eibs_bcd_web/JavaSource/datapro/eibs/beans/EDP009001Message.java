package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDP009001 physical file definition.
* 
* File level identifier is 1130611113109.
* Record format level identifier is 4B1682AE92A44.
*/

public class EDP009001Message extends MessageRecord
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
                                     "E01IFDCUN",
                                     "E01IFDFEY",
                                     "E01IFDFEM",
                                     "E01IFDCFO",
                                     "E01LIQUID",
                                     "E01PRUACI",
                                     "E01PEMECO",
                                     "E01ROTINV",
                                     "E01PEMEPA",
                                     "E01ENDEUD",
                                     "E01ENDFIN",
                                     "E01RENACT",
                                     "E01RENPAT",
                                     "E01MANEUT",
                                     "E01MAROPE",
                                     "E01RIEPAT",
                                     "E01RIEVTA"
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
                                   "E01IFDCUN",
                                   "E01IFDFEY",
                                   "E01IFDFEM",
                                   "E01IFDCFO",
                                   "E01LIQUID",
                                   "E01PRUACI",
                                   "E01PEMECO",
                                   "E01ROTINV",
                                   "E01PEMEPA",
                                   "E01ENDEUD",
                                   "E01ENDFIN",
                                   "E01RENACT",
                                   "E01RENPAT",
                                   "E01MANEUT",
                                   "E01MAROPE",
                                   "E01RIEPAT",
                                   "E01RIEVTA"
                                 };
  final static String fid = "1130611113109";
  final static String rid = "4B1682AE92A44";
  final static String fmtname = "EDP009001";
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
  private DecimalField fieldE01IFDCUN = null;
  private DecimalField fieldE01IFDFEY = null;
  private DecimalField fieldE01IFDFEM = null;
  private CharacterField fieldE01IFDCFO = null;
  private DecimalField fieldE01LIQUID = null;
  private DecimalField fieldE01PRUACI = null;
  private DecimalField fieldE01PEMECO = null;
  private DecimalField fieldE01ROTINV = null;
  private DecimalField fieldE01PEMEPA = null;
  private DecimalField fieldE01ENDEUD = null;
  private DecimalField fieldE01ENDFIN = null;
  private DecimalField fieldE01RENACT = null;
  private DecimalField fieldE01RENPAT = null;
  private DecimalField fieldE01MANEUT = null;
  private DecimalField fieldE01MAROPE = null;
  private DecimalField fieldE01RIEPAT = null;
  private DecimalField fieldE01RIEVTA = null;

  /**
  * Constructor for EDP009001Message.
  */
  public EDP009001Message()
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
    recordsize = 283;
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
    fields[9] = fieldE01IFDCUN =
    new DecimalField(message, HEADERSIZE + 42, 10, 0, "E01IFDCUN");
    fields[10] = fieldE01IFDFEY =
    new DecimalField(message, HEADERSIZE + 52, 5, 0, "E01IFDFEY");
    fields[11] = fieldE01IFDFEM =
    new DecimalField(message, HEADERSIZE + 57, 3, 0, "E01IFDFEM");
    fields[12] = fieldE01IFDCFO =
    new CharacterField(message, HEADERSIZE + 60, 2, "E01IFDCFO");
    fields[13] = fieldE01LIQUID =
    new DecimalField(message, HEADERSIZE + 62, 17, 2, "E01LIQUID");
    fields[14] = fieldE01PRUACI =
    new DecimalField(message, HEADERSIZE + 79, 17, 2, "E01PRUACI");
    fields[15] = fieldE01PEMECO =
    new DecimalField(message, HEADERSIZE + 96, 17, 2, "E01PEMECO");
    fields[16] = fieldE01ROTINV =
    new DecimalField(message, HEADERSIZE + 113, 17, 2, "E01ROTINV");
    fields[17] = fieldE01PEMEPA =
    new DecimalField(message, HEADERSIZE + 130, 17, 2, "E01PEMEPA");
    fields[18] = fieldE01ENDEUD =
    new DecimalField(message, HEADERSIZE + 147, 17, 2, "E01ENDEUD");
    fields[19] = fieldE01ENDFIN =
    new DecimalField(message, HEADERSIZE + 164, 17, 2, "E01ENDFIN");
    fields[20] = fieldE01RENACT =
    new DecimalField(message, HEADERSIZE + 181, 17, 2, "E01RENACT");
    fields[21] = fieldE01RENPAT =
    new DecimalField(message, HEADERSIZE + 198, 17, 2, "E01RENPAT");
    fields[22] = fieldE01MANEUT =
    new DecimalField(message, HEADERSIZE + 215, 17, 2, "E01MANEUT");
    fields[23] = fieldE01MAROPE =
    new DecimalField(message, HEADERSIZE + 232, 17, 2, "E01MAROPE");
    fields[24] = fieldE01RIEPAT =
    new DecimalField(message, HEADERSIZE + 249, 17, 2, "E01RIEPAT");
    fields[25] = fieldE01RIEVTA =
    new DecimalField(message, HEADERSIZE + 266, 17, 2, "E01RIEVTA");

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
  * Set field E01IFDCUN using a String value.
  */
  public void setE01IFDCUN(String newvalue)
  {
    fieldE01IFDCUN.setString(newvalue);
  }

  /**
  * Get value of field E01IFDCUN as a String.
  */
  public String getE01IFDCUN()
  {
    return fieldE01IFDCUN.getString();
  }

  /**
  * Set numeric field E01IFDCUN using a BigDecimal value.
  */
  public void setE01IFDCUN(BigDecimal newvalue)
  {
    fieldE01IFDCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01IFDCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01IFDCUN()
  {
    return fieldE01IFDCUN.getBigDecimal();
  }

  /**
  * Set field E01IFDFEY using a String value.
  */
  public void setE01IFDFEY(String newvalue)
  {
    fieldE01IFDFEY.setString(newvalue);
  }

  /**
  * Get value of field E01IFDFEY as a String.
  */
  public String getE01IFDFEY()
  {
    return fieldE01IFDFEY.getString();
  }

  /**
  * Set numeric field E01IFDFEY using a BigDecimal value.
  */
  public void setE01IFDFEY(BigDecimal newvalue)
  {
    fieldE01IFDFEY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01IFDFEY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01IFDFEY()
  {
    return fieldE01IFDFEY.getBigDecimal();
  }

  /**
  * Set field E01IFDFEM using a String value.
  */
  public void setE01IFDFEM(String newvalue)
  {
    fieldE01IFDFEM.setString(newvalue);
  }

  /**
  * Get value of field E01IFDFEM as a String.
  */
  public String getE01IFDFEM()
  {
    return fieldE01IFDFEM.getString();
  }

  /**
  * Set numeric field E01IFDFEM using a BigDecimal value.
  */
  public void setE01IFDFEM(BigDecimal newvalue)
  {
    fieldE01IFDFEM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01IFDFEM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01IFDFEM()
  {
    return fieldE01IFDFEM.getBigDecimal();
  }

  /**
  * Set field E01IFDCFO using a String value.
  */
  public void setE01IFDCFO(String newvalue)
  {
    fieldE01IFDCFO.setString(newvalue);
  }

  /**
  * Get value of field E01IFDCFO as a String.
  */
  public String getE01IFDCFO()
  {
    return fieldE01IFDCFO.getString();
  }

  /**
  * Set field E01LIQUID using a String value.
  */
  public void setE01LIQUID(String newvalue)
  {
    fieldE01LIQUID.setString(newvalue);
  }

  /**
  * Get value of field E01LIQUID as a String.
  */
  public String getE01LIQUID()
  {
    return fieldE01LIQUID.getString();
  }

  /**
  * Set numeric field E01LIQUID using a BigDecimal value.
  */
  public void setE01LIQUID(BigDecimal newvalue)
  {
    fieldE01LIQUID.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01LIQUID as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01LIQUID()
  {
    return fieldE01LIQUID.getBigDecimal();
  }

  /**
  * Set field E01PRUACI using a String value.
  */
  public void setE01PRUACI(String newvalue)
  {
    fieldE01PRUACI.setString(newvalue);
  }

  /**
  * Get value of field E01PRUACI as a String.
  */
  public String getE01PRUACI()
  {
    return fieldE01PRUACI.getString();
  }

  /**
  * Set numeric field E01PRUACI using a BigDecimal value.
  */
  public void setE01PRUACI(BigDecimal newvalue)
  {
    fieldE01PRUACI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRUACI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRUACI()
  {
    return fieldE01PRUACI.getBigDecimal();
  }

  /**
  * Set field E01PEMECO using a String value.
  */
  public void setE01PEMECO(String newvalue)
  {
    fieldE01PEMECO.setString(newvalue);
  }

  /**
  * Get value of field E01PEMECO as a String.
  */
  public String getE01PEMECO()
  {
    return fieldE01PEMECO.getString();
  }

  /**
  * Set numeric field E01PEMECO using a BigDecimal value.
  */
  public void setE01PEMECO(BigDecimal newvalue)
  {
    fieldE01PEMECO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PEMECO as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PEMECO()
  {
    return fieldE01PEMECO.getBigDecimal();
  }

  /**
  * Set field E01ROTINV using a String value.
  */
  public void setE01ROTINV(String newvalue)
  {
    fieldE01ROTINV.setString(newvalue);
  }

  /**
  * Get value of field E01ROTINV as a String.
  */
  public String getE01ROTINV()
  {
    return fieldE01ROTINV.getString();
  }

  /**
  * Set numeric field E01ROTINV using a BigDecimal value.
  */
  public void setE01ROTINV(BigDecimal newvalue)
  {
    fieldE01ROTINV.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ROTINV as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ROTINV()
  {
    return fieldE01ROTINV.getBigDecimal();
  }

  /**
  * Set field E01PEMEPA using a String value.
  */
  public void setE01PEMEPA(String newvalue)
  {
    fieldE01PEMEPA.setString(newvalue);
  }

  /**
  * Get value of field E01PEMEPA as a String.
  */
  public String getE01PEMEPA()
  {
    return fieldE01PEMEPA.getString();
  }

  /**
  * Set numeric field E01PEMEPA using a BigDecimal value.
  */
  public void setE01PEMEPA(BigDecimal newvalue)
  {
    fieldE01PEMEPA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PEMEPA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PEMEPA()
  {
    return fieldE01PEMEPA.getBigDecimal();
  }

  /**
  * Set field E01ENDEUD using a String value.
  */
  public void setE01ENDEUD(String newvalue)
  {
    fieldE01ENDEUD.setString(newvalue);
  }

  /**
  * Get value of field E01ENDEUD as a String.
  */
  public String getE01ENDEUD()
  {
    return fieldE01ENDEUD.getString();
  }

  /**
  * Set numeric field E01ENDEUD using a BigDecimal value.
  */
  public void setE01ENDEUD(BigDecimal newvalue)
  {
    fieldE01ENDEUD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ENDEUD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ENDEUD()
  {
    return fieldE01ENDEUD.getBigDecimal();
  }

  /**
  * Set field E01ENDFIN using a String value.
  */
  public void setE01ENDFIN(String newvalue)
  {
    fieldE01ENDFIN.setString(newvalue);
  }

  /**
  * Get value of field E01ENDFIN as a String.
  */
  public String getE01ENDFIN()
  {
    return fieldE01ENDFIN.getString();
  }

  /**
  * Set numeric field E01ENDFIN using a BigDecimal value.
  */
  public void setE01ENDFIN(BigDecimal newvalue)
  {
    fieldE01ENDFIN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ENDFIN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ENDFIN()
  {
    return fieldE01ENDFIN.getBigDecimal();
  }

  /**
  * Set field E01RENACT using a String value.
  */
  public void setE01RENACT(String newvalue)
  {
    fieldE01RENACT.setString(newvalue);
  }

  /**
  * Get value of field E01RENACT as a String.
  */
  public String getE01RENACT()
  {
    return fieldE01RENACT.getString();
  }

  /**
  * Set numeric field E01RENACT using a BigDecimal value.
  */
  public void setE01RENACT(BigDecimal newvalue)
  {
    fieldE01RENACT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RENACT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RENACT()
  {
    return fieldE01RENACT.getBigDecimal();
  }

  /**
  * Set field E01RENPAT using a String value.
  */
  public void setE01RENPAT(String newvalue)
  {
    fieldE01RENPAT.setString(newvalue);
  }

  /**
  * Get value of field E01RENPAT as a String.
  */
  public String getE01RENPAT()
  {
    return fieldE01RENPAT.getString();
  }

  /**
  * Set numeric field E01RENPAT using a BigDecimal value.
  */
  public void setE01RENPAT(BigDecimal newvalue)
  {
    fieldE01RENPAT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RENPAT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RENPAT()
  {
    return fieldE01RENPAT.getBigDecimal();
  }

  /**
  * Set field E01MANEUT using a String value.
  */
  public void setE01MANEUT(String newvalue)
  {
    fieldE01MANEUT.setString(newvalue);
  }

  /**
  * Get value of field E01MANEUT as a String.
  */
  public String getE01MANEUT()
  {
    return fieldE01MANEUT.getString();
  }

  /**
  * Set numeric field E01MANEUT using a BigDecimal value.
  */
  public void setE01MANEUT(BigDecimal newvalue)
  {
    fieldE01MANEUT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MANEUT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MANEUT()
  {
    return fieldE01MANEUT.getBigDecimal();
  }

  /**
  * Set field E01MAROPE using a String value.
  */
  public void setE01MAROPE(String newvalue)
  {
    fieldE01MAROPE.setString(newvalue);
  }

  /**
  * Get value of field E01MAROPE as a String.
  */
  public String getE01MAROPE()
  {
    return fieldE01MAROPE.getString();
  }

  /**
  * Set numeric field E01MAROPE using a BigDecimal value.
  */
  public void setE01MAROPE(BigDecimal newvalue)
  {
    fieldE01MAROPE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01MAROPE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01MAROPE()
  {
    return fieldE01MAROPE.getBigDecimal();
  }

  /**
  * Set field E01RIEPAT using a String value.
  */
  public void setE01RIEPAT(String newvalue)
  {
    fieldE01RIEPAT.setString(newvalue);
  }

  /**
  * Get value of field E01RIEPAT as a String.
  */
  public String getE01RIEPAT()
  {
    return fieldE01RIEPAT.getString();
  }

  /**
  * Set numeric field E01RIEPAT using a BigDecimal value.
  */
  public void setE01RIEPAT(BigDecimal newvalue)
  {
    fieldE01RIEPAT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RIEPAT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RIEPAT()
  {
    return fieldE01RIEPAT.getBigDecimal();
  }

  /**
  * Set field E01RIEVTA using a String value.
  */
  public void setE01RIEVTA(String newvalue)
  {
    fieldE01RIEVTA.setString(newvalue);
  }

  /**
  * Get value of field E01RIEVTA as a String.
  */
  public String getE01RIEVTA()
  {
    return fieldE01RIEVTA.getString();
  }

  /**
  * Set numeric field E01RIEVTA using a BigDecimal value.
  */
  public void setE01RIEVTA(BigDecimal newvalue)
  {
    fieldE01RIEVTA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RIEVTA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RIEVTA()
  {
    return fieldE01RIEVTA.getBigDecimal();
  }

}
