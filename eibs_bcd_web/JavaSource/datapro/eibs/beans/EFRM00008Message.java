package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EFRM00008 physical file definition.
* 
* File level identifier is 1170202115302.
* Record format level identifier is 35EF0B0E541F3.
*/

public class EFRM00008Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "E08LDMCDP",
                                     "E08LDMCDA",
                                     "E08LDMKDP",
                                     "E08LDMKDA",
                                     "E08TOTDEP",
                                     "E08NUMDEP",
                                     "E08LDMCWD",
                                     "E08LDMCWA",
                                     "E08LDMCPY",
                                     "E08LDMCPA",
                                     "E08TOTRET",
                                     "E08NUMRET",
                                     "E08LDMTIN",
                                     "E08LDMTIA",
                                     "E08LDMTRV",
                                     "E08LDMTRA",
                                     "E08LDMUSO",
                                     "E08LDMMOT",
                                     "E08LDMAM1",
                                     "E08LDMUC1",
                                     "E08LDMCN1",
                                     "E08LDMFG1",
                                     "E08LDMCN2",
                                     "E08LDMFG2",
                                     "E08LDMCN3",
                                     "E08LDMFG3",
                                     "E08LDMCN4",
                                     "E08LDMFG4",
                                     "E08LDMGAV",
                                     "E08LDMNAV",
                                     "E08LDMUC3",
                                     "D08LDMUC3",
                                     "E08LDMVOL",
                                     "E08LDMDEP",
                                     "E08LDMPMD",
                                     "E08LDMTRF",
                                     "D08LDMTRF",
                                     "D08LDMCN1",
                                     "D08LDMCN2",
                                     "D08LDMCN3",
                                     "D08LDMCN4"
                                   };
  final static String tnames[] = {
                                   "depCashNumber",
                                   "depCashAmount",
                                   "depOtherNumber",
                                   "depOtherAmount",
                                   "amountTotalDep",
                                   "cantTotalDep",
                                   "retEfecrNumber",
                                   "retEfectAmount",
                                   "payCkNumber",
                                   "payCkAmount",
                                   "amountTotalRet",
                                   "cantTotalRet",
                                   "transfEmitNumber",
                                   "transEmitAmount",
                                   "transRecNumber",
                                   "transRecAmount",
                                   "useAccount",
                                   "reasonForRequest",
                                   "openingAmount",
                                   "modeOpening",
                                   "countryTransf1",
                                   "flSendReci1",
                                   "countryTransf2",
                                   "flSendReci2",
                                   "countryTranf3",
                                   "flSendReci3",
                                   "countryTransf4",
                                   "flSendReci4",
                                   "salPromBook",
                                   "salNetBook",
                                   "sourceOfFunds1",
                                   "descSourceOfFunds1",
                                   "volumenSales",
                                   "promediDeposits",
                                   "pcDepositCks",
                                   "transferYN1",
                                   "desTransferYN1",
                                   "descCountry1",
                                   "descCountry2",
                                   "descCountry3",
                                   "descCountry4"
                                 };
  final static String fid = "1170202115302";
  final static String rid = "35EF0B0E541F3";
  final static String fmtname = "EFRM00008";
  final int FIELDCOUNT = 41;
  private static Hashtable tlookup = new Hashtable();
  private DecimalField fieldE08LDMCDP = null;
  private DecimalField fieldE08LDMCDA = null;
  private DecimalField fieldE08LDMKDP = null;
  private DecimalField fieldE08LDMKDA = null;
  private DecimalField fieldE08TOTDEP = null;
  private DecimalField fieldE08NUMDEP = null;
  private DecimalField fieldE08LDMCWD = null;
  private DecimalField fieldE08LDMCWA = null;
  private DecimalField fieldE08LDMCPY = null;
  private DecimalField fieldE08LDMCPA = null;
  private DecimalField fieldE08TOTRET = null;
  private DecimalField fieldE08NUMRET = null;
  private DecimalField fieldE08LDMTIN = null;
  private DecimalField fieldE08LDMTIA = null;
  private DecimalField fieldE08LDMTRV = null;
  private DecimalField fieldE08LDMTRA = null;
  private CharacterField fieldE08LDMUSO = null;
  private CharacterField fieldE08LDMMOT = null;
  private DecimalField fieldE08LDMAM1 = null;
  private CharacterField fieldE08LDMUC1 = null;
  private CharacterField fieldE08LDMCN1 = null;
  private CharacterField fieldE08LDMFG1 = null;
  private CharacterField fieldE08LDMCN2 = null;
  private CharacterField fieldE08LDMFG2 = null;
  private CharacterField fieldE08LDMCN3 = null;
  private CharacterField fieldE08LDMFG3 = null;
  private CharacterField fieldE08LDMCN4 = null;
  private CharacterField fieldE08LDMFG4 = null;
  private DecimalField fieldE08LDMGAV = null;
  private DecimalField fieldE08LDMNAV = null;
  private CharacterField fieldE08LDMUC3 = null;
  private CharacterField fieldD08LDMUC3 = null;
  private DecimalField fieldE08LDMVOL = null;
  private DecimalField fieldE08LDMDEP = null;
  private DecimalField fieldE08LDMPMD = null;
  private CharacterField fieldE08LDMTRF = null;
  private CharacterField fieldD08LDMTRF = null;
  private CharacterField fieldD08LDMCN1 = null;
  private CharacterField fieldD08LDMCN2 = null;
  private CharacterField fieldD08LDMCN3 = null;
  private CharacterField fieldD08LDMCN4 = null;

  /**
  * Constructor for EFRM00008Message.
  */
  public EFRM00008Message()
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
    recordsize = 880;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldE08LDMCDP =
    new DecimalField(message, HEADERSIZE + 0, 6, 0, "depCashNumber");
    fields[1] = fieldE08LDMCDA =
    new DecimalField(message, HEADERSIZE + 6, 17, 2, "depCashAmount");
    fields[2] = fieldE08LDMKDP =
    new DecimalField(message, HEADERSIZE + 23, 6, 0, "depOtherNumber");
    fields[3] = fieldE08LDMKDA =
    new DecimalField(message, HEADERSIZE + 29, 17, 2, "depOtherAmount");
    fields[4] = fieldE08TOTDEP =
    new DecimalField(message, HEADERSIZE + 46, 19, 2, "amountTotalDep");
    fields[5] = fieldE08NUMDEP =
    new DecimalField(message, HEADERSIZE + 65, 8, 0, "cantTotalDep");
    fields[6] = fieldE08LDMCWD =
    new DecimalField(message, HEADERSIZE + 73, 6, 0, "retEfecrNumber");
    fields[7] = fieldE08LDMCWA =
    new DecimalField(message, HEADERSIZE + 79, 17, 2, "retEfectAmount");
    fields[8] = fieldE08LDMCPY =
    new DecimalField(message, HEADERSIZE + 96, 6, 0, "payCkNumber");
    fields[9] = fieldE08LDMCPA =
    new DecimalField(message, HEADERSIZE + 102, 17, 2, "payCkAmount");
    fields[10] = fieldE08TOTRET =
    new DecimalField(message, HEADERSIZE + 119, 19, 2, "amountTotalRet");
    fields[11] = fieldE08NUMRET =
    new DecimalField(message, HEADERSIZE + 138, 8, 0, "cantTotalRet");
    fields[12] = fieldE08LDMTIN =
    new DecimalField(message, HEADERSIZE + 146, 6, 0, "transfEmitNumber");
    fields[13] = fieldE08LDMTIA =
    new DecimalField(message, HEADERSIZE + 152, 17, 2, "transEmitAmount");
    fields[14] = fieldE08LDMTRV =
    new DecimalField(message, HEADERSIZE + 169, 6, 0, "transRecNumber");
    fields[15] = fieldE08LDMTRA =
    new DecimalField(message, HEADERSIZE + 175, 17, 2, "transRecAmount");
    fields[16] = fieldE08LDMUSO =
    new CharacterField(message, HEADERSIZE + 192, 45, "useAccount");
    fields[17] = fieldE08LDMMOT =
    new CharacterField(message, HEADERSIZE + 237, 45, "reasonForRequest");
    fields[18] = fieldE08LDMAM1 =
    new DecimalField(message, HEADERSIZE + 282, 17, 2, "openingAmount");
    fields[19] = fieldE08LDMUC1 =
    new CharacterField(message, HEADERSIZE + 299, 45, "modeOpening");
    fields[20] = fieldE08LDMCN1 =
    new CharacterField(message, HEADERSIZE + 344, 45, "countryTransf1");
    fields[21] = fieldE08LDMFG1 =
    new CharacterField(message, HEADERSIZE + 389, 1, "flSendReci1");
    fields[22] = fieldE08LDMCN2 =
    new CharacterField(message, HEADERSIZE + 390, 45, "countryTransf2");
    fields[23] = fieldE08LDMFG2 =
    new CharacterField(message, HEADERSIZE + 435, 1, "flSendReci2");
    fields[24] = fieldE08LDMCN3 =
    new CharacterField(message, HEADERSIZE + 436, 45, "countryTranf3");
    fields[25] = fieldE08LDMFG3 =
    new CharacterField(message, HEADERSIZE + 481, 1, "flSendReci3");
    fields[26] = fieldE08LDMCN4 =
    new CharacterField(message, HEADERSIZE + 482, 45, "countryTransf4");
    fields[27] = fieldE08LDMFG4 =
    new CharacterField(message, HEADERSIZE + 527, 1, "flSendReci4");
    fields[28] = fieldE08LDMGAV =
    new DecimalField(message, HEADERSIZE + 528, 17, 2, "salPromBook");
    fields[29] = fieldE08LDMNAV =
    new DecimalField(message, HEADERSIZE + 545, 17, 2, "salNetBook");
    fields[30] = fieldE08LDMUC3 =
    new CharacterField(message, HEADERSIZE + 562, 45, "sourceOfFunds1");
    fields[31] = fieldD08LDMUC3 =
    new CharacterField(message, HEADERSIZE + 607, 45, "descSourceOfFunds1");
    fields[32] = fieldE08LDMVOL =
    new DecimalField(message, HEADERSIZE + 652, 17, 2, "volumenSales");
    fields[33] = fieldE08LDMDEP =
    new DecimalField(message, HEADERSIZE + 669, 17, 2, "promediDeposits");
    fields[34] = fieldE08LDMPMD =
    new DecimalField(message, HEADERSIZE + 686, 11, 6, "pcDepositCks");
    fields[35] = fieldE08LDMTRF =
    new CharacterField(message, HEADERSIZE + 697, 1, "transferYN1");
    fields[36] = fieldD08LDMTRF =
    new CharacterField(message, HEADERSIZE + 698, 2, "desTransferYN1");
    fields[37] = fieldD08LDMCN1 =
    new CharacterField(message, HEADERSIZE + 700, 45, "descCountry1");
    fields[38] = fieldD08LDMCN2 =
    new CharacterField(message, HEADERSIZE + 745, 45, "descCountry2");
    fields[39] = fieldD08LDMCN3 =
    new CharacterField(message, HEADERSIZE + 790, 45, "descCountry3");
    fields[40] = fieldD08LDMCN4 =
    new CharacterField(message, HEADERSIZE + 835, 45, "descCountry4");

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
  * Set field E08LDMCDP using a String value.
  */
  public void setE08LDMCDP(String newvalue)
  {
    fieldE08LDMCDP.setString(newvalue);
  }

  /**
  * Get value of field E08LDMCDP as a String.
  */
  public String getE08LDMCDP()
  {
    return fieldE08LDMCDP.getString();
  }

  /**
  * Set numeric field E08LDMCDP using a BigDecimal value.
  */
  public void setE08LDMCDP(BigDecimal newvalue)
  {
    fieldE08LDMCDP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08LDMCDP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08LDMCDP()
  {
    return fieldE08LDMCDP.getBigDecimal();
  }

  /**
  * Set field E08LDMCDA using a String value.
  */
  public void setE08LDMCDA(String newvalue)
  {
    fieldE08LDMCDA.setString(newvalue);
  }

  /**
  * Get value of field E08LDMCDA as a String.
  */
  public String getE08LDMCDA()
  {
    return fieldE08LDMCDA.getString();
  }

  /**
  * Set numeric field E08LDMCDA using a BigDecimal value.
  */
  public void setE08LDMCDA(BigDecimal newvalue)
  {
    fieldE08LDMCDA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08LDMCDA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08LDMCDA()
  {
    return fieldE08LDMCDA.getBigDecimal();
  }

  /**
  * Set field E08LDMKDP using a String value.
  */
  public void setE08LDMKDP(String newvalue)
  {
    fieldE08LDMKDP.setString(newvalue);
  }

  /**
  * Get value of field E08LDMKDP as a String.
  */
  public String getE08LDMKDP()
  {
    return fieldE08LDMKDP.getString();
  }

  /**
  * Set numeric field E08LDMKDP using a BigDecimal value.
  */
  public void setE08LDMKDP(BigDecimal newvalue)
  {
    fieldE08LDMKDP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08LDMKDP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08LDMKDP()
  {
    return fieldE08LDMKDP.getBigDecimal();
  }

  /**
  * Set field E08LDMKDA using a String value.
  */
  public void setE08LDMKDA(String newvalue)
  {
    fieldE08LDMKDA.setString(newvalue);
  }

  /**
  * Get value of field E08LDMKDA as a String.
  */
  public String getE08LDMKDA()
  {
    return fieldE08LDMKDA.getString();
  }

  /**
  * Set numeric field E08LDMKDA using a BigDecimal value.
  */
  public void setE08LDMKDA(BigDecimal newvalue)
  {
    fieldE08LDMKDA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08LDMKDA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08LDMKDA()
  {
    return fieldE08LDMKDA.getBigDecimal();
  }

  /**
  * Set field E08TOTDEP using a String value.
  */
  public void setE08TOTDEP(String newvalue)
  {
    fieldE08TOTDEP.setString(newvalue);
  }

  /**
  * Get value of field E08TOTDEP as a String.
  */
  public String getE08TOTDEP()
  {
    return fieldE08TOTDEP.getString();
  }

  /**
  * Set numeric field E08TOTDEP using a BigDecimal value.
  */
  public void setE08TOTDEP(BigDecimal newvalue)
  {
    fieldE08TOTDEP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08TOTDEP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08TOTDEP()
  {
    return fieldE08TOTDEP.getBigDecimal();
  }

  /**
  * Set field E08NUMDEP using a String value.
  */
  public void setE08NUMDEP(String newvalue)
  {
    fieldE08NUMDEP.setString(newvalue);
  }

  /**
  * Get value of field E08NUMDEP as a String.
  */
  public String getE08NUMDEP()
  {
    return fieldE08NUMDEP.getString();
  }

  /**
  * Set numeric field E08NUMDEP using a BigDecimal value.
  */
  public void setE08NUMDEP(BigDecimal newvalue)
  {
    fieldE08NUMDEP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08NUMDEP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08NUMDEP()
  {
    return fieldE08NUMDEP.getBigDecimal();
  }

  /**
  * Set field E08LDMCWD using a String value.
  */
  public void setE08LDMCWD(String newvalue)
  {
    fieldE08LDMCWD.setString(newvalue);
  }

  /**
  * Get value of field E08LDMCWD as a String.
  */
  public String getE08LDMCWD()
  {
    return fieldE08LDMCWD.getString();
  }

  /**
  * Set numeric field E08LDMCWD using a BigDecimal value.
  */
  public void setE08LDMCWD(BigDecimal newvalue)
  {
    fieldE08LDMCWD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08LDMCWD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08LDMCWD()
  {
    return fieldE08LDMCWD.getBigDecimal();
  }

  /**
  * Set field E08LDMCWA using a String value.
  */
  public void setE08LDMCWA(String newvalue)
  {
    fieldE08LDMCWA.setString(newvalue);
  }

  /**
  * Get value of field E08LDMCWA as a String.
  */
  public String getE08LDMCWA()
  {
    return fieldE08LDMCWA.getString();
  }

  /**
  * Set numeric field E08LDMCWA using a BigDecimal value.
  */
  public void setE08LDMCWA(BigDecimal newvalue)
  {
    fieldE08LDMCWA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08LDMCWA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08LDMCWA()
  {
    return fieldE08LDMCWA.getBigDecimal();
  }

  /**
  * Set field E08LDMCPY using a String value.
  */
  public void setE08LDMCPY(String newvalue)
  {
    fieldE08LDMCPY.setString(newvalue);
  }

  /**
  * Get value of field E08LDMCPY as a String.
  */
  public String getE08LDMCPY()
  {
    return fieldE08LDMCPY.getString();
  }

  /**
  * Set numeric field E08LDMCPY using a BigDecimal value.
  */
  public void setE08LDMCPY(BigDecimal newvalue)
  {
    fieldE08LDMCPY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08LDMCPY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08LDMCPY()
  {
    return fieldE08LDMCPY.getBigDecimal();
  }

  /**
  * Set field E08LDMCPA using a String value.
  */
  public void setE08LDMCPA(String newvalue)
  {
    fieldE08LDMCPA.setString(newvalue);
  }

  /**
  * Get value of field E08LDMCPA as a String.
  */
  public String getE08LDMCPA()
  {
    return fieldE08LDMCPA.getString();
  }

  /**
  * Set numeric field E08LDMCPA using a BigDecimal value.
  */
  public void setE08LDMCPA(BigDecimal newvalue)
  {
    fieldE08LDMCPA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08LDMCPA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08LDMCPA()
  {
    return fieldE08LDMCPA.getBigDecimal();
  }

  /**
  * Set field E08TOTRET using a String value.
  */
  public void setE08TOTRET(String newvalue)
  {
    fieldE08TOTRET.setString(newvalue);
  }

  /**
  * Get value of field E08TOTRET as a String.
  */
  public String getE08TOTRET()
  {
    return fieldE08TOTRET.getString();
  }

  /**
  * Set numeric field E08TOTRET using a BigDecimal value.
  */
  public void setE08TOTRET(BigDecimal newvalue)
  {
    fieldE08TOTRET.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08TOTRET as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08TOTRET()
  {
    return fieldE08TOTRET.getBigDecimal();
  }

  /**
  * Set field E08NUMRET using a String value.
  */
  public void setE08NUMRET(String newvalue)
  {
    fieldE08NUMRET.setString(newvalue);
  }

  /**
  * Get value of field E08NUMRET as a String.
  */
  public String getE08NUMRET()
  {
    return fieldE08NUMRET.getString();
  }

  /**
  * Set numeric field E08NUMRET using a BigDecimal value.
  */
  public void setE08NUMRET(BigDecimal newvalue)
  {
    fieldE08NUMRET.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08NUMRET as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08NUMRET()
  {
    return fieldE08NUMRET.getBigDecimal();
  }

  /**
  * Set field E08LDMTIN using a String value.
  */
  public void setE08LDMTIN(String newvalue)
  {
    fieldE08LDMTIN.setString(newvalue);
  }

  /**
  * Get value of field E08LDMTIN as a String.
  */
  public String getE08LDMTIN()
  {
    return fieldE08LDMTIN.getString();
  }

  /**
  * Set numeric field E08LDMTIN using a BigDecimal value.
  */
  public void setE08LDMTIN(BigDecimal newvalue)
  {
    fieldE08LDMTIN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08LDMTIN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08LDMTIN()
  {
    return fieldE08LDMTIN.getBigDecimal();
  }

  /**
  * Set field E08LDMTIA using a String value.
  */
  public void setE08LDMTIA(String newvalue)
  {
    fieldE08LDMTIA.setString(newvalue);
  }

  /**
  * Get value of field E08LDMTIA as a String.
  */
  public String getE08LDMTIA()
  {
    return fieldE08LDMTIA.getString();
  }

  /**
  * Set numeric field E08LDMTIA using a BigDecimal value.
  */
  public void setE08LDMTIA(BigDecimal newvalue)
  {
    fieldE08LDMTIA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08LDMTIA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08LDMTIA()
  {
    return fieldE08LDMTIA.getBigDecimal();
  }

  /**
  * Set field E08LDMTRV using a String value.
  */
  public void setE08LDMTRV(String newvalue)
  {
    fieldE08LDMTRV.setString(newvalue);
  }

  /**
  * Get value of field E08LDMTRV as a String.
  */
  public String getE08LDMTRV()
  {
    return fieldE08LDMTRV.getString();
  }

  /**
  * Set numeric field E08LDMTRV using a BigDecimal value.
  */
  public void setE08LDMTRV(BigDecimal newvalue)
  {
    fieldE08LDMTRV.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08LDMTRV as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08LDMTRV()
  {
    return fieldE08LDMTRV.getBigDecimal();
  }

  /**
  * Set field E08LDMTRA using a String value.
  */
  public void setE08LDMTRA(String newvalue)
  {
    fieldE08LDMTRA.setString(newvalue);
  }

  /**
  * Get value of field E08LDMTRA as a String.
  */
  public String getE08LDMTRA()
  {
    return fieldE08LDMTRA.getString();
  }

  /**
  * Set numeric field E08LDMTRA using a BigDecimal value.
  */
  public void setE08LDMTRA(BigDecimal newvalue)
  {
    fieldE08LDMTRA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08LDMTRA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08LDMTRA()
  {
    return fieldE08LDMTRA.getBigDecimal();
  }

  /**
  * Set field E08LDMUSO using a String value.
  */
  public void setE08LDMUSO(String newvalue)
  {
    fieldE08LDMUSO.setString(newvalue);
  }

  /**
  * Get value of field E08LDMUSO as a String.
  */
  public String getE08LDMUSO()
  {
    return fieldE08LDMUSO.getString();
  }

  /**
  * Set field E08LDMMOT using a String value.
  */
  public void setE08LDMMOT(String newvalue)
  {
    fieldE08LDMMOT.setString(newvalue);
  }

  /**
  * Get value of field E08LDMMOT as a String.
  */
  public String getE08LDMMOT()
  {
    return fieldE08LDMMOT.getString();
  }

  /**
  * Set field E08LDMAM1 using a String value.
  */
  public void setE08LDMAM1(String newvalue)
  {
    fieldE08LDMAM1.setString(newvalue);
  }

  /**
  * Get value of field E08LDMAM1 as a String.
  */
  public String getE08LDMAM1()
  {
    return fieldE08LDMAM1.getString();
  }

  /**
  * Set numeric field E08LDMAM1 using a BigDecimal value.
  */
  public void setE08LDMAM1(BigDecimal newvalue)
  {
    fieldE08LDMAM1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08LDMAM1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08LDMAM1()
  {
    return fieldE08LDMAM1.getBigDecimal();
  }

  /**
  * Set field E08LDMUC1 using a String value.
  */
  public void setE08LDMUC1(String newvalue)
  {
    fieldE08LDMUC1.setString(newvalue);
  }

  /**
  * Get value of field E08LDMUC1 as a String.
  */
  public String getE08LDMUC1()
  {
    return fieldE08LDMUC1.getString();
  }

  /**
  * Set field E08LDMCN1 using a String value.
  */
  public void setE08LDMCN1(String newvalue)
  {
    fieldE08LDMCN1.setString(newvalue);
  }

  /**
  * Get value of field E08LDMCN1 as a String.
  */
  public String getE08LDMCN1()
  {
    return fieldE08LDMCN1.getString();
  }

  /**
  * Set field E08LDMFG1 using a String value.
  */
  public void setE08LDMFG1(String newvalue)
  {
    fieldE08LDMFG1.setString(newvalue);
  }

  /**
  * Get value of field E08LDMFG1 as a String.
  */
  public String getE08LDMFG1()
  {
    return fieldE08LDMFG1.getString();
  }

  /**
  * Set field E08LDMCN2 using a String value.
  */
  public void setE08LDMCN2(String newvalue)
  {
    fieldE08LDMCN2.setString(newvalue);
  }

  /**
  * Get value of field E08LDMCN2 as a String.
  */
  public String getE08LDMCN2()
  {
    return fieldE08LDMCN2.getString();
  }

  /**
  * Set field E08LDMFG2 using a String value.
  */
  public void setE08LDMFG2(String newvalue)
  {
    fieldE08LDMFG2.setString(newvalue);
  }

  /**
  * Get value of field E08LDMFG2 as a String.
  */
  public String getE08LDMFG2()
  {
    return fieldE08LDMFG2.getString();
  }

  /**
  * Set field E08LDMCN3 using a String value.
  */
  public void setE08LDMCN3(String newvalue)
  {
    fieldE08LDMCN3.setString(newvalue);
  }

  /**
  * Get value of field E08LDMCN3 as a String.
  */
  public String getE08LDMCN3()
  {
    return fieldE08LDMCN3.getString();
  }

  /**
  * Set field E08LDMFG3 using a String value.
  */
  public void setE08LDMFG3(String newvalue)
  {
    fieldE08LDMFG3.setString(newvalue);
  }

  /**
  * Get value of field E08LDMFG3 as a String.
  */
  public String getE08LDMFG3()
  {
    return fieldE08LDMFG3.getString();
  }

  /**
  * Set field E08LDMCN4 using a String value.
  */
  public void setE08LDMCN4(String newvalue)
  {
    fieldE08LDMCN4.setString(newvalue);
  }

  /**
  * Get value of field E08LDMCN4 as a String.
  */
  public String getE08LDMCN4()
  {
    return fieldE08LDMCN4.getString();
  }

  /**
  * Set field E08LDMFG4 using a String value.
  */
  public void setE08LDMFG4(String newvalue)
  {
    fieldE08LDMFG4.setString(newvalue);
  }

  /**
  * Get value of field E08LDMFG4 as a String.
  */
  public String getE08LDMFG4()
  {
    return fieldE08LDMFG4.getString();
  }

  /**
  * Set field E08LDMGAV using a String value.
  */
  public void setE08LDMGAV(String newvalue)
  {
    fieldE08LDMGAV.setString(newvalue);
  }

  /**
  * Get value of field E08LDMGAV as a String.
  */
  public String getE08LDMGAV()
  {
    return fieldE08LDMGAV.getString();
  }

  /**
  * Set numeric field E08LDMGAV using a BigDecimal value.
  */
  public void setE08LDMGAV(BigDecimal newvalue)
  {
    fieldE08LDMGAV.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08LDMGAV as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08LDMGAV()
  {
    return fieldE08LDMGAV.getBigDecimal();
  }

  /**
  * Set field E08LDMNAV using a String value.
  */
  public void setE08LDMNAV(String newvalue)
  {
    fieldE08LDMNAV.setString(newvalue);
  }

  /**
  * Get value of field E08LDMNAV as a String.
  */
  public String getE08LDMNAV()
  {
    return fieldE08LDMNAV.getString();
  }

  /**
  * Set numeric field E08LDMNAV using a BigDecimal value.
  */
  public void setE08LDMNAV(BigDecimal newvalue)
  {
    fieldE08LDMNAV.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08LDMNAV as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08LDMNAV()
  {
    return fieldE08LDMNAV.getBigDecimal();
  }

  /**
  * Set field E08LDMUC3 using a String value.
  */
  public void setE08LDMUC3(String newvalue)
  {
    fieldE08LDMUC3.setString(newvalue);
  }

  /**
  * Get value of field E08LDMUC3 as a String.
  */
  public String getE08LDMUC3()
  {
    return fieldE08LDMUC3.getString();
  }

  /**
  * Set field D08LDMUC3 using a String value.
  */
  public void setD08LDMUC3(String newvalue)
  {
    fieldD08LDMUC3.setString(newvalue);
  }

  /**
  * Get value of field D08LDMUC3 as a String.
  */
  public String getD08LDMUC3()
  {
    return fieldD08LDMUC3.getString();
  }

  /**
  * Set field E08LDMVOL using a String value.
  */
  public void setE08LDMVOL(String newvalue)
  {
    fieldE08LDMVOL.setString(newvalue);
  }

  /**
  * Get value of field E08LDMVOL as a String.
  */
  public String getE08LDMVOL()
  {
    return fieldE08LDMVOL.getString();
  }

  /**
  * Set numeric field E08LDMVOL using a BigDecimal value.
  */
  public void setE08LDMVOL(BigDecimal newvalue)
  {
    fieldE08LDMVOL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08LDMVOL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08LDMVOL()
  {
    return fieldE08LDMVOL.getBigDecimal();
  }

  /**
  * Set field E08LDMDEP using a String value.
  */
  public void setE08LDMDEP(String newvalue)
  {
    fieldE08LDMDEP.setString(newvalue);
  }

  /**
  * Get value of field E08LDMDEP as a String.
  */
  public String getE08LDMDEP()
  {
    return fieldE08LDMDEP.getString();
  }

  /**
  * Set numeric field E08LDMDEP using a BigDecimal value.
  */
  public void setE08LDMDEP(BigDecimal newvalue)
  {
    fieldE08LDMDEP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08LDMDEP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08LDMDEP()
  {
    return fieldE08LDMDEP.getBigDecimal();
  }

  /**
  * Set field E08LDMPMD using a String value.
  */
  public void setE08LDMPMD(String newvalue)
  {
    fieldE08LDMPMD.setString(newvalue);
  }

  /**
  * Get value of field E08LDMPMD as a String.
  */
  public String getE08LDMPMD()
  {
    return fieldE08LDMPMD.getString();
  }

  /**
  * Set numeric field E08LDMPMD using a BigDecimal value.
  */
  public void setE08LDMPMD(BigDecimal newvalue)
  {
    fieldE08LDMPMD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E08LDMPMD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE08LDMPMD()
  {
    return fieldE08LDMPMD.getBigDecimal();
  }

  /**
  * Set field E08LDMTRF using a String value.
  */
  public void setE08LDMTRF(String newvalue)
  {
    fieldE08LDMTRF.setString(newvalue);
  }

  /**
  * Get value of field E08LDMTRF as a String.
  */
  public String getE08LDMTRF()
  {
    return fieldE08LDMTRF.getString();
  }

  /**
  * Set field D08LDMTRF using a String value.
  */
  public void setD08LDMTRF(String newvalue)
  {
    fieldD08LDMTRF.setString(newvalue);
  }

  /**
  * Get value of field D08LDMTRF as a String.
  */
  public String getD08LDMTRF()
  {
    return fieldD08LDMTRF.getString();
  }

  /**
  * Set field D08LDMCN1 using a String value.
  */
  public void setD08LDMCN1(String newvalue)
  {
    fieldD08LDMCN1.setString(newvalue);
  }

  /**
  * Get value of field D08LDMCN1 as a String.
  */
  public String getD08LDMCN1()
  {
    return fieldD08LDMCN1.getString();
  }

  /**
  * Set field D08LDMCN2 using a String value.
  */
  public void setD08LDMCN2(String newvalue)
  {
    fieldD08LDMCN2.setString(newvalue);
  }

  /**
  * Get value of field D08LDMCN2 as a String.
  */
  public String getD08LDMCN2()
  {
    return fieldD08LDMCN2.getString();
  }

  /**
  * Set field D08LDMCN3 using a String value.
  */
  public void setD08LDMCN3(String newvalue)
  {
    fieldD08LDMCN3.setString(newvalue);
  }

  /**
  * Get value of field D08LDMCN3 as a String.
  */
  public String getD08LDMCN3()
  {
    return fieldD08LDMCN3.getString();
  }

  /**
  * Set field D08LDMCN4 using a String value.
  */
  public void setD08LDMCN4(String newvalue)
  {
    fieldD08LDMCN4.setString(newvalue);
  }

  /**
  * Get value of field D08LDMCN4 as a String.
  */
  public String getD08LDMCN4()
  {
    return fieldD08LDMCN4.getString();
  }

}
