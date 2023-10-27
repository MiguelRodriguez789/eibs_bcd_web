package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECNL03001 physical file definition.
* 
* File level identifier is 1130611112849.
* Record format level identifier is 509BA9B177EDC.
*/

public class ECNL03001Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "E01CODBNK",
                                     "E01CODTRN",
                                     "E01CODCNL",
                                     "E01CODTMN",
                                     "E01CODER1",
                                     "E01ERRDS1",
                                     "E01CODER2",
                                     "E01ERRDS2",
                                     "E01CODER3",
                                     "E01ERRDS3",
                                     "E01CODER4",
                                     "E01ERRDS4",
                                     "E01CODER5",
                                     "E01ERRDS5",
                                     "E01NUMCAR",
                                     "E01TYPCAR",
                                     "E01CUSCUN",
                                     "E01CUENTA",
                                     "E01NUMCKN",
                                     "E01AMTCKN",
                                     "E01NUMSEQ",
                                     "E01CUSIDN"
                                   };
  final static String tnames[] = {
                                   "E01CODBNK",
                                   "E01CODTRN",
                                   "E01CODCNL",
                                   "E01CODTMN",
                                   "E01CODER1",
                                   "E01ERRDS1",
                                   "E01CODER2",
                                   "E01ERRDS2",
                                   "E01CODER3",
                                   "E01ERRDS3",
                                   "E01CODER4",
                                   "E01ERRDS4",
                                   "E01CODER5",
                                   "E01ERRDS5",
                                   "E01NUMCAR",
                                   "E01TYPCAR",
                                   "E01CUSCUN",
                                   "E01CUENTA",
                                   "E01NUMCKN",
                                   "E01AMTCKN",
                                   "E01NUMSEQ",
                                   "E01CUSIDN"
                                 };
  final static String fid = "1130611112849";
  final static String rid = "509BA9B177EDC";
  final static String fmtname = "ECNL03001";
  final int FIELDCOUNT = 22;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldE01CODBNK = null;
  private CharacterField fieldE01CODTRN = null;
  private CharacterField fieldE01CODCNL = null;
  private CharacterField fieldE01CODTMN = null;
  private DecimalField fieldE01CODER1 = null;
  private CharacterField fieldE01ERRDS1 = null;
  private DecimalField fieldE01CODER2 = null;
  private CharacterField fieldE01ERRDS2 = null;
  private DecimalField fieldE01CODER3 = null;
  private CharacterField fieldE01ERRDS3 = null;
  private DecimalField fieldE01CODER4 = null;
  private CharacterField fieldE01ERRDS4 = null;
  private DecimalField fieldE01CODER5 = null;
  private CharacterField fieldE01ERRDS5 = null;
  private CharacterField fieldE01NUMCAR = null;
  private CharacterField fieldE01TYPCAR = null;
  private DecimalField fieldE01CUSCUN = null;
  private DecimalField fieldE01CUENTA = null;
  private DecimalField fieldE01NUMCKN = null;
  private DecimalField fieldE01AMTCKN = null;
  private DecimalField fieldE01NUMSEQ = null;
  private CharacterField fieldE01CUSIDN = null;

  /**
  * Constructor for ECNL03001Message.
  */
  public ECNL03001Message()
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
    recordsize = 555;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldE01CODBNK =
    new CharacterField(message, HEADERSIZE + 0, 2, "E01CODBNK");
    fields[1] = fieldE01CODTRN =
    new CharacterField(message, HEADERSIZE + 2, 4, "E01CODTRN");
    fields[2] = fieldE01CODCNL =
    new CharacterField(message, HEADERSIZE + 6, 4, "E01CODCNL");
    fields[3] = fieldE01CODTMN =
    new CharacterField(message, HEADERSIZE + 10, 4, "E01CODTMN");
    fields[4] = fieldE01CODER1 =
    new DecimalField(message, HEADERSIZE + 14, 5, 0, "E01CODER1");
    fields[5] = fieldE01ERRDS1 =
    new CharacterField(message, HEADERSIZE + 19, 80, "E01ERRDS1");
    fields[6] = fieldE01CODER2 =
    new DecimalField(message, HEADERSIZE + 99, 5, 0, "E01CODER2");
    fields[7] = fieldE01ERRDS2 =
    new CharacterField(message, HEADERSIZE + 104, 80, "E01ERRDS2");
    fields[8] = fieldE01CODER3 =
    new DecimalField(message, HEADERSIZE + 184, 5, 0, "E01CODER3");
    fields[9] = fieldE01ERRDS3 =
    new CharacterField(message, HEADERSIZE + 189, 80, "E01ERRDS3");
    fields[10] = fieldE01CODER4 =
    new DecimalField(message, HEADERSIZE + 269, 5, 0, "E01CODER4");
    fields[11] = fieldE01ERRDS4 =
    new CharacterField(message, HEADERSIZE + 274, 80, "E01ERRDS4");
    fields[12] = fieldE01CODER5 =
    new DecimalField(message, HEADERSIZE + 354, 5, 0, "E01CODER5");
    fields[13] = fieldE01ERRDS5 =
    new CharacterField(message, HEADERSIZE + 359, 80, "E01ERRDS5");
    fields[14] = fieldE01NUMCAR =
    new CharacterField(message, HEADERSIZE + 439, 20, "E01NUMCAR");
    fields[15] = fieldE01TYPCAR =
    new CharacterField(message, HEADERSIZE + 459, 1, "E01TYPCAR");
    fields[16] = fieldE01CUSCUN =
    new DecimalField(message, HEADERSIZE + 460, 10, 0, "E01CUSCUN");
    fields[17] = fieldE01CUENTA =
    new DecimalField(message, HEADERSIZE + 470, 21, 0, "E01CUENTA");
    fields[18] = fieldE01NUMCKN =
    new DecimalField(message, HEADERSIZE + 491, 12, 0, "E01NUMCKN");
    fields[19] = fieldE01AMTCKN =
    new DecimalField(message, HEADERSIZE + 503, 17, 2, "E01AMTCKN");
    fields[20] = fieldE01NUMSEQ =
    new DecimalField(message, HEADERSIZE + 520, 10, 0, "E01NUMSEQ");
    fields[21] = fieldE01CUSIDN =
    new CharacterField(message, HEADERSIZE + 530, 25, "E01CUSIDN");

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
  * Set field E01CODBNK using a String value.
  */
  public void setE01CODBNK(String newvalue)
  {
    fieldE01CODBNK.setString(newvalue);
  }

  /**
  * Get value of field E01CODBNK as a String.
  */
  public String getE01CODBNK()
  {
    return fieldE01CODBNK.getString();
  }

  /**
  * Set field E01CODTRN using a String value.
  */
  public void setE01CODTRN(String newvalue)
  {
    fieldE01CODTRN.setString(newvalue);
  }

  /**
  * Get value of field E01CODTRN as a String.
  */
  public String getE01CODTRN()
  {
    return fieldE01CODTRN.getString();
  }

  /**
  * Set field E01CODCNL using a String value.
  */
  public void setE01CODCNL(String newvalue)
  {
    fieldE01CODCNL.setString(newvalue);
  }

  /**
  * Get value of field E01CODCNL as a String.
  */
  public String getE01CODCNL()
  {
    return fieldE01CODCNL.getString();
  }

  /**
  * Set field E01CODTMN using a String value.
  */
  public void setE01CODTMN(String newvalue)
  {
    fieldE01CODTMN.setString(newvalue);
  }

  /**
  * Get value of field E01CODTMN as a String.
  */
  public String getE01CODTMN()
  {
    return fieldE01CODTMN.getString();
  }

  /**
  * Set field E01CODER1 using a String value.
  */
  public void setE01CODER1(String newvalue)
  {
    fieldE01CODER1.setString(newvalue);
  }

  /**
  * Get value of field E01CODER1 as a String.
  */
  public String getE01CODER1()
  {
    return fieldE01CODER1.getString();
  }

  /**
  * Set numeric field E01CODER1 using a BigDecimal value.
  */
  public void setE01CODER1(BigDecimal newvalue)
  {
    fieldE01CODER1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CODER1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CODER1()
  {
    return fieldE01CODER1.getBigDecimal();
  }

  /**
  * Set field E01ERRDS1 using a String value.
  */
  public void setE01ERRDS1(String newvalue)
  {
    fieldE01ERRDS1.setString(newvalue);
  }

  /**
  * Get value of field E01ERRDS1 as a String.
  */
  public String getE01ERRDS1()
  {
    return fieldE01ERRDS1.getString();
  }

  /**
  * Set field E01CODER2 using a String value.
  */
  public void setE01CODER2(String newvalue)
  {
    fieldE01CODER2.setString(newvalue);
  }

  /**
  * Get value of field E01CODER2 as a String.
  */
  public String getE01CODER2()
  {
    return fieldE01CODER2.getString();
  }

  /**
  * Set numeric field E01CODER2 using a BigDecimal value.
  */
  public void setE01CODER2(BigDecimal newvalue)
  {
    fieldE01CODER2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CODER2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CODER2()
  {
    return fieldE01CODER2.getBigDecimal();
  }

  /**
  * Set field E01ERRDS2 using a String value.
  */
  public void setE01ERRDS2(String newvalue)
  {
    fieldE01ERRDS2.setString(newvalue);
  }

  /**
  * Get value of field E01ERRDS2 as a String.
  */
  public String getE01ERRDS2()
  {
    return fieldE01ERRDS2.getString();
  }

  /**
  * Set field E01CODER3 using a String value.
  */
  public void setE01CODER3(String newvalue)
  {
    fieldE01CODER3.setString(newvalue);
  }

  /**
  * Get value of field E01CODER3 as a String.
  */
  public String getE01CODER3()
  {
    return fieldE01CODER3.getString();
  }

  /**
  * Set numeric field E01CODER3 using a BigDecimal value.
  */
  public void setE01CODER3(BigDecimal newvalue)
  {
    fieldE01CODER3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CODER3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CODER3()
  {
    return fieldE01CODER3.getBigDecimal();
  }

  /**
  * Set field E01ERRDS3 using a String value.
  */
  public void setE01ERRDS3(String newvalue)
  {
    fieldE01ERRDS3.setString(newvalue);
  }

  /**
  * Get value of field E01ERRDS3 as a String.
  */
  public String getE01ERRDS3()
  {
    return fieldE01ERRDS3.getString();
  }

  /**
  * Set field E01CODER4 using a String value.
  */
  public void setE01CODER4(String newvalue)
  {
    fieldE01CODER4.setString(newvalue);
  }

  /**
  * Get value of field E01CODER4 as a String.
  */
  public String getE01CODER4()
  {
    return fieldE01CODER4.getString();
  }

  /**
  * Set numeric field E01CODER4 using a BigDecimal value.
  */
  public void setE01CODER4(BigDecimal newvalue)
  {
    fieldE01CODER4.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CODER4 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CODER4()
  {
    return fieldE01CODER4.getBigDecimal();
  }

  /**
  * Set field E01ERRDS4 using a String value.
  */
  public void setE01ERRDS4(String newvalue)
  {
    fieldE01ERRDS4.setString(newvalue);
  }

  /**
  * Get value of field E01ERRDS4 as a String.
  */
  public String getE01ERRDS4()
  {
    return fieldE01ERRDS4.getString();
  }

  /**
  * Set field E01CODER5 using a String value.
  */
  public void setE01CODER5(String newvalue)
  {
    fieldE01CODER5.setString(newvalue);
  }

  /**
  * Get value of field E01CODER5 as a String.
  */
  public String getE01CODER5()
  {
    return fieldE01CODER5.getString();
  }

  /**
  * Set numeric field E01CODER5 using a BigDecimal value.
  */
  public void setE01CODER5(BigDecimal newvalue)
  {
    fieldE01CODER5.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CODER5 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CODER5()
  {
    return fieldE01CODER5.getBigDecimal();
  }

  /**
  * Set field E01ERRDS5 using a String value.
  */
  public void setE01ERRDS5(String newvalue)
  {
    fieldE01ERRDS5.setString(newvalue);
  }

  /**
  * Get value of field E01ERRDS5 as a String.
  */
  public String getE01ERRDS5()
  {
    return fieldE01ERRDS5.getString();
  }

  /**
  * Set field E01NUMCAR using a String value.
  */
  public void setE01NUMCAR(String newvalue)
  {
    fieldE01NUMCAR.setString(newvalue);
  }

  /**
  * Get value of field E01NUMCAR as a String.
  */
  public String getE01NUMCAR()
  {
    return fieldE01NUMCAR.getString();
  }

  /**
  * Set field E01TYPCAR using a String value.
  */
  public void setE01TYPCAR(String newvalue)
  {
    fieldE01TYPCAR.setString(newvalue);
  }

  /**
  * Get value of field E01TYPCAR as a String.
  */
  public String getE01TYPCAR()
  {
    return fieldE01TYPCAR.getString();
  }

  /**
  * Set field E01CUSCUN using a String value.
  */
  public void setE01CUSCUN(String newvalue)
  {
    fieldE01CUSCUN.setString(newvalue);
  }

  /**
  * Get value of field E01CUSCUN as a String.
  */
  public String getE01CUSCUN()
  {
    return fieldE01CUSCUN.getString();
  }

  /**
  * Set numeric field E01CUSCUN using a BigDecimal value.
  */
  public void setE01CUSCUN(BigDecimal newvalue)
  {
    fieldE01CUSCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUSCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUSCUN()
  {
    return fieldE01CUSCUN.getBigDecimal();
  }

  /**
  * Set field E01CUENTA using a String value.
  */
  public void setE01CUENTA(String newvalue)
  {
    fieldE01CUENTA.setString(newvalue);
  }

  /**
  * Get value of field E01CUENTA as a String.
  */
  public String getE01CUENTA()
  {
    return fieldE01CUENTA.getString();
  }

  /**
  * Set numeric field E01CUENTA using a BigDecimal value.
  */
  public void setE01CUENTA(BigDecimal newvalue)
  {
    fieldE01CUENTA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01CUENTA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01CUENTA()
  {
    return fieldE01CUENTA.getBigDecimal();
  }

  /**
  * Set field E01NUMCKN using a String value.
  */
  public void setE01NUMCKN(String newvalue)
  {
    fieldE01NUMCKN.setString(newvalue);
  }

  /**
  * Get value of field E01NUMCKN as a String.
  */
  public String getE01NUMCKN()
  {
    return fieldE01NUMCKN.getString();
  }

  /**
  * Set numeric field E01NUMCKN using a BigDecimal value.
  */
  public void setE01NUMCKN(BigDecimal newvalue)
  {
    fieldE01NUMCKN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01NUMCKN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01NUMCKN()
  {
    return fieldE01NUMCKN.getBigDecimal();
  }

  /**
  * Set field E01AMTCKN using a String value.
  */
  public void setE01AMTCKN(String newvalue)
  {
    fieldE01AMTCKN.setString(newvalue);
  }

  /**
  * Get value of field E01AMTCKN as a String.
  */
  public String getE01AMTCKN()
  {
    return fieldE01AMTCKN.getString();
  }

  /**
  * Set numeric field E01AMTCKN using a BigDecimal value.
  */
  public void setE01AMTCKN(BigDecimal newvalue)
  {
    fieldE01AMTCKN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01AMTCKN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01AMTCKN()
  {
    return fieldE01AMTCKN.getBigDecimal();
  }

  /**
  * Set field E01NUMSEQ using a String value.
  */
  public void setE01NUMSEQ(String newvalue)
  {
    fieldE01NUMSEQ.setString(newvalue);
  }

  /**
  * Get value of field E01NUMSEQ as a String.
  */
  public String getE01NUMSEQ()
  {
    return fieldE01NUMSEQ.getString();
  }

  /**
  * Set numeric field E01NUMSEQ using a BigDecimal value.
  */
  public void setE01NUMSEQ(BigDecimal newvalue)
  {
    fieldE01NUMSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01NUMSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01NUMSEQ()
  {
    return fieldE01NUMSEQ.getBigDecimal();
  }

  /**
  * Set field E01CUSIDN using a String value.
  */
  public void setE01CUSIDN(String newvalue)
  {
    fieldE01CUSIDN.setString(newvalue);
  }

  /**
  * Get value of field E01CUSIDN as a String.
  */
  public String getE01CUSIDN()
  {
    return fieldE01CUSIDN.getString();
  }

}
