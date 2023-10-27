package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESD095201 physical file definition.
* 
* File level identifier is 1130611113400.
* Record format level identifier is 3F36A87B1ECEE.
*/

public class ESD095201Message extends MessageRecord
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
                                     "E01PRMBNK",
                                     "E01PRMCCY",
                                     "E01PRMDDC",
                                     "E01PRMDFY",
                                     "E01PRMDFM",
                                     "E01PRMDFD",
                                     "E01PRMDTY",
                                     "E01PRMDTM",
                                     "E01PRMDTD",
                                     "E01RTRBNK",
                                     "E01RTRCCY",
                                     "E01RTRRDY",
                                     "E01RTRRDM",
                                     "E01RTRRDD",
                                     "E01RTREXR",
                                     "E01RTRREC",
                                     "E01RTROPE"
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
                                   "E01PRMBNK",
                                   "E01PRMCCY",
                                   "E01PRMDDC",
                                   "E01PRMDFY",
                                   "E01PRMDFM",
                                   "E01PRMDFD",
                                   "E01PRMDTY",
                                   "E01PRMDTM",
                                   "E01PRMDTD",
                                   "E01RTRBNK",
                                   "E01RTRCCY",
                                   "E01RTRRDY",
                                   "E01RTRRDM",
                                   "E01RTRRDD",
                                   "E01RTREXR",
                                   "E01RTRREC",
                                   "E01RTROPE"
                                 };
  final static String fid = "1130611113400";
  final static String rid = "3F36A87B1ECEE";
  final static String fmtname = "ESD095201";
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
  private CharacterField fieldE01PRMBNK = null;
  private CharacterField fieldE01PRMCCY = null;
  private DecimalField fieldE01PRMDDC = null;
  private DecimalField fieldE01PRMDFY = null;
  private DecimalField fieldE01PRMDFM = null;
  private DecimalField fieldE01PRMDFD = null;
  private DecimalField fieldE01PRMDTY = null;
  private DecimalField fieldE01PRMDTM = null;
  private DecimalField fieldE01PRMDTD = null;
  private CharacterField fieldE01RTRBNK = null;
  private CharacterField fieldE01RTRCCY = null;
  private DecimalField fieldE01RTRRDY = null;
  private DecimalField fieldE01RTRRDM = null;
  private DecimalField fieldE01RTRRDD = null;
  private DecimalField fieldE01RTREXR = null;
  private DecimalField fieldE01RTRREC = null;
  private CharacterField fieldE01RTROPE = null;

  /**
  * Constructor for ESD095201Message.
  */
  public ESD095201Message()
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
    recordsize = 109;
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
    fields[9] = fieldE01PRMBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01PRMBNK");
    fields[10] = fieldE01PRMCCY =
    new CharacterField(message, HEADERSIZE + 44, 3, "E01PRMCCY");
    fields[11] = fieldE01PRMDDC =
    new DecimalField(message, HEADERSIZE + 47, 2, 0, "E01PRMDDC");
    fields[12] = fieldE01PRMDFY =
    new DecimalField(message, HEADERSIZE + 49, 5, 0, "E01PRMDFY");
    fields[13] = fieldE01PRMDFM =
    new DecimalField(message, HEADERSIZE + 54, 3, 0, "E01PRMDFM");
    fields[14] = fieldE01PRMDFD =
    new DecimalField(message, HEADERSIZE + 57, 3, 0, "E01PRMDFD");
    fields[15] = fieldE01PRMDTY =
    new DecimalField(message, HEADERSIZE + 60, 5, 0, "E01PRMDTY");
    fields[16] = fieldE01PRMDTM =
    new DecimalField(message, HEADERSIZE + 65, 3, 0, "E01PRMDTM");
    fields[17] = fieldE01PRMDTD =
    new DecimalField(message, HEADERSIZE + 68, 3, 0, "E01PRMDTD");
    fields[18] = fieldE01RTRBNK =
    new CharacterField(message, HEADERSIZE + 71, 2, "E01RTRBNK");
    fields[19] = fieldE01RTRCCY =
    new CharacterField(message, HEADERSIZE + 73, 3, "E01RTRCCY");
    fields[20] = fieldE01RTRRDY =
    new DecimalField(message, HEADERSIZE + 76, 5, 0, "E01RTRRDY");
    fields[21] = fieldE01RTRRDM =
    new DecimalField(message, HEADERSIZE + 81, 3, 0, "E01RTRRDM");
    fields[22] = fieldE01RTRRDD =
    new DecimalField(message, HEADERSIZE + 84, 3, 0, "E01RTRRDD");
    fields[23] = fieldE01RTREXR =
    new DecimalField(message, HEADERSIZE + 87, 13, 6, "E01RTREXR");
    fields[24] = fieldE01RTRREC =
    new DecimalField(message, HEADERSIZE + 100, 8, 0, "E01RTRREC");
    fields[25] = fieldE01RTROPE =
    new CharacterField(message, HEADERSIZE + 108, 1, "E01RTROPE");

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
  * Set field E01PRMBNK using a String value.
  */
  public void setE01PRMBNK(String newvalue)
  {
    fieldE01PRMBNK.setString(newvalue);
  }

  /**
  * Get value of field E01PRMBNK as a String.
  */
  public String getE01PRMBNK()
  {
    return fieldE01PRMBNK.getString();
  }

  /**
  * Set field E01PRMCCY using a String value.
  */
  public void setE01PRMCCY(String newvalue)
  {
    fieldE01PRMCCY.setString(newvalue);
  }

  /**
  * Get value of field E01PRMCCY as a String.
  */
  public String getE01PRMCCY()
  {
    return fieldE01PRMCCY.getString();
  }

  /**
  * Set field E01PRMDDC using a String value.
  */
  public void setE01PRMDDC(String newvalue)
  {
    fieldE01PRMDDC.setString(newvalue);
  }

  /**
  * Get value of field E01PRMDDC as a String.
  */
  public String getE01PRMDDC()
  {
    return fieldE01PRMDDC.getString();
  }

  /**
  * Set numeric field E01PRMDDC using a BigDecimal value.
  */
  public void setE01PRMDDC(BigDecimal newvalue)
  {
    fieldE01PRMDDC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRMDDC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRMDDC()
  {
    return fieldE01PRMDDC.getBigDecimal();
  }

  /**
  * Set field E01PRMDFY using a String value.
  */
  public void setE01PRMDFY(String newvalue)
  {
    fieldE01PRMDFY.setString(newvalue);
  }

  /**
  * Get value of field E01PRMDFY as a String.
  */
  public String getE01PRMDFY()
  {
    return fieldE01PRMDFY.getString();
  }

  /**
  * Set numeric field E01PRMDFY using a BigDecimal value.
  */
  public void setE01PRMDFY(BigDecimal newvalue)
  {
    fieldE01PRMDFY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRMDFY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRMDFY()
  {
    return fieldE01PRMDFY.getBigDecimal();
  }

  /**
  * Set field E01PRMDFM using a String value.
  */
  public void setE01PRMDFM(String newvalue)
  {
    fieldE01PRMDFM.setString(newvalue);
  }

  /**
  * Get value of field E01PRMDFM as a String.
  */
  public String getE01PRMDFM()
  {
    return fieldE01PRMDFM.getString();
  }

  /**
  * Set numeric field E01PRMDFM using a BigDecimal value.
  */
  public void setE01PRMDFM(BigDecimal newvalue)
  {
    fieldE01PRMDFM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRMDFM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRMDFM()
  {
    return fieldE01PRMDFM.getBigDecimal();
  }

  /**
  * Set field E01PRMDFD using a String value.
  */
  public void setE01PRMDFD(String newvalue)
  {
    fieldE01PRMDFD.setString(newvalue);
  }

  /**
  * Get value of field E01PRMDFD as a String.
  */
  public String getE01PRMDFD()
  {
    return fieldE01PRMDFD.getString();
  }

  /**
  * Set numeric field E01PRMDFD using a BigDecimal value.
  */
  public void setE01PRMDFD(BigDecimal newvalue)
  {
    fieldE01PRMDFD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRMDFD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRMDFD()
  {
    return fieldE01PRMDFD.getBigDecimal();
  }

  /**
  * Set field E01PRMDTY using a String value.
  */
  public void setE01PRMDTY(String newvalue)
  {
    fieldE01PRMDTY.setString(newvalue);
  }

  /**
  * Get value of field E01PRMDTY as a String.
  */
  public String getE01PRMDTY()
  {
    return fieldE01PRMDTY.getString();
  }

  /**
  * Set numeric field E01PRMDTY using a BigDecimal value.
  */
  public void setE01PRMDTY(BigDecimal newvalue)
  {
    fieldE01PRMDTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRMDTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRMDTY()
  {
    return fieldE01PRMDTY.getBigDecimal();
  }

  /**
  * Set field E01PRMDTM using a String value.
  */
  public void setE01PRMDTM(String newvalue)
  {
    fieldE01PRMDTM.setString(newvalue);
  }

  /**
  * Get value of field E01PRMDTM as a String.
  */
  public String getE01PRMDTM()
  {
    return fieldE01PRMDTM.getString();
  }

  /**
  * Set numeric field E01PRMDTM using a BigDecimal value.
  */
  public void setE01PRMDTM(BigDecimal newvalue)
  {
    fieldE01PRMDTM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRMDTM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRMDTM()
  {
    return fieldE01PRMDTM.getBigDecimal();
  }

  /**
  * Set field E01PRMDTD using a String value.
  */
  public void setE01PRMDTD(String newvalue)
  {
    fieldE01PRMDTD.setString(newvalue);
  }

  /**
  * Get value of field E01PRMDTD as a String.
  */
  public String getE01PRMDTD()
  {
    return fieldE01PRMDTD.getString();
  }

  /**
  * Set numeric field E01PRMDTD using a BigDecimal value.
  */
  public void setE01PRMDTD(BigDecimal newvalue)
  {
    fieldE01PRMDTD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PRMDTD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PRMDTD()
  {
    return fieldE01PRMDTD.getBigDecimal();
  }

  /**
  * Set field E01RTRBNK using a String value.
  */
  public void setE01RTRBNK(String newvalue)
  {
    fieldE01RTRBNK.setString(newvalue);
  }

  /**
  * Get value of field E01RTRBNK as a String.
  */
  public String getE01RTRBNK()
  {
    return fieldE01RTRBNK.getString();
  }

  /**
  * Set field E01RTRCCY using a String value.
  */
  public void setE01RTRCCY(String newvalue)
  {
    fieldE01RTRCCY.setString(newvalue);
  }

  /**
  * Get value of field E01RTRCCY as a String.
  */
  public String getE01RTRCCY()
  {
    return fieldE01RTRCCY.getString();
  }

  /**
  * Set field E01RTRRDY using a String value.
  */
  public void setE01RTRRDY(String newvalue)
  {
    fieldE01RTRRDY.setString(newvalue);
  }

  /**
  * Get value of field E01RTRRDY as a String.
  */
  public String getE01RTRRDY()
  {
    return fieldE01RTRRDY.getString();
  }

  /**
  * Set numeric field E01RTRRDY using a BigDecimal value.
  */
  public void setE01RTRRDY(BigDecimal newvalue)
  {
    fieldE01RTRRDY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RTRRDY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RTRRDY()
  {
    return fieldE01RTRRDY.getBigDecimal();
  }

  /**
  * Set field E01RTRRDM using a String value.
  */
  public void setE01RTRRDM(String newvalue)
  {
    fieldE01RTRRDM.setString(newvalue);
  }

  /**
  * Get value of field E01RTRRDM as a String.
  */
  public String getE01RTRRDM()
  {
    return fieldE01RTRRDM.getString();
  }

  /**
  * Set numeric field E01RTRRDM using a BigDecimal value.
  */
  public void setE01RTRRDM(BigDecimal newvalue)
  {
    fieldE01RTRRDM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RTRRDM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RTRRDM()
  {
    return fieldE01RTRRDM.getBigDecimal();
  }

  /**
  * Set field E01RTRRDD using a String value.
  */
  public void setE01RTRRDD(String newvalue)
  {
    fieldE01RTRRDD.setString(newvalue);
  }

  /**
  * Get value of field E01RTRRDD as a String.
  */
  public String getE01RTRRDD()
  {
    return fieldE01RTRRDD.getString();
  }

  /**
  * Set numeric field E01RTRRDD using a BigDecimal value.
  */
  public void setE01RTRRDD(BigDecimal newvalue)
  {
    fieldE01RTRRDD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RTRRDD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RTRRDD()
  {
    return fieldE01RTRRDD.getBigDecimal();
  }

  /**
  * Set field E01RTREXR using a String value.
  */
  public void setE01RTREXR(String newvalue)
  {
    fieldE01RTREXR.setString(newvalue);
  }

  /**
  * Get value of field E01RTREXR as a String.
  */
  public String getE01RTREXR()
  {
    return fieldE01RTREXR.getString();
  }

  /**
  * Set numeric field E01RTREXR using a BigDecimal value.
  */
  public void setE01RTREXR(BigDecimal newvalue)
  {
    fieldE01RTREXR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RTREXR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RTREXR()
  {
    return fieldE01RTREXR.getBigDecimal();
  }

  /**
  * Set field E01RTRREC using a String value.
  */
  public void setE01RTRREC(String newvalue)
  {
    fieldE01RTRREC.setString(newvalue);
  }

  /**
  * Get value of field E01RTRREC as a String.
  */
  public String getE01RTRREC()
  {
    return fieldE01RTRREC.getString();
  }

  /**
  * Set numeric field E01RTRREC using a BigDecimal value.
  */
  public void setE01RTRREC(BigDecimal newvalue)
  {
    fieldE01RTRREC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01RTRREC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01RTRREC()
  {
    return fieldE01RTRREC.getBigDecimal();
  }

  /**
  * Set field E01RTROPE using a String value.
  */
  public void setE01RTROPE(String newvalue)
  {
    fieldE01RTROPE.setString(newvalue);
  }

  /**
  * Get value of field E01RTROPE as a String.
  */
  public String getE01RTROPE()
  {
    return fieldE01RTROPE.getString();
  }

}