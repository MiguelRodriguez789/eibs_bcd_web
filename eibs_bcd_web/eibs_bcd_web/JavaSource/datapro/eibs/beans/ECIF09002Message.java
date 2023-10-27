package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECIF09002 physical file definition.
* 
* File level identifier is 1130611112846.
* Record format level identifier is 51E13507D99E4.
*/

public class ECIF09002Message extends MessageRecord
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
                                     "E02INQBNK",
                                     "E02INQBNN",
                                     "E02INQRDY",
                                     "E02INQRDM",
                                     "E02INQOFC",
                                     "E02INQOFN",
                                     "E02INQACT",
                                     "E02INQPAS",
                                     "E02INQOTH"
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
                                   "E02INQBNK",
                                   "E02INQBNN",
                                   "E02INQRDY",
                                   "E02INQRDM",
                                   "E02INQOFC",
                                   "E02INQOFN",
                                   "E02INQACT",
                                   "E02INQPAS",
                                   "E02INQOTH"
                                 };
  final static String fid = "1130611112846";
  final static String rid = "51E13507D99E4";
  final static String fmtname = "ECIF09002";
  final int FIELDCOUNT = 18;
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
  private CharacterField fieldE02INQBNK = null;
  private CharacterField fieldE02INQBNN = null;
  private DecimalField fieldE02INQRDY = null;
  private DecimalField fieldE02INQRDM = null;
  private CharacterField fieldE02INQOFC = null;
  private CharacterField fieldE02INQOFN = null;
  private DecimalField fieldE02INQACT = null;
  private DecimalField fieldE02INQPAS = null;
  private DecimalField fieldE02INQOTH = null;

  /**
  * Constructor for ECIF09002Message.
  */
  public ECIF09002Message()
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
    recordsize = 197;
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
    fields[9] = fieldE02INQBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E02INQBNK");
    fields[10] = fieldE02INQBNN =
    new CharacterField(message, HEADERSIZE + 44, 45, "E02INQBNN");
    fields[11] = fieldE02INQRDY =
    new DecimalField(message, HEADERSIZE + 89, 5, 0, "E02INQRDY");
    fields[12] = fieldE02INQRDM =
    new DecimalField(message, HEADERSIZE + 94, 3, 0, "E02INQRDM");
    fields[13] = fieldE02INQOFC =
    new CharacterField(message, HEADERSIZE + 97, 4, "E02INQOFC");
    fields[14] = fieldE02INQOFN =
    new CharacterField(message, HEADERSIZE + 101, 45, "E02INQOFN");
    fields[15] = fieldE02INQACT =
    new DecimalField(message, HEADERSIZE + 146, 17, 2, "E02INQACT");
    fields[16] = fieldE02INQPAS =
    new DecimalField(message, HEADERSIZE + 163, 17, 2, "E02INQPAS");
    fields[17] = fieldE02INQOTH =
    new DecimalField(message, HEADERSIZE + 180, 17, 2, "E02INQOTH");

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
  * Set field E02INQBNK using a String value.
  */
  public void setE02INQBNK(String newvalue)
  {
    fieldE02INQBNK.setString(newvalue);
  }

  /**
  * Get value of field E02INQBNK as a String.
  */
  public String getE02INQBNK()
  {
    return fieldE02INQBNK.getString();
  }

  /**
  * Set field E02INQBNN using a String value.
  */
  public void setE02INQBNN(String newvalue)
  {
    fieldE02INQBNN.setString(newvalue);
  }

  /**
  * Get value of field E02INQBNN as a String.
  */
  public String getE02INQBNN()
  {
    return fieldE02INQBNN.getString();
  }

  /**
  * Set field E02INQRDY using a String value.
  */
  public void setE02INQRDY(String newvalue)
  {
    fieldE02INQRDY.setString(newvalue);
  }

  /**
  * Get value of field E02INQRDY as a String.
  */
  public String getE02INQRDY()
  {
    return fieldE02INQRDY.getString();
  }

  /**
  * Set numeric field E02INQRDY using a BigDecimal value.
  */
  public void setE02INQRDY(BigDecimal newvalue)
  {
    fieldE02INQRDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02INQRDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02INQRDY()
  {
    return fieldE02INQRDY.getBigDecimal();
  }

  /**
  * Set field E02INQRDM using a String value.
  */
  public void setE02INQRDM(String newvalue)
  {
    fieldE02INQRDM.setString(newvalue);
  }

  /**
  * Get value of field E02INQRDM as a String.
  */
  public String getE02INQRDM()
  {
    return fieldE02INQRDM.getString();
  }

  /**
  * Set numeric field E02INQRDM using a BigDecimal value.
  */
  public void setE02INQRDM(BigDecimal newvalue)
  {
    fieldE02INQRDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02INQRDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02INQRDM()
  {
    return fieldE02INQRDM.getBigDecimal();
  }

  /**
  * Set field E02INQOFC using a String value.
  */
  public void setE02INQOFC(String newvalue)
  {
    fieldE02INQOFC.setString(newvalue);
  }

  /**
  * Get value of field E02INQOFC as a String.
  */
  public String getE02INQOFC()
  {
    return fieldE02INQOFC.getString();
  }

  /**
  * Set field E02INQOFN using a String value.
  */
  public void setE02INQOFN(String newvalue)
  {
    fieldE02INQOFN.setString(newvalue);
  }

  /**
  * Get value of field E02INQOFN as a String.
  */
  public String getE02INQOFN()
  {
    return fieldE02INQOFN.getString();
  }

  /**
  * Set field E02INQACT using a String value.
  */
  public void setE02INQACT(String newvalue)
  {
    fieldE02INQACT.setString(newvalue);
  }

  /**
  * Get value of field E02INQACT as a String.
  */
  public String getE02INQACT()
  {
    return fieldE02INQACT.getString();
  }

  /**
  * Set numeric field E02INQACT using a BigDecimal value.
  */
  public void setE02INQACT(BigDecimal newvalue)
  {
    fieldE02INQACT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02INQACT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02INQACT()
  {
    return fieldE02INQACT.getBigDecimal();
  }

  /**
  * Set field E02INQPAS using a String value.
  */
  public void setE02INQPAS(String newvalue)
  {
    fieldE02INQPAS.setString(newvalue);
  }

  /**
  * Get value of field E02INQPAS as a String.
  */
  public String getE02INQPAS()
  {
    return fieldE02INQPAS.getString();
  }

  /**
  * Set numeric field E02INQPAS using a BigDecimal value.
  */
  public void setE02INQPAS(BigDecimal newvalue)
  {
    fieldE02INQPAS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02INQPAS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02INQPAS()
  {
    return fieldE02INQPAS.getBigDecimal();
  }

  /**
  * Set field E02INQOTH using a String value.
  */
  public void setE02INQOTH(String newvalue)
  {
    fieldE02INQOTH.setString(newvalue);
  }

  /**
  * Get value of field E02INQOTH as a String.
  */
  public String getE02INQOTH()
  {
    return fieldE02INQOTH.getString();
  }

  /**
  * Set numeric field E02INQOTH using a BigDecimal value.
  */
  public void setE02INQOTH(BigDecimal newvalue)
  {
    fieldE02INQOTH.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02INQOTH as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02INQOTH()
  {
    return fieldE02INQOTH.getBigDecimal();
  }

}
