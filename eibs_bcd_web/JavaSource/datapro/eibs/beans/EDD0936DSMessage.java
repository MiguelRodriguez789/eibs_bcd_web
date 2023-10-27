package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDD0936DS physical file definition.
* 
* File level identifier is 1170113163859.
* Record format level identifier is 2E164A07DBF3C.
*/

public class EDD0936DSMessage extends MessageRecord
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
                                     "E01DDCACC",
                                     "E01DDCCHK",
                                     "E01DDCDTM",
                                     "E01DDCDTD",
                                     "E01DDCDTY",
                                     "E01DDCTCD",
                                     "E01DDCTDS",
                                     "E01DDCAMT",
                                     "E01DDCORG",
                                     "E01DDCSTS",
                                     "E01DDCODA",
                                     "E01DDCBTH",
                                     "E01DDCIVA"
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
                                   "E01DDCACC",
                                   "E01DDCCHK",
                                   "E01DDCDTM",
                                   "E01DDCDTD",
                                   "E01DDCDTY",
                                   "E01DDCTCD",
                                   "E01DDCTDS",
                                   "E01DDCAMT",
                                   "E01DDCORG",
                                   "E01DDCSTS",
                                   "E01DDCODA",
                                   "E01DDCBTH",
                                   "E01DDCIVA"
                                 };
  final static String fid = "1170113163859";
  final static String rid = "2E164A07DBF3C";
  final static String fmtname = "EDD0936DS";
  final int FIELDCOUNT = 22;
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
  private DecimalField fieldE01DDCACC = null;
  private DecimalField fieldE01DDCCHK = null;
  private DecimalField fieldE01DDCDTM = null;
  private DecimalField fieldE01DDCDTD = null;
  private DecimalField fieldE01DDCDTY = null;
  private CharacterField fieldE01DDCTCD = null;
  private CharacterField fieldE01DDCTDS = null;
  private DecimalField fieldE01DDCAMT = null;
  private CharacterField fieldE01DDCORG = null;
  private CharacterField fieldE01DDCSTS = null;
  private CharacterField fieldE01DDCODA = null;
  private DecimalField fieldE01DDCBTH = null;
  private CharacterField fieldE01DDCIVA = null;

  /**
  * Constructor for EDD0936DSMessage.
  */
  public EDD0936DSMessage()
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
    recordsize = 170;
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
    fields[9] = fieldE01DDCACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E01DDCACC");
    fields[10] = fieldE01DDCCHK =
    new DecimalField(message, HEADERSIZE + 55, 12, 0, "E01DDCCHK");
    fields[11] = fieldE01DDCDTM =
    new DecimalField(message, HEADERSIZE + 67, 3, 0, "E01DDCDTM");
    fields[12] = fieldE01DDCDTD =
    new DecimalField(message, HEADERSIZE + 70, 3, 0, "E01DDCDTD");
    fields[13] = fieldE01DDCDTY =
    new DecimalField(message, HEADERSIZE + 73, 5, 0, "E01DDCDTY");
    fields[14] = fieldE01DDCTCD =
    new CharacterField(message, HEADERSIZE + 78, 4, "E01DDCTCD");
    fields[15] = fieldE01DDCTDS =
    new CharacterField(message, HEADERSIZE + 82, 60, "E01DDCTDS");
    fields[16] = fieldE01DDCAMT =
    new DecimalField(message, HEADERSIZE + 142, 17, 2, "E01DDCAMT");
    fields[17] = fieldE01DDCORG =
    new CharacterField(message, HEADERSIZE + 159, 2, "E01DDCORG");
    fields[18] = fieldE01DDCSTS =
    new CharacterField(message, HEADERSIZE + 161, 1, "E01DDCSTS");
    fields[19] = fieldE01DDCODA =
    new CharacterField(message, HEADERSIZE + 162, 1, "E01DDCODA");
    fields[20] = fieldE01DDCBTH =
    new DecimalField(message, HEADERSIZE + 163, 6, 0, "E01DDCBTH");
    fields[21] = fieldE01DDCIVA =
    new CharacterField(message, HEADERSIZE + 169, 1, "E01DDCIVA");

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
  * Set field E01DDCACC using a String value.
  */
  public void setE01DDCACC(String newvalue)
  {
    fieldE01DDCACC.setString(newvalue);
  }

  /**
  * Get value of field E01DDCACC as a String.
  */
  public String getE01DDCACC()
  {
    return fieldE01DDCACC.getString();
  }

  /**
  * Set numeric field E01DDCACC using a BigDecimal value.
  */
  public void setE01DDCACC(BigDecimal newvalue)
  {
    fieldE01DDCACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DDCACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DDCACC()
  {
    return fieldE01DDCACC.getBigDecimal();
  }

  /**
  * Set field E01DDCCHK using a String value.
  */
  public void setE01DDCCHK(String newvalue)
  {
    fieldE01DDCCHK.setString(newvalue);
  }

  /**
  * Get value of field E01DDCCHK as a String.
  */
  public String getE01DDCCHK()
  {
    return fieldE01DDCCHK.getString();
  }

  /**
  * Set numeric field E01DDCCHK using a BigDecimal value.
  */
  public void setE01DDCCHK(BigDecimal newvalue)
  {
    fieldE01DDCCHK.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DDCCHK as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DDCCHK()
  {
    return fieldE01DDCCHK.getBigDecimal();
  }

  /**
  * Set field E01DDCDTM using a String value.
  */
  public void setE01DDCDTM(String newvalue)
  {
    fieldE01DDCDTM.setString(newvalue);
  }

  /**
  * Get value of field E01DDCDTM as a String.
  */
  public String getE01DDCDTM()
  {
    return fieldE01DDCDTM.getString();
  }

  /**
  * Set numeric field E01DDCDTM using a BigDecimal value.
  */
  public void setE01DDCDTM(BigDecimal newvalue)
  {
    fieldE01DDCDTM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DDCDTM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DDCDTM()
  {
    return fieldE01DDCDTM.getBigDecimal();
  }

  /**
  * Set field E01DDCDTD using a String value.
  */
  public void setE01DDCDTD(String newvalue)
  {
    fieldE01DDCDTD.setString(newvalue);
  }

  /**
  * Get value of field E01DDCDTD as a String.
  */
  public String getE01DDCDTD()
  {
    return fieldE01DDCDTD.getString();
  }

  /**
  * Set numeric field E01DDCDTD using a BigDecimal value.
  */
  public void setE01DDCDTD(BigDecimal newvalue)
  {
    fieldE01DDCDTD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DDCDTD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DDCDTD()
  {
    return fieldE01DDCDTD.getBigDecimal();
  }

  /**
  * Set field E01DDCDTY using a String value.
  */
  public void setE01DDCDTY(String newvalue)
  {
    fieldE01DDCDTY.setString(newvalue);
  }

  /**
  * Get value of field E01DDCDTY as a String.
  */
  public String getE01DDCDTY()
  {
    return fieldE01DDCDTY.getString();
  }

  /**
  * Set numeric field E01DDCDTY using a BigDecimal value.
  */
  public void setE01DDCDTY(BigDecimal newvalue)
  {
    fieldE01DDCDTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DDCDTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DDCDTY()
  {
    return fieldE01DDCDTY.getBigDecimal();
  }

  /**
  * Set field E01DDCTCD using a String value.
  */
  public void setE01DDCTCD(String newvalue)
  {
    fieldE01DDCTCD.setString(newvalue);
  }

  /**
  * Get value of field E01DDCTCD as a String.
  */
  public String getE01DDCTCD()
  {
    return fieldE01DDCTCD.getString();
  }

  /**
  * Set field E01DDCTDS using a String value.
  */
  public void setE01DDCTDS(String newvalue)
  {
    fieldE01DDCTDS.setString(newvalue);
  }

  /**
  * Get value of field E01DDCTDS as a String.
  */
  public String getE01DDCTDS()
  {
    return fieldE01DDCTDS.getString();
  }

  /**
  * Set field E01DDCAMT using a String value.
  */
  public void setE01DDCAMT(String newvalue)
  {
    fieldE01DDCAMT.setString(newvalue);
  }

  /**
  * Get value of field E01DDCAMT as a String.
  */
  public String getE01DDCAMT()
  {
    return fieldE01DDCAMT.getString();
  }

  /**
  * Set numeric field E01DDCAMT using a BigDecimal value.
  */
  public void setE01DDCAMT(BigDecimal newvalue)
  {
    fieldE01DDCAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DDCAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DDCAMT()
  {
    return fieldE01DDCAMT.getBigDecimal();
  }

  /**
  * Set field E01DDCORG using a String value.
  */
  public void setE01DDCORG(String newvalue)
  {
    fieldE01DDCORG.setString(newvalue);
  }

  /**
  * Get value of field E01DDCORG as a String.
  */
  public String getE01DDCORG()
  {
    return fieldE01DDCORG.getString();
  }

  /**
  * Set field E01DDCSTS using a String value.
  */
  public void setE01DDCSTS(String newvalue)
  {
    fieldE01DDCSTS.setString(newvalue);
  }

  /**
  * Get value of field E01DDCSTS as a String.
  */
  public String getE01DDCSTS()
  {
    return fieldE01DDCSTS.getString();
  }

  /**
  * Set field E01DDCODA using a String value.
  */
  public void setE01DDCODA(String newvalue)
  {
    fieldE01DDCODA.setString(newvalue);
  }

  /**
  * Get value of field E01DDCODA as a String.
  */
  public String getE01DDCODA()
  {
    return fieldE01DDCODA.getString();
  }

  /**
  * Set field E01DDCBTH using a String value.
  */
  public void setE01DDCBTH(String newvalue)
  {
    fieldE01DDCBTH.setString(newvalue);
  }

  /**
  * Get value of field E01DDCBTH as a String.
  */
  public String getE01DDCBTH()
  {
    return fieldE01DDCBTH.getString();
  }

  /**
  * Set numeric field E01DDCBTH using a BigDecimal value.
  */
  public void setE01DDCBTH(BigDecimal newvalue)
  {
    fieldE01DDCBTH.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DDCBTH as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DDCBTH()
  {
    return fieldE01DDCBTH.getBigDecimal();
  }

  /**
  * Set field E01DDCIVA using a String value.
  */
  public void setE01DDCIVA(String newvalue)
  {
    fieldE01DDCIVA.setString(newvalue);
  }

  /**
  * Get value of field E01DDCIVA as a String.
  */
  public String getE01DDCIVA()
  {
    return fieldE01DDCIVA.getString();
  }

}
