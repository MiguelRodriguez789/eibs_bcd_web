package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECC005501 physical file definition.
* 
* File level identifier is 1100706173523.
* Record format level identifier is 3309C055D71CC.
*/

public class ECC005501Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H01USR",
                                     "H01PGM",
                                     "H01TIM",
                                     "H01SCR",
                                     "H01OPE",
                                     "H01MAS",
                                     "H01WK1",
                                     "H01WK2",
                                     "H01WK3",
                                     "E01ACC",
                                     "E01USR",
                                     "E01FLA"
                                   };
  final static String tnames[] = {
                                   "H01USR",
                                   "H01PGM",
                                   "H01TIM",
                                   "H01SCR",
                                   "H01OPE",
                                   "H01MAS",
                                   "H01WK1",
                                   "H01WK2",
                                   "H01WK3",
                                   "E01ACC",
                                   "E01USR",
                                   "E01FLA"
                                 };
  final static String fid = "1100706173523";
  final static String rid = "3309C055D71CC";
  final static String fmtname = "ECC005501";
  final int FIELDCOUNT = 12;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH01USR = null;
  private CharacterField fieldH01PGM = null;
  private CharacterField fieldH01TIM = null;
  private CharacterField fieldH01SCR = null;
  private CharacterField fieldH01OPE = null;
  private CharacterField fieldH01MAS = null;
  private CharacterField fieldH01WK1 = null;
  private CharacterField fieldH01WK2 = null;
  private CharacterField fieldH01WK3 = null;
  private DecimalField fieldE01ACC = null;
  private CharacterField fieldE01USR = null;
  private CharacterField fieldE01FLA = null;

  /**
  * Constructor for ECC005501Message.
  */
  public ECC005501Message()
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
    recordsize = 66;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH01USR =
    new CharacterField(message, HEADERSIZE + 0, 10, "H01USR");
    fields[1] = fieldH01PGM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H01PGM");
    fields[2] = fieldH01TIM =
    new CharacterField(message, HEADERSIZE + 20, 12, "H01TIM");
    fields[3] = fieldH01SCR =
    new CharacterField(message, HEADERSIZE + 32, 2, "H01SCR");
    fields[4] = fieldH01OPE =
    new CharacterField(message, HEADERSIZE + 34, 4, "H01OPE");
    fields[5] = fieldH01MAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H01MAS");
    fields[6] = fieldH01WK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H01WK1");
    fields[7] = fieldH01WK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H01WK2");
    fields[8] = fieldH01WK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H01WK3");
    fields[9] = fieldE01ACC =
    new DecimalField(message, HEADERSIZE + 42, 13, 0, "E01ACC");
    fields[10] = fieldE01USR =
    new CharacterField(message, HEADERSIZE + 55, 10, "E01USR");
    fields[11] = fieldE01FLA =
    new CharacterField(message, HEADERSIZE + 65, 1, "E01FLA");

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
  * Set field H01USR using a String value.
  */
  public void setH01USR(String newvalue)
  {
    fieldH01USR.setString(newvalue);
  }

  /**
  * Get value of field H01USR as a String.
  */
  public String getH01USR()
  {
    return fieldH01USR.getString();
  }

  /**
  * Set field H01PGM using a String value.
  */
  public void setH01PGM(String newvalue)
  {
    fieldH01PGM.setString(newvalue);
  }

  /**
  * Get value of field H01PGM as a String.
  */
  public String getH01PGM()
  {
    return fieldH01PGM.getString();
  }

  /**
  * Set field H01TIM using a String value.
  */
  public void setH01TIM(String newvalue)
  {
    fieldH01TIM.setString(newvalue);
  }

  /**
  * Get value of field H01TIM as a String.
  */
  public String getH01TIM()
  {
    return fieldH01TIM.getString();
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
  * Set field H01OPE using a String value.
  */
  public void setH01OPE(String newvalue)
  {
    fieldH01OPE.setString(newvalue);
  }

  /**
  * Get value of field H01OPE as a String.
  */
  public String getH01OPE()
  {
    return fieldH01OPE.getString();
  }

  /**
  * Set field H01MAS using a String value.
  */
  public void setH01MAS(String newvalue)
  {
    fieldH01MAS.setString(newvalue);
  }

  /**
  * Get value of field H01MAS as a String.
  */
  public String getH01MAS()
  {
    return fieldH01MAS.getString();
  }

  /**
  * Set field H01WK1 using a String value.
  */
  public void setH01WK1(String newvalue)
  {
    fieldH01WK1.setString(newvalue);
  }

  /**
  * Get value of field H01WK1 as a String.
  */
  public String getH01WK1()
  {
    return fieldH01WK1.getString();
  }

  /**
  * Set field H01WK2 using a String value.
  */
  public void setH01WK2(String newvalue)
  {
    fieldH01WK2.setString(newvalue);
  }

  /**
  * Get value of field H01WK2 as a String.
  */
  public String getH01WK2()
  {
    return fieldH01WK2.getString();
  }

  /**
  * Set field H01WK3 using a String value.
  */
  public void setH01WK3(String newvalue)
  {
    fieldH01WK3.setString(newvalue);
  }

  /**
  * Get value of field H01WK3 as a String.
  */
  public String getH01WK3()
  {
    return fieldH01WK3.getString();
  }

  /**
  * Set field E01ACC using a String value.
  */
  public void setE01ACC(String newvalue)
  {
    fieldE01ACC.setString(newvalue);
  }

  /**
  * Get value of field E01ACC as a String.
  */
  public String getE01ACC()
  {
    return fieldE01ACC.getString();
  }

  /**
  * Set numeric field E01ACC using a BigDecimal value.
  */
  public void setE01ACC(BigDecimal newvalue)
  {
    fieldE01ACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01ACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01ACC()
  {
    return fieldE01ACC.getBigDecimal();
  }

  /**
  * Set field E01USR using a String value.
  */
  public void setE01USR(String newvalue)
  {
    fieldE01USR.setString(newvalue);
  }

  /**
  * Get value of field E01USR as a String.
  */
  public String getE01USR()
  {
    return fieldE01USR.getString();
  }

  /**
  * Set field E01FLA using a String value.
  */
  public void setE01FLA(String newvalue)
  {
    fieldE01FLA.setString(newvalue);
  }

  /**
  * Get value of field E01FLA as a String.
  */
  public String getE01FLA()
  {
    return fieldE01FLA.getString();
  }

}