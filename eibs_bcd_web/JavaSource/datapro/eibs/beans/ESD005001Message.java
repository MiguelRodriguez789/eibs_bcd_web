package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESD005001 physical file definition.
* 
* File level identifier is 1161021142706.
* Record format level identifier is 41E263E7AA36B.
*/

public class ESD005001Message extends MessageRecord
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
                                     "E01WNMACD",
                                     "E01WNMACC",
                                     "E01WNMTID",
                                     "E01WNMIDN",
                                     "E01WNMTYP",
                                     "E01WNMNME",
                                     "E01WNMSEQ",
                                     "E01WNMFVM",
                                     "E01WNMFVD",
                                     "E01WNMFVY",
                                     "E01WNMMOT",
                                     "E01WNMMOD",
                                     "E01WNMSTS",
                                     "E01WNMSTD",
                                     "E01WNMUSE",
                                     "E01WNMFCM",
                                     "E01WNMFCD",
                                     "E01WNMFCY",
                                     "E01WNMDSC",
                                     "E01WNMNUM",
                                     "E01WNMIND"
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
                                   "E01WNMACD",
                                   "E01WNMACC",
                                   "E01WNMTID",
                                   "E01WNMIDN",
                                   "E01WNMTYP",
                                   "E01WNMNME",
                                   "E01WNMSEQ",
                                   "E01WNMFVM",
                                   "E01WNMFVD",
                                   "E01WNMFVY",
                                   "E01WNMMOT",
                                   "E01WNMMOD",
                                   "E01WNMSTS",
                                   "E01WNMSTD",
                                   "E01WNMUSE",
                                   "E01WNMFCM",
                                   "E01WNMFCD",
                                   "E01WNMFCY",
                                   "E01WNMDSC",
                                   "E01WNMNUM",
                                   "E01WNMIND"
                                 };
  final static String fid = "1161021142706";
  final static String rid = "41E263E7AA36B";
  final static String fmtname = "ESD005001";
  final int FIELDCOUNT = 30;
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
  private CharacterField fieldE01WNMACD = null;
  private DecimalField fieldE01WNMACC = null;
  private CharacterField fieldE01WNMTID = null;
  private CharacterField fieldE01WNMIDN = null;
  private CharacterField fieldE01WNMTYP = null;
  private DecimalField fieldE01WNMNME = null;
  private DecimalField fieldE01WNMSEQ = null;
  private DecimalField fieldE01WNMFVM = null;
  private DecimalField fieldE01WNMFVD = null;
  private DecimalField fieldE01WNMFVY = null;
  private CharacterField fieldE01WNMMOT = null;
  private CharacterField fieldE01WNMMOD = null;
  private CharacterField fieldE01WNMSTS = null;
  private CharacterField fieldE01WNMSTD = null;
  private CharacterField fieldE01WNMUSE = null;
  private DecimalField fieldE01WNMFCM = null;
  private DecimalField fieldE01WNMFCD = null;
  private DecimalField fieldE01WNMFCY = null;
  private CharacterField fieldE01WNMDSC = null;
  private DecimalField fieldE01WNMNUM = null;
  private CharacterField fieldE01WNMIND = null;

  /**
  * Constructor for ESD005001Message.
  */
  public ESD005001Message()
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
    recordsize = 359;
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
    fields[9] = fieldE01WNMACD =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01WNMACD");
    fields[10] = fieldE01WNMACC =
    new DecimalField(message, HEADERSIZE + 44, 13, 0, "E01WNMACC");
    fields[11] = fieldE01WNMTID =
    new CharacterField(message, HEADERSIZE + 57, 4, "E01WNMTID");
    fields[12] = fieldE01WNMIDN =
    new CharacterField(message, HEADERSIZE + 61, 25, "E01WNMIDN");
    fields[13] = fieldE01WNMTYP =
    new CharacterField(message, HEADERSIZE + 86, 1, "E01WNMTYP");
    fields[14] = fieldE01WNMNME =
    new DecimalField(message, HEADERSIZE + 87, 11, 0, "E01WNMNME");
    fields[15] = fieldE01WNMSEQ =
    new DecimalField(message, HEADERSIZE + 98, 13, 0, "E01WNMSEQ");
    fields[16] = fieldE01WNMFVM =
    new DecimalField(message, HEADERSIZE + 111, 3, 0, "E01WNMFVM");
    fields[17] = fieldE01WNMFVD =
    new DecimalField(message, HEADERSIZE + 114, 3, 0, "E01WNMFVD");
    fields[18] = fieldE01WNMFVY =
    new DecimalField(message, HEADERSIZE + 117, 5, 0, "E01WNMFVY");
    fields[19] = fieldE01WNMMOT =
    new CharacterField(message, HEADERSIZE + 122, 4, "E01WNMMOT");
    fields[20] = fieldE01WNMMOD =
    new CharacterField(message, HEADERSIZE + 126, 60, "E01WNMMOD");
    fields[21] = fieldE01WNMSTS =
    new CharacterField(message, HEADERSIZE + 186, 1, "E01WNMSTS");
    fields[22] = fieldE01WNMSTD =
    new CharacterField(message, HEADERSIZE + 187, 10, "E01WNMSTD");
    fields[23] = fieldE01WNMUSE =
    new CharacterField(message, HEADERSIZE + 197, 10, "E01WNMUSE");
    fields[24] = fieldE01WNMFCM =
    new DecimalField(message, HEADERSIZE + 207, 3, 0, "E01WNMFCM");
    fields[25] = fieldE01WNMFCD =
    new DecimalField(message, HEADERSIZE + 210, 3, 0, "E01WNMFCD");
    fields[26] = fieldE01WNMFCY =
    new DecimalField(message, HEADERSIZE + 213, 5, 0, "E01WNMFCY");
    fields[27] = fieldE01WNMDSC =
    new CharacterField(message, HEADERSIZE + 218, 132, "E01WNMDSC");
    fields[28] = fieldE01WNMNUM =
    new DecimalField(message, HEADERSIZE + 350, 8, 0, "E01WNMNUM");
    fields[29] = fieldE01WNMIND =
    new CharacterField(message, HEADERSIZE + 358, 1, "E01WNMIND");

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
  * Set field E01WNMACD using a String value.
  */
  public void setE01WNMACD(String newvalue)
  {
    fieldE01WNMACD.setString(newvalue);
  }

  /**
  * Get value of field E01WNMACD as a String.
  */
  public String getE01WNMACD()
  {
    return fieldE01WNMACD.getString();
  }

  /**
  * Set field E01WNMACC using a String value.
  */
  public void setE01WNMACC(String newvalue)
  {
    fieldE01WNMACC.setString(newvalue);
  }

  /**
  * Get value of field E01WNMACC as a String.
  */
  public String getE01WNMACC()
  {
    return fieldE01WNMACC.getString();
  }

  /**
  * Set numeric field E01WNMACC using a BigDecimal value.
  */
  public void setE01WNMACC(BigDecimal newvalue)
  {
    fieldE01WNMACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01WNMACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01WNMACC()
  {
    return fieldE01WNMACC.getBigDecimal();
  }

  /**
  * Set field E01WNMTID using a String value.
  */
  public void setE01WNMTID(String newvalue)
  {
    fieldE01WNMTID.setString(newvalue);
  }

  /**
  * Get value of field E01WNMTID as a String.
  */
  public String getE01WNMTID()
  {
    return fieldE01WNMTID.getString();
  }

  /**
  * Set field E01WNMIDN using a String value.
  */
  public void setE01WNMIDN(String newvalue)
  {
    fieldE01WNMIDN.setString(newvalue);
  }

  /**
  * Get value of field E01WNMIDN as a String.
  */
  public String getE01WNMIDN()
  {
    return fieldE01WNMIDN.getString();
  }

  /**
  * Set field E01WNMTYP using a String value.
  */
  public void setE01WNMTYP(String newvalue)
  {
    fieldE01WNMTYP.setString(newvalue);
  }

  /**
  * Get value of field E01WNMTYP as a String.
  */
  public String getE01WNMTYP()
  {
    return fieldE01WNMTYP.getString();
  }

  /**
  * Set field E01WNMNME using a String value.
  */
  public void setE01WNMNME(String newvalue)
  {
    fieldE01WNMNME.setString(newvalue);
  }

  /**
  * Get value of field E01WNMNME as a String.
  */
  public String getE01WNMNME()
  {
    return fieldE01WNMNME.getString();
  }

  /**
  * Set numeric field E01WNMNME using a BigDecimal value.
  */
  public void setE01WNMNME(BigDecimal newvalue)
  {
    fieldE01WNMNME.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01WNMNME as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01WNMNME()
  {
    return fieldE01WNMNME.getBigDecimal();
  }

  /**
  * Set field E01WNMSEQ using a String value.
  */
  public void setE01WNMSEQ(String newvalue)
  {
    fieldE01WNMSEQ.setString(newvalue);
  }

  /**
  * Get value of field E01WNMSEQ as a String.
  */
  public String getE01WNMSEQ()
  {
    return fieldE01WNMSEQ.getString();
  }

  /**
  * Set numeric field E01WNMSEQ using a BigDecimal value.
  */
  public void setE01WNMSEQ(BigDecimal newvalue)
  {
    fieldE01WNMSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01WNMSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01WNMSEQ()
  {
    return fieldE01WNMSEQ.getBigDecimal();
  }

  /**
  * Set field E01WNMFVM using a String value.
  */
  public void setE01WNMFVM(String newvalue)
  {
    fieldE01WNMFVM.setString(newvalue);
  }

  /**
  * Get value of field E01WNMFVM as a String.
  */
  public String getE01WNMFVM()
  {
    return fieldE01WNMFVM.getString();
  }

  /**
  * Set numeric field E01WNMFVM using a BigDecimal value.
  */
  public void setE01WNMFVM(BigDecimal newvalue)
  {
    fieldE01WNMFVM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01WNMFVM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01WNMFVM()
  {
    return fieldE01WNMFVM.getBigDecimal();
  }

  /**
  * Set field E01WNMFVD using a String value.
  */
  public void setE01WNMFVD(String newvalue)
  {
    fieldE01WNMFVD.setString(newvalue);
  }

  /**
  * Get value of field E01WNMFVD as a String.
  */
  public String getE01WNMFVD()
  {
    return fieldE01WNMFVD.getString();
  }

  /**
  * Set numeric field E01WNMFVD using a BigDecimal value.
  */
  public void setE01WNMFVD(BigDecimal newvalue)
  {
    fieldE01WNMFVD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01WNMFVD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01WNMFVD()
  {
    return fieldE01WNMFVD.getBigDecimal();
  }

  /**
  * Set field E01WNMFVY using a String value.
  */
  public void setE01WNMFVY(String newvalue)
  {
    fieldE01WNMFVY.setString(newvalue);
  }

  /**
  * Get value of field E01WNMFVY as a String.
  */
  public String getE01WNMFVY()
  {
    return fieldE01WNMFVY.getString();
  }

  /**
  * Set numeric field E01WNMFVY using a BigDecimal value.
  */
  public void setE01WNMFVY(BigDecimal newvalue)
  {
    fieldE01WNMFVY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01WNMFVY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01WNMFVY()
  {
    return fieldE01WNMFVY.getBigDecimal();
  }

  /**
  * Set field E01WNMMOT using a String value.
  */
  public void setE01WNMMOT(String newvalue)
  {
    fieldE01WNMMOT.setString(newvalue);
  }

  /**
  * Get value of field E01WNMMOT as a String.
  */
  public String getE01WNMMOT()
  {
    return fieldE01WNMMOT.getString();
  }

  /**
  * Set field E01WNMMOD using a String value.
  */
  public void setE01WNMMOD(String newvalue)
  {
    fieldE01WNMMOD.setString(newvalue);
  }

  /**
  * Get value of field E01WNMMOD as a String.
  */
  public String getE01WNMMOD()
  {
    return fieldE01WNMMOD.getString();
  }

  /**
  * Set field E01WNMSTS using a String value.
  */
  public void setE01WNMSTS(String newvalue)
  {
    fieldE01WNMSTS.setString(newvalue);
  }

  /**
  * Get value of field E01WNMSTS as a String.
  */
  public String getE01WNMSTS()
  {
    return fieldE01WNMSTS.getString();
  }

  /**
  * Set field E01WNMSTD using a String value.
  */
  public void setE01WNMSTD(String newvalue)
  {
    fieldE01WNMSTD.setString(newvalue);
  }

  /**
  * Get value of field E01WNMSTD as a String.
  */
  public String getE01WNMSTD()
  {
    return fieldE01WNMSTD.getString();
  }

  /**
  * Set field E01WNMUSE using a String value.
  */
  public void setE01WNMUSE(String newvalue)
  {
    fieldE01WNMUSE.setString(newvalue);
  }

  /**
  * Get value of field E01WNMUSE as a String.
  */
  public String getE01WNMUSE()
  {
    return fieldE01WNMUSE.getString();
  }

  /**
  * Set field E01WNMFCM using a String value.
  */
  public void setE01WNMFCM(String newvalue)
  {
    fieldE01WNMFCM.setString(newvalue);
  }

  /**
  * Get value of field E01WNMFCM as a String.
  */
  public String getE01WNMFCM()
  {
    return fieldE01WNMFCM.getString();
  }

  /**
  * Set numeric field E01WNMFCM using a BigDecimal value.
  */
  public void setE01WNMFCM(BigDecimal newvalue)
  {
    fieldE01WNMFCM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01WNMFCM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01WNMFCM()
  {
    return fieldE01WNMFCM.getBigDecimal();
  }

  /**
  * Set field E01WNMFCD using a String value.
  */
  public void setE01WNMFCD(String newvalue)
  {
    fieldE01WNMFCD.setString(newvalue);
  }

  /**
  * Get value of field E01WNMFCD as a String.
  */
  public String getE01WNMFCD()
  {
    return fieldE01WNMFCD.getString();
  }

  /**
  * Set numeric field E01WNMFCD using a BigDecimal value.
  */
  public void setE01WNMFCD(BigDecimal newvalue)
  {
    fieldE01WNMFCD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01WNMFCD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01WNMFCD()
  {
    return fieldE01WNMFCD.getBigDecimal();
  }

  /**
  * Set field E01WNMFCY using a String value.
  */
  public void setE01WNMFCY(String newvalue)
  {
    fieldE01WNMFCY.setString(newvalue);
  }

  /**
  * Get value of field E01WNMFCY as a String.
  */
  public String getE01WNMFCY()
  {
    return fieldE01WNMFCY.getString();
  }

  /**
  * Set numeric field E01WNMFCY using a BigDecimal value.
  */
  public void setE01WNMFCY(BigDecimal newvalue)
  {
    fieldE01WNMFCY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01WNMFCY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01WNMFCY()
  {
    return fieldE01WNMFCY.getBigDecimal();
  }

  /**
  * Set field E01WNMDSC using a String value.
  */
  public void setE01WNMDSC(String newvalue)
  {
    fieldE01WNMDSC.setString(newvalue);
  }

  /**
  * Get value of field E01WNMDSC as a String.
  */
  public String getE01WNMDSC()
  {
    return fieldE01WNMDSC.getString();
  }

  /**
  * Set field E01WNMNUM using a String value.
  */
  public void setE01WNMNUM(String newvalue)
  {
    fieldE01WNMNUM.setString(newvalue);
  }

  /**
  * Get value of field E01WNMNUM as a String.
  */
  public String getE01WNMNUM()
  {
    return fieldE01WNMNUM.getString();
  }

  /**
  * Set numeric field E01WNMNUM using a BigDecimal value.
  */
  public void setE01WNMNUM(BigDecimal newvalue)
  {
    fieldE01WNMNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01WNMNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01WNMNUM()
  {
    return fieldE01WNMNUM.getBigDecimal();
  }

  /**
  * Set field E01WNMIND using a String value.
  */
  public void setE01WNMIND(String newvalue)
  {
    fieldE01WNMIND.setString(newvalue);
  }

  /**
  * Get value of field E01WNMIND as a String.
  */
  public String getE01WNMIND()
  {
    return fieldE01WNMIND.getString();
  }

}