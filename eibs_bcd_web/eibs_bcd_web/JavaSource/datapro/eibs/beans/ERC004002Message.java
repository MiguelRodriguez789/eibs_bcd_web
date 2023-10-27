package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ERC004002 physical file definition.
* 
* File level identifier is 1161013153554.
* Record format level identifier is 48FE879E16FB9.
*/

public class ERC004002Message extends MessageRecord
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
                                     "E02RCTBNK",
                                     "E02RCTCCY",
                                     "E02RCTGLN",
                                     "E02RCTACC",
                                     "E02RCTBDY",
                                     "E02RCTBDM",
                                     "E02RCTBDD",
                                     "E02RCTAPC",
                                     "E02RCTCDE",
                                     "E02RCTAMD",
                                     "E02RCTAMC",
                                     "E02RCTCKN",
                                     "E02RCTTRN",
                                     "E02RCTPMN",
                                     "E02RCTCOD",
                                     "E02RCTPRC",
                                     "E02RCTRTY",
                                     "E02RCTUID"
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
                                   "E02RCTBNK",
                                   "E02RCTCCY",
                                   "E02RCTGLN",
                                   "E02RCTACC",
                                   "E02RCTBDY",
                                   "E02RCTBDM",
                                   "E02RCTBDD",
                                   "E02RCTAPC",
                                   "E02RCTCDE",
                                   "E02RCTAMD",
                                   "E02RCTAMC",
                                   "E02RCTCKN",
                                   "E02RCTTRN",
                                   "E02RCTPMN",
                                   "E02RCTCOD",
                                   "E02RCTPRC",
                                   "E02RCTRTY",
                                   "E02RCTUID"
                                 };
  final static String fid = "1161013153554";
  final static String rid = "48FE879E16FB9";
  final static String fmtname = "ERC004002";
  final int FIELDCOUNT = 27;
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
  private CharacterField fieldE02RCTBNK = null;
  private CharacterField fieldE02RCTCCY = null;
  private DecimalField fieldE02RCTGLN = null;
  private DecimalField fieldE02RCTACC = null;
  private DecimalField fieldE02RCTBDY = null;
  private DecimalField fieldE02RCTBDM = null;
  private DecimalField fieldE02RCTBDD = null;
  private CharacterField fieldE02RCTAPC = null;
  private CharacterField fieldE02RCTCDE = null;
  private DecimalField fieldE02RCTAMD = null;
  private DecimalField fieldE02RCTAMC = null;
  private DecimalField fieldE02RCTCKN = null;
  private DecimalField fieldE02RCTTRN = null;
  private DecimalField fieldE02RCTPMN = null;
  private CharacterField fieldE02RCTCOD = null;
  private CharacterField fieldE02RCTPRC = null;
  private CharacterField fieldE02RCTRTY = null;
  private DecimalField fieldE02RCTUID = null;

  /**
  * Constructor for ERC004002Message.
  */
  public ERC004002Message()
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
    recordsize = 171;
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
    fields[9] = fieldE02RCTBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E02RCTBNK");
    fields[10] = fieldE02RCTCCY =
    new CharacterField(message, HEADERSIZE + 44, 3, "E02RCTCCY");
    fields[11] = fieldE02RCTGLN =
    new DecimalField(message, HEADERSIZE + 47, 17, 0, "E02RCTGLN");
    fields[12] = fieldE02RCTACC =
    new DecimalField(message, HEADERSIZE + 64, 13, 0, "E02RCTACC");
    fields[13] = fieldE02RCTBDY =
    new DecimalField(message, HEADERSIZE + 77, 5, 0, "E02RCTBDY");
    fields[14] = fieldE02RCTBDM =
    new DecimalField(message, HEADERSIZE + 82, 3, 0, "E02RCTBDM");
    fields[15] = fieldE02RCTBDD =
    new DecimalField(message, HEADERSIZE + 85, 3, 0, "E02RCTBDD");
    fields[16] = fieldE02RCTAPC =
    new CharacterField(message, HEADERSIZE + 88, 2, "E02RCTAPC");
    fields[17] = fieldE02RCTCDE =
    new CharacterField(message, HEADERSIZE + 90, 4, "E02RCTCDE");
    fields[18] = fieldE02RCTAMD =
    new DecimalField(message, HEADERSIZE + 94, 17, 2, "E02RCTAMD");
    fields[19] = fieldE02RCTAMC =
    new DecimalField(message, HEADERSIZE + 111, 17, 2, "E02RCTAMC");
    fields[20] = fieldE02RCTCKN =
    new DecimalField(message, HEADERSIZE + 128, 12, 0, "E02RCTCKN");
    fields[21] = fieldE02RCTTRN =
    new DecimalField(message, HEADERSIZE + 140, 6, 0, "E02RCTTRN");
    fields[22] = fieldE02RCTPMN =
    new DecimalField(message, HEADERSIZE + 146, 6, 0, "E02RCTPMN");
    fields[23] = fieldE02RCTCOD =
    new CharacterField(message, HEADERSIZE + 152, 4, "E02RCTCOD");
    fields[24] = fieldE02RCTPRC =
    new CharacterField(message, HEADERSIZE + 156, 1, "E02RCTPRC");
    fields[25] = fieldE02RCTRTY =
    new CharacterField(message, HEADERSIZE + 157, 1, "E02RCTRTY");
    fields[26] = fieldE02RCTUID =
    new DecimalField(message, HEADERSIZE + 158, 13, 0, "E02RCTUID");

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
  * Set field E02RCTBNK using a String value.
  */
  public void setE02RCTBNK(String newvalue)
  {
    fieldE02RCTBNK.setString(newvalue);
  }

  /**
  * Get value of field E02RCTBNK as a String.
  */
  public String getE02RCTBNK()
  {
    return fieldE02RCTBNK.getString();
  }

  /**
  * Set field E02RCTCCY using a String value.
  */
  public void setE02RCTCCY(String newvalue)
  {
    fieldE02RCTCCY.setString(newvalue);
  }

  /**
  * Get value of field E02RCTCCY as a String.
  */
  public String getE02RCTCCY()
  {
    return fieldE02RCTCCY.getString();
  }

  /**
  * Set field E02RCTGLN using a String value.
  */
  public void setE02RCTGLN(String newvalue)
  {
    fieldE02RCTGLN.setString(newvalue);
  }

  /**
  * Get value of field E02RCTGLN as a String.
  */
  public String getE02RCTGLN()
  {
    return fieldE02RCTGLN.getString();
  }

  /**
  * Set numeric field E02RCTGLN using a BigDecimal value.
  */
  public void setE02RCTGLN(BigDecimal newvalue)
  {
    fieldE02RCTGLN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RCTGLN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RCTGLN()
  {
    return fieldE02RCTGLN.getBigDecimal();
  }

  /**
  * Set field E02RCTACC using a String value.
  */
  public void setE02RCTACC(String newvalue)
  {
    fieldE02RCTACC.setString(newvalue);
  }

  /**
  * Get value of field E02RCTACC as a String.
  */
  public String getE02RCTACC()
  {
    return fieldE02RCTACC.getString();
  }

  /**
  * Set numeric field E02RCTACC using a BigDecimal value.
  */
  public void setE02RCTACC(BigDecimal newvalue)
  {
    fieldE02RCTACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RCTACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RCTACC()
  {
    return fieldE02RCTACC.getBigDecimal();
  }

  /**
  * Set field E02RCTBDY using a String value.
  */
  public void setE02RCTBDY(String newvalue)
  {
    fieldE02RCTBDY.setString(newvalue);
  }

  /**
  * Get value of field E02RCTBDY as a String.
  */
  public String getE02RCTBDY()
  {
    return fieldE02RCTBDY.getString();
  }

  /**
  * Set numeric field E02RCTBDY using a BigDecimal value.
  */
  public void setE02RCTBDY(BigDecimal newvalue)
  {
    fieldE02RCTBDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RCTBDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RCTBDY()
  {
    return fieldE02RCTBDY.getBigDecimal();
  }

  /**
  * Set field E02RCTBDM using a String value.
  */
  public void setE02RCTBDM(String newvalue)
  {
    fieldE02RCTBDM.setString(newvalue);
  }

  /**
  * Get value of field E02RCTBDM as a String.
  */
  public String getE02RCTBDM()
  {
    return fieldE02RCTBDM.getString();
  }

  /**
  * Set numeric field E02RCTBDM using a BigDecimal value.
  */
  public void setE02RCTBDM(BigDecimal newvalue)
  {
    fieldE02RCTBDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RCTBDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RCTBDM()
  {
    return fieldE02RCTBDM.getBigDecimal();
  }

  /**
  * Set field E02RCTBDD using a String value.
  */
  public void setE02RCTBDD(String newvalue)
  {
    fieldE02RCTBDD.setString(newvalue);
  }

  /**
  * Get value of field E02RCTBDD as a String.
  */
  public String getE02RCTBDD()
  {
    return fieldE02RCTBDD.getString();
  }

  /**
  * Set numeric field E02RCTBDD using a BigDecimal value.
  */
  public void setE02RCTBDD(BigDecimal newvalue)
  {
    fieldE02RCTBDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RCTBDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RCTBDD()
  {
    return fieldE02RCTBDD.getBigDecimal();
  }

  /**
  * Set field E02RCTAPC using a String value.
  */
  public void setE02RCTAPC(String newvalue)
  {
    fieldE02RCTAPC.setString(newvalue);
  }

  /**
  * Get value of field E02RCTAPC as a String.
  */
  public String getE02RCTAPC()
  {
    return fieldE02RCTAPC.getString();
  }

  /**
  * Set field E02RCTCDE using a String value.
  */
  public void setE02RCTCDE(String newvalue)
  {
    fieldE02RCTCDE.setString(newvalue);
  }

  /**
  * Get value of field E02RCTCDE as a String.
  */
  public String getE02RCTCDE()
  {
    return fieldE02RCTCDE.getString();
  }

  /**
  * Set field E02RCTAMD using a String value.
  */
  public void setE02RCTAMD(String newvalue)
  {
    fieldE02RCTAMD.setString(newvalue);
  }

  /**
  * Get value of field E02RCTAMD as a String.
  */
  public String getE02RCTAMD()
  {
    return fieldE02RCTAMD.getString();
  }

  /**
  * Set numeric field E02RCTAMD using a BigDecimal value.
  */
  public void setE02RCTAMD(BigDecimal newvalue)
  {
    fieldE02RCTAMD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RCTAMD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RCTAMD()
  {
    return fieldE02RCTAMD.getBigDecimal();
  }

  /**
  * Set field E02RCTAMC using a String value.
  */
  public void setE02RCTAMC(String newvalue)
  {
    fieldE02RCTAMC.setString(newvalue);
  }

  /**
  * Get value of field E02RCTAMC as a String.
  */
  public String getE02RCTAMC()
  {
    return fieldE02RCTAMC.getString();
  }

  /**
  * Set numeric field E02RCTAMC using a BigDecimal value.
  */
  public void setE02RCTAMC(BigDecimal newvalue)
  {
    fieldE02RCTAMC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RCTAMC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RCTAMC()
  {
    return fieldE02RCTAMC.getBigDecimal();
  }

  /**
  * Set field E02RCTCKN using a String value.
  */
  public void setE02RCTCKN(String newvalue)
  {
    fieldE02RCTCKN.setString(newvalue);
  }

  /**
  * Get value of field E02RCTCKN as a String.
  */
  public String getE02RCTCKN()
  {
    return fieldE02RCTCKN.getString();
  }

  /**
  * Set numeric field E02RCTCKN using a BigDecimal value.
  */
  public void setE02RCTCKN(BigDecimal newvalue)
  {
    fieldE02RCTCKN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RCTCKN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RCTCKN()
  {
    return fieldE02RCTCKN.getBigDecimal();
  }

  /**
  * Set field E02RCTTRN using a String value.
  */
  public void setE02RCTTRN(String newvalue)
  {
    fieldE02RCTTRN.setString(newvalue);
  }

  /**
  * Get value of field E02RCTTRN as a String.
  */
  public String getE02RCTTRN()
  {
    return fieldE02RCTTRN.getString();
  }

  /**
  * Set numeric field E02RCTTRN using a BigDecimal value.
  */
  public void setE02RCTTRN(BigDecimal newvalue)
  {
    fieldE02RCTTRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RCTTRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RCTTRN()
  {
    return fieldE02RCTTRN.getBigDecimal();
  }

  /**
  * Set field E02RCTPMN using a String value.
  */
  public void setE02RCTPMN(String newvalue)
  {
    fieldE02RCTPMN.setString(newvalue);
  }

  /**
  * Get value of field E02RCTPMN as a String.
  */
  public String getE02RCTPMN()
  {
    return fieldE02RCTPMN.getString();
  }

  /**
  * Set numeric field E02RCTPMN using a BigDecimal value.
  */
  public void setE02RCTPMN(BigDecimal newvalue)
  {
    fieldE02RCTPMN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RCTPMN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RCTPMN()
  {
    return fieldE02RCTPMN.getBigDecimal();
  }

  /**
  * Set field E02RCTCOD using a String value.
  */
  public void setE02RCTCOD(String newvalue)
  {
    fieldE02RCTCOD.setString(newvalue);
  }

  /**
  * Get value of field E02RCTCOD as a String.
  */
  public String getE02RCTCOD()
  {
    return fieldE02RCTCOD.getString();
  }

  /**
  * Set field E02RCTPRC using a String value.
  */
  public void setE02RCTPRC(String newvalue)
  {
    fieldE02RCTPRC.setString(newvalue);
  }

  /**
  * Get value of field E02RCTPRC as a String.
  */
  public String getE02RCTPRC()
  {
    return fieldE02RCTPRC.getString();
  }

  /**
  * Set field E02RCTRTY using a String value.
  */
  public void setE02RCTRTY(String newvalue)
  {
    fieldE02RCTRTY.setString(newvalue);
  }

  /**
  * Get value of field E02RCTRTY as a String.
  */
  public String getE02RCTRTY()
  {
    return fieldE02RCTRTY.getString();
  }

  /**
  * Set field E02RCTUID using a String value.
  */
  public void setE02RCTUID(String newvalue)
  {
    fieldE02RCTUID.setString(newvalue);
  }

  /**
  * Get value of field E02RCTUID as a String.
  */
  public String getE02RCTUID()
  {
    return fieldE02RCTUID.getString();
  }

  /**
  * Set numeric field E02RCTUID using a BigDecimal value.
  */
  public void setE02RCTUID(BigDecimal newvalue)
  {
    fieldE02RCTUID.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02RCTUID as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02RCTUID()
  {
    return fieldE02RCTUID.getBigDecimal();
  }

}
