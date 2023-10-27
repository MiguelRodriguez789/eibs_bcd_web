package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECRA01002 physical file definition.
* 
* File level identifier is 1040928115807.
* Record format level identifier is 40074B6523278.
*/

public class ECRA01002Message extends MessageRecord
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
                                     "E02CRGBNK",
                                     "E02CRGARN",
                                     "E02CRGADS",
                                     "E02CRGIEF",
                                     "E02CRGMSA",
                                     "E02CRGSTC",
                                     "E02CRGCTC",
                                     "E02CRGCET",
                                     "E02CRGMPF",
                                     "D02IEFDSC",
                                     "D02STCDSC",
                                     "D02CTCDSC",
                                     "D02CETDSC",
                                     "D02MSADSC"
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
                                   "E02CRGBNK",
                                   "E02CRGARN",
                                   "E02CRGADS",
                                   "E02CRGIEF",
                                   "E02CRGMSA",
                                   "E02CRGSTC",
                                   "E02CRGCTC",
                                   "E02CRGCET",
                                   "E02CRGMPF",
                                   "D02IEFDSC",
                                   "D02STCDSC",
                                   "D02CTCDSC",
                                   "D02CETDSC",
                                   "D02MSADSC"
                                 };
  final static String fid = "1040928115807";
  final static String rid = "40074B6523278";
  final static String fmtname = "ECRA01002";
  final int FIELDCOUNT = 23;
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
  private CharacterField fieldE02CRGBNK = null;
  private DecimalField fieldE02CRGARN = null;
  private CharacterField fieldE02CRGADS = null;
  private CharacterField fieldE02CRGIEF = null;
  private CharacterField fieldE02CRGMSA = null;
  private CharacterField fieldE02CRGSTC = null;
  private CharacterField fieldE02CRGCTC = null;
  private CharacterField fieldE02CRGCET = null;
  private CharacterField fieldE02CRGMPF = null;
  private CharacterField fieldD02IEFDSC = null;
  private CharacterField fieldD02STCDSC = null;
  private CharacterField fieldD02CTCDSC = null;
  private CharacterField fieldD02CETDSC = null;
  private CharacterField fieldD02MSADSC = null;

  /**
  * Constructor for ECRA01002Message.
  */
  public ECRA01002Message()
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
    recordsize = 272;
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
    fields[9] = fieldE02CRGBNK =
    new CharacterField(message, HEADERSIZE + 42, 2, "E02CRGBNK");
    fields[10] = fieldE02CRGARN =
    new DecimalField(message, HEADERSIZE + 44, 5, 0, "E02CRGARN");
    fields[11] = fieldE02CRGADS =
    new CharacterField(message, HEADERSIZE + 49, 50, "E02CRGADS");
    fields[12] = fieldE02CRGIEF =
    new CharacterField(message, HEADERSIZE + 99, 1, "E02CRGIEF");
    fields[13] = fieldE02CRGMSA =
    new CharacterField(message, HEADERSIZE + 100, 5, "E02CRGMSA");
    fields[14] = fieldE02CRGSTC =
    new CharacterField(message, HEADERSIZE + 105, 2, "E02CRGSTC");
    fields[15] = fieldE02CRGCTC =
    new CharacterField(message, HEADERSIZE + 107, 3, "E02CRGCTC");
    fields[16] = fieldE02CRGCET =
    new CharacterField(message, HEADERSIZE + 110, 6, "E02CRGCET");
    fields[17] = fieldE02CRGMPF =
    new CharacterField(message, HEADERSIZE + 116, 1, "E02CRGMPF");
    fields[18] = fieldD02IEFDSC =
    new CharacterField(message, HEADERSIZE + 117, 15, "D02IEFDSC");
    fields[19] = fieldD02STCDSC =
    new CharacterField(message, HEADERSIZE + 132, 35, "D02STCDSC");
    fields[20] = fieldD02CTCDSC =
    new CharacterField(message, HEADERSIZE + 167, 35, "D02CTCDSC");
    fields[21] = fieldD02CETDSC =
    new CharacterField(message, HEADERSIZE + 202, 35, "D02CETDSC");
    fields[22] = fieldD02MSADSC =
    new CharacterField(message, HEADERSIZE + 237, 35, "D02MSADSC");

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
  * Set field E02CRGBNK using a String value.
  */
  public void setE02CRGBNK(String newvalue)
  {
    fieldE02CRGBNK.setString(newvalue);
  }

  /**
  * Get value of field E02CRGBNK as a String.
  */
  public String getE02CRGBNK()
  {
    return fieldE02CRGBNK.getString();
  }

  /**
  * Set field E02CRGARN using a String value.
  */
  public void setE02CRGARN(String newvalue)
  {
    fieldE02CRGARN.setString(newvalue);
  }

  /**
  * Get value of field E02CRGARN as a String.
  */
  public String getE02CRGARN()
  {
    return fieldE02CRGARN.getString();
  }

  /**
  * Set numeric field E02CRGARN using a BigDecimal value.
  */
  public void setE02CRGARN(BigDecimal newvalue)
  {
    fieldE02CRGARN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E02CRGARN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE02CRGARN()
  {
    return fieldE02CRGARN.getBigDecimal();
  }

  /**
  * Set field E02CRGADS using a String value.
  */
  public void setE02CRGADS(String newvalue)
  {
    fieldE02CRGADS.setString(newvalue);
  }

  /**
  * Get value of field E02CRGADS as a String.
  */
  public String getE02CRGADS()
  {
    return fieldE02CRGADS.getString();
  }

  /**
  * Set field E02CRGIEF using a String value.
  */
  public void setE02CRGIEF(String newvalue)
  {
    fieldE02CRGIEF.setString(newvalue);
  }

  /**
  * Get value of field E02CRGIEF as a String.
  */
  public String getE02CRGIEF()
  {
    return fieldE02CRGIEF.getString();
  }

  /**
  * Set field E02CRGMSA using a String value.
  */
  public void setE02CRGMSA(String newvalue)
  {
    fieldE02CRGMSA.setString(newvalue);
  }

  /**
  * Get value of field E02CRGMSA as a String.
  */
  public String getE02CRGMSA()
  {
    return fieldE02CRGMSA.getString();
  }

  /**
  * Set field E02CRGSTC using a String value.
  */
  public void setE02CRGSTC(String newvalue)
  {
    fieldE02CRGSTC.setString(newvalue);
  }

  /**
  * Get value of field E02CRGSTC as a String.
  */
  public String getE02CRGSTC()
  {
    return fieldE02CRGSTC.getString();
  }

  /**
  * Set field E02CRGCTC using a String value.
  */
  public void setE02CRGCTC(String newvalue)
  {
    fieldE02CRGCTC.setString(newvalue);
  }

  /**
  * Get value of field E02CRGCTC as a String.
  */
  public String getE02CRGCTC()
  {
    return fieldE02CRGCTC.getString();
  }

  /**
  * Set field E02CRGCET using a String value.
  */
  public void setE02CRGCET(String newvalue)
  {
    fieldE02CRGCET.setString(newvalue);
  }

  /**
  * Get value of field E02CRGCET as a String.
  */
  public String getE02CRGCET()
  {
    return fieldE02CRGCET.getString();
  }

  /**
  * Set field E02CRGMPF using a String value.
  */
  public void setE02CRGMPF(String newvalue)
  {
    fieldE02CRGMPF.setString(newvalue);
  }

  /**
  * Get value of field E02CRGMPF as a String.
  */
  public String getE02CRGMPF()
  {
    return fieldE02CRGMPF.getString();
  }

  /**
  * Set field D02IEFDSC using a String value.
  */
  public void setD02IEFDSC(String newvalue)
  {
    fieldD02IEFDSC.setString(newvalue);
  }

  /**
  * Get value of field D02IEFDSC as a String.
  */
  public String getD02IEFDSC()
  {
    return fieldD02IEFDSC.getString();
  }

  /**
  * Set field D02STCDSC using a String value.
  */
  public void setD02STCDSC(String newvalue)
  {
    fieldD02STCDSC.setString(newvalue);
  }

  /**
  * Get value of field D02STCDSC as a String.
  */
  public String getD02STCDSC()
  {
    return fieldD02STCDSC.getString();
  }

  /**
  * Set field D02CTCDSC using a String value.
  */
  public void setD02CTCDSC(String newvalue)
  {
    fieldD02CTCDSC.setString(newvalue);
  }

  /**
  * Get value of field D02CTCDSC as a String.
  */
  public String getD02CTCDSC()
  {
    return fieldD02CTCDSC.getString();
  }

  /**
  * Set field D02CETDSC using a String value.
  */
  public void setD02CETDSC(String newvalue)
  {
    fieldD02CETDSC.setString(newvalue);
  }

  /**
  * Get value of field D02CETDSC as a String.
  */
  public String getD02CETDSC()
  {
    return fieldD02CETDSC.getString();
  }

  /**
  * Set field D02MSADSC using a String value.
  */
  public void setD02MSADSC(String newvalue)
  {
    fieldD02MSADSC.setString(newvalue);
  }

  /**
  * Get value of field D02MSADSC as a String.
  */
  public String getD02MSADSC()
  {
    return fieldD02MSADSC.getString();
  }

}