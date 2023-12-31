package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ECO107001 physical file definition.
* 
* File level identifier is 1150729121535.
* Record format level identifier is 4C0C018E1D7FD.
*/

public class ECO107001Message extends MessageRecord
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
                                     "E01PAQREG",
                                     "E01PAQBRN",
                                     "E01PAQYYI",
                                     "E01PAQMMI",
                                     "E01PAQDDI",
                                     "E01PAQYYF",
                                     "E01PAQMMF",
                                     "E01PAQDDF",
                                     "E01PAQBNK",
                                     "E01PAQNAM",
                                     "E01PAQSEQ",
                                     "E01PAQFET",
                                     "E01PAQTIP",
                                     "E01PAQBRT",
                                     "E01PAQBRD",
                                     "E01PAQHOR",
                                     "E01PAQNUM",
                                     "E01PAQSTI",
                                     "E01PAQSTF",
                                     "E01PAQAMT"
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
                                   "E01PAQREG",
                                   "E01PAQBRN",
                                   "E01PAQYYI",
                                   "E01PAQMMI",
                                   "E01PAQDDI",
                                   "E01PAQYYF",
                                   "E01PAQMMF",
                                   "E01PAQDDF",
                                   "E01PAQBNK",
                                   "E01PAQNAM",
                                   "E01PAQSEQ",
                                   "E01PAQFET",
                                   "E01PAQTIP",
                                   "E01PAQBRT",
                                   "E01PAQBRD",
                                   "E01PAQHOR",
                                   "E01PAQNUM",
                                   "E01PAQSTI",
                                   "E01PAQSTF",
                                   "E01PAQAMT"
                                 };
  final static String fid = "1150729121535";
  final static String rid = "4C0C018E1D7FD";
  final static String fmtname = "ECO107001";
  final int FIELDCOUNT = 29;
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
  private DecimalField fieldE01PAQREG = null;
  private DecimalField fieldE01PAQBRN = null;
  private DecimalField fieldE01PAQYYI = null;
  private DecimalField fieldE01PAQMMI = null;
  private DecimalField fieldE01PAQDDI = null;
  private DecimalField fieldE01PAQYYF = null;
  private DecimalField fieldE01PAQMMF = null;
  private DecimalField fieldE01PAQDDF = null;
  private CharacterField fieldE01PAQBNK = null;
  private CharacterField fieldE01PAQNAM = null;
  private DecimalField fieldE01PAQSEQ = null;
  private DecimalField fieldE01PAQFET = null;
  private CharacterField fieldE01PAQTIP = null;
  private DecimalField fieldE01PAQBRT = null;
  private CharacterField fieldE01PAQBRD = null;
  private CharacterField fieldE01PAQHOR = null;
  private DecimalField fieldE01PAQNUM = null;
  private DecimalField fieldE01PAQSTI = null;
  private DecimalField fieldE01PAQSTF = null;
  private DecimalField fieldE01PAQAMT = null;

  /**
  * Constructor for ECO107001Message.
  */
  public ECO107001Message()
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
    recordsize = 220;
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
    fields[9] = fieldE01PAQREG =
    new DecimalField(message, HEADERSIZE + 42, 7, 0, "E01PAQREG");
    fields[10] = fieldE01PAQBRN =
    new DecimalField(message, HEADERSIZE + 49, 5, 0, "E01PAQBRN");
    fields[11] = fieldE01PAQYYI =
    new DecimalField(message, HEADERSIZE + 54, 5, 0, "E01PAQYYI");
    fields[12] = fieldE01PAQMMI =
    new DecimalField(message, HEADERSIZE + 59, 3, 0, "E01PAQMMI");
    fields[13] = fieldE01PAQDDI =
    new DecimalField(message, HEADERSIZE + 62, 3, 0, "E01PAQDDI");
    fields[14] = fieldE01PAQYYF =
    new DecimalField(message, HEADERSIZE + 65, 5, 0, "E01PAQYYF");
    fields[15] = fieldE01PAQMMF =
    new DecimalField(message, HEADERSIZE + 70, 3, 0, "E01PAQMMF");
    fields[16] = fieldE01PAQDDF =
    new DecimalField(message, HEADERSIZE + 73, 3, 0, "E01PAQDDF");
    fields[17] = fieldE01PAQBNK =
    new CharacterField(message, HEADERSIZE + 76, 2, "E01PAQBNK");
    fields[18] = fieldE01PAQNAM =
    new CharacterField(message, HEADERSIZE + 78, 35, "E01PAQNAM");
    fields[19] = fieldE01PAQSEQ =
    new DecimalField(message, HEADERSIZE + 113, 5, 0, "E01PAQSEQ");
    fields[20] = fieldE01PAQFET =
    new DecimalField(message, HEADERSIZE + 118, 9, 0, "E01PAQFET");
    fields[21] = fieldE01PAQTIP =
    new CharacterField(message, HEADERSIZE + 127, 2, "E01PAQTIP");
    fields[22] = fieldE01PAQBRT =
    new DecimalField(message, HEADERSIZE + 129, 5, 0, "E01PAQBRT");
    fields[23] = fieldE01PAQBRD =
    new CharacterField(message, HEADERSIZE + 134, 45, "E01PAQBRD");
    fields[24] = fieldE01PAQHOR =
    new CharacterField(message, HEADERSIZE + 179, 1, "E01PAQHOR");
    fields[25] = fieldE01PAQNUM =
    new DecimalField(message, HEADERSIZE + 180, 9, 0, "E01PAQNUM");
    fields[26] = fieldE01PAQSTI =
    new DecimalField(message, HEADERSIZE + 189, 7, 0, "E01PAQSTI");
    fields[27] = fieldE01PAQSTF =
    new DecimalField(message, HEADERSIZE + 196, 7, 0, "E01PAQSTF");
    fields[28] = fieldE01PAQAMT =
    new DecimalField(message, HEADERSIZE + 203, 17, 2, "E01PAQAMT");

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
  * Set field E01PAQREG using a String value.
  */
  public void setE01PAQREG(String newvalue)
  {
    fieldE01PAQREG.setString(newvalue);
  }

  /**
  * Get value of field E01PAQREG as a String.
  */
  public String getE01PAQREG()
  {
    return fieldE01PAQREG.getString();
  }

  /**
  * Set numeric field E01PAQREG using a BigDecimal value.
  */
  public void setE01PAQREG(BigDecimal newvalue)
  {
    fieldE01PAQREG.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PAQREG as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PAQREG()
  {
    return fieldE01PAQREG.getBigDecimal();
  }

  /**
  * Set field E01PAQBRN using a String value.
  */
  public void setE01PAQBRN(String newvalue)
  {
    fieldE01PAQBRN.setString(newvalue);
  }

  /**
  * Get value of field E01PAQBRN as a String.
  */
  public String getE01PAQBRN()
  {
    return fieldE01PAQBRN.getString();
  }

  /**
  * Set numeric field E01PAQBRN using a BigDecimal value.
  */
  public void setE01PAQBRN(BigDecimal newvalue)
  {
    fieldE01PAQBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PAQBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PAQBRN()
  {
    return fieldE01PAQBRN.getBigDecimal();
  }

  /**
  * Set field E01PAQYYI using a String value.
  */
  public void setE01PAQYYI(String newvalue)
  {
    fieldE01PAQYYI.setString(newvalue);
  }

  /**
  * Get value of field E01PAQYYI as a String.
  */
  public String getE01PAQYYI()
  {
    return fieldE01PAQYYI.getString();
  }

  /**
  * Set numeric field E01PAQYYI using a BigDecimal value.
  */
  public void setE01PAQYYI(BigDecimal newvalue)
  {
    fieldE01PAQYYI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PAQYYI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PAQYYI()
  {
    return fieldE01PAQYYI.getBigDecimal();
  }

  /**
  * Set field E01PAQMMI using a String value.
  */
  public void setE01PAQMMI(String newvalue)
  {
    fieldE01PAQMMI.setString(newvalue);
  }

  /**
  * Get value of field E01PAQMMI as a String.
  */
  public String getE01PAQMMI()
  {
    return fieldE01PAQMMI.getString();
  }

  /**
  * Set numeric field E01PAQMMI using a BigDecimal value.
  */
  public void setE01PAQMMI(BigDecimal newvalue)
  {
    fieldE01PAQMMI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PAQMMI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PAQMMI()
  {
    return fieldE01PAQMMI.getBigDecimal();
  }

  /**
  * Set field E01PAQDDI using a String value.
  */
  public void setE01PAQDDI(String newvalue)
  {
    fieldE01PAQDDI.setString(newvalue);
  }

  /**
  * Get value of field E01PAQDDI as a String.
  */
  public String getE01PAQDDI()
  {
    return fieldE01PAQDDI.getString();
  }

  /**
  * Set numeric field E01PAQDDI using a BigDecimal value.
  */
  public void setE01PAQDDI(BigDecimal newvalue)
  {
    fieldE01PAQDDI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PAQDDI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PAQDDI()
  {
    return fieldE01PAQDDI.getBigDecimal();
  }

  /**
  * Set field E01PAQYYF using a String value.
  */
  public void setE01PAQYYF(String newvalue)
  {
    fieldE01PAQYYF.setString(newvalue);
  }

  /**
  * Get value of field E01PAQYYF as a String.
  */
  public String getE01PAQYYF()
  {
    return fieldE01PAQYYF.getString();
  }

  /**
  * Set numeric field E01PAQYYF using a BigDecimal value.
  */
  public void setE01PAQYYF(BigDecimal newvalue)
  {
    fieldE01PAQYYF.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PAQYYF as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PAQYYF()
  {
    return fieldE01PAQYYF.getBigDecimal();
  }

  /**
  * Set field E01PAQMMF using a String value.
  */
  public void setE01PAQMMF(String newvalue)
  {
    fieldE01PAQMMF.setString(newvalue);
  }

  /**
  * Get value of field E01PAQMMF as a String.
  */
  public String getE01PAQMMF()
  {
    return fieldE01PAQMMF.getString();
  }

  /**
  * Set numeric field E01PAQMMF using a BigDecimal value.
  */
  public void setE01PAQMMF(BigDecimal newvalue)
  {
    fieldE01PAQMMF.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PAQMMF as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PAQMMF()
  {
    return fieldE01PAQMMF.getBigDecimal();
  }

  /**
  * Set field E01PAQDDF using a String value.
  */
  public void setE01PAQDDF(String newvalue)
  {
    fieldE01PAQDDF.setString(newvalue);
  }

  /**
  * Get value of field E01PAQDDF as a String.
  */
  public String getE01PAQDDF()
  {
    return fieldE01PAQDDF.getString();
  }

  /**
  * Set numeric field E01PAQDDF using a BigDecimal value.
  */
  public void setE01PAQDDF(BigDecimal newvalue)
  {
    fieldE01PAQDDF.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PAQDDF as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PAQDDF()
  {
    return fieldE01PAQDDF.getBigDecimal();
  }

  /**
  * Set field E01PAQBNK using a String value.
  */
  public void setE01PAQBNK(String newvalue)
  {
    fieldE01PAQBNK.setString(newvalue);
  }

  /**
  * Get value of field E01PAQBNK as a String.
  */
  public String getE01PAQBNK()
  {
    return fieldE01PAQBNK.getString();
  }

  /**
  * Set field E01PAQNAM using a String value.
  */
  public void setE01PAQNAM(String newvalue)
  {
    fieldE01PAQNAM.setString(newvalue);
  }

  /**
  * Get value of field E01PAQNAM as a String.
  */
  public String getE01PAQNAM()
  {
    return fieldE01PAQNAM.getString();
  }

  /**
  * Set field E01PAQSEQ using a String value.
  */
  public void setE01PAQSEQ(String newvalue)
  {
    fieldE01PAQSEQ.setString(newvalue);
  }

  /**
  * Get value of field E01PAQSEQ as a String.
  */
  public String getE01PAQSEQ()
  {
    return fieldE01PAQSEQ.getString();
  }

  /**
  * Set numeric field E01PAQSEQ using a BigDecimal value.
  */
  public void setE01PAQSEQ(BigDecimal newvalue)
  {
    fieldE01PAQSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PAQSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PAQSEQ()
  {
    return fieldE01PAQSEQ.getBigDecimal();
  }

  /**
  * Set field E01PAQFET using a String value.
  */
  public void setE01PAQFET(String newvalue)
  {
    fieldE01PAQFET.setString(newvalue);
  }

  /**
  * Get value of field E01PAQFET as a String.
  */
  public String getE01PAQFET()
  {
    return fieldE01PAQFET.getString();
  }

  /**
  * Set numeric field E01PAQFET using a BigDecimal value.
  */
  public void setE01PAQFET(BigDecimal newvalue)
  {
    fieldE01PAQFET.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PAQFET as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PAQFET()
  {
    return fieldE01PAQFET.getBigDecimal();
  }

  /**
  * Set field E01PAQTIP using a String value.
  */
  public void setE01PAQTIP(String newvalue)
  {
    fieldE01PAQTIP.setString(newvalue);
  }

  /**
  * Get value of field E01PAQTIP as a String.
  */
  public String getE01PAQTIP()
  {
    return fieldE01PAQTIP.getString();
  }

  /**
  * Set field E01PAQBRT using a String value.
  */
  public void setE01PAQBRT(String newvalue)
  {
    fieldE01PAQBRT.setString(newvalue);
  }

  /**
  * Get value of field E01PAQBRT as a String.
  */
  public String getE01PAQBRT()
  {
    return fieldE01PAQBRT.getString();
  }

  /**
  * Set numeric field E01PAQBRT using a BigDecimal value.
  */
  public void setE01PAQBRT(BigDecimal newvalue)
  {
    fieldE01PAQBRT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PAQBRT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PAQBRT()
  {
    return fieldE01PAQBRT.getBigDecimal();
  }

  /**
  * Set field E01PAQBRD using a String value.
  */
  public void setE01PAQBRD(String newvalue)
  {
    fieldE01PAQBRD.setString(newvalue);
  }

  /**
  * Get value of field E01PAQBRD as a String.
  */
  public String getE01PAQBRD()
  {
    return fieldE01PAQBRD.getString();
  }

  /**
  * Set field E01PAQHOR using a String value.
  */
  public void setE01PAQHOR(String newvalue)
  {
    fieldE01PAQHOR.setString(newvalue);
  }

  /**
  * Get value of field E01PAQHOR as a String.
  */
  public String getE01PAQHOR()
  {
    return fieldE01PAQHOR.getString();
  }

  /**
  * Set field E01PAQNUM using a String value.
  */
  public void setE01PAQNUM(String newvalue)
  {
    fieldE01PAQNUM.setString(newvalue);
  }

  /**
  * Get value of field E01PAQNUM as a String.
  */
  public String getE01PAQNUM()
  {
    return fieldE01PAQNUM.getString();
  }

  /**
  * Set numeric field E01PAQNUM using a BigDecimal value.
  */
  public void setE01PAQNUM(BigDecimal newvalue)
  {
    fieldE01PAQNUM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PAQNUM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PAQNUM()
  {
    return fieldE01PAQNUM.getBigDecimal();
  }

  /**
  * Set field E01PAQSTI using a String value.
  */
  public void setE01PAQSTI(String newvalue)
  {
    fieldE01PAQSTI.setString(newvalue);
  }

  /**
  * Get value of field E01PAQSTI as a String.
  */
  public String getE01PAQSTI()
  {
    return fieldE01PAQSTI.getString();
  }

  /**
  * Set numeric field E01PAQSTI using a BigDecimal value.
  */
  public void setE01PAQSTI(BigDecimal newvalue)
  {
    fieldE01PAQSTI.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PAQSTI as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PAQSTI()
  {
    return fieldE01PAQSTI.getBigDecimal();
  }

  /**
  * Set field E01PAQSTF using a String value.
  */
  public void setE01PAQSTF(String newvalue)
  {
    fieldE01PAQSTF.setString(newvalue);
  }

  /**
  * Get value of field E01PAQSTF as a String.
  */
  public String getE01PAQSTF()
  {
    return fieldE01PAQSTF.getString();
  }

  /**
  * Set numeric field E01PAQSTF using a BigDecimal value.
  */
  public void setE01PAQSTF(BigDecimal newvalue)
  {
    fieldE01PAQSTF.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PAQSTF as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PAQSTF()
  {
    return fieldE01PAQSTF.getBigDecimal();
  }

  /**
  * Set field E01PAQAMT using a String value.
  */
  public void setE01PAQAMT(String newvalue)
  {
    fieldE01PAQAMT.setString(newvalue);
  }

  /**
  * Get value of field E01PAQAMT as a String.
  */
  public String getE01PAQAMT()
  {
    return fieldE01PAQAMT.getString();
  }

  /**
  * Set numeric field E01PAQAMT using a BigDecimal value.
  */
  public void setE01PAQAMT(BigDecimal newvalue)
  {
    fieldE01PAQAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01PAQAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01PAQAMT()
  {
    return fieldE01PAQAMT.getBigDecimal();
  }

}
