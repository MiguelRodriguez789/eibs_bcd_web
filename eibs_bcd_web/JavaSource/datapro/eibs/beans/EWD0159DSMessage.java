package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EWD0159DS physical file definition.
* 
* File level identifier is 1150429110213.
* Record format level identifier is 3243D4A88510A.
*/

public class EWD0159DSMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "EWDCNV",
                                     "EWDSEQ",
                                     "EWDDES",
                                     "EWDOPE"
                                   };
  final static String tnames[] = {
                                   "EWDCNV",
                                   "EWDSEQ",
                                   "EWDDES",
                                   "EWDOPE"
                                 };
  final static String fid = "1150429110213";
  final static String rid = "3243D4A88510A";
  final static String fmtname = "EWD0159DS";
  final int FIELDCOUNT = 4;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldEWDCNV = null;
  private DecimalField fieldEWDSEQ = null;
  private CharacterField fieldEWDDES = null;
  private CharacterField fieldEWDOPE = null;

  /**
  * Constructor for EWD0159DSMessage.
  */
  public EWD0159DSMessage()
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
    recordsize = 54;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldEWDCNV =
    new CharacterField(message, HEADERSIZE + 0, 4, "EWDCNV");
    fields[1] = fieldEWDSEQ =
    new DecimalField(message, HEADERSIZE + 4, 4, 0, "EWDSEQ");
    fields[2] = fieldEWDDES =
    new CharacterField(message, HEADERSIZE + 8, 45, "EWDDES");
    fields[3] = fieldEWDOPE =
    new CharacterField(message, HEADERSIZE + 53, 1, "EWDOPE");

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
  * Set field EWDCNV using a String value.
  */
  public void setEWDCNV(String newvalue)
  {
    fieldEWDCNV.setString(newvalue);
  }

  /**
  * Get value of field EWDCNV as a String.
  */
  public String getEWDCNV()
  {
    return fieldEWDCNV.getString();
  }

  /**
  * Set field EWDSEQ using a String value.
  */
  public void setEWDSEQ(String newvalue)
  {
    fieldEWDSEQ.setString(newvalue);
  }

  /**
  * Get value of field EWDSEQ as a String.
  */
  public String getEWDSEQ()
  {
    return fieldEWDSEQ.getString();
  }

  /**
  * Set numeric field EWDSEQ using a BigDecimal value.
  */
  public void setEWDSEQ(BigDecimal newvalue)
  {
    fieldEWDSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field EWDSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalEWDSEQ()
  {
    return fieldEWDSEQ.getBigDecimal();
  }

  /**
  * Set field EWDDES using a String value.
  */
  public void setEWDDES(String newvalue)
  {
    fieldEWDDES.setString(newvalue);
  }

  /**
  * Get value of field EWDDES as a String.
  */
  public String getEWDDES()
  {
    return fieldEWDDES.getString();
  }

  /**
  * Set field EWDOPE using a String value.
  */
  public void setEWDOPE(String newvalue)
  {
    fieldEWDOPE.setString(newvalue);
  }

  /**
  * Get value of field EWDOPE as a String.
  */
  public String getEWDOPE()
  {
    return fieldEWDOPE.getString();
  }

}
