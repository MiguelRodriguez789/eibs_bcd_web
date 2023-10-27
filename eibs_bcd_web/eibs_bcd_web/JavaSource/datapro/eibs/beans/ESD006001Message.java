package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESD006001 physical file definition.
* 
* File level identifier is 1150225104804.
* Record format level identifier is 47373A297F2EF.
*/

public class ESD006001Message extends MessageRecord
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
                                     "E01DDSBNK",
                                     "E01DDSACC",
                                     "E01DDSCCY",
                                     "E01DDSCUN",
                                     "D01CUSNA1",
                                     "E01ACMATY",
                                     "E01ACMPRO",
                                     "E01ACMACD"
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
                                   "E01DDSBNK",
                                   "E01DDSACC",
                                   "E01DDSCCY",
                                   "E01DDSCUN",
                                   "D01CUSNA1",
                                   "E01ACMATY",
                                   "E01ACMPRO",
                                   "E01ACMACD"
                                 };
  final static String fid = "1150225104804";
  final static String rid = "47373A297F2EF";
  final static String fmtname = "ESD006001";
  final int FIELDCOUNT = 17;
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
  private CharacterField fieldE01DDSBNK = null;
  private DecimalField fieldE01DDSACC = null;
  private CharacterField fieldE01DDSCCY = null;
  private DecimalField fieldE01DDSCUN = null;
  private CharacterField fieldD01CUSNA1 = null;
  private CharacterField fieldE01ACMATY = null;
  private CharacterField fieldE01ACMPRO = null;
  private CharacterField fieldE01ACMACD = null;

  /**
  * Constructor for ESD006001Message.
  */
  public ESD006001Message()
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
    recordsize = 140;
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
    fields[9] = fieldE01DDSBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01DDSBNK");
    fields[10] = fieldE01DDSACC =
    new DecimalField(message, HEADERSIZE + 44, 13, 0, "E01DDSACC");
    fields[11] = fieldE01DDSCCY =
    new CharacterField(message, HEADERSIZE + 57, 3, "E01DDSCCY");
    fields[12] = fieldE01DDSCUN =
    new DecimalField(message, HEADERSIZE + 60, 10, 0, "E01DDSCUN");
    fields[13] = fieldD01CUSNA1 =
    new CharacterField(message, HEADERSIZE + 70, 60, "D01CUSNA1");
    fields[14] = fieldE01ACMATY =
    new CharacterField(message, HEADERSIZE + 130, 4, "E01ACMATY");
    fields[15] = fieldE01ACMPRO =
    new CharacterField(message, HEADERSIZE + 134, 4, "E01ACMPRO");
    fields[16] = fieldE01ACMACD =
    new CharacterField(message, HEADERSIZE + 138, 2, "E01ACMACD");

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
  * Set field E01DDSBNK using a String value.
  */
  public void setE01DDSBNK(String newvalue)
  {
    fieldE01DDSBNK.setString(newvalue);
  }

  /**
  * Get value of field E01DDSBNK as a String.
  */
  public String getE01DDSBNK()
  {
    return fieldE01DDSBNK.getString();
  }

  /**
  * Set field E01DDSACC using a String value.
  */
  public void setE01DDSACC(String newvalue)
  {
    fieldE01DDSACC.setString(newvalue);
  }

  /**
  * Get value of field E01DDSACC as a String.
  */
  public String getE01DDSACC()
  {
    return fieldE01DDSACC.getString();
  }

  /**
  * Set numeric field E01DDSACC using a BigDecimal value.
  */
  public void setE01DDSACC(BigDecimal newvalue)
  {
    fieldE01DDSACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DDSACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DDSACC()
  {
    return fieldE01DDSACC.getBigDecimal();
  }

  /**
  * Set field E01DDSCCY using a String value.
  */
  public void setE01DDSCCY(String newvalue)
  {
    fieldE01DDSCCY.setString(newvalue);
  }

  /**
  * Get value of field E01DDSCCY as a String.
  */
  public String getE01DDSCCY()
  {
    return fieldE01DDSCCY.getString();
  }

  /**
  * Set field E01DDSCUN using a String value.
  */
  public void setE01DDSCUN(String newvalue)
  {
    fieldE01DDSCUN.setString(newvalue);
  }

  /**
  * Get value of field E01DDSCUN as a String.
  */
  public String getE01DDSCUN()
  {
    return fieldE01DDSCUN.getString();
  }

  /**
  * Set numeric field E01DDSCUN using a BigDecimal value.
  */
  public void setE01DDSCUN(BigDecimal newvalue)
  {
    fieldE01DDSCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DDSCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DDSCUN()
  {
    return fieldE01DDSCUN.getBigDecimal();
  }

  /**
  * Set field D01CUSNA1 using a String value.
  */
  public void setD01CUSNA1(String newvalue)
  {
    fieldD01CUSNA1.setString(newvalue);
  }

  /**
  * Get value of field D01CUSNA1 as a String.
  */
  public String getD01CUSNA1()
  {
    return fieldD01CUSNA1.getString();
  }

  /**
  * Set field E01ACMATY using a String value.
  */
  public void setE01ACMATY(String newvalue)
  {
    fieldE01ACMATY.setString(newvalue);
  }

  /**
  * Get value of field E01ACMATY as a String.
  */
  public String getE01ACMATY()
  {
    return fieldE01ACMATY.getString();
  }

  /**
  * Set field E01ACMPRO using a String value.
  */
  public void setE01ACMPRO(String newvalue)
  {
    fieldE01ACMPRO.setString(newvalue);
  }

  /**
  * Get value of field E01ACMPRO as a String.
  */
  public String getE01ACMPRO()
  {
    return fieldE01ACMPRO.getString();
  }

  /**
  * Set field E01ACMACD using a String value.
  */
  public void setE01ACMACD(String newvalue)
  {
    fieldE01ACMACD.setString(newvalue);
  }

  /**
  * Get value of field E01ACMACD as a String.
  */
  public String getE01ACMACD()
  {
    return fieldE01ACMACD.getString();
  }

}
