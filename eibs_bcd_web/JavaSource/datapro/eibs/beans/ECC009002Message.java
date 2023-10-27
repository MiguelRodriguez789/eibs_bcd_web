package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECC009002 physical file definition.
* 
* File level identifier is 1130611112842.
* Record format level identifier is 5114C73AE3F6C.
*/

public class ECC009002Message extends MessageRecord
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
                                     "E02TARTYP",
                                     "E02CCRNUM",
                                     "E02CCRCRA",
                                     "E02CCRBRN",
                                     "E02PRICUN",
                                     "E02CCRCID",
                                     "E02CCRTYP",
                                     "E02CCRSTP",
                                     "E02CCRASG",
                                     "E02CCRPRI",
                                     "E02CCRASM",
                                     "E02CCRASD",
                                     "E02CCRASY",
                                     "E02CCRSTS",
                                     "E02CCRDSC",
                                     "E02CCRSTM",
                                     "E02CCRSTD",
                                     "E02CCRSTY",
                                     "E02CCRUSR",
                                     "E02CCRSTA",
                                     "E02CCRDSA",
                                     "E02CCRAPC",
                                     "E02CCRTPI"
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
                                   "E02TARTYP",
                                   "E02CCRNUM",
                                   "E02CCRCRA",
                                   "E02CCRBRN",
                                   "E02PRICUN",
                                   "E02CCRCID",
                                   "E02CCRTYP",
                                   "E02CCRSTP",
                                   "E02CCRASG",
                                   "E02CCRPRI",
                                   "E02CCRASM",
                                   "E02CCRASD",
                                   "E02CCRASY",
                                   "E02CCRSTS",
                                   "E02CCRDSC",
                                   "E02CCRSTM",
                                   "E02CCRSTD",
                                   "E02CCRSTY",
                                   "E02CCRUSR",
                                   "E02CCRSTA",
                                   "E02CCRDSA",
                                   "E02CCRAPC",
                                   "E02CCRTPI"
                                 };
  final static String fid = "1130611112842";
  final static String rid = "5114C73AE3F6C";
  final static String fmtname = "ECC009002";
  final int FIELDCOUNT = 32;
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
  private CharacterField fieldE02TARTYP = null;
  private CharacterField fieldE02CCRNUM = null;
  private DecimalField fieldE02CCRCRA = null;
  private DecimalField fieldE02CCRBRN = null;
  private DecimalField fieldE02PRICUN = null;
  private CharacterField fieldE02CCRCID = null;
  private CharacterField fieldE02CCRTYP = null;
  private CharacterField fieldE02CCRSTP = null;
  private CharacterField fieldE02CCRASG = null;
  private CharacterField fieldE02CCRPRI = null;
  private DecimalField fieldE02CCRASM = null;
  private DecimalField fieldE02CCRASD = null;
  private DecimalField fieldE02CCRASY = null;
  private CharacterField fieldE02CCRSTS = null;
  private CharacterField fieldE02CCRDSC = null;
  private DecimalField fieldE02CCRSTM = null;
  private DecimalField fieldE02CCRSTD = null;
  private DecimalField fieldE02CCRSTY = null;
  private CharacterField fieldE02CCRUSR = null;
  private CharacterField fieldE02CCRSTA = null;
  private CharacterField fieldE02CCRDSA = null;
  private CharacterField fieldE02CCRAPC = null;
  private CharacterField fieldE02CCRTPI = null;

  /**
  * Constructor for ECC009002Message.
  */
  public ECC009002Message()
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
    recordsize = 185;
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
    fields[9] = fieldE02TARTYP =
    new CharacterField(message, HEADERSIZE + 42, 1, "E02TARTYP");
    fields[10] = fieldE02CCRNUM =
    new CharacterField(message, HEADERSIZE + 43, 20, "E02CCRNUM");
    fields[11] = fieldE02CCRCRA =
    new DecimalField(message, HEADERSIZE + 63, 13, 0, "E02CCRCRA");
    fields[12] = fieldE02CCRBRN =
    new DecimalField(message, HEADERSIZE + 76, 5, 0, "E02CCRBRN");
    fields[13] = fieldE02PRICUN =
    new DecimalField(message, HEADERSIZE + 81, 10, 0, "E02PRICUN");
    fields[14] = fieldE02CCRCID =
    new CharacterField(message, HEADERSIZE + 91, 15, "E02CCRCID");
    fields[15] = fieldE02CCRTYP =
    new CharacterField(message, HEADERSIZE + 106, 4, "E02CCRTYP");
    fields[16] = fieldE02CCRSTP =
    new CharacterField(message, HEADERSIZE + 110, 4, "E02CCRSTP");
    fields[17] = fieldE02CCRASG =
    new CharacterField(message, HEADERSIZE + 114, 1, "E02CCRASG");
    fields[18] = fieldE02CCRPRI =
    new CharacterField(message, HEADERSIZE + 115, 1, "E02CCRPRI");
    fields[19] = fieldE02CCRASM =
    new DecimalField(message, HEADERSIZE + 116, 3, 0, "E02CCRASM");
    fields[20] = fieldE02CCRASD =
    new DecimalField(message, HEADERSIZE + 119, 3, 0, "E02CCRASD");
    fields[21] = fieldE02CCRASY =
    new DecimalField(message, HEADERSIZE + 122, 5, 0, "E02CCRASY");
    fields[22] = fieldE02CCRSTS =
    new CharacterField(message, HEADERSIZE + 127, 2, "E02CCRSTS");
    fields[23] = fieldE02CCRDSC =
    new CharacterField(message, HEADERSIZE + 129, 15, "E02CCRDSC");
    fields[24] = fieldE02CCRSTM =
    new DecimalField(message, HEADERSIZE + 144, 3, 0, "E02CCRSTM");
    fields[25] = fieldE02CCRSTD =
    new DecimalField(message, HEADERSIZE + 147, 3, 0, "E02CCRSTD");
    fields[26] = fieldE02CCRSTY =
    new DecimalField(message, HEADERSIZE + 150, 5, 0, "E02CCRSTY");
    fields[27] = fieldE02CCRUSR =
    new CharacterField(message, HEADERSIZE + 155, 10, "E02CCRUSR");
    fields[28] = fieldE02CCRSTA =
    new CharacterField(message, HEADERSIZE + 165, 2, "E02CCRSTA");
    fields[29] = fieldE02CCRDSA =
    new CharacterField(message, HEADERSIZE + 167, 15, "E02CCRDSA");
    fields[30] = fieldE02CCRAPC =
    new CharacterField(message, HEADERSIZE + 182, 2, "E02CCRAPC");
    fields[31] = fieldE02CCRTPI =
    new CharacterField(message, HEADERSIZE + 184, 1, "E02CCRTPI");

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
  * Set field E02TARTYP using a String value.
  */
  public void setE02TARTYP(String newvalue)
  {
    fieldE02TARTYP.setString(newvalue);
  }

  /**
  * Get value of field E02TARTYP as a String.
  */
  public String getE02TARTYP()
  {
    return fieldE02TARTYP.getString();
  }

  /**
  * Set field E02CCRNUM using a String value.
  */
  public void setE02CCRNUM(String newvalue)
  {
    fieldE02CCRNUM.setString(newvalue);
  }

  /**
  * Get value of field E02CCRNUM as a String.
  */
  public String getE02CCRNUM()
  {
    return fieldE02CCRNUM.getString();
  }

  /**
  * Set field E02CCRCRA using a String value.
  */
  public void setE02CCRCRA(String newvalue)
  {
    fieldE02CCRCRA.setString(newvalue);
  }

  /**
  * Get value of field E02CCRCRA as a String.
  */
  public String getE02CCRCRA()
  {
    return fieldE02CCRCRA.getString();
  }

  /**
  * Set numeric field E02CCRCRA using a BigDecimal value.
  */
  public void setE02CCRCRA(BigDecimal newvalue)
  {
    fieldE02CCRCRA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CCRCRA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CCRCRA()
  {
    return fieldE02CCRCRA.getBigDecimal();
  }

  /**
  * Set field E02CCRBRN using a String value.
  */
  public void setE02CCRBRN(String newvalue)
  {
    fieldE02CCRBRN.setString(newvalue);
  }

  /**
  * Get value of field E02CCRBRN as a String.
  */
  public String getE02CCRBRN()
  {
    return fieldE02CCRBRN.getString();
  }

  /**
  * Set numeric field E02CCRBRN using a BigDecimal value.
  */
  public void setE02CCRBRN(BigDecimal newvalue)
  {
    fieldE02CCRBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CCRBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CCRBRN()
  {
    return fieldE02CCRBRN.getBigDecimal();
  }

  /**
  * Set field E02PRICUN using a String value.
  */
  public void setE02PRICUN(String newvalue)
  {
    fieldE02PRICUN.setString(newvalue);
  }

  /**
  * Get value of field E02PRICUN as a String.
  */
  public String getE02PRICUN()
  {
    return fieldE02PRICUN.getString();
  }

  /**
  * Set numeric field E02PRICUN using a BigDecimal value.
  */
  public void setE02PRICUN(BigDecimal newvalue)
  {
    fieldE02PRICUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02PRICUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02PRICUN()
  {
    return fieldE02PRICUN.getBigDecimal();
  }

  /**
  * Set field E02CCRCID using a String value.
  */
  public void setE02CCRCID(String newvalue)
  {
    fieldE02CCRCID.setString(newvalue);
  }

  /**
  * Get value of field E02CCRCID as a String.
  */
  public String getE02CCRCID()
  {
    return fieldE02CCRCID.getString();
  }

  /**
  * Set field E02CCRTYP using a String value.
  */
  public void setE02CCRTYP(String newvalue)
  {
    fieldE02CCRTYP.setString(newvalue);
  }

  /**
  * Get value of field E02CCRTYP as a String.
  */
  public String getE02CCRTYP()
  {
    return fieldE02CCRTYP.getString();
  }

  /**
  * Set field E02CCRSTP using a String value.
  */
  public void setE02CCRSTP(String newvalue)
  {
    fieldE02CCRSTP.setString(newvalue);
  }

  /**
  * Get value of field E02CCRSTP as a String.
  */
  public String getE02CCRSTP()
  {
    return fieldE02CCRSTP.getString();
  }

  /**
  * Set field E02CCRASG using a String value.
  */
  public void setE02CCRASG(String newvalue)
  {
    fieldE02CCRASG.setString(newvalue);
  }

  /**
  * Get value of field E02CCRASG as a String.
  */
  public String getE02CCRASG()
  {
    return fieldE02CCRASG.getString();
  }

  /**
  * Set field E02CCRPRI using a String value.
  */
  public void setE02CCRPRI(String newvalue)
  {
    fieldE02CCRPRI.setString(newvalue);
  }

  /**
  * Get value of field E02CCRPRI as a String.
  */
  public String getE02CCRPRI()
  {
    return fieldE02CCRPRI.getString();
  }

  /**
  * Set field E02CCRASM using a String value.
  */
  public void setE02CCRASM(String newvalue)
  {
    fieldE02CCRASM.setString(newvalue);
  }

  /**
  * Get value of field E02CCRASM as a String.
  */
  public String getE02CCRASM()
  {
    return fieldE02CCRASM.getString();
  }

  /**
  * Set numeric field E02CCRASM using a BigDecimal value.
  */
  public void setE02CCRASM(BigDecimal newvalue)
  {
    fieldE02CCRASM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CCRASM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CCRASM()
  {
    return fieldE02CCRASM.getBigDecimal();
  }

  /**
  * Set field E02CCRASD using a String value.
  */
  public void setE02CCRASD(String newvalue)
  {
    fieldE02CCRASD.setString(newvalue);
  }

  /**
  * Get value of field E02CCRASD as a String.
  */
  public String getE02CCRASD()
  {
    return fieldE02CCRASD.getString();
  }

  /**
  * Set numeric field E02CCRASD using a BigDecimal value.
  */
  public void setE02CCRASD(BigDecimal newvalue)
  {
    fieldE02CCRASD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CCRASD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CCRASD()
  {
    return fieldE02CCRASD.getBigDecimal();
  }

  /**
  * Set field E02CCRASY using a String value.
  */
  public void setE02CCRASY(String newvalue)
  {
    fieldE02CCRASY.setString(newvalue);
  }

  /**
  * Get value of field E02CCRASY as a String.
  */
  public String getE02CCRASY()
  {
    return fieldE02CCRASY.getString();
  }

  /**
  * Set numeric field E02CCRASY using a BigDecimal value.
  */
  public void setE02CCRASY(BigDecimal newvalue)
  {
    fieldE02CCRASY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CCRASY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CCRASY()
  {
    return fieldE02CCRASY.getBigDecimal();
  }

  /**
  * Set field E02CCRSTS using a String value.
  */
  public void setE02CCRSTS(String newvalue)
  {
    fieldE02CCRSTS.setString(newvalue);
  }

  /**
  * Get value of field E02CCRSTS as a String.
  */
  public String getE02CCRSTS()
  {
    return fieldE02CCRSTS.getString();
  }

  /**
  * Set field E02CCRDSC using a String value.
  */
  public void setE02CCRDSC(String newvalue)
  {
    fieldE02CCRDSC.setString(newvalue);
  }

  /**
  * Get value of field E02CCRDSC as a String.
  */
  public String getE02CCRDSC()
  {
    return fieldE02CCRDSC.getString();
  }

  /**
  * Set field E02CCRSTM using a String value.
  */
  public void setE02CCRSTM(String newvalue)
  {
    fieldE02CCRSTM.setString(newvalue);
  }

  /**
  * Get value of field E02CCRSTM as a String.
  */
  public String getE02CCRSTM()
  {
    return fieldE02CCRSTM.getString();
  }

  /**
  * Set numeric field E02CCRSTM using a BigDecimal value.
  */
  public void setE02CCRSTM(BigDecimal newvalue)
  {
    fieldE02CCRSTM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CCRSTM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CCRSTM()
  {
    return fieldE02CCRSTM.getBigDecimal();
  }

  /**
  * Set field E02CCRSTD using a String value.
  */
  public void setE02CCRSTD(String newvalue)
  {
    fieldE02CCRSTD.setString(newvalue);
  }

  /**
  * Get value of field E02CCRSTD as a String.
  */
  public String getE02CCRSTD()
  {
    return fieldE02CCRSTD.getString();
  }

  /**
  * Set numeric field E02CCRSTD using a BigDecimal value.
  */
  public void setE02CCRSTD(BigDecimal newvalue)
  {
    fieldE02CCRSTD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CCRSTD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CCRSTD()
  {
    return fieldE02CCRSTD.getBigDecimal();
  }

  /**
  * Set field E02CCRSTY using a String value.
  */
  public void setE02CCRSTY(String newvalue)
  {
    fieldE02CCRSTY.setString(newvalue);
  }

  /**
  * Get value of field E02CCRSTY as a String.
  */
  public String getE02CCRSTY()
  {
    return fieldE02CCRSTY.getString();
  }

  /**
  * Set numeric field E02CCRSTY using a BigDecimal value.
  */
  public void setE02CCRSTY(BigDecimal newvalue)
  {
    fieldE02CCRSTY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CCRSTY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CCRSTY()
  {
    return fieldE02CCRSTY.getBigDecimal();
  }

  /**
  * Set field E02CCRUSR using a String value.
  */
  public void setE02CCRUSR(String newvalue)
  {
    fieldE02CCRUSR.setString(newvalue);
  }

  /**
  * Get value of field E02CCRUSR as a String.
  */
  public String getE02CCRUSR()
  {
    return fieldE02CCRUSR.getString();
  }

  /**
  * Set field E02CCRSTA using a String value.
  */
  public void setE02CCRSTA(String newvalue)
  {
    fieldE02CCRSTA.setString(newvalue);
  }

  /**
  * Get value of field E02CCRSTA as a String.
  */
  public String getE02CCRSTA()
  {
    return fieldE02CCRSTA.getString();
  }

  /**
  * Set field E02CCRDSA using a String value.
  */
  public void setE02CCRDSA(String newvalue)
  {
    fieldE02CCRDSA.setString(newvalue);
  }

  /**
  * Get value of field E02CCRDSA as a String.
  */
  public String getE02CCRDSA()
  {
    return fieldE02CCRDSA.getString();
  }

  /**
  * Set field E02CCRAPC using a String value.
  */
  public void setE02CCRAPC(String newvalue)
  {
    fieldE02CCRAPC.setString(newvalue);
  }

  /**
  * Get value of field E02CCRAPC as a String.
  */
  public String getE02CCRAPC()
  {
    return fieldE02CCRAPC.getString();
  }

  /**
  * Set field E02CCRTPI using a String value.
  */
  public void setE02CCRTPI(String newvalue)
  {
    fieldE02CCRTPI.setString(newvalue);
  }

  /**
  * Get value of field E02CCRTPI as a String.
  */
  public String getE02CCRTPI()
  {
    return fieldE02CCRTPI.getString();
  }

}