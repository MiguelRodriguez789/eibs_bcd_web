package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ESD079201 physical file definition.
* 
* File level identifier is 1180601104338.
* Record format level identifier is 4498236CBEB9E.
*/

public class ESD079201Message extends MessageRecord
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
                                     "E01COPCDE",
                                     "E01COPSEQ",
                                     "E01COPDES",
                                     "E01COPCOP",
                                     "E01COPCCO",
                                     "E01COPPHN",
                                     "E01COPIAD",
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
                                   "E01COPCDE",
                                   "E01COPSEQ",
                                   "E01COPDES",
                                   "E01COPCOP",
                                   "E01COPCCO",
                                   "E01COPPHN",
                                   "E01COPIAD",
                                   "E01NUMREC",
                                   "E01INDOPE"
                                 };
  final static String fid = "1180601104338";
  final static String rid = "4498236CBEB9E";
  final static String fmtname = "ESD079201";
  final int FIELDCOUNT = 18;
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
  private CharacterField fieldE01COPCDE = null;
  private DecimalField fieldE01COPSEQ = null;
  private CharacterField fieldE01COPDES = null;
  private CharacterField fieldE01COPCOP = null;
  private CharacterField fieldE01COPCCO = null;
  private DecimalField fieldE01COPPHN = null;
  private CharacterField fieldE01COPIAD = null;
  private DecimalField fieldE01NUMREC = null;
  private CharacterField fieldE01INDOPE = null;

  /**
  * Constructor for ESD079201Message.
  */
  public ESD079201Message()
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
    recordsize = 270;
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
    fields[9] = fieldE01COPCDE =
    new CharacterField(message, HEADERSIZE + 42, 4, "E01COPCDE");
    fields[10] = fieldE01COPSEQ =
    new DecimalField(message, HEADERSIZE + 46, 4, 0, "E01COPSEQ");
    fields[11] = fieldE01COPDES =
    new CharacterField(message, HEADERSIZE + 50, 45, "E01COPDES");
    fields[12] = fieldE01COPCOP =
    new CharacterField(message, HEADERSIZE + 95, 45, "E01COPCOP");
    fields[13] = fieldE01COPCCO =
    new CharacterField(message, HEADERSIZE + 140, 45, "E01COPCCO");
    fields[14] = fieldE01COPPHN =
    new DecimalField(message, HEADERSIZE + 185, 16, 0, "E01COPPHN");
    fields[15] = fieldE01COPIAD =
    new CharacterField(message, HEADERSIZE + 201, 60, "E01COPIAD");
    fields[16] = fieldE01NUMREC =
    new DecimalField(message, HEADERSIZE + 261, 8, 0, "E01NUMREC");
    fields[17] = fieldE01INDOPE =
    new CharacterField(message, HEADERSIZE + 269, 1, "E01INDOPE");

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
  * Set field E01COPCDE using a String value.
  */
  public void setE01COPCDE(String newvalue)
  {
    fieldE01COPCDE.setString(newvalue);
  }

  /**
  * Get value of field E01COPCDE as a String.
  */
  public String getE01COPCDE()
  {
    return fieldE01COPCDE.getString();
  }

  /**
  * Set field E01COPSEQ using a String value.
  */
  public void setE01COPSEQ(String newvalue)
  {
    fieldE01COPSEQ.setString(newvalue);
  }

  /**
  * Get value of field E01COPSEQ as a String.
  */
  public String getE01COPSEQ()
  {
    return fieldE01COPSEQ.getString();
  }

  /**
  * Set numeric field E01COPSEQ using a BigDecimal value.
  */
  public void setE01COPSEQ(BigDecimal newvalue)
  {
    fieldE01COPSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01COPSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01COPSEQ()
  {
    return fieldE01COPSEQ.getBigDecimal();
  }

  /**
  * Set field E01COPDES using a String value.
  */
  public void setE01COPDES(String newvalue)
  {
    fieldE01COPDES.setString(newvalue);
  }

  /**
  * Get value of field E01COPDES as a String.
  */
  public String getE01COPDES()
  {
    return fieldE01COPDES.getString();
  }

  /**
  * Set field E01COPCOP using a String value.
  */
  public void setE01COPCOP(String newvalue)
  {
    fieldE01COPCOP.setString(newvalue);
  }

  /**
  * Get value of field E01COPCOP as a String.
  */
  public String getE01COPCOP()
  {
    return fieldE01COPCOP.getString();
  }

  /**
  * Set field E01COPCCO using a String value.
  */
  public void setE01COPCCO(String newvalue)
  {
    fieldE01COPCCO.setString(newvalue);
  }

  /**
  * Get value of field E01COPCCO as a String.
  */
  public String getE01COPCCO()
  {
    return fieldE01COPCCO.getString();
  }

  /**
  * Set field E01COPPHN using a String value.
  */
  public void setE01COPPHN(String newvalue)
  {
    fieldE01COPPHN.setString(newvalue);
  }

  /**
  * Get value of field E01COPPHN as a String.
  */
  public String getE01COPPHN()
  {
    return fieldE01COPPHN.getString();
  }

  /**
  * Set numeric field E01COPPHN using a BigDecimal value.
  */
  public void setE01COPPHN(BigDecimal newvalue)
  {
    fieldE01COPPHN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01COPPHN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01COPPHN()
  {
    return fieldE01COPPHN.getBigDecimal();
  }

  /**
  * Set field E01COPIAD using a String value.
  */
  public void setE01COPIAD(String newvalue)
  {
    fieldE01COPIAD.setString(newvalue);
  }

  /**
  * Get value of field E01COPIAD as a String.
  */
  public String getE01COPIAD()
  {
    return fieldE01COPIAD.getString();
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
