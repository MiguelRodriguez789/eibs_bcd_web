package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECIF10001 physical file definition.
* 
* File level identifier is 1130611112846.
* Record format level identifier is 4612DC3DEEB02.
*/

public class ECIF10001Message extends MessageRecord
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
                                     "E01OFCCDE",
                                     "E01PRDCDE",
                                     "E01TYPCDE",
                                     "E01ACDCDE",
                                     "E01CUSNUM",
                                     "E01CUSNA1",
                                     "E01ACCNUM",
                                     "E01PRNAMT",
                                     "E01INTAMT",
                                     "E01PENAMT",
                                     "E01HLDAMT",
                                     "E01EWDREC",
                                     "E01EWDOPE",
                                     "E01INQCLS",
                                     "E01CUSGRP",
                                     "E01NMEGRP"
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
                                   "E01OFCCDE",
                                   "E01PRDCDE",
                                   "E01TYPCDE",
                                   "E01ACDCDE",
                                   "E01CUSNUM",
                                   "E01CUSNA1",
                                   "E01ACCNUM",
                                   "E01PRNAMT",
                                   "E01INTAMT",
                                   "E01PENAMT",
                                   "E01HLDAMT",
                                   "E01EWDREC",
                                   "E01EWDOPE",
                                   "E01INQCLS",
                                   "E01CUSGRP",
                                   "E01NMEGRP"
                                 };
  final static String fid = "1130611112846";
  final static String rid = "4612DC3DEEB02";
  final static String fmtname = "ECIF10001";
  final int FIELDCOUNT = 25;
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
  private CharacterField fieldE01OFCCDE = null;
  private CharacterField fieldE01PRDCDE = null;
  private CharacterField fieldE01TYPCDE = null;
  private CharacterField fieldE01ACDCDE = null;
  private DecimalField fieldE01CUSNUM = null;
  private CharacterField fieldE01CUSNA1 = null;
  private DecimalField fieldE01ACCNUM = null;
  private DecimalField fieldE01PRNAMT = null;
  private DecimalField fieldE01INTAMT = null;
  private DecimalField fieldE01PENAMT = null;
  private DecimalField fieldE01HLDAMT = null;
  private DecimalField fieldE01EWDREC = null;
  private CharacterField fieldE01EWDOPE = null;
  private CharacterField fieldE01INQCLS = null;
  private DecimalField fieldE01CUSGRP = null;
  private CharacterField fieldE01NMEGRP = null;

  /**
  * Constructor for ECIF10001Message.
  */
  public ECIF10001Message()
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
    fields[9] = fieldE01OFCCDE =
    new CharacterField(message, HEADERSIZE + 42, 4, "E01OFCCDE");
    fields[10] = fieldE01PRDCDE =
    new CharacterField(message, HEADERSIZE + 46, 4, "E01PRDCDE");
    fields[11] = fieldE01TYPCDE =
    new CharacterField(message, HEADERSIZE + 50, 4, "E01TYPCDE");
    fields[12] = fieldE01ACDCDE =
    new CharacterField(message, HEADERSIZE + 54, 2, "E01ACDCDE");
    fields[13] = fieldE01CUSNUM =
    new DecimalField(message, HEADERSIZE + 56, 10, 0, "E01CUSNUM");
    fields[14] = fieldE01CUSNA1 =
    new CharacterField(message, HEADERSIZE + 66, 60, "E01CUSNA1");
    fields[15] = fieldE01ACCNUM =
    new DecimalField(message, HEADERSIZE + 126, 13, 0, "E01ACCNUM");
    fields[16] = fieldE01PRNAMT =
    new DecimalField(message, HEADERSIZE + 139, 17, 2, "E01PRNAMT");
    fields[17] = fieldE01INTAMT =
    new DecimalField(message, HEADERSIZE + 156, 17, 2, "E01INTAMT");
    fields[18] = fieldE01PENAMT =
    new DecimalField(message, HEADERSIZE + 173, 17, 2, "E01PENAMT");
    fields[19] = fieldE01HLDAMT =
    new DecimalField(message, HEADERSIZE + 190, 17, 2, "E01HLDAMT");
    fields[20] = fieldE01EWDREC =
    new DecimalField(message, HEADERSIZE + 207, 8, 0, "E01EWDREC");
    fields[21] = fieldE01EWDOPE =
    new CharacterField(message, HEADERSIZE + 215, 1, "E01EWDOPE");
    fields[22] = fieldE01INQCLS =
    new CharacterField(message, HEADERSIZE + 216, 2, "E01INQCLS");
    fields[23] = fieldE01CUSGRP =
    new DecimalField(message, HEADERSIZE + 218, 10, 0, "E01CUSGRP");
    fields[24] = fieldE01NMEGRP =
    new CharacterField(message, HEADERSIZE + 228, 60, "E01NMEGRP");

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
  * Set field E01OFCCDE using a String value.
  */
  public void setE01OFCCDE(String newvalue)
  {
    fieldE01OFCCDE.setString(newvalue);
  }

  /**
  * Get value of field E01OFCCDE as a String.
  */
  public String getE01OFCCDE()
  {
    return fieldE01OFCCDE.getString();
  }

  /**
  * Set field E01PRDCDE using a String value.
  */
  public void setE01PRDCDE(String newvalue)
  {
    fieldE01PRDCDE.setString(newvalue);
  }

  /**
  * Get value of field E01PRDCDE as a String.
  */
  public String getE01PRDCDE()
  {
    return fieldE01PRDCDE.getString();
  }

  /**
  * Set field E01TYPCDE using a String value.
  */
  public void setE01TYPCDE(String newvalue)
  {
    fieldE01TYPCDE.setString(newvalue);
  }

  /**
  * Get value of field E01TYPCDE as a String.
  */
  public String getE01TYPCDE()
  {
    return fieldE01TYPCDE.getString();
  }

  /**
  * Set field E01ACDCDE using a String value.
  */
  public void setE01ACDCDE(String newvalue)
  {
    fieldE01ACDCDE.setString(newvalue);
  }

  /**
  * Get value of field E01ACDCDE as a String.
  */
  public String getE01ACDCDE()
  {
    return fieldE01ACDCDE.getString();
  }

  /**
  * Set field E01CUSNUM using a String value.
  */
  public void setE01CUSNUM(String newvalue)
  {
    fieldE01CUSNUM.setString(newvalue);
  }

  /**
  * Get value of field E01CUSNUM as a String.
  */
  public String getE01CUSNUM()
  {
    return fieldE01CUSNUM.getString();
  }

  /**
  * Set numeric field E01CUSNUM using a BigDecimal value.
  */
  public void setE01CUSNUM(BigDecimal newvalue)
  {
    fieldE01CUSNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUSNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUSNUM()
  {
    return fieldE01CUSNUM.getBigDecimal();
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
  * Set field E01ACCNUM using a String value.
  */
  public void setE01ACCNUM(String newvalue)
  {
    fieldE01ACCNUM.setString(newvalue);
  }

  /**
  * Get value of field E01ACCNUM as a String.
  */
  public String getE01ACCNUM()
  {
    return fieldE01ACCNUM.getString();
  }

  /**
  * Set numeric field E01ACCNUM using a BigDecimal value.
  */
  public void setE01ACCNUM(BigDecimal newvalue)
  {
    fieldE01ACCNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACCNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACCNUM()
  {
    return fieldE01ACCNUM.getBigDecimal();
  }

  /**
  * Set field E01PRNAMT using a String value.
  */
  public void setE01PRNAMT(String newvalue)
  {
    fieldE01PRNAMT.setString(newvalue);
  }

  /**
  * Get value of field E01PRNAMT as a String.
  */
  public String getE01PRNAMT()
  {
    return fieldE01PRNAMT.getString();
  }

  /**
  * Set numeric field E01PRNAMT using a BigDecimal value.
  */
  public void setE01PRNAMT(BigDecimal newvalue)
  {
    fieldE01PRNAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRNAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRNAMT()
  {
    return fieldE01PRNAMT.getBigDecimal();
  }

  /**
  * Set field E01INTAMT using a String value.
  */
  public void setE01INTAMT(String newvalue)
  {
    fieldE01INTAMT.setString(newvalue);
  }

  /**
  * Get value of field E01INTAMT as a String.
  */
  public String getE01INTAMT()
  {
    return fieldE01INTAMT.getString();
  }

  /**
  * Set numeric field E01INTAMT using a BigDecimal value.
  */
  public void setE01INTAMT(BigDecimal newvalue)
  {
    fieldE01INTAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01INTAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01INTAMT()
  {
    return fieldE01INTAMT.getBigDecimal();
  }

  /**
  * Set field E01PENAMT using a String value.
  */
  public void setE01PENAMT(String newvalue)
  {
    fieldE01PENAMT.setString(newvalue);
  }

  /**
  * Get value of field E01PENAMT as a String.
  */
  public String getE01PENAMT()
  {
    return fieldE01PENAMT.getString();
  }

  /**
  * Set numeric field E01PENAMT using a BigDecimal value.
  */
  public void setE01PENAMT(BigDecimal newvalue)
  {
    fieldE01PENAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PENAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PENAMT()
  {
    return fieldE01PENAMT.getBigDecimal();
  }

  /**
  * Set field E01HLDAMT using a String value.
  */
  public void setE01HLDAMT(String newvalue)
  {
    fieldE01HLDAMT.setString(newvalue);
  }

  /**
  * Get value of field E01HLDAMT as a String.
  */
  public String getE01HLDAMT()
  {
    return fieldE01HLDAMT.getString();
  }

  /**
  * Set numeric field E01HLDAMT using a BigDecimal value.
  */
  public void setE01HLDAMT(BigDecimal newvalue)
  {
    fieldE01HLDAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01HLDAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01HLDAMT()
  {
    return fieldE01HLDAMT.getBigDecimal();
  }

  /**
  * Set field E01EWDREC using a String value.
  */
  public void setE01EWDREC(String newvalue)
  {
    fieldE01EWDREC.setString(newvalue);
  }

  /**
  * Get value of field E01EWDREC as a String.
  */
  public String getE01EWDREC()
  {
    return fieldE01EWDREC.getString();
  }

  /**
  * Set numeric field E01EWDREC using a BigDecimal value.
  */
  public void setE01EWDREC(BigDecimal newvalue)
  {
    fieldE01EWDREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EWDREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EWDREC()
  {
    return fieldE01EWDREC.getBigDecimal();
  }

  /**
  * Set field E01EWDOPE using a String value.
  */
  public void setE01EWDOPE(String newvalue)
  {
    fieldE01EWDOPE.setString(newvalue);
  }

  /**
  * Get value of field E01EWDOPE as a String.
  */
  public String getE01EWDOPE()
  {
    return fieldE01EWDOPE.getString();
  }

  /**
  * Set field E01INQCLS using a String value.
  */
  public void setE01INQCLS(String newvalue)
  {
    fieldE01INQCLS.setString(newvalue);
  }

  /**
  * Get value of field E01INQCLS as a String.
  */
  public String getE01INQCLS()
  {
    return fieldE01INQCLS.getString();
  }

  /**
  * Set field E01CUSGRP using a String value.
  */
  public void setE01CUSGRP(String newvalue)
  {
    fieldE01CUSGRP.setString(newvalue);
  }

  /**
  * Get value of field E01CUSGRP as a String.
  */
  public String getE01CUSGRP()
  {
    return fieldE01CUSGRP.getString();
  }

  /**
  * Set numeric field E01CUSGRP using a BigDecimal value.
  */
  public void setE01CUSGRP(BigDecimal newvalue)
  {
    fieldE01CUSGRP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUSGRP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUSGRP()
  {
    return fieldE01CUSGRP.getBigDecimal();
  }

  /**
  * Set field E01NMEGRP using a String value.
  */
  public void setE01NMEGRP(String newvalue)
  {
    fieldE01NMEGRP.setString(newvalue);
  }

  /**
  * Get value of field E01NMEGRP as a String.
  */
  public String getE01NMEGRP()
  {
    return fieldE01NMEGRP.getString();
  }

}
