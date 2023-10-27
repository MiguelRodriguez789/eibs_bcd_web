package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDC00040 physical file definition.
* 
* File level identifier is 1100706173544.
* Record format level identifier is 3D3A6CDCE0C05.
*/

public class EDC00040Message extends MessageRecord
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
                                     "EDCRCL",
                                     "EDCSIC",
                                     "EDCPER",
                                     "EDCSTS",
                                     "EDCSTD",
                                     "EDCXRT"
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
                                   "EDCRCL",
                                   "EDCSIC",
                                   "EDCPER",
                                   "EDCSTS",
                                   "EDCSTD",
                                   "EDCXRT"
                                 };
  final static String fid = "1100706173544";
  final static String rid = "3D3A6CDCE0C05";
  final static String fmtname = "EDC00040";
  final int FIELDCOUNT = 15;
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
  private CharacterField fieldEDCRCL = null;
  private CharacterField fieldEDCSIC = null;
  private DecimalField fieldEDCPER = null;
  private DecimalField fieldEDCSTS = null;
  private CharacterField fieldEDCSTD = null;
  private DecimalField fieldEDCXRT = null;

  /**
  * Constructor for EDC00040Message.
  */
  public EDC00040Message()
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
    recordsize = 125;
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
    fields[9] = fieldEDCRCL =
    new CharacterField(message, HEADERSIZE + 42, 15, "EDCRCL");
    fields[10] = fieldEDCSIC =
    new CharacterField(message, HEADERSIZE + 57, 30, "EDCSIC");
    fields[11] = fieldEDCPER =
    new DecimalField(message, HEADERSIZE + 87, 7, 0, "EDCPER");
    fields[12] = fieldEDCSTS =
    new DecimalField(message, HEADERSIZE + 94, 2, 0, "EDCSTS");
    fields[13] = fieldEDCSTD =
    new CharacterField(message, HEADERSIZE + 96, 27, "EDCSTD");
    fields[14] = fieldEDCXRT =
    new DecimalField(message, HEADERSIZE + 123, 2, 0, "EDCXRT");

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
  * Set field EDCRCL using a String value.
  */
  public void setEDCRCL(String newvalue)
  {
    fieldEDCRCL.setString(newvalue);
  }

  /**
  * Get value of field EDCRCL as a String.
  */
  public String getEDCRCL()
  {
    return fieldEDCRCL.getString();
  }

  /**
  * Set field EDCSIC using a String value.
  */
  public void setEDCSIC(String newvalue)
  {
    fieldEDCSIC.setString(newvalue);
  }

  /**
  * Get value of field EDCSIC as a String.
  */
  public String getEDCSIC()
  {
    return fieldEDCSIC.getString();
  }

  /**
  * Set field EDCPER using a String value.
  */
  public void setEDCPER(String newvalue)
  {
    fieldEDCPER.setString(newvalue);
  }

  /**
  * Get value of field EDCPER as a String.
  */
  public String getEDCPER()
  {
    return fieldEDCPER.getString();
  }

  /**
  * Set numeric field EDCPER using a BigDecimal value.
  */
  public void setEDCPER(BigDecimal newvalue)
  {
    fieldEDCPER.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EDCPER as a BigDecimal.
  */
  public BigDecimal getBigDecimalEDCPER()
  {
    return fieldEDCPER.getBigDecimal();
  }

  /**
  * Set field EDCSTS using a String value.
  */
  public void setEDCSTS(String newvalue)
  {
    fieldEDCSTS.setString(newvalue);
  }

  /**
  * Get value of field EDCSTS as a String.
  */
  public String getEDCSTS()
  {
    return fieldEDCSTS.getString();
  }

  /**
  * Set numeric field EDCSTS using a BigDecimal value.
  */
  public void setEDCSTS(BigDecimal newvalue)
  {
    fieldEDCSTS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EDCSTS as a BigDecimal.
  */
  public BigDecimal getBigDecimalEDCSTS()
  {
    return fieldEDCSTS.getBigDecimal();
  }

  /**
  * Set field EDCSTD using a String value.
  */
  public void setEDCSTD(String newvalue)
  {
    fieldEDCSTD.setString(newvalue);
  }

  /**
  * Get value of field EDCSTD as a String.
  */
  public String getEDCSTD()
  {
    return fieldEDCSTD.getString();
  }

  /**
  * Set field EDCXRT using a String value.
  */
  public void setEDCXRT(String newvalue)
  {
    fieldEDCXRT.setString(newvalue);
  }

  /**
  * Get value of field EDCXRT as a String.
  */
  public String getEDCXRT()
  {
    return fieldEDCXRT.getString();
  }

  /**
  * Set numeric field EDCXRT using a BigDecimal value.
  */
  public void setEDCXRT(BigDecimal newvalue)
  {
    fieldEDCXRT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EDCXRT as a BigDecimal.
  */
  public BigDecimal getBigDecimalEDCXRT()
  {
    return fieldEDCXRT.getBigDecimal();
  }

}
