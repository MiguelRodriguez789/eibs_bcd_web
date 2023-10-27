package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL0115DS physical file definition.
* 
* File level identifier is 1120912192350.
* Record format level identifier is 3F5F68E2EA131.
*/

public class EDL0115DSMessage extends MessageRecord
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
                                     "E01IBSREF",
                                     "E01DLISIN",
                                     "E01DLISER",
                                     "E01DLISYM",
                                     "E01DLIDSC",
                                     "E01DLIPRC",
                                     "E01DLICRP",
                                     "E01DLIMAT",
                                     "E01DLIISU",
                                     "E01DLIFCD",
                                     "E01DLILCD",
                                     "E01DLINCD",
                                     "E01DLIFRQ",
                                     "E01DLIBSE",
                                     "E01DLIRMD",
                                     "E01DLIRSP",
                                     "E01DLICTR",
                                     "E01DLICCY",
                                     "E01DLIMAD",
                                     "E01DLIMMD"
                                   };
  final static String tnames[] = {
                                   "USER",
                                   "PROGRAM",
                                   "TIME-DATE",
                                   "SCREEN",
                                   "OPERAT",
                                   "MORE",
                                   "LENGUAJE",
                                   "FLAG",
                                   "FLAG",
                                   "IBS",
                                   "ISINNUMBER",
                                   "ISINSERIE",
                                   "SYMBOL",
                                   "INSTRUDESCRIPTION",
                                   "INSTPRICE",
                                   "COUPONRATE",
                                   "MATURITY",
                                   "ISSUE",
                                   "FIRSTCOUPONDATE",
                                   "LASTCOUPONDATE",
                                   "NEXTCOUPONDATE",
                                   "FRECUNCY",
                                   "BASECALCULATION",
                                   "RATINGMOD",
                                   "RATINGFITCH",
                                   "COUNTRY",
                                   "CURRENCY",
                                   "MIDMACAULAYDURATION",
                                   "MIDMODIFIEDDURATION"
                                 };
  final static String fid = "1120912192350";
  final static String rid = "3F5F68E2EA131";
  final static String fmtname = "EDL0115DS";
  final int FIELDCOUNT = 29;
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
  private DecimalField fieldE01IBSREF = null;
  private CharacterField fieldE01DLISIN = null;
  private CharacterField fieldE01DLISER = null;
  private CharacterField fieldE01DLISYM = null;
  private CharacterField fieldE01DLIDSC = null;
  private DecimalField fieldE01DLIPRC = null;
  private DecimalField fieldE01DLICRP = null;
  private DecimalField fieldE01DLIMAT = null;
  private DecimalField fieldE01DLIISU = null;
  private DecimalField fieldE01DLIFCD = null;
  private DecimalField fieldE01DLILCD = null;
  private DecimalField fieldE01DLINCD = null;
  private DecimalField fieldE01DLIFRQ = null;
  private CharacterField fieldE01DLIBSE = null;
  private CharacterField fieldE01DLIRMD = null;
  private CharacterField fieldE01DLIRSP = null;
  private CharacterField fieldE01DLICTR = null;
  private CharacterField fieldE01DLICCY = null;
  private DecimalField fieldE01DLIMAD = null;
  private DecimalField fieldE01DLIMMD = null;

  /**
  * Constructor for EDL0115DSMessage.
  */
  public EDL0115DSMessage()
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
    recordsize = 325;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH01USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "USER");
    fields[1] = fieldH01PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "PROGRAM");
    fields[2] = fieldH01TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "TIME-DATE");
    fields[3] = fieldH01SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "SCREEN");
    fields[4] = fieldH01OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "OPERAT");
    fields[5] = fieldH01FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "MORE");
    fields[6] = fieldH01FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "LENGUAJE");
    fields[7] = fieldH01FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "FLAG");
    fields[8] = fieldH01FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "FLAG");
    fields[9] = fieldE01IBSREF =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "IBS");
    fields[10] = fieldE01DLISIN =
    new CharacterField(message, HEADERSIZE + 55, 12, "ISINNUMBER");
    fields[11] = fieldE01DLISER =
    new CharacterField(message, HEADERSIZE + 67, 4, "ISINSERIE");
    fields[12] = fieldE01DLISYM =
    new CharacterField(message, HEADERSIZE + 71, 15, "SYMBOL");
    fields[13] = fieldE01DLIDSC =
    new CharacterField(message, HEADERSIZE + 86, 60, "INSTRUDESCRIPTION");
    fields[14] = fieldE01DLIPRC =
    new DecimalField(message, HEADERSIZE + 146, 23, 8, "INSTPRICE");
    fields[15] = fieldE01DLICRP =
    new DecimalField(message, HEADERSIZE + 169, 11, 6, "COUPONRATE");
    fields[16] = fieldE01DLIMAT =
    new DecimalField(message, HEADERSIZE + 180, 9, 0, "MATURITY");
    fields[17] = fieldE01DLIISU =
    new DecimalField(message, HEADERSIZE + 189, 9, 0, "ISSUE");
    fields[18] = fieldE01DLIFCD =
    new DecimalField(message, HEADERSIZE + 198, 9, 0, "FIRSTCOUPONDATE");
    fields[19] = fieldE01DLILCD =
    new DecimalField(message, HEADERSIZE + 207, 9, 0, "LASTCOUPONDATE");
    fields[20] = fieldE01DLINCD =
    new DecimalField(message, HEADERSIZE + 216, 9, 0, "NEXTCOUPONDATE");
    fields[21] = fieldE01DLIFRQ =
    new DecimalField(message, HEADERSIZE + 225, 2, 0, "FRECUNCY");
    fields[22] = fieldE01DLIBSE =
    new CharacterField(message, HEADERSIZE + 227, 23, "BASECALCULATION");
    fields[23] = fieldE01DLIRMD =
    new CharacterField(message, HEADERSIZE + 250, 23, "RATINGMOD");
    fields[24] = fieldE01DLIRSP =
    new CharacterField(message, HEADERSIZE + 273, 23, "RATINGFITCH");
    fields[25] = fieldE01DLICTR =
    new CharacterField(message, HEADERSIZE + 296, 4, "COUNTRY");
    fields[26] = fieldE01DLICCY =
    new CharacterField(message, HEADERSIZE + 300, 3, "CURRENCY");
    fields[27] = fieldE01DLIMAD =
    new DecimalField(message, HEADERSIZE + 303, 11, 6, "MIDMACAULAYDURATION");
    fields[28] = fieldE01DLIMMD =
    new DecimalField(message, HEADERSIZE + 314, 11, 6, "MIDMODIFIEDDURATION");

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
  * Set field E01IBSREF using a String value.
  */
  public void setE01IBSREF(String newvalue)
  {
    fieldE01IBSREF.setString(newvalue);
  }

  /**
  * Get value of field E01IBSREF as a String.
  */
  public String getE01IBSREF()
  {
    return fieldE01IBSREF.getString();
  }

  /**
  * Set numeric field E01IBSREF using a BigDecimal value.
  */
  public void setE01IBSREF(BigDecimal newvalue)
  {
    fieldE01IBSREF.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01IBSREF as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01IBSREF()
  {
    return fieldE01IBSREF.getBigDecimal();
  }

  /**
  * Set field E01DLISIN using a String value.
  */
  public void setE01DLISIN(String newvalue)
  {
    fieldE01DLISIN.setString(newvalue);
  }

  /**
  * Get value of field E01DLISIN as a String.
  */
  public String getE01DLISIN()
  {
    return fieldE01DLISIN.getString();
  }

  /**
  * Set field E01DLISER using a String value.
  */
  public void setE01DLISER(String newvalue)
  {
    fieldE01DLISER.setString(newvalue);
  }

  /**
  * Get value of field E01DLISER as a String.
  */
  public String getE01DLISER()
  {
    return fieldE01DLISER.getString();
  }

  /**
  * Set field E01DLISYM using a String value.
  */
  public void setE01DLISYM(String newvalue)
  {
    fieldE01DLISYM.setString(newvalue);
  }

  /**
  * Get value of field E01DLISYM as a String.
  */
  public String getE01DLISYM()
  {
    return fieldE01DLISYM.getString();
  }

  /**
  * Set field E01DLIDSC using a String value.
  */
  public void setE01DLIDSC(String newvalue)
  {
    fieldE01DLIDSC.setString(newvalue);
  }

  /**
  * Get value of field E01DLIDSC as a String.
  */
  public String getE01DLIDSC()
  {
    return fieldE01DLIDSC.getString();
  }

  /**
  * Set field E01DLIPRC using a String value.
  */
  public void setE01DLIPRC(String newvalue)
  {
    fieldE01DLIPRC.setString(newvalue);
  }

  /**
  * Get value of field E01DLIPRC as a String.
  */
  public String getE01DLIPRC()
  {
    return fieldE01DLIPRC.getString();
  }

  /**
  * Set numeric field E01DLIPRC using a BigDecimal value.
  */
  public void setE01DLIPRC(BigDecimal newvalue)
  {
    fieldE01DLIPRC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DLIPRC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DLIPRC()
  {
    return fieldE01DLIPRC.getBigDecimal();
  }

  /**
  * Set field E01DLICRP using a String value.
  */
  public void setE01DLICRP(String newvalue)
  {
    fieldE01DLICRP.setString(newvalue);
  }

  /**
  * Get value of field E01DLICRP as a String.
  */
  public String getE01DLICRP()
  {
    return fieldE01DLICRP.getString();
  }

  /**
  * Set numeric field E01DLICRP using a BigDecimal value.
  */
  public void setE01DLICRP(BigDecimal newvalue)
  {
    fieldE01DLICRP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DLICRP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DLICRP()
  {
    return fieldE01DLICRP.getBigDecimal();
  }

  /**
  * Set field E01DLIMAT using a String value.
  */
  public void setE01DLIMAT(String newvalue)
  {
    fieldE01DLIMAT.setString(newvalue);
  }

  /**
  * Get value of field E01DLIMAT as a String.
  */
  public String getE01DLIMAT()
  {
    return fieldE01DLIMAT.getString();
  }

  /**
  * Set numeric field E01DLIMAT using a BigDecimal value.
  */
  public void setE01DLIMAT(BigDecimal newvalue)
  {
    fieldE01DLIMAT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DLIMAT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DLIMAT()
  {
    return fieldE01DLIMAT.getBigDecimal();
  }

  /**
  * Set field E01DLIISU using a String value.
  */
  public void setE01DLIISU(String newvalue)
  {
    fieldE01DLIISU.setString(newvalue);
  }

  /**
  * Get value of field E01DLIISU as a String.
  */
  public String getE01DLIISU()
  {
    return fieldE01DLIISU.getString();
  }

  /**
  * Set numeric field E01DLIISU using a BigDecimal value.
  */
  public void setE01DLIISU(BigDecimal newvalue)
  {
    fieldE01DLIISU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DLIISU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DLIISU()
  {
    return fieldE01DLIISU.getBigDecimal();
  }

  /**
  * Set field E01DLIFCD using a String value.
  */
  public void setE01DLIFCD(String newvalue)
  {
    fieldE01DLIFCD.setString(newvalue);
  }

  /**
  * Get value of field E01DLIFCD as a String.
  */
  public String getE01DLIFCD()
  {
    return fieldE01DLIFCD.getString();
  }

  /**
  * Set numeric field E01DLIFCD using a BigDecimal value.
  */
  public void setE01DLIFCD(BigDecimal newvalue)
  {
    fieldE01DLIFCD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DLIFCD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DLIFCD()
  {
    return fieldE01DLIFCD.getBigDecimal();
  }

  /**
  * Set field E01DLILCD using a String value.
  */
  public void setE01DLILCD(String newvalue)
  {
    fieldE01DLILCD.setString(newvalue);
  }

  /**
  * Get value of field E01DLILCD as a String.
  */
  public String getE01DLILCD()
  {
    return fieldE01DLILCD.getString();
  }

  /**
  * Set numeric field E01DLILCD using a BigDecimal value.
  */
  public void setE01DLILCD(BigDecimal newvalue)
  {
    fieldE01DLILCD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DLILCD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DLILCD()
  {
    return fieldE01DLILCD.getBigDecimal();
  }

  /**
  * Set field E01DLINCD using a String value.
  */
  public void setE01DLINCD(String newvalue)
  {
    fieldE01DLINCD.setString(newvalue);
  }

  /**
  * Get value of field E01DLINCD as a String.
  */
  public String getE01DLINCD()
  {
    return fieldE01DLINCD.getString();
  }

  /**
  * Set numeric field E01DLINCD using a BigDecimal value.
  */
  public void setE01DLINCD(BigDecimal newvalue)
  {
    fieldE01DLINCD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DLINCD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DLINCD()
  {
    return fieldE01DLINCD.getBigDecimal();
  }

  /**
  * Set field E01DLIFRQ using a String value.
  */
  public void setE01DLIFRQ(String newvalue)
  {
    fieldE01DLIFRQ.setString(newvalue);
  }

  /**
  * Get value of field E01DLIFRQ as a String.
  */
  public String getE01DLIFRQ()
  {
    return fieldE01DLIFRQ.getString();
  }

  /**
  * Set numeric field E01DLIFRQ using a BigDecimal value.
  */
  public void setE01DLIFRQ(BigDecimal newvalue)
  {
    fieldE01DLIFRQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DLIFRQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DLIFRQ()
  {
    return fieldE01DLIFRQ.getBigDecimal();
  }

  /**
  * Set field E01DLIBSE using a String value.
  */
  public void setE01DLIBSE(String newvalue)
  {
    fieldE01DLIBSE.setString(newvalue);
  }

  /**
  * Get value of field E01DLIBSE as a String.
  */
  public String getE01DLIBSE()
  {
    return fieldE01DLIBSE.getString();
  }

  /**
  * Set field E01DLIRMD using a String value.
  */
  public void setE01DLIRMD(String newvalue)
  {
    fieldE01DLIRMD.setString(newvalue);
  }

  /**
  * Get value of field E01DLIRMD as a String.
  */
  public String getE01DLIRMD()
  {
    return fieldE01DLIRMD.getString();
  }

  /**
  * Set field E01DLIRSP using a String value.
  */
  public void setE01DLIRSP(String newvalue)
  {
    fieldE01DLIRSP.setString(newvalue);
  }

  /**
  * Get value of field E01DLIRSP as a String.
  */
  public String getE01DLIRSP()
  {
    return fieldE01DLIRSP.getString();
  }

  /**
  * Set field E01DLICTR using a String value.
  */
  public void setE01DLICTR(String newvalue)
  {
    fieldE01DLICTR.setString(newvalue);
  }

  /**
  * Get value of field E01DLICTR as a String.
  */
  public String getE01DLICTR()
  {
    return fieldE01DLICTR.getString();
  }

  /**
  * Set field E01DLICCY using a String value.
  */
  public void setE01DLICCY(String newvalue)
  {
    fieldE01DLICCY.setString(newvalue);
  }

  /**
  * Get value of field E01DLICCY as a String.
  */
  public String getE01DLICCY()
  {
    return fieldE01DLICCY.getString();
  }

  /**
  * Set field E01DLIMAD using a String value.
  */
  public void setE01DLIMAD(String newvalue)
  {
    fieldE01DLIMAD.setString(newvalue);
  }

  /**
  * Get value of field E01DLIMAD as a String.
  */
  public String getE01DLIMAD()
  {
    return fieldE01DLIMAD.getString();
  }

  /**
  * Set numeric field E01DLIMAD using a BigDecimal value.
  */
  public void setE01DLIMAD(BigDecimal newvalue)
  {
    fieldE01DLIMAD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DLIMAD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DLIMAD()
  {
    return fieldE01DLIMAD.getBigDecimal();
  }

  /**
  * Set field E01DLIMMD using a String value.
  */
  public void setE01DLIMMD(String newvalue)
  {
    fieldE01DLIMMD.setString(newvalue);
  }

  /**
  * Get value of field E01DLIMMD as a String.
  */
  public String getE01DLIMMD()
  {
    return fieldE01DLIMMD.getString();
  }

  /**
  * Set numeric field E01DLIMMD using a BigDecimal value.
  */
  public void setE01DLIMMD(BigDecimal newvalue)
  {
    fieldE01DLIMMD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DLIMMD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DLIMMD()
  {
    return fieldE01DLIMMD.getBigDecimal();
  }

}
