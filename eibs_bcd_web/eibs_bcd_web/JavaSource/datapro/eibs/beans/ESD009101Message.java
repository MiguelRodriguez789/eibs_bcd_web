package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESD009101 physical file definition.
* 
* File level identifier is 1170727145218.
* Record format level identifier is 3A575E5F823F1.
*/

public class ESD009101Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H01USERID",
                                     "H01PROGRM",
                                     "H01TIMSYS",
                                     "H01SCR",
                                     "H01OPECOD",
                                     "H01FLGMAS",
                                     "H01FLGWK1",
                                     "H01FLGWK2",
                                     "H01FLGWK3",
                                     "H01CUN",
                                     "H01LGT",
                                     "H01STS",
                                     "H01NA1",
                                     "H01IDN",
                                     "H01TID",
                                     "H01PID",
                                     "E01BNK",
                                     "E01NRI",
                                     "E01DNR",
                                     "E01CAR",
                                     "E01OFE",
                                     "E01FAY",
                                     "E01FAM",
                                     "E01FAD",
                                     "D01STS",
                                     "D01UC6",
                                     "E01NUMREC",
                                     "E01INDOPE"
                                   };
  final static String tnames[] = {
                                   "H01USERID",
                                   "H01PROGRM",
                                   "H01TIMSYS",
                                   "H01SCR",
                                   "H01OPECOD",
                                   "H01FLGMAS",
                                   "H01FLGWK1",
                                   "H01FLGWK2",
                                   "H01FLGWK3",
                                   "H01CUN",
                                   "H01LGT",
                                   "H01STS",
                                   "H01NA1",
                                   "H01IDN",
                                   "H01TID",
                                   "H01PID",
                                   "E01BNK",
                                   "E01NRI",
                                   "E01DNR",
                                   "E01CAR",
                                   "E01OFE",
                                   "E01FAY",
                                   "E01FAM",
                                   "E01FAD",
                                   "D01STS",
                                   "D01UC6",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1170727145218";
  final static String rid = "3A575E5F823F1";
  final static String fmtname = "ESD009101";
  final int FIELDCOUNT = 28;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH01USERID = null;
  private CharacterField fieldH01PROGRM = null;
  private CharacterField fieldH01TIMSYS = null;
  private CharacterField fieldH01SCR = null;
  private CharacterField fieldH01OPECOD = null;
  private CharacterField fieldH01FLGMAS = null;
  private CharacterField fieldH01FLGWK1 = null;
  private CharacterField fieldH01FLGWK2 = null;
  private CharacterField fieldH01FLGWK3 = null;
  private DecimalField fieldH01CUN = null;
  private CharacterField fieldH01LGT = null;
  private CharacterField fieldH01STS = null;
  private CharacterField fieldH01NA1 = null;
  private CharacterField fieldH01IDN = null;
  private CharacterField fieldH01TID = null;
  private CharacterField fieldH01PID = null;
  private CharacterField fieldE01BNK = null;
  private CharacterField fieldE01NRI = null;
  private CharacterField fieldE01DNR = null;
  private DecimalField fieldE01CAR = null;
  private CharacterField fieldE01OFE = null;
  private DecimalField fieldE01FAY = null;
  private DecimalField fieldE01FAM = null;
  private DecimalField fieldE01FAD = null;
  private CharacterField fieldD01STS = null;
  private CharacterField fieldD01UC6 = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for ESD009101Message.
  */
  public ESD009101Message()
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
    recordsize = 380;
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
    fields[3] = fieldH01SCR =
    new CharacterField(message, HEADERSIZE + 32, 2, "H01SCR");
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
    fields[9] = fieldH01CUN =
    new DecimalField(message, HEADERSIZE + 42, 10, 0, "H01CUN");
    fields[10] = fieldH01LGT =
    new CharacterField(message, HEADERSIZE + 52, 1, "H01LGT");
    fields[11] = fieldH01STS =
    new CharacterField(message, HEADERSIZE + 53, 1, "H01STS");
    fields[12] = fieldH01NA1 =
    new CharacterField(message, HEADERSIZE + 54, 45, "H01NA1");
    fields[13] = fieldH01IDN =
    new CharacterField(message, HEADERSIZE + 99, 25, "H01IDN");
    fields[14] = fieldH01TID =
    new CharacterField(message, HEADERSIZE + 124, 4, "H01TID");
    fields[15] = fieldH01PID =
    new CharacterField(message, HEADERSIZE + 128, 4, "H01PID");
    fields[16] = fieldE01BNK =
    new CharacterField(message, HEADERSIZE + 132, 2, "E01BNK");
    fields[17] = fieldE01NRI =
    new CharacterField(message, HEADERSIZE + 134, 4, "E01NRI");
    fields[18] = fieldE01DNR =
    new CharacterField(message, HEADERSIZE + 138, 60, "E01DNR");
    fields[19] = fieldE01CAR =
    new DecimalField(message, HEADERSIZE + 198, 8, 3, "E01CAR");
    fields[20] = fieldE01OFE =
    new CharacterField(message, HEADERSIZE + 206, 60, "E01OFE");
    fields[21] = fieldE01FAY =
    new DecimalField(message, HEADERSIZE + 266, 5, 0, "E01FAY");
    fields[22] = fieldE01FAM =
    new DecimalField(message, HEADERSIZE + 271, 5, 0, "E01FAM");
    fields[23] = fieldE01FAD =
    new DecimalField(message, HEADERSIZE + 276, 5, 0, "E01FAD");
    fields[24] = fieldD01STS =
    new CharacterField(message, HEADERSIZE + 281, 45, "D01STS");
    fields[25] = fieldD01UC6 =
    new CharacterField(message, HEADERSIZE + 326, 45, "D01UC6");
    fields[26] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 371, 8, 0, "E01NUMREC");
    fields[27] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 379, 1, "E01INDOPE");

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
  * Set field H01SCR using a String value.
  */
  public void setH01SCR(String newvalue)
  {
    fieldH01SCR.setString(newvalue);
  }

  /**
  * Get value of field H01SCR as a String.
  */
  public String getH01SCR()
  {
    return fieldH01SCR.getString();
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
  * Set field H01CUN using a String value.
  */
  public void setH01CUN(String newvalue)
  {
    fieldH01CUN.setString(newvalue);
  }

  /**
  * Get value of field H01CUN as a String.
  */
  public String getH01CUN()
  {
    return fieldH01CUN.getString();
  }

  /**
  * Set numeric field H01CUN using a BigDecimal value.
  */
  public void setH01CUN(BigDecimal newvalue)
  {
    fieldH01CUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field H01CUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalH01CUN()
  {
    return fieldH01CUN.getBigDecimal();
  }

  /**
  * Set field H01LGT using a String value.
  */
  public void setH01LGT(String newvalue)
  {
    fieldH01LGT.setString(newvalue);
  }

  /**
  * Get value of field H01LGT as a String.
  */
  public String getH01LGT()
  {
    return fieldH01LGT.getString();
  }

  /**
  * Set field H01STS using a String value.
  */
  public void setH01STS(String newvalue)
  {
    fieldH01STS.setString(newvalue);
  }

  /**
  * Get value of field H01STS as a String.
  */
  public String getH01STS()
  {
    return fieldH01STS.getString();
  }

  /**
  * Set field H01NA1 using a String value.
  */
  public void setH01NA1(String newvalue)
  {
    fieldH01NA1.setString(newvalue);
  }

  /**
  * Get value of field H01NA1 as a String.
  */
  public String getH01NA1()
  {
    return fieldH01NA1.getString();
  }

  /**
  * Set field H01IDN using a String value.
  */
  public void setH01IDN(String newvalue)
  {
    fieldH01IDN.setString(newvalue);
  }

  /**
  * Get value of field H01IDN as a String.
  */
  public String getH01IDN()
  {
    return fieldH01IDN.getString();
  }

  /**
  * Set field H01TID using a String value.
  */
  public void setH01TID(String newvalue)
  {
    fieldH01TID.setString(newvalue);
  }

  /**
  * Get value of field H01TID as a String.
  */
  public String getH01TID()
  {
    return fieldH01TID.getString();
  }

  /**
  * Set field H01PID using a String value.
  */
  public void setH01PID(String newvalue)
  {
    fieldH01PID.setString(newvalue);
  }

  /**
  * Get value of field H01PID as a String.
  */
  public String getH01PID()
  {
    return fieldH01PID.getString();
  }

  /**
  * Set field E01BNK using a String value.
  */
  public void setE01BNK(String newvalue)
  {
    fieldE01BNK.setString(newvalue);
  }

  /**
  * Get value of field E01BNK as a String.
  */
  public String getE01BNK()
  {
    return fieldE01BNK.getString();
  }

  /**
  * Set field E01NRI using a String value.
  */
  public void setE01NRI(String newvalue)
  {
    fieldE01NRI.setString(newvalue);
  }

  /**
  * Get value of field E01NRI as a String.
  */
  public String getE01NRI()
  {
    return fieldE01NRI.getString();
  }

  /**
  * Set field E01DNR using a String value.
  */
  public void setE01DNR(String newvalue)
  {
    fieldE01DNR.setString(newvalue);
  }

  /**
  * Get value of field E01DNR as a String.
  */
  public String getE01DNR()
  {
    return fieldE01DNR.getString();
  }

  /**
  * Set field E01CAR using a String value.
  */
  public void setE01CAR(String newvalue)
  {
    fieldE01CAR.setString(newvalue);
  }

  /**
  * Get value of field E01CAR as a String.
  */
  public String getE01CAR()
  {
    return fieldE01CAR.getString();
  }

  /**
  * Set numeric field E01CAR using a BigDecimal value.
  */
  public void setE01CAR(BigDecimal newvalue)
  {
    fieldE01CAR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CAR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CAR()
  {
    return fieldE01CAR.getBigDecimal();
  }

  /**
  * Set field E01OFE using a String value.
  */
  public void setE01OFE(String newvalue)
  {
    fieldE01OFE.setString(newvalue);
  }

  /**
  * Get value of field E01OFE as a String.
  */
  public String getE01OFE()
  {
    return fieldE01OFE.getString();
  }

  /**
  * Set field E01FAY using a String value.
  */
  public void setE01FAY(String newvalue)
  {
    fieldE01FAY.setString(newvalue);
  }

  /**
  * Get value of field E01FAY as a String.
  */
  public String getE01FAY()
  {
    return fieldE01FAY.getString();
  }

  /**
  * Set numeric field E01FAY using a BigDecimal value.
  */
  public void setE01FAY(BigDecimal newvalue)
  {
    fieldE01FAY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FAY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FAY()
  {
    return fieldE01FAY.getBigDecimal();
  }

  /**
  * Set field E01FAM using a String value.
  */
  public void setE01FAM(String newvalue)
  {
    fieldE01FAM.setString(newvalue);
  }

  /**
  * Get value of field E01FAM as a String.
  */
  public String getE01FAM()
  {
    return fieldE01FAM.getString();
  }

  /**
  * Set numeric field E01FAM using a BigDecimal value.
  */
  public void setE01FAM(BigDecimal newvalue)
  {
    fieldE01FAM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FAM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FAM()
  {
    return fieldE01FAM.getBigDecimal();
  }

  /**
  * Set field E01FAD using a String value.
  */
  public void setE01FAD(String newvalue)
  {
    fieldE01FAD.setString(newvalue);
  }

  /**
  * Get value of field E01FAD as a String.
  */
  public String getE01FAD()
  {
    return fieldE01FAD.getString();
  }

  /**
  * Set numeric field E01FAD using a BigDecimal value.
  */
  public void setE01FAD(BigDecimal newvalue)
  {
    fieldE01FAD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01FAD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01FAD()
  {
    return fieldE01FAD.getBigDecimal();
  }

  /**
  * Set field D01STS using a String value.
  */
  public void setD01STS(String newvalue)
  {
    fieldD01STS.setString(newvalue);
  }

  /**
  * Get value of field D01STS as a String.
  */
  public String getD01STS()
  {
    return fieldD01STS.getString();
  }

  /**
  * Set field D01UC6 using a String value.
  */
  public void setD01UC6(String newvalue)
  {
    fieldD01UC6.setString(newvalue);
  }

  /**
  * Get value of field D01UC6 as a String.
  */
  public String getD01UC6()
  {
    return fieldD01UC6.getString();
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
