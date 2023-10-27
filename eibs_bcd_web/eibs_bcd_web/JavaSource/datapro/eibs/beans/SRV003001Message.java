package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from SRV003001 physical file definition.
* 
* File level identifier is 1060922123649.
* Record format level identifier is 3F967A631D182.
*/

public class SRV003001Message extends MessageRecord
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
                                     "E01BALCIA",
                                     "E01BALCIN",
                                     "E01BALSRV",
                                     "E01BALSRN",
                                     "E01BALSEQ",
                                     "E01BALCTA",
                                     "E01BALCON",
                                     "E01BALBAL",
                                     "E01BALBD1",
                                     "E01BALBD2",
                                     "E01BALBD3",
                                     "E01BALCD1",
                                     "E01BALCD2",
                                     "E01BALCD3",
                                     "E01BALCRT",
                                     "E01BALCRU",
                                     "E01BALAPP",
                                     "E01BALAD1",
                                     "E01BALAD2",
                                     "E01BALAD3",
                                     "E01BALAPT",
                                     "E01BALAPU",
                                     "E01BALUD1",
                                     "E01BALUD2",
                                     "E01BALUD3",
                                     "E01BALUPT",
                                     "E01BALUPU",
                                     "E01BALSTS",
                                     "E01BALSTN",
                                     "E01BALERR",
                                     "E01BALETX"
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
                                   "E01BALCIA",
                                   "E01BALCIN",
                                   "E01BALSRV",
                                   "E01BALSRN",
                                   "E01BALSEQ",
                                   "E01BALCTA",
                                   "E01BALCON",
                                   "E01BALBAL",
                                   "E01BALBD1",
                                   "E01BALBD2",
                                   "E01BALBD3",
                                   "E01BALCD1",
                                   "E01BALCD2",
                                   "E01BALCD3",
                                   "E01BALCRT",
                                   "E01BALCRU",
                                   "E01BALAPP",
                                   "E01BALAD1",
                                   "E01BALAD2",
                                   "E01BALAD3",
                                   "E01BALAPT",
                                   "E01BALAPU",
                                   "E01BALUD1",
                                   "E01BALUD2",
                                   "E01BALUD3",
                                   "E01BALUPT",
                                   "E01BALUPU",
                                   "E01BALSTS",
                                   "E01BALSTN",
                                   "E01BALERR",
                                   "E01BALETX"
                                 };
  final static String fid = "1060922123649";
  final static String rid = "3F967A631D182";
  final static String fmtname = "SRV003001";
  final int FIELDCOUNT = 40;
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
  private CharacterField fieldE01BALCIA = null;
  private CharacterField fieldE01BALCIN = null;
  private CharacterField fieldE01BALSRV = null;
  private CharacterField fieldE01BALSRN = null;
  private DecimalField fieldE01BALSEQ = null;
  private CharacterField fieldE01BALCTA = null;
  private DecimalField fieldE01BALCON = null;
  private DecimalField fieldE01BALBAL = null;
  private DecimalField fieldE01BALBD1 = null;
  private DecimalField fieldE01BALBD2 = null;
  private DecimalField fieldE01BALBD3 = null;
  private DecimalField fieldE01BALCD1 = null;
  private DecimalField fieldE01BALCD2 = null;
  private DecimalField fieldE01BALCD3 = null;
  private DecimalField fieldE01BALCRT = null;
  private CharacterField fieldE01BALCRU = null;
  private DecimalField fieldE01BALAPP = null;
  private DecimalField fieldE01BALAD1 = null;
  private DecimalField fieldE01BALAD2 = null;
  private DecimalField fieldE01BALAD3 = null;
  private DecimalField fieldE01BALAPT = null;
  private CharacterField fieldE01BALAPU = null;
  private DecimalField fieldE01BALUD1 = null;
  private DecimalField fieldE01BALUD2 = null;
  private DecimalField fieldE01BALUD3 = null;
  private DecimalField fieldE01BALUPT = null;
  private CharacterField fieldE01BALUPU = null;
  private CharacterField fieldE01BALSTS = null;
  private CharacterField fieldE01BALSTN = null;
  private DecimalField fieldE01BALERR = null;
  private CharacterField fieldE01BALETX = null;

  /**
  * Constructor for SRV003001Message.
  */
  public SRV003001Message()
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
    recordsize = 368;
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
    fields[9] = fieldE01BALCIA =
    new CharacterField(message, HEADERSIZE + 42, 4, "E01BALCIA");
    fields[10] = fieldE01BALCIN =
    new CharacterField(message, HEADERSIZE + 46, 35, "E01BALCIN");
    fields[11] = fieldE01BALSRV =
    new CharacterField(message, HEADERSIZE + 81, 4, "E01BALSRV");
    fields[12] = fieldE01BALSRN =
    new CharacterField(message, HEADERSIZE + 85, 35, "E01BALSRN");
    fields[13] = fieldE01BALSEQ =
    new DecimalField(message, HEADERSIZE + 120, 6, 0, "E01BALSEQ");
    fields[14] = fieldE01BALCTA =
    new CharacterField(message, HEADERSIZE + 126, 20, "E01BALCTA");
    fields[15] = fieldE01BALCON =
    new DecimalField(message, HEADERSIZE + 146, 5, 0, "E01BALCON");
    fields[16] = fieldE01BALBAL =
    new DecimalField(message, HEADERSIZE + 151, 17, 2, "E01BALBAL");
    fields[17] = fieldE01BALBD1 =
    new DecimalField(message, HEADERSIZE + 168, 3, 0, "E01BALBD1");
    fields[18] = fieldE01BALBD2 =
    new DecimalField(message, HEADERSIZE + 171, 3, 0, "E01BALBD2");
    fields[19] = fieldE01BALBD3 =
    new DecimalField(message, HEADERSIZE + 174, 3, 0, "E01BALBD3");
    fields[20] = fieldE01BALCD1 =
    new DecimalField(message, HEADERSIZE + 177, 3, 0, "E01BALCD1");
    fields[21] = fieldE01BALCD2 =
    new DecimalField(message, HEADERSIZE + 180, 3, 0, "E01BALCD2");
    fields[22] = fieldE01BALCD3 =
    new DecimalField(message, HEADERSIZE + 183, 3, 0, "E01BALCD3");
    fields[23] = fieldE01BALCRT =
    new DecimalField(message, HEADERSIZE + 186, 7, 0, "E01BALCRT");
    fields[24] = fieldE01BALCRU =
    new CharacterField(message, HEADERSIZE + 193, 10, "E01BALCRU");
    fields[25] = fieldE01BALAPP =
    new DecimalField(message, HEADERSIZE + 203, 17, 2, "E01BALAPP");
    fields[26] = fieldE01BALAD1 =
    new DecimalField(message, HEADERSIZE + 220, 3, 0, "E01BALAD1");
    fields[27] = fieldE01BALAD2 =
    new DecimalField(message, HEADERSIZE + 223, 3, 0, "E01BALAD2");
    fields[28] = fieldE01BALAD3 =
    new DecimalField(message, HEADERSIZE + 226, 3, 0, "E01BALAD3");
    fields[29] = fieldE01BALAPT =
    new DecimalField(message, HEADERSIZE + 229, 7, 0, "E01BALAPT");
    fields[30] = fieldE01BALAPU =
    new CharacterField(message, HEADERSIZE + 236, 10, "E01BALAPU");
    fields[31] = fieldE01BALUD1 =
    new DecimalField(message, HEADERSIZE + 246, 3, 0, "E01BALUD1");
    fields[32] = fieldE01BALUD2 =
    new DecimalField(message, HEADERSIZE + 249, 3, 0, "E01BALUD2");
    fields[33] = fieldE01BALUD3 =
    new DecimalField(message, HEADERSIZE + 252, 3, 0, "E01BALUD3");
    fields[34] = fieldE01BALUPT =
    new DecimalField(message, HEADERSIZE + 255, 7, 0, "E01BALUPT");
    fields[35] = fieldE01BALUPU =
    new CharacterField(message, HEADERSIZE + 262, 10, "E01BALUPU");
    fields[36] = fieldE01BALSTS =
    new CharacterField(message, HEADERSIZE + 272, 1, "E01BALSTS");
    fields[37] = fieldE01BALSTN =
    new CharacterField(message, HEADERSIZE + 273, 16, "E01BALSTN");
    fields[38] = fieldE01BALERR =
    new DecimalField(message, HEADERSIZE + 289, 5, 0, "E01BALERR");
    fields[39] = fieldE01BALETX =
    new CharacterField(message, HEADERSIZE + 294, 74, "E01BALETX");

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
  * Set field E01BALCIA using a String value.
  */
  public void setE01BALCIA(String newvalue)
  {
    fieldE01BALCIA.setString(newvalue);
  }

  /**
  * Get value of field E01BALCIA as a String.
  */
  public String getE01BALCIA()
  {
    return fieldE01BALCIA.getString();
  }

  /**
  * Set field E01BALCIN using a String value.
  */
  public void setE01BALCIN(String newvalue)
  {
    fieldE01BALCIN.setString(newvalue);
  }

  /**
  * Get value of field E01BALCIN as a String.
  */
  public String getE01BALCIN()
  {
    return fieldE01BALCIN.getString();
  }

  /**
  * Set field E01BALSRV using a String value.
  */
  public void setE01BALSRV(String newvalue)
  {
    fieldE01BALSRV.setString(newvalue);
  }

  /**
  * Get value of field E01BALSRV as a String.
  */
  public String getE01BALSRV()
  {
    return fieldE01BALSRV.getString();
  }

  /**
  * Set field E01BALSRN using a String value.
  */
  public void setE01BALSRN(String newvalue)
  {
    fieldE01BALSRN.setString(newvalue);
  }

  /**
  * Get value of field E01BALSRN as a String.
  */
  public String getE01BALSRN()
  {
    return fieldE01BALSRN.getString();
  }

  /**
  * Set field E01BALSEQ using a String value.
  */
  public void setE01BALSEQ(String newvalue)
  {
    fieldE01BALSEQ.setString(newvalue);
  }

  /**
  * Get value of field E01BALSEQ as a String.
  */
  public String getE01BALSEQ()
  {
    return fieldE01BALSEQ.getString();
  }

  /**
  * Set numeric field E01BALSEQ using a BigDecimal value.
  */
  public void setE01BALSEQ(BigDecimal newvalue)
  {
    fieldE01BALSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BALSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BALSEQ()
  {
    return fieldE01BALSEQ.getBigDecimal();
  }

  /**
  * Set field E01BALCTA using a String value.
  */
  public void setE01BALCTA(String newvalue)
  {
    fieldE01BALCTA.setString(newvalue);
  }

  /**
  * Get value of field E01BALCTA as a String.
  */
  public String getE01BALCTA()
  {
    return fieldE01BALCTA.getString();
  }

  /**
  * Set field E01BALCON using a String value.
  */
  public void setE01BALCON(String newvalue)
  {
    fieldE01BALCON.setString(newvalue);
  }

  /**
  * Get value of field E01BALCON as a String.
  */
  public String getE01BALCON()
  {
    return fieldE01BALCON.getString();
  }

  /**
  * Set numeric field E01BALCON using a BigDecimal value.
  */
  public void setE01BALCON(BigDecimal newvalue)
  {
    fieldE01BALCON.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BALCON as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BALCON()
  {
    return fieldE01BALCON.getBigDecimal();
  }

  /**
  * Set field E01BALBAL using a String value.
  */
  public void setE01BALBAL(String newvalue)
  {
    fieldE01BALBAL.setString(newvalue);
  }

  /**
  * Get value of field E01BALBAL as a String.
  */
  public String getE01BALBAL()
  {
    return fieldE01BALBAL.getString();
  }

  /**
  * Set numeric field E01BALBAL using a BigDecimal value.
  */
  public void setE01BALBAL(BigDecimal newvalue)
  {
    fieldE01BALBAL.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BALBAL as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BALBAL()
  {
    return fieldE01BALBAL.getBigDecimal();
  }

  /**
  * Set field E01BALBD1 using a String value.
  */
  public void setE01BALBD1(String newvalue)
  {
    fieldE01BALBD1.setString(newvalue);
  }

  /**
  * Get value of field E01BALBD1 as a String.
  */
  public String getE01BALBD1()
  {
    return fieldE01BALBD1.getString();
  }

  /**
  * Set numeric field E01BALBD1 using a BigDecimal value.
  */
  public void setE01BALBD1(BigDecimal newvalue)
  {
    fieldE01BALBD1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BALBD1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BALBD1()
  {
    return fieldE01BALBD1.getBigDecimal();
  }

  /**
  * Set field E01BALBD2 using a String value.
  */
  public void setE01BALBD2(String newvalue)
  {
    fieldE01BALBD2.setString(newvalue);
  }

  /**
  * Get value of field E01BALBD2 as a String.
  */
  public String getE01BALBD2()
  {
    return fieldE01BALBD2.getString();
  }

  /**
  * Set numeric field E01BALBD2 using a BigDecimal value.
  */
  public void setE01BALBD2(BigDecimal newvalue)
  {
    fieldE01BALBD2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BALBD2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BALBD2()
  {
    return fieldE01BALBD2.getBigDecimal();
  }

  /**
  * Set field E01BALBD3 using a String value.
  */
  public void setE01BALBD3(String newvalue)
  {
    fieldE01BALBD3.setString(newvalue);
  }

  /**
  * Get value of field E01BALBD3 as a String.
  */
  public String getE01BALBD3()
  {
    return fieldE01BALBD3.getString();
  }

  /**
  * Set numeric field E01BALBD3 using a BigDecimal value.
  */
  public void setE01BALBD3(BigDecimal newvalue)
  {
    fieldE01BALBD3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BALBD3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BALBD3()
  {
    return fieldE01BALBD3.getBigDecimal();
  }

  /**
  * Set field E01BALCD1 using a String value.
  */
  public void setE01BALCD1(String newvalue)
  {
    fieldE01BALCD1.setString(newvalue);
  }

  /**
  * Get value of field E01BALCD1 as a String.
  */
  public String getE01BALCD1()
  {
    return fieldE01BALCD1.getString();
  }

  /**
  * Set numeric field E01BALCD1 using a BigDecimal value.
  */
  public void setE01BALCD1(BigDecimal newvalue)
  {
    fieldE01BALCD1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BALCD1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BALCD1()
  {
    return fieldE01BALCD1.getBigDecimal();
  }

  /**
  * Set field E01BALCD2 using a String value.
  */
  public void setE01BALCD2(String newvalue)
  {
    fieldE01BALCD2.setString(newvalue);
  }

  /**
  * Get value of field E01BALCD2 as a String.
  */
  public String getE01BALCD2()
  {
    return fieldE01BALCD2.getString();
  }

  /**
  * Set numeric field E01BALCD2 using a BigDecimal value.
  */
  public void setE01BALCD2(BigDecimal newvalue)
  {
    fieldE01BALCD2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BALCD2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BALCD2()
  {
    return fieldE01BALCD2.getBigDecimal();
  }

  /**
  * Set field E01BALCD3 using a String value.
  */
  public void setE01BALCD3(String newvalue)
  {
    fieldE01BALCD3.setString(newvalue);
  }

  /**
  * Get value of field E01BALCD3 as a String.
  */
  public String getE01BALCD3()
  {
    return fieldE01BALCD3.getString();
  }

  /**
  * Set numeric field E01BALCD3 using a BigDecimal value.
  */
  public void setE01BALCD3(BigDecimal newvalue)
  {
    fieldE01BALCD3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BALCD3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BALCD3()
  {
    return fieldE01BALCD3.getBigDecimal();
  }

  /**
  * Set field E01BALCRT using a String value.
  */
  public void setE01BALCRT(String newvalue)
  {
    fieldE01BALCRT.setString(newvalue);
  }

  /**
  * Get value of field E01BALCRT as a String.
  */
  public String getE01BALCRT()
  {
    return fieldE01BALCRT.getString();
  }

  /**
  * Set numeric field E01BALCRT using a BigDecimal value.
  */
  public void setE01BALCRT(BigDecimal newvalue)
  {
    fieldE01BALCRT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BALCRT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BALCRT()
  {
    return fieldE01BALCRT.getBigDecimal();
  }

  /**
  * Set field E01BALCRU using a String value.
  */
  public void setE01BALCRU(String newvalue)
  {
    fieldE01BALCRU.setString(newvalue);
  }

  /**
  * Get value of field E01BALCRU as a String.
  */
  public String getE01BALCRU()
  {
    return fieldE01BALCRU.getString();
  }

  /**
  * Set field E01BALAPP using a String value.
  */
  public void setE01BALAPP(String newvalue)
  {
    fieldE01BALAPP.setString(newvalue);
  }

  /**
  * Get value of field E01BALAPP as a String.
  */
  public String getE01BALAPP()
  {
    return fieldE01BALAPP.getString();
  }

  /**
  * Set numeric field E01BALAPP using a BigDecimal value.
  */
  public void setE01BALAPP(BigDecimal newvalue)
  {
    fieldE01BALAPP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BALAPP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BALAPP()
  {
    return fieldE01BALAPP.getBigDecimal();
  }

  /**
  * Set field E01BALAD1 using a String value.
  */
  public void setE01BALAD1(String newvalue)
  {
    fieldE01BALAD1.setString(newvalue);
  }

  /**
  * Get value of field E01BALAD1 as a String.
  */
  public String getE01BALAD1()
  {
    return fieldE01BALAD1.getString();
  }

  /**
  * Set numeric field E01BALAD1 using a BigDecimal value.
  */
  public void setE01BALAD1(BigDecimal newvalue)
  {
    fieldE01BALAD1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BALAD1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BALAD1()
  {
    return fieldE01BALAD1.getBigDecimal();
  }

  /**
  * Set field E01BALAD2 using a String value.
  */
  public void setE01BALAD2(String newvalue)
  {
    fieldE01BALAD2.setString(newvalue);
  }

  /**
  * Get value of field E01BALAD2 as a String.
  */
  public String getE01BALAD2()
  {
    return fieldE01BALAD2.getString();
  }

  /**
  * Set numeric field E01BALAD2 using a BigDecimal value.
  */
  public void setE01BALAD2(BigDecimal newvalue)
  {
    fieldE01BALAD2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BALAD2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BALAD2()
  {
    return fieldE01BALAD2.getBigDecimal();
  }

  /**
  * Set field E01BALAD3 using a String value.
  */
  public void setE01BALAD3(String newvalue)
  {
    fieldE01BALAD3.setString(newvalue);
  }

  /**
  * Get value of field E01BALAD3 as a String.
  */
  public String getE01BALAD3()
  {
    return fieldE01BALAD3.getString();
  }

  /**
  * Set numeric field E01BALAD3 using a BigDecimal value.
  */
  public void setE01BALAD3(BigDecimal newvalue)
  {
    fieldE01BALAD3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BALAD3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BALAD3()
  {
    return fieldE01BALAD3.getBigDecimal();
  }

  /**
  * Set field E01BALAPT using a String value.
  */
  public void setE01BALAPT(String newvalue)
  {
    fieldE01BALAPT.setString(newvalue);
  }

  /**
  * Get value of field E01BALAPT as a String.
  */
  public String getE01BALAPT()
  {
    return fieldE01BALAPT.getString();
  }

  /**
  * Set numeric field E01BALAPT using a BigDecimal value.
  */
  public void setE01BALAPT(BigDecimal newvalue)
  {
    fieldE01BALAPT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BALAPT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BALAPT()
  {
    return fieldE01BALAPT.getBigDecimal();
  }

  /**
  * Set field E01BALAPU using a String value.
  */
  public void setE01BALAPU(String newvalue)
  {
    fieldE01BALAPU.setString(newvalue);
  }

  /**
  * Get value of field E01BALAPU as a String.
  */
  public String getE01BALAPU()
  {
    return fieldE01BALAPU.getString();
  }

  /**
  * Set field E01BALUD1 using a String value.
  */
  public void setE01BALUD1(String newvalue)
  {
    fieldE01BALUD1.setString(newvalue);
  }

  /**
  * Get value of field E01BALUD1 as a String.
  */
  public String getE01BALUD1()
  {
    return fieldE01BALUD1.getString();
  }

  /**
  * Set numeric field E01BALUD1 using a BigDecimal value.
  */
  public void setE01BALUD1(BigDecimal newvalue)
  {
    fieldE01BALUD1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BALUD1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BALUD1()
  {
    return fieldE01BALUD1.getBigDecimal();
  }

  /**
  * Set field E01BALUD2 using a String value.
  */
  public void setE01BALUD2(String newvalue)
  {
    fieldE01BALUD2.setString(newvalue);
  }

  /**
  * Get value of field E01BALUD2 as a String.
  */
  public String getE01BALUD2()
  {
    return fieldE01BALUD2.getString();
  }

  /**
  * Set numeric field E01BALUD2 using a BigDecimal value.
  */
  public void setE01BALUD2(BigDecimal newvalue)
  {
    fieldE01BALUD2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BALUD2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BALUD2()
  {
    return fieldE01BALUD2.getBigDecimal();
  }

  /**
  * Set field E01BALUD3 using a String value.
  */
  public void setE01BALUD3(String newvalue)
  {
    fieldE01BALUD3.setString(newvalue);
  }

  /**
  * Get value of field E01BALUD3 as a String.
  */
  public String getE01BALUD3()
  {
    return fieldE01BALUD3.getString();
  }

  /**
  * Set numeric field E01BALUD3 using a BigDecimal value.
  */
  public void setE01BALUD3(BigDecimal newvalue)
  {
    fieldE01BALUD3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BALUD3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BALUD3()
  {
    return fieldE01BALUD3.getBigDecimal();
  }

  /**
  * Set field E01BALUPT using a String value.
  */
  public void setE01BALUPT(String newvalue)
  {
    fieldE01BALUPT.setString(newvalue);
  }

  /**
  * Get value of field E01BALUPT as a String.
  */
  public String getE01BALUPT()
  {
    return fieldE01BALUPT.getString();
  }

  /**
  * Set numeric field E01BALUPT using a BigDecimal value.
  */
  public void setE01BALUPT(BigDecimal newvalue)
  {
    fieldE01BALUPT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BALUPT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BALUPT()
  {
    return fieldE01BALUPT.getBigDecimal();
  }

  /**
  * Set field E01BALUPU using a String value.
  */
  public void setE01BALUPU(String newvalue)
  {
    fieldE01BALUPU.setString(newvalue);
  }

  /**
  * Get value of field E01BALUPU as a String.
  */
  public String getE01BALUPU()
  {
    return fieldE01BALUPU.getString();
  }

  /**
  * Set field E01BALSTS using a String value.
  */
  public void setE01BALSTS(String newvalue)
  {
    fieldE01BALSTS.setString(newvalue);
  }

  /**
  * Get value of field E01BALSTS as a String.
  */
  public String getE01BALSTS()
  {
    return fieldE01BALSTS.getString();
  }

  /**
  * Set field E01BALSTN using a String value.
  */
  public void setE01BALSTN(String newvalue)
  {
    fieldE01BALSTN.setString(newvalue);
  }

  /**
  * Get value of field E01BALSTN as a String.
  */
  public String getE01BALSTN()
  {
    return fieldE01BALSTN.getString();
  }

  /**
  * Set field E01BALERR using a String value.
  */
  public void setE01BALERR(String newvalue)
  {
    fieldE01BALERR.setString(newvalue);
  }

  /**
  * Get value of field E01BALERR as a String.
  */
  public String getE01BALERR()
  {
    return fieldE01BALERR.getString();
  }

  /**
  * Set numeric field E01BALERR using a BigDecimal value.
  */
  public void setE01BALERR(BigDecimal newvalue)
  {
    fieldE01BALERR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BALERR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BALERR()
  {
    return fieldE01BALERR.getBigDecimal();
  }

  /**
  * Set field E01BALETX using a String value.
  */
  public void setE01BALETX(String newvalue)
  {
    fieldE01BALETX.setString(newvalue);
  }

  /**
  * Get value of field E01BALETX as a String.
  */
  public String getE01BALETX()
  {
    return fieldE01BALETX.getString();
  }

}
