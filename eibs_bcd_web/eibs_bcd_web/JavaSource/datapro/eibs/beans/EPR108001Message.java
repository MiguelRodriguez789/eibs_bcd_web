package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EPR108001 physical file definition.
* 
* File level identifier is 1130611113248.
* Record format level identifier is 3AD40FDEDD5DE.
*/

public class EPR108001Message extends MessageRecord
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
                                     "E01PRINUM",
                                     "E01PRIOCU",
                                     "E01CUSNA1",
                                     "E01PRITYP",
                                     "E01PRICDE",
                                     "E01PRITDM",
                                     "E01PRITDD",
                                     "E01PRITDY",
                                     "E01PRITTM",
                                     "E01PRIDAC",
                                     "E01PRIOBN",
                                     "E01PRIOBR",
                                     "E01PRICCY",
                                     "E01PRIAMT",
                                     "E01BTHNUM",
                                     "E01REMARK",
                                     "E01PRIUSR",
                                     "E01NUMREC"
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
                                   "E01PRINUM",
                                   "E01PRIOCU",
                                   "E01CUSNA1",
                                   "E01PRITYP",
                                   "E01PRICDE",
                                   "E01PRITDM",
                                   "E01PRITDD",
                                   "E01PRITDY",
                                   "E01PRITTM",
                                   "E01PRIDAC",
                                   "E01PRIOBN",
                                   "E01PRIOBR",
                                   "E01PRICCY",
                                   "E01PRIAMT",
                                   "E01BTHNUM",
                                   "E01REMARK",
                                   "E01PRIUSR",
                                   "E01NUMREC"
                                 };
  final static String fid = "1130611113248";
  final static String rid = "3AD40FDEDD5DE";
  final static String fmtname = "EPR108001";
  final int FIELDCOUNT = 27;
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
  private DecimalField fieldE01PRINUM = null;
  private DecimalField fieldE01PRIOCU = null;
  private CharacterField fieldE01CUSNA1 = null;
  private CharacterField fieldE01PRITYP = null;
  private CharacterField fieldE01PRICDE = null;
  private DecimalField fieldE01PRITDM = null;
  private DecimalField fieldE01PRITDD = null;
  private DecimalField fieldE01PRITDY = null;
  private CharacterField fieldE01PRITTM = null;
  private DecimalField fieldE01PRIDAC = null;
  private CharacterField fieldE01PRIOBN = null;
  private DecimalField fieldE01PRIOBR = null;
  private CharacterField fieldE01PRICCY = null;
  private DecimalField fieldE01PRIAMT = null;
  private DecimalField fieldE01BTHNUM = null;
  private CharacterField fieldE01REMARK = null;
  private CharacterField fieldE01PRIUSR = null;
  private DecimalField fieldE01NUMREC = null;

  /**
  * Constructor for EPR108001Message.
  */
  public EPR108001Message()
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
    recordsize = 288;
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
    fields[9] = fieldE01PRINUM =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E01PRINUM");
    fields[10] = fieldE01PRIOCU =
    new DecimalField(message, HEADERSIZE + 55, 10, 0, "E01PRIOCU");
    fields[11] = fieldE01CUSNA1 =
    new CharacterField(message, HEADERSIZE + 65, 60, "E01CUSNA1");
    fields[12] = fieldE01PRITYP =
    new CharacterField(message, HEADERSIZE + 125, 1, "E01PRITYP");
    fields[13] = fieldE01PRICDE =
    new CharacterField(message, HEADERSIZE + 126, 1, "E01PRICDE");
    fields[14] = fieldE01PRITDM =
    new DecimalField(message, HEADERSIZE + 127, 3, 0, "E01PRITDM");
    fields[15] = fieldE01PRITDD =
    new DecimalField(message, HEADERSIZE + 130, 3, 0, "E01PRITDD");
    fields[16] = fieldE01PRITDY =
    new DecimalField(message, HEADERSIZE + 133, 5, 0, "E01PRITDY");
    fields[17] = fieldE01PRITTM =
    new CharacterField(message, HEADERSIZE + 138, 26, "E01PRITTM");
    fields[18] = fieldE01PRIDAC =
    new DecimalField(message, HEADERSIZE + 164, 13, 0, "E01PRIDAC");
    fields[19] = fieldE01PRIOBN =
    new CharacterField(message, HEADERSIZE + 177, 2, "E01PRIOBN");
    fields[20] = fieldE01PRIOBR =
    new DecimalField(message, HEADERSIZE + 179, 5, 0, "E01PRIOBR");
    fields[21] = fieldE01PRICCY =
    new CharacterField(message, HEADERSIZE + 184, 3, "E01PRICCY");
    fields[22] = fieldE01PRIAMT =
    new DecimalField(message, HEADERSIZE + 187, 17, 2, "E01PRIAMT");
    fields[23] = fieldE01BTHNUM =
    new DecimalField(message, HEADERSIZE + 204, 6, 0, "E01BTHNUM");
    fields[24] = fieldE01REMARK =
    new CharacterField(message, HEADERSIZE + 210, 60, "E01REMARK");
    fields[25] = fieldE01PRIUSR =
    new CharacterField(message, HEADERSIZE + 270, 10, "E01PRIUSR");
    fields[26] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 280, 8, 0, "E01NUMREC");

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
  * Set field E01PRINUM using a String value.
  */
  public void setE01PRINUM(String newvalue)
  {
    fieldE01PRINUM.setString(newvalue);
  }

  /**
  * Get value of field E01PRINUM as a String.
  */
  public String getE01PRINUM()
  {
    return fieldE01PRINUM.getString();
  }

  /**
  * Set numeric field E01PRINUM using a BigDecimal value.
  */
  public void setE01PRINUM(BigDecimal newvalue)
  {
    fieldE01PRINUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRINUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRINUM()
  {
    return fieldE01PRINUM.getBigDecimal();
  }

  /**
  * Set field E01PRIOCU using a String value.
  */
  public void setE01PRIOCU(String newvalue)
  {
    fieldE01PRIOCU.setString(newvalue);
  }

  /**
  * Get value of field E01PRIOCU as a String.
  */
  public String getE01PRIOCU()
  {
    return fieldE01PRIOCU.getString();
  }

  /**
  * Set numeric field E01PRIOCU using a BigDecimal value.
  */
  public void setE01PRIOCU(BigDecimal newvalue)
  {
    fieldE01PRIOCU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRIOCU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRIOCU()
  {
    return fieldE01PRIOCU.getBigDecimal();
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
  * Set field E01PRITYP using a String value.
  */
  public void setE01PRITYP(String newvalue)
  {
    fieldE01PRITYP.setString(newvalue);
  }

  /**
  * Get value of field E01PRITYP as a String.
  */
  public String getE01PRITYP()
  {
    return fieldE01PRITYP.getString();
  }

  /**
  * Set field E01PRICDE using a String value.
  */
  public void setE01PRICDE(String newvalue)
  {
    fieldE01PRICDE.setString(newvalue);
  }

  /**
  * Get value of field E01PRICDE as a String.
  */
  public String getE01PRICDE()
  {
    return fieldE01PRICDE.getString();
  }

  /**
  * Set field E01PRITDM using a String value.
  */
  public void setE01PRITDM(String newvalue)
  {
    fieldE01PRITDM.setString(newvalue);
  }

  /**
  * Get value of field E01PRITDM as a String.
  */
  public String getE01PRITDM()
  {
    return fieldE01PRITDM.getString();
  }

  /**
  * Set numeric field E01PRITDM using a BigDecimal value.
  */
  public void setE01PRITDM(BigDecimal newvalue)
  {
    fieldE01PRITDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRITDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRITDM()
  {
    return fieldE01PRITDM.getBigDecimal();
  }

  /**
  * Set field E01PRITDD using a String value.
  */
  public void setE01PRITDD(String newvalue)
  {
    fieldE01PRITDD.setString(newvalue);
  }

  /**
  * Get value of field E01PRITDD as a String.
  */
  public String getE01PRITDD()
  {
    return fieldE01PRITDD.getString();
  }

  /**
  * Set numeric field E01PRITDD using a BigDecimal value.
  */
  public void setE01PRITDD(BigDecimal newvalue)
  {
    fieldE01PRITDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRITDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRITDD()
  {
    return fieldE01PRITDD.getBigDecimal();
  }

  /**
  * Set field E01PRITDY using a String value.
  */
  public void setE01PRITDY(String newvalue)
  {
    fieldE01PRITDY.setString(newvalue);
  }

  /**
  * Get value of field E01PRITDY as a String.
  */
  public String getE01PRITDY()
  {
    return fieldE01PRITDY.getString();
  }

  /**
  * Set numeric field E01PRITDY using a BigDecimal value.
  */
  public void setE01PRITDY(BigDecimal newvalue)
  {
    fieldE01PRITDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRITDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRITDY()
  {
    return fieldE01PRITDY.getBigDecimal();
  }

  /**
  * Set field E01PRITTM using a String value.
  */
  public void setE01PRITTM(String newvalue)
  {
    fieldE01PRITTM.setString(newvalue);
  }

  /**
  * Get value of field E01PRITTM as a String.
  */
  public String getE01PRITTM()
  {
    return fieldE01PRITTM.getString();
  }

  /**
  * Set field E01PRIDAC using a String value.
  */
  public void setE01PRIDAC(String newvalue)
  {
    fieldE01PRIDAC.setString(newvalue);
  }

  /**
  * Get value of field E01PRIDAC as a String.
  */
  public String getE01PRIDAC()
  {
    return fieldE01PRIDAC.getString();
  }

  /**
  * Set numeric field E01PRIDAC using a BigDecimal value.
  */
  public void setE01PRIDAC(BigDecimal newvalue)
  {
    fieldE01PRIDAC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRIDAC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRIDAC()
  {
    return fieldE01PRIDAC.getBigDecimal();
  }

  /**
  * Set field E01PRIOBN using a String value.
  */
  public void setE01PRIOBN(String newvalue)
  {
    fieldE01PRIOBN.setString(newvalue);
  }

  /**
  * Get value of field E01PRIOBN as a String.
  */
  public String getE01PRIOBN()
  {
    return fieldE01PRIOBN.getString();
  }

  /**
  * Set field E01PRIOBR using a String value.
  */
  public void setE01PRIOBR(String newvalue)
  {
    fieldE01PRIOBR.setString(newvalue);
  }

  /**
  * Get value of field E01PRIOBR as a String.
  */
  public String getE01PRIOBR()
  {
    return fieldE01PRIOBR.getString();
  }

  /**
  * Set numeric field E01PRIOBR using a BigDecimal value.
  */
  public void setE01PRIOBR(BigDecimal newvalue)
  {
    fieldE01PRIOBR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRIOBR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRIOBR()
  {
    return fieldE01PRIOBR.getBigDecimal();
  }

  /**
  * Set field E01PRICCY using a String value.
  */
  public void setE01PRICCY(String newvalue)
  {
    fieldE01PRICCY.setString(newvalue);
  }

  /**
  * Get value of field E01PRICCY as a String.
  */
  public String getE01PRICCY()
  {
    return fieldE01PRICCY.getString();
  }

  /**
  * Set field E01PRIAMT using a String value.
  */
  public void setE01PRIAMT(String newvalue)
  {
    fieldE01PRIAMT.setString(newvalue);
  }

  /**
  * Get value of field E01PRIAMT as a String.
  */
  public String getE01PRIAMT()
  {
    return fieldE01PRIAMT.getString();
  }

  /**
  * Set numeric field E01PRIAMT using a BigDecimal value.
  */
  public void setE01PRIAMT(BigDecimal newvalue)
  {
    fieldE01PRIAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRIAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRIAMT()
  {
    return fieldE01PRIAMT.getBigDecimal();
  }

  /**
  * Set field E01BTHNUM using a String value.
  */
  public void setE01BTHNUM(String newvalue)
  {
    fieldE01BTHNUM.setString(newvalue);
  }

  /**
  * Get value of field E01BTHNUM as a String.
  */
  public String getE01BTHNUM()
  {
    return fieldE01BTHNUM.getString();
  }

  /**
  * Set numeric field E01BTHNUM using a BigDecimal value.
  */
  public void setE01BTHNUM(BigDecimal newvalue)
  {
    fieldE01BTHNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BTHNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BTHNUM()
  {
    return fieldE01BTHNUM.getBigDecimal();
  }

  /**
  * Set field E01REMARK using a String value.
  */
  public void setE01REMARK(String newvalue)
  {
    fieldE01REMARK.setString(newvalue);
  }

  /**
  * Get value of field E01REMARK as a String.
  */
  public String getE01REMARK()
  {
    return fieldE01REMARK.getString();
  }

  /**
  * Set field E01PRIUSR using a String value.
  */
  public void setE01PRIUSR(String newvalue)
  {
    fieldE01PRIUSR.setString(newvalue);
  }

  /**
  * Get value of field E01PRIUSR as a String.
  */
  public String getE01PRIUSR()
  {
    return fieldE01PRIUSR.getString();
  }

  /**
  * Set field E01NUMREC using a String value.
  */
  public void setE01NUMREC(String newvalue)
  {
    fieldE01NUMREC.setString(newvalue);
  }

  /**
  * Get value of field E01NUMREC as a String.
  */
  public String getE01NUMREC()
  {
    return fieldE01NUMREC.getString();
  }

  /**
  * Set numeric field E01NUMREC using a BigDecimal value.
  */
  public void setE01NUMREC(BigDecimal newvalue)
  {
    fieldE01NUMREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01NUMREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01NUMREC()
  {
    return fieldE01NUMREC.getBigDecimal();
  }

}