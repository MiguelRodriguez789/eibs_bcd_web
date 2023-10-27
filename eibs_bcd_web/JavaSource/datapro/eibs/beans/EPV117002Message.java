package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EPV117002 physical file definition.
* 
* File level identifier is 1161101092422.
* Record format level identifier is 3F5FD6C807D67.
*/

public class EPV117002Message extends MessageRecord
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
                                     "E02PTVCUN",
                                     "E02PTVNUM",
                                     "E02RUTCLI",
                                     "E02NMECLI",
                                     "E02CNVCLI",
                                     "E02CODBNK",
                                     "E02NUMOFI",
                                     "E02RUNDTM",
                                     "E02RUNDTD",
                                     "E02RUNDTY"
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
                                   "E02PTVCUN",
                                   "E02PTVNUM",
                                   "E02RUTCLI",
                                   "E02NMECLI",
                                   "E02CNVCLI",
                                   "E02CODBNK",
                                   "E02NUMOFI",
                                   "E02RUNDTM",
                                   "E02RUNDTD",
                                   "E02RUNDTY"
                                 };
  final static String fid = "1161101092422";
  final static String rid = "3F5FD6C807D67";
  final static String fmtname = "EPV117002";
  final int FIELDCOUNT = 19;
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
  private DecimalField fieldE02PTVCUN = null;
  private DecimalField fieldE02PTVNUM = null;
  private CharacterField fieldE02RUTCLI = null;
  private CharacterField fieldE02NMECLI = null;
  private CharacterField fieldE02CNVCLI = null;
  private CharacterField fieldE02CODBNK = null;
  private DecimalField fieldE02NUMOFI = null;
  private DecimalField fieldE02RUNDTM = null;
  private DecimalField fieldE02RUNDTD = null;
  private DecimalField fieldE02RUNDTY = null;

  /**
  * Constructor for EPV117002Message.
  */
  public EPV117002Message()
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
    recordsize = 157;
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
    fields[9] = fieldE02PTVCUN =
    new DecimalField(message, HEADERSIZE + 42, 10, 0, "E02PTVCUN");
    fields[10] = fieldE02PTVNUM =
    new DecimalField(message, HEADERSIZE + 52, 13, 0, "E02PTVNUM");
    fields[11] = fieldE02RUTCLI =
    new CharacterField(message, HEADERSIZE + 65, 25, "E02RUTCLI");
    fields[12] = fieldE02NMECLI =
    new CharacterField(message, HEADERSIZE + 90, 45, "E02NMECLI");
    fields[13] = fieldE02CNVCLI =
    new CharacterField(message, HEADERSIZE + 135, 4, "E02CNVCLI");
    fields[14] = fieldE02CODBNK =
    new CharacterField(message, HEADERSIZE + 139, 2, "E02CODBNK");
    fields[15] = fieldE02NUMOFI =
    new DecimalField(message, HEADERSIZE + 141, 5, 0, "E02NUMOFI");
    fields[16] = fieldE02RUNDTM =
    new DecimalField(message, HEADERSIZE + 146, 3, 0, "E02RUNDTM");
    fields[17] = fieldE02RUNDTD =
    new DecimalField(message, HEADERSIZE + 149, 3, 0, "E02RUNDTD");
    fields[18] = fieldE02RUNDTY =
    new DecimalField(message, HEADERSIZE + 152, 5, 0, "E02RUNDTY");

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
  * Set field E02PTVCUN using a String value.
  */
  public void setE02PTVCUN(String newvalue)
  {
    fieldE02PTVCUN.setString(newvalue);
  }

  /**
  * Get value of field E02PTVCUN as a String.
  */
  public String getE02PTVCUN()
  {
    return fieldE02PTVCUN.getString();
  }

  /**
  * Set numeric field E02PTVCUN using a BigDecimal value.
  */
  public void setE02PTVCUN(BigDecimal newvalue)
  {
    fieldE02PTVCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PTVCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PTVCUN()
  {
    return fieldE02PTVCUN.getBigDecimal();
  }

  /**
  * Set field E02PTVNUM using a String value.
  */
  public void setE02PTVNUM(String newvalue)
  {
    fieldE02PTVNUM.setString(newvalue);
  }

  /**
  * Get value of field E02PTVNUM as a String.
  */
  public String getE02PTVNUM()
  {
    return fieldE02PTVNUM.getString();
  }

  /**
  * Set numeric field E02PTVNUM using a BigDecimal value.
  */
  public void setE02PTVNUM(BigDecimal newvalue)
  {
    fieldE02PTVNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PTVNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PTVNUM()
  {
    return fieldE02PTVNUM.getBigDecimal();
  }

  /**
  * Set field E02RUTCLI using a String value.
  */
  public void setE02RUTCLI(String newvalue)
  {
    fieldE02RUTCLI.setString(newvalue);
  }

  /**
  * Get value of field E02RUTCLI as a String.
  */
  public String getE02RUTCLI()
  {
    return fieldE02RUTCLI.getString();
  }

  /**
  * Set field E02NMECLI using a String value.
  */
  public void setE02NMECLI(String newvalue)
  {
    fieldE02NMECLI.setString(newvalue);
  }

  /**
  * Get value of field E02NMECLI as a String.
  */
  public String getE02NMECLI()
  {
    return fieldE02NMECLI.getString();
  }

  /**
  * Set field E02CNVCLI using a String value.
  */
  public void setE02CNVCLI(String newvalue)
  {
    fieldE02CNVCLI.setString(newvalue);
  }

  /**
  * Get value of field E02CNVCLI as a String.
  */
  public String getE02CNVCLI()
  {
    return fieldE02CNVCLI.getString();
  }

  /**
  * Set field E02CODBNK using a String value.
  */
  public void setE02CODBNK(String newvalue)
  {
    fieldE02CODBNK.setString(newvalue);
  }

  /**
  * Get value of field E02CODBNK as a String.
  */
  public String getE02CODBNK()
  {
    return fieldE02CODBNK.getString();
  }

  /**
  * Set field E02NUMOFI using a String value.
  */
  public void setE02NUMOFI(String newvalue)
  {
    fieldE02NUMOFI.setString(newvalue);
  }

  /**
  * Get value of field E02NUMOFI as a String.
  */
  public String getE02NUMOFI()
  {
    return fieldE02NUMOFI.getString();
  }

  /**
  * Set numeric field E02NUMOFI using a BigDecimal value.
  */
  public void setE02NUMOFI(BigDecimal newvalue)
  {
    fieldE02NUMOFI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02NUMOFI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02NUMOFI()
  {
    return fieldE02NUMOFI.getBigDecimal();
  }

  /**
  * Set field E02RUNDTM using a String value.
  */
  public void setE02RUNDTM(String newvalue)
  {
    fieldE02RUNDTM.setString(newvalue);
  }

  /**
  * Get value of field E02RUNDTM as a String.
  */
  public String getE02RUNDTM()
  {
    return fieldE02RUNDTM.getString();
  }

  /**
  * Set numeric field E02RUNDTM using a BigDecimal value.
  */
  public void setE02RUNDTM(BigDecimal newvalue)
  {
    fieldE02RUNDTM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RUNDTM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RUNDTM()
  {
    return fieldE02RUNDTM.getBigDecimal();
  }

  /**
  * Set field E02RUNDTD using a String value.
  */
  public void setE02RUNDTD(String newvalue)
  {
    fieldE02RUNDTD.setString(newvalue);
  }

  /**
  * Get value of field E02RUNDTD as a String.
  */
  public String getE02RUNDTD()
  {
    return fieldE02RUNDTD.getString();
  }

  /**
  * Set numeric field E02RUNDTD using a BigDecimal value.
  */
  public void setE02RUNDTD(BigDecimal newvalue)
  {
    fieldE02RUNDTD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RUNDTD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RUNDTD()
  {
    return fieldE02RUNDTD.getBigDecimal();
  }

  /**
  * Set field E02RUNDTY using a String value.
  */
  public void setE02RUNDTY(String newvalue)
  {
    fieldE02RUNDTY.setString(newvalue);
  }

  /**
  * Get value of field E02RUNDTY as a String.
  */
  public String getE02RUNDTY()
  {
    return fieldE02RUNDTY.getString();
  }

  /**
  * Set numeric field E02RUNDTY using a BigDecimal value.
  */
  public void setE02RUNDTY(BigDecimal newvalue)
  {
    fieldE02RUNDTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RUNDTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RUNDTY()
  {
    return fieldE02RUNDTY.getBigDecimal();
  }

}
