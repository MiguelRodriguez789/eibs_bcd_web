package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECIF110P1 physical file definition.
* 
* File level identifier is 1130611112846.
* Record format level identifier is 3E2878B0FCDBF.
*/

public class ECIF110P1Message extends MessageRecord
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
                                     "E01TRAACC",
                                     "E01CUSSHN",
                                     "E01POSDT1",
                                     "E01POSDT2",
                                     "E01POSDT3",
                                     "E01DEPPTD",
                                     "E01TRAREF",
                                     "E01TRANAR",
                                     "E01DEPUNC",
                                     "E01VALDT1",
                                     "E01VALDT2",
                                     "E01VALDT3",
                                     "E01DEPVAL",
                                     "E01WTWVAL",
                                     "E01NETVAL",
                                     "E01OFCCDE",
                                     "E01WTOT01",
                                     "E01WTOT02",
                                     "E01WTOT03",
                                     "E01WTOT04",
                                     "E01WTOT05",
                                     "E01GRPNUM",
                                     "E01GRPNAM",
                                     "E01SGRNUM",
                                     "E01SGRNAM",
                                     "E01COSCEN",
                                     "E01CCNAME",
                                     "E01ALLCCT",
                                     "E01CCAUTH"
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
                                   "E01TRAACC",
                                   "E01CUSSHN",
                                   "E01POSDT1",
                                   "E01POSDT2",
                                   "E01POSDT3",
                                   "E01DEPPTD",
                                   "E01TRAREF",
                                   "E01TRANAR",
                                   "E01DEPUNC",
                                   "E01VALDT1",
                                   "E01VALDT2",
                                   "E01VALDT3",
                                   "E01DEPVAL",
                                   "E01WTWVAL",
                                   "E01NETVAL",
                                   "E01OFCCDE",
                                   "E01WTOT01",
                                   "E01WTOT02",
                                   "E01WTOT03",
                                   "E01WTOT04",
                                   "E01WTOT05",
                                   "E01GRPNUM",
                                   "E01GRPNAM",
                                   "E01SGRNUM",
                                   "E01SGRNAM",
                                   "E01COSCEN",
                                   "E01CCNAME",
                                   "E01ALLCCT",
                                   "E01CCAUTH"
                                 };
  final static String fid = "1130611112846";
  final static String rid = "3E2878B0FCDBF";
  final static String fmtname = "ECIF110P1";
  final int FIELDCOUNT = 38;
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
  private DecimalField fieldE01TRAACC = null;
  private CharacterField fieldE01CUSSHN = null;
  private DecimalField fieldE01POSDT1 = null;
  private DecimalField fieldE01POSDT2 = null;
  private DecimalField fieldE01POSDT3 = null;
  private DecimalField fieldE01DEPPTD = null;
  private CharacterField fieldE01TRAREF = null;
  private CharacterField fieldE01TRANAR = null;
  private DecimalField fieldE01DEPUNC = null;
  private DecimalField fieldE01VALDT1 = null;
  private DecimalField fieldE01VALDT2 = null;
  private DecimalField fieldE01VALDT3 = null;
  private DecimalField fieldE01DEPVAL = null;
  private DecimalField fieldE01WTWVAL = null;
  private DecimalField fieldE01NETVAL = null;
  private CharacterField fieldE01OFCCDE = null;
  private DecimalField fieldE01WTOT01 = null;
  private DecimalField fieldE01WTOT02 = null;
  private DecimalField fieldE01WTOT03 = null;
  private DecimalField fieldE01WTOT04 = null;
  private DecimalField fieldE01WTOT05 = null;
  private CharacterField fieldE01GRPNUM = null;
  private CharacterField fieldE01GRPNAM = null;
  private CharacterField fieldE01SGRNUM = null;
  private CharacterField fieldE01SGRNAM = null;
  private DecimalField fieldE01COSCEN = null;
  private CharacterField fieldE01CCNAME = null;
  private CharacterField fieldE01ALLCCT = null;
  private CharacterField fieldE01CCAUTH = null;

  /**
  * Constructor for ECIF110P1Message.
  */
  public ECIF110P1Message()
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
    recordsize = 3010;
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
    fields[9] = fieldE01TRAACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E01TRAACC");
    fields[10] = fieldE01CUSSHN =
    new CharacterField(message, HEADERSIZE + 55, 45, "E01CUSSHN");
    fields[11] = fieldE01POSDT1 =
    new DecimalField(message, HEADERSIZE + 100, 3, 0, "E01POSDT1");
    fields[12] = fieldE01POSDT2 =
    new DecimalField(message, HEADERSIZE + 103, 3, 0, "E01POSDT2");
    fields[13] = fieldE01POSDT3 =
    new DecimalField(message, HEADERSIZE + 106, 5, 0, "E01POSDT3");
    fields[14] = fieldE01DEPPTD =
    new DecimalField(message, HEADERSIZE + 111, 17, 2, "E01DEPPTD");
    fields[15] = fieldE01TRAREF =
    new CharacterField(message, HEADERSIZE + 128, 60, "E01TRAREF");
    fields[16] = fieldE01TRANAR =
    new CharacterField(message, HEADERSIZE + 188, 60, "E01TRANAR");
    fields[17] = fieldE01DEPUNC =
    new DecimalField(message, HEADERSIZE + 248, 17, 2, "E01DEPUNC");
    fields[18] = fieldE01VALDT1 =
    new DecimalField(message, HEADERSIZE + 265, 3, 0, "E01VALDT1");
    fields[19] = fieldE01VALDT2 =
    new DecimalField(message, HEADERSIZE + 268, 3, 0, "E01VALDT2");
    fields[20] = fieldE01VALDT3 =
    new DecimalField(message, HEADERSIZE + 271, 5, 0, "E01VALDT3");
    fields[21] = fieldE01DEPVAL =
    new DecimalField(message, HEADERSIZE + 276, 17, 2, "E01DEPVAL");
    fields[22] = fieldE01WTWVAL =
    new DecimalField(message, HEADERSIZE + 293, 17, 2, "E01WTWVAL");
    fields[23] = fieldE01NETVAL =
    new DecimalField(message, HEADERSIZE + 310, 17, 2, "E01NETVAL");
    fields[24] = fieldE01OFCCDE =
    new CharacterField(message, HEADERSIZE + 327, 4, "E01OFCCDE");
    fields[25] = fieldE01WTOT01 =
    new DecimalField(message, HEADERSIZE + 331, 17, 2, "E01WTOT01");
    fields[26] = fieldE01WTOT02 =
    new DecimalField(message, HEADERSIZE + 348, 17, 2, "E01WTOT02");
    fields[27] = fieldE01WTOT03 =
    new DecimalField(message, HEADERSIZE + 365, 17, 2, "E01WTOT03");
    fields[28] = fieldE01WTOT04 =
    new DecimalField(message, HEADERSIZE + 382, 17, 2, "E01WTOT04");
    fields[29] = fieldE01WTOT05 =
    new DecimalField(message, HEADERSIZE + 399, 17, 2, "E01WTOT05");
    fields[30] = fieldE01GRPNUM =
    new CharacterField(message, HEADERSIZE + 416, 3, "E01GRPNUM");
    fields[31] = fieldE01GRPNAM =
    new CharacterField(message, HEADERSIZE + 419, 60, "E01GRPNAM");
    fields[32] = fieldE01SGRNUM =
    new CharacterField(message, HEADERSIZE + 479, 3, "E01SGRNUM");
    fields[33] = fieldE01SGRNAM =
    new CharacterField(message, HEADERSIZE + 482, 60, "E01SGRNAM");
    fields[34] = fieldE01COSCEN =
    new DecimalField(message, HEADERSIZE + 542, 7, 0, "E01COSCEN");
    fields[35] = fieldE01CCNAME =
    new CharacterField(message, HEADERSIZE + 549, 60, "E01CCNAME");
    fields[36] = fieldE01ALLCCT =
    new CharacterField(message, HEADERSIZE + 609, 1, "E01ALLCCT");
    fields[37] = fieldE01CCAUTH =
    new CharacterField(message, HEADERSIZE + 610, 2400, "E01CCAUTH");

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
  * Set field E01TRAACC using a String value.
  */
  public void setE01TRAACC(String newvalue)
  {
    fieldE01TRAACC.setString(newvalue);
  }

  /**
  * Get value of field E01TRAACC as a String.
  */
  public String getE01TRAACC()
  {
    return fieldE01TRAACC.getString();
  }

  /**
  * Set numeric field E01TRAACC using a BigDecimal value.
  */
  public void setE01TRAACC(BigDecimal newvalue)
  {
    fieldE01TRAACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01TRAACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01TRAACC()
  {
    return fieldE01TRAACC.getBigDecimal();
  }

  /**
  * Set field E01CUSSHN using a String value.
  */
  public void setE01CUSSHN(String newvalue)
  {
    fieldE01CUSSHN.setString(newvalue);
  }

  /**
  * Get value of field E01CUSSHN as a String.
  */
  public String getE01CUSSHN()
  {
    return fieldE01CUSSHN.getString();
  }

  /**
  * Set field E01POSDT1 using a String value.
  */
  public void setE01POSDT1(String newvalue)
  {
    fieldE01POSDT1.setString(newvalue);
  }

  /**
  * Get value of field E01POSDT1 as a String.
  */
  public String getE01POSDT1()
  {
    return fieldE01POSDT1.getString();
  }

  /**
  * Set numeric field E01POSDT1 using a BigDecimal value.
  */
  public void setE01POSDT1(BigDecimal newvalue)
  {
    fieldE01POSDT1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01POSDT1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01POSDT1()
  {
    return fieldE01POSDT1.getBigDecimal();
  }

  /**
  * Set field E01POSDT2 using a String value.
  */
  public void setE01POSDT2(String newvalue)
  {
    fieldE01POSDT2.setString(newvalue);
  }

  /**
  * Get value of field E01POSDT2 as a String.
  */
  public String getE01POSDT2()
  {
    return fieldE01POSDT2.getString();
  }

  /**
  * Set numeric field E01POSDT2 using a BigDecimal value.
  */
  public void setE01POSDT2(BigDecimal newvalue)
  {
    fieldE01POSDT2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01POSDT2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01POSDT2()
  {
    return fieldE01POSDT2.getBigDecimal();
  }

  /**
  * Set field E01POSDT3 using a String value.
  */
  public void setE01POSDT3(String newvalue)
  {
    fieldE01POSDT3.setString(newvalue);
  }

  /**
  * Get value of field E01POSDT3 as a String.
  */
  public String getE01POSDT3()
  {
    return fieldE01POSDT3.getString();
  }

  /**
  * Set numeric field E01POSDT3 using a BigDecimal value.
  */
  public void setE01POSDT3(BigDecimal newvalue)
  {
    fieldE01POSDT3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01POSDT3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01POSDT3()
  {
    return fieldE01POSDT3.getBigDecimal();
  }

  /**
  * Set field E01DEPPTD using a String value.
  */
  public void setE01DEPPTD(String newvalue)
  {
    fieldE01DEPPTD.setString(newvalue);
  }

  /**
  * Get value of field E01DEPPTD as a String.
  */
  public String getE01DEPPTD()
  {
    return fieldE01DEPPTD.getString();
  }

  /**
  * Set numeric field E01DEPPTD using a BigDecimal value.
  */
  public void setE01DEPPTD(BigDecimal newvalue)
  {
    fieldE01DEPPTD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEPPTD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEPPTD()
  {
    return fieldE01DEPPTD.getBigDecimal();
  }

  /**
  * Set field E01TRAREF using a String value.
  */
  public void setE01TRAREF(String newvalue)
  {
    fieldE01TRAREF.setString(newvalue);
  }

  /**
  * Get value of field E01TRAREF as a String.
  */
  public String getE01TRAREF()
  {
    return fieldE01TRAREF.getString();
  }

  /**
  * Set field E01TRANAR using a String value.
  */
  public void setE01TRANAR(String newvalue)
  {
    fieldE01TRANAR.setString(newvalue);
  }

  /**
  * Get value of field E01TRANAR as a String.
  */
  public String getE01TRANAR()
  {
    return fieldE01TRANAR.getString();
  }

  /**
  * Set field E01DEPUNC using a String value.
  */
  public void setE01DEPUNC(String newvalue)
  {
    fieldE01DEPUNC.setString(newvalue);
  }

  /**
  * Get value of field E01DEPUNC as a String.
  */
  public String getE01DEPUNC()
  {
    return fieldE01DEPUNC.getString();
  }

  /**
  * Set numeric field E01DEPUNC using a BigDecimal value.
  */
  public void setE01DEPUNC(BigDecimal newvalue)
  {
    fieldE01DEPUNC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEPUNC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEPUNC()
  {
    return fieldE01DEPUNC.getBigDecimal();
  }

  /**
  * Set field E01VALDT1 using a String value.
  */
  public void setE01VALDT1(String newvalue)
  {
    fieldE01VALDT1.setString(newvalue);
  }

  /**
  * Get value of field E01VALDT1 as a String.
  */
  public String getE01VALDT1()
  {
    return fieldE01VALDT1.getString();
  }

  /**
  * Set numeric field E01VALDT1 using a BigDecimal value.
  */
  public void setE01VALDT1(BigDecimal newvalue)
  {
    fieldE01VALDT1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01VALDT1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01VALDT1()
  {
    return fieldE01VALDT1.getBigDecimal();
  }

  /**
  * Set field E01VALDT2 using a String value.
  */
  public void setE01VALDT2(String newvalue)
  {
    fieldE01VALDT2.setString(newvalue);
  }

  /**
  * Get value of field E01VALDT2 as a String.
  */
  public String getE01VALDT2()
  {
    return fieldE01VALDT2.getString();
  }

  /**
  * Set numeric field E01VALDT2 using a BigDecimal value.
  */
  public void setE01VALDT2(BigDecimal newvalue)
  {
    fieldE01VALDT2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01VALDT2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01VALDT2()
  {
    return fieldE01VALDT2.getBigDecimal();
  }

  /**
  * Set field E01VALDT3 using a String value.
  */
  public void setE01VALDT3(String newvalue)
  {
    fieldE01VALDT3.setString(newvalue);
  }

  /**
  * Get value of field E01VALDT3 as a String.
  */
  public String getE01VALDT3()
  {
    return fieldE01VALDT3.getString();
  }

  /**
  * Set numeric field E01VALDT3 using a BigDecimal value.
  */
  public void setE01VALDT3(BigDecimal newvalue)
  {
    fieldE01VALDT3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01VALDT3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01VALDT3()
  {
    return fieldE01VALDT3.getBigDecimal();
  }

  /**
  * Set field E01DEPVAL using a String value.
  */
  public void setE01DEPVAL(String newvalue)
  {
    fieldE01DEPVAL.setString(newvalue);
  }

  /**
  * Get value of field E01DEPVAL as a String.
  */
  public String getE01DEPVAL()
  {
    return fieldE01DEPVAL.getString();
  }

  /**
  * Set numeric field E01DEPVAL using a BigDecimal value.
  */
  public void setE01DEPVAL(BigDecimal newvalue)
  {
    fieldE01DEPVAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DEPVAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DEPVAL()
  {
    return fieldE01DEPVAL.getBigDecimal();
  }

  /**
  * Set field E01WTWVAL using a String value.
  */
  public void setE01WTWVAL(String newvalue)
  {
    fieldE01WTWVAL.setString(newvalue);
  }

  /**
  * Get value of field E01WTWVAL as a String.
  */
  public String getE01WTWVAL()
  {
    return fieldE01WTWVAL.getString();
  }

  /**
  * Set numeric field E01WTWVAL using a BigDecimal value.
  */
  public void setE01WTWVAL(BigDecimal newvalue)
  {
    fieldE01WTWVAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01WTWVAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01WTWVAL()
  {
    return fieldE01WTWVAL.getBigDecimal();
  }

  /**
  * Set field E01NETVAL using a String value.
  */
  public void setE01NETVAL(String newvalue)
  {
    fieldE01NETVAL.setString(newvalue);
  }

  /**
  * Get value of field E01NETVAL as a String.
  */
  public String getE01NETVAL()
  {
    return fieldE01NETVAL.getString();
  }

  /**
  * Set numeric field E01NETVAL using a BigDecimal value.
  */
  public void setE01NETVAL(BigDecimal newvalue)
  {
    fieldE01NETVAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01NETVAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01NETVAL()
  {
    return fieldE01NETVAL.getBigDecimal();
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
  * Set field E01WTOT01 using a String value.
  */
  public void setE01WTOT01(String newvalue)
  {
    fieldE01WTOT01.setString(newvalue);
  }

  /**
  * Get value of field E01WTOT01 as a String.
  */
  public String getE01WTOT01()
  {
    return fieldE01WTOT01.getString();
  }

  /**
  * Set numeric field E01WTOT01 using a BigDecimal value.
  */
  public void setE01WTOT01(BigDecimal newvalue)
  {
    fieldE01WTOT01.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01WTOT01 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01WTOT01()
  {
    return fieldE01WTOT01.getBigDecimal();
  }

  /**
  * Set field E01WTOT02 using a String value.
  */
  public void setE01WTOT02(String newvalue)
  {
    fieldE01WTOT02.setString(newvalue);
  }

  /**
  * Get value of field E01WTOT02 as a String.
  */
  public String getE01WTOT02()
  {
    return fieldE01WTOT02.getString();
  }

  /**
  * Set numeric field E01WTOT02 using a BigDecimal value.
  */
  public void setE01WTOT02(BigDecimal newvalue)
  {
    fieldE01WTOT02.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01WTOT02 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01WTOT02()
  {
    return fieldE01WTOT02.getBigDecimal();
  }

  /**
  * Set field E01WTOT03 using a String value.
  */
  public void setE01WTOT03(String newvalue)
  {
    fieldE01WTOT03.setString(newvalue);
  }

  /**
  * Get value of field E01WTOT03 as a String.
  */
  public String getE01WTOT03()
  {
    return fieldE01WTOT03.getString();
  }

  /**
  * Set numeric field E01WTOT03 using a BigDecimal value.
  */
  public void setE01WTOT03(BigDecimal newvalue)
  {
    fieldE01WTOT03.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01WTOT03 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01WTOT03()
  {
    return fieldE01WTOT03.getBigDecimal();
  }

  /**
  * Set field E01WTOT04 using a String value.
  */
  public void setE01WTOT04(String newvalue)
  {
    fieldE01WTOT04.setString(newvalue);
  }

  /**
  * Get value of field E01WTOT04 as a String.
  */
  public String getE01WTOT04()
  {
    return fieldE01WTOT04.getString();
  }

  /**
  * Set numeric field E01WTOT04 using a BigDecimal value.
  */
  public void setE01WTOT04(BigDecimal newvalue)
  {
    fieldE01WTOT04.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01WTOT04 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01WTOT04()
  {
    return fieldE01WTOT04.getBigDecimal();
  }

  /**
  * Set field E01WTOT05 using a String value.
  */
  public void setE01WTOT05(String newvalue)
  {
    fieldE01WTOT05.setString(newvalue);
  }

  /**
  * Get value of field E01WTOT05 as a String.
  */
  public String getE01WTOT05()
  {
    return fieldE01WTOT05.getString();
  }

  /**
  * Set numeric field E01WTOT05 using a BigDecimal value.
  */
  public void setE01WTOT05(BigDecimal newvalue)
  {
    fieldE01WTOT05.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01WTOT05 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01WTOT05()
  {
    return fieldE01WTOT05.getBigDecimal();
  }

  /**
  * Set field E01GRPNUM using a String value.
  */
  public void setE01GRPNUM(String newvalue)
  {
    fieldE01GRPNUM.setString(newvalue);
  }

  /**
  * Get value of field E01GRPNUM as a String.
  */
  public String getE01GRPNUM()
  {
    return fieldE01GRPNUM.getString();
  }

  /**
  * Set field E01GRPNAM using a String value.
  */
  public void setE01GRPNAM(String newvalue)
  {
    fieldE01GRPNAM.setString(newvalue);
  }

  /**
  * Get value of field E01GRPNAM as a String.
  */
  public String getE01GRPNAM()
  {
    return fieldE01GRPNAM.getString();
  }

  /**
  * Set field E01SGRNUM using a String value.
  */
  public void setE01SGRNUM(String newvalue)
  {
    fieldE01SGRNUM.setString(newvalue);
  }

  /**
  * Get value of field E01SGRNUM as a String.
  */
  public String getE01SGRNUM()
  {
    return fieldE01SGRNUM.getString();
  }

  /**
  * Set field E01SGRNAM using a String value.
  */
  public void setE01SGRNAM(String newvalue)
  {
    fieldE01SGRNAM.setString(newvalue);
  }

  /**
  * Get value of field E01SGRNAM as a String.
  */
  public String getE01SGRNAM()
  {
    return fieldE01SGRNAM.getString();
  }

  /**
  * Set field E01COSCEN using a String value.
  */
  public void setE01COSCEN(String newvalue)
  {
    fieldE01COSCEN.setString(newvalue);
  }

  /**
  * Get value of field E01COSCEN as a String.
  */
  public String getE01COSCEN()
  {
    return fieldE01COSCEN.getString();
  }

  /**
  * Set numeric field E01COSCEN using a BigDecimal value.
  */
  public void setE01COSCEN(BigDecimal newvalue)
  {
    fieldE01COSCEN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01COSCEN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01COSCEN()
  {
    return fieldE01COSCEN.getBigDecimal();
  }

  /**
  * Set field E01CCNAME using a String value.
  */
  public void setE01CCNAME(String newvalue)
  {
    fieldE01CCNAME.setString(newvalue);
  }

  /**
  * Get value of field E01CCNAME as a String.
  */
  public String getE01CCNAME()
  {
    return fieldE01CCNAME.getString();
  }

  /**
  * Set field E01ALLCCT using a String value.
  */
  public void setE01ALLCCT(String newvalue)
  {
    fieldE01ALLCCT.setString(newvalue);
  }

  /**
  * Get value of field E01ALLCCT as a String.
  */
  public String getE01ALLCCT()
  {
    return fieldE01ALLCCT.getString();
  }

  /**
  * Set field E01CCAUTH using a String value.
  */
  public void setE01CCAUTH(String newvalue)
  {
    fieldE01CCAUTH.setString(newvalue);
  }

  /**
  * Get value of field E01CCAUTH as a String.
  */
  public String getE01CCAUTH()
  {
    return fieldE01CCAUTH.getString();
  }

}
