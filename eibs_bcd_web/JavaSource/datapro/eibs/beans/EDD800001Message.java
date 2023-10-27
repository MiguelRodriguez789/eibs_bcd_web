package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDD800001 physical file definition.
* 
* File level identifier is 1180625160059.
* Record format level identifier is 44AD4F2490B30.
*/

public class EDD800001Message extends MessageRecord
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
                                     "E01BIOACC",
                                     "E01BIOADS",
                                     "E01BIOCUN",
                                     "E01BIOPID",
                                     "E01BIOTID",
                                     "E01BIOIDN",
                                     "E01BIONA1",
                                     "E01BIOREG",
                                     "E01BIOVER",
                                     "E01ACT",
                                     "E01NUMREC",
                                     "E01INDOPE"
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
                                   "E01BIOACC",
                                   "E01BIOADS",
                                   "E01BIOCUN",
                                   "E01BIOPID",
                                   "E01BIOTID",
                                   "E01BIOIDN",
                                   "E01BIONA1",
                                   "E01BIOREG",
                                   "E01BIOVER",
                                   "E01ACT",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1180625160059";
  final static String rid = "44AD4F2490B30";
  final static String fmtname = "EDD800001";
  final int FIELDCOUNT = 21;
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
  private DecimalField fieldE01BIOACC = null;
  private CharacterField fieldE01BIOADS = null;
  private DecimalField fieldE01BIOCUN = null;
  private CharacterField fieldE01BIOPID = null;
  private CharacterField fieldE01BIOTID = null;
  private CharacterField fieldE01BIOIDN = null;
  private CharacterField fieldE01BIONA1 = null;
  private CharacterField fieldE01BIOREG = null;
  private CharacterField fieldE01BIOVER = null;
  private CharacterField fieldE01ACT = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for EDD800001Message.
  */
  public EDD800001Message()
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
    recordsize = 230;
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
    fields[9] = fieldE01BIOACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E01BIOACC");
    fields[10] = fieldE01BIOADS =
    new CharacterField(message, HEADERSIZE + 55, 60, "E01BIOADS");
    fields[11] = fieldE01BIOCUN =
    new DecimalField(message, HEADERSIZE + 115, 10, 0, "E01BIOCUN");
    fields[12] = fieldE01BIOPID =
    new CharacterField(message, HEADERSIZE + 125, 4, "E01BIOPID");
    fields[13] = fieldE01BIOTID =
    new CharacterField(message, HEADERSIZE + 129, 4, "E01BIOTID");
    fields[14] = fieldE01BIOIDN =
    new CharacterField(message, HEADERSIZE + 133, 25, "E01BIOIDN");
    fields[15] = fieldE01BIONA1 =
    new CharacterField(message, HEADERSIZE + 158, 60, "E01BIONA1");
    fields[16] = fieldE01BIOREG =
    new CharacterField(message, HEADERSIZE + 218, 1, "E01BIOREG");
    fields[17] = fieldE01BIOVER =
    new CharacterField(message, HEADERSIZE + 219, 1, "E01BIOVER");
    fields[18] = fieldE01ACT =
    new CharacterField(message, HEADERSIZE + 220, 1, "E01ACT");
    fields[19] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 221, 8, 0, "E01NUMREC");
    fields[20] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 229, 1, "E01INDOPE");

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
  * Set field E01BIOACC using a String value.
  */
  public void setE01BIOACC(String newvalue)
  {
    fieldE01BIOACC.setString(newvalue);
  }

  /**
  * Get value of field E01BIOACC as a String.
  */
  public String getE01BIOACC()
  {
    return fieldE01BIOACC.getString();
  }

  /**
  * Set numeric field E01BIOACC using a BigDecimal value.
  */
  public void setE01BIOACC(BigDecimal newvalue)
  {
    fieldE01BIOACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BIOACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BIOACC()
  {
    return fieldE01BIOACC.getBigDecimal();
  }

  /**
  * Set field E01BIOADS using a String value.
  */
  public void setE01BIOADS(String newvalue)
  {
    fieldE01BIOADS.setString(newvalue);
  }

  /**
  * Get value of field E01BIOADS as a String.
  */
  public String getE01BIOADS()
  {
    return fieldE01BIOADS.getString();
  }

  /**
  * Set field E01BIOCUN using a String value.
  */
  public void setE01BIOCUN(String newvalue)
  {
    fieldE01BIOCUN.setString(newvalue);
  }

  /**
  * Get value of field E01BIOCUN as a String.
  */
  public String getE01BIOCUN()
  {
    return fieldE01BIOCUN.getString();
  }

  /**
  * Set numeric field E01BIOCUN using a BigDecimal value.
  */
  public void setE01BIOCUN(BigDecimal newvalue)
  {
    fieldE01BIOCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BIOCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BIOCUN()
  {
    return fieldE01BIOCUN.getBigDecimal();
  }

  /**
  * Set field E01BIOPID using a String value.
  */
  public void setE01BIOPID(String newvalue)
  {
    fieldE01BIOPID.setString(newvalue);
  }

  /**
  * Get value of field E01BIOPID as a String.
  */
  public String getE01BIOPID()
  {
    return fieldE01BIOPID.getString();
  }

  /**
  * Set field E01BIOTID using a String value.
  */
  public void setE01BIOTID(String newvalue)
  {
    fieldE01BIOTID.setString(newvalue);
  }

  /**
  * Get value of field E01BIOTID as a String.
  */
  public String getE01BIOTID()
  {
    return fieldE01BIOTID.getString();
  }

  /**
  * Set field E01BIOIDN using a String value.
  */
  public void setE01BIOIDN(String newvalue)
  {
    fieldE01BIOIDN.setString(newvalue);
  }

  /**
  * Get value of field E01BIOIDN as a String.
  */
  public String getE01BIOIDN()
  {
    return fieldE01BIOIDN.getString();
  }

  /**
  * Set field E01BIONA1 using a String value.
  */
  public void setE01BIONA1(String newvalue)
  {
    fieldE01BIONA1.setString(newvalue);
  }

  /**
  * Get value of field E01BIONA1 as a String.
  */
  public String getE01BIONA1()
  {
    return fieldE01BIONA1.getString();
  }

  /**
  * Set field E01BIOREG using a String value.
  */
  public void setE01BIOREG(String newvalue)
  {
    fieldE01BIOREG.setString(newvalue);
  }

  /**
  * Get value of field E01BIOREG as a String.
  */
  public String getE01BIOREG()
  {
    return fieldE01BIOREG.getString();
  }

  /**
  * Set field E01BIOVER using a String value.
  */
  public void setE01BIOVER(String newvalue)
  {
    fieldE01BIOVER.setString(newvalue);
  }

  /**
  * Get value of field E01BIOVER as a String.
  */
  public String getE01BIOVER()
  {
    return fieldE01BIOVER.getString();
  }

  /**
  * Set field E01ACT using a String value.
  */
  public void setE01ACT(String newvalue)
  {
    fieldE01ACT.setString(newvalue);
  }

  /**
  * Get value of field E01ACT as a String.
  */
  public String getE01ACT()
  {
    return fieldE01ACT.getString();
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

  /**
  * Set field E01INDOPE using a String value.
  */
  public void setE01INDOPE(String newvalue)
  {
    fieldE01INDOPE.setString(newvalue);
  }

  /**
  * Get value of field E01INDOPE as a String.
  */
  public String getE01INDOPE()
  {
    return fieldE01INDOPE.getString();
  }

}