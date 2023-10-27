package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EEJ005101 physical file definition.
* 
* File level identifier is 1130611113117.
* Record format level identifier is 341A38D876C2D.
*/

public class EEJ005101Message extends MessageRecord
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
                                     "E01EJAUSR",
                                     "E01EJACD1",
                                     "E01EJASUP",
                                     "E01EJACD2",
                                     "E01EJAUSN",
                                     "E01EJARD1",
                                     "E01EJARD2",
                                     "E01EJARD3",
                                     "E01EJARTI",
                                     "E01EJAAD1",
                                     "E01EJAAD2",
                                     "E01EJAAD3",
                                     "E01EJAATI",
                                     "E01EJAREF",
                                     "E01EJAOPE",
                                     "E01EJAOPN",
                                     "E01EJAACD",
                                     "E01EJASTS",
                                     "E01EJASTN",
                                     "E01EJARMK",
                                     "E01EJARTE",
                                     "E01EJAAMT",
                                     "E01EJAPTY",
                                     "E01EJAACR",
                                     "E01EJAACA",
                                     "E01EJATYP",
                                     "E01EJATYN",
                                     "E01EJAIUS",
                                     "E01EJACD3",
                                     "E01EJAIUN",
                                     "E01EJAID1",
                                     "E01EJAID2",
                                     "E01EJAID3",
                                     "E01EJAITI",
                                     "E01EJACCY",
                                     "E01EJACCN",
                                     "E01EJAATY",
                                     "E01EJARTB",
                                     "E01EJATRM",
                                     "E01EJACUS",
                                     "E01EJACUN",
                                     "E01EJAPER",
                                     "E01EJAPEA",
                                     "E01CODPRD",
                                     "E01DESPRD"
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
                                   "E01EJAUSR",
                                   "E01EJACD1",
                                   "E01EJASUP",
                                   "E01EJACD2",
                                   "E01EJAUSN",
                                   "E01EJARD1",
                                   "E01EJARD2",
                                   "E01EJARD3",
                                   "E01EJARTI",
                                   "E01EJAAD1",
                                   "E01EJAAD2",
                                   "E01EJAAD3",
                                   "E01EJAATI",
                                   "E01EJAREF",
                                   "E01EJAOPE",
                                   "E01EJAOPN",
                                   "E01EJAACD",
                                   "E01EJASTS",
                                   "E01EJASTN",
                                   "E01EJARMK",
                                   "E01EJARTE",
                                   "E01EJAAMT",
                                   "E01EJAPTY",
                                   "E01EJAACR",
                                   "E01EJAACA",
                                   "E01EJATYP",
                                   "E01EJATYN",
                                   "E01EJAIUS",
                                   "E01EJACD3",
                                   "E01EJAIUN",
                                   "E01EJAID1",
                                   "E01EJAID2",
                                   "E01EJAID3",
                                   "E01EJAITI",
                                   "E01EJACCY",
                                   "E01EJACCN",
                                   "E01EJAATY",
                                   "E01EJARTB",
                                   "E01EJATRM",
                                   "E01EJACUS",
                                   "E01EJACUN",
                                   "E01EJAPER",
                                   "E01EJAPEA",
                                   "E01CODPRD",
                                   "E01DESPRD"
                                 };
  final static String fid = "1130611113117";
  final static String rid = "341A38D876C2D";
  final static String fmtname = "EEJ005101";
  final int FIELDCOUNT = 54;
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
  private CharacterField fieldE01EJAUSR = null;
  private CharacterField fieldE01EJACD1 = null;
  private CharacterField fieldE01EJASUP = null;
  private CharacterField fieldE01EJACD2 = null;
  private CharacterField fieldE01EJAUSN = null;
  private DecimalField fieldE01EJARD1 = null;
  private DecimalField fieldE01EJARD2 = null;
  private DecimalField fieldE01EJARD3 = null;
  private CharacterField fieldE01EJARTI = null;
  private DecimalField fieldE01EJAAD1 = null;
  private DecimalField fieldE01EJAAD2 = null;
  private DecimalField fieldE01EJAAD3 = null;
  private CharacterField fieldE01EJAATI = null;
  private DecimalField fieldE01EJAREF = null;
  private CharacterField fieldE01EJAOPE = null;
  private CharacterField fieldE01EJAOPN = null;
  private CharacterField fieldE01EJAACD = null;
  private CharacterField fieldE01EJASTS = null;
  private CharacterField fieldE01EJASTN = null;
  private CharacterField fieldE01EJARMK = null;
  private DecimalField fieldE01EJARTE = null;
  private DecimalField fieldE01EJAAMT = null;
  private CharacterField fieldE01EJAPTY = null;
  private DecimalField fieldE01EJAACR = null;
  private DecimalField fieldE01EJAACA = null;
  private CharacterField fieldE01EJATYP = null;
  private CharacterField fieldE01EJATYN = null;
  private CharacterField fieldE01EJAIUS = null;
  private CharacterField fieldE01EJACD3 = null;
  private CharacterField fieldE01EJAIUN = null;
  private DecimalField fieldE01EJAID1 = null;
  private DecimalField fieldE01EJAID2 = null;
  private DecimalField fieldE01EJAID3 = null;
  private CharacterField fieldE01EJAITI = null;
  private CharacterField fieldE01EJACCY = null;
  private CharacterField fieldE01EJACCN = null;
  private CharacterField fieldE01EJAATY = null;
  private CharacterField fieldE01EJARTB = null;
  private DecimalField fieldE01EJATRM = null;
  private DecimalField fieldE01EJACUS = null;
  private CharacterField fieldE01EJACUN = null;
  private DecimalField fieldE01EJAPER = null;
  private DecimalField fieldE01EJAPEA = null;
  private CharacterField fieldE01CODPRD = null;
  private CharacterField fieldE01DESPRD = null;

  /**
  * Constructor for EEJ005101Message.
  */
  public EEJ005101Message()
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
    recordsize = 871;
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
    fields[9] = fieldE01EJAUSR =
    new CharacterField(message, HEADERSIZE + 42, 10, "E01EJAUSR");
    fields[10] = fieldE01EJACD1 =
    new CharacterField(message, HEADERSIZE + 52, 4, "E01EJACD1");
    fields[11] = fieldE01EJASUP =
    new CharacterField(message, HEADERSIZE + 56, 10, "E01EJASUP");
    fields[12] = fieldE01EJACD2 =
    new CharacterField(message, HEADERSIZE + 66, 4, "E01EJACD2");
    fields[13] = fieldE01EJAUSN =
    new CharacterField(message, HEADERSIZE + 70, 45, "E01EJAUSN");
    fields[14] = fieldE01EJARD1 =
    new DecimalField(message, HEADERSIZE + 115, 3, 0, "E01EJARD1");
    fields[15] = fieldE01EJARD2 =
    new DecimalField(message, HEADERSIZE + 118, 3, 0, "E01EJARD2");
    fields[16] = fieldE01EJARD3 =
    new DecimalField(message, HEADERSIZE + 121, 5, 0, "E01EJARD3");
    fields[17] = fieldE01EJARTI =
    new CharacterField(message, HEADERSIZE + 126, 26, "E01EJARTI");
    fields[18] = fieldE01EJAAD1 =
    new DecimalField(message, HEADERSIZE + 152, 3, 0, "E01EJAAD1");
    fields[19] = fieldE01EJAAD2 =
    new DecimalField(message, HEADERSIZE + 155, 3, 0, "E01EJAAD2");
    fields[20] = fieldE01EJAAD3 =
    new DecimalField(message, HEADERSIZE + 158, 5, 0, "E01EJAAD3");
    fields[21] = fieldE01EJAATI =
    new CharacterField(message, HEADERSIZE + 163, 26, "E01EJAATI");
    fields[22] = fieldE01EJAREF =
    new DecimalField(message, HEADERSIZE + 189, 13, 0, "E01EJAREF");
    fields[23] = fieldE01EJAOPE =
    new CharacterField(message, HEADERSIZE + 202, 2, "E01EJAOPE");
    fields[24] = fieldE01EJAOPN =
    new CharacterField(message, HEADERSIZE + 204, 18, "E01EJAOPN");
    fields[25] = fieldE01EJAACD =
    new CharacterField(message, HEADERSIZE + 222, 2, "E01EJAACD");
    fields[26] = fieldE01EJASTS =
    new CharacterField(message, HEADERSIZE + 224, 1, "E01EJASTS");
    fields[27] = fieldE01EJASTN =
    new CharacterField(message, HEADERSIZE + 225, 23, "E01EJASTN");
    fields[28] = fieldE01EJARMK =
    new CharacterField(message, HEADERSIZE + 248, 256, "E01EJARMK");
    fields[29] = fieldE01EJARTE =
    new DecimalField(message, HEADERSIZE + 504, 11, 6, "E01EJARTE");
    fields[30] = fieldE01EJAAMT =
    new DecimalField(message, HEADERSIZE + 515, 17, 2, "E01EJAAMT");
    fields[31] = fieldE01EJAPTY =
    new CharacterField(message, HEADERSIZE + 532, 1, "E01EJAPTY");
    fields[32] = fieldE01EJAACR =
    new DecimalField(message, HEADERSIZE + 533, 11, 6, "E01EJAACR");
    fields[33] = fieldE01EJAACA =
    new DecimalField(message, HEADERSIZE + 544, 17, 2, "E01EJAACA");
    fields[34] = fieldE01EJATYP =
    new CharacterField(message, HEADERSIZE + 561, 1, "E01EJATYP");
    fields[35] = fieldE01EJATYN =
    new CharacterField(message, HEADERSIZE + 562, 20, "E01EJATYN");
    fields[36] = fieldE01EJAIUS =
    new CharacterField(message, HEADERSIZE + 582, 10, "E01EJAIUS");
    fields[37] = fieldE01EJACD3 =
    new CharacterField(message, HEADERSIZE + 592, 4, "E01EJACD3");
    fields[38] = fieldE01EJAIUN =
    new CharacterField(message, HEADERSIZE + 596, 45, "E01EJAIUN");
    fields[39] = fieldE01EJAID1 =
    new DecimalField(message, HEADERSIZE + 641, 3, 0, "E01EJAID1");
    fields[40] = fieldE01EJAID2 =
    new DecimalField(message, HEADERSIZE + 644, 3, 0, "E01EJAID2");
    fields[41] = fieldE01EJAID3 =
    new DecimalField(message, HEADERSIZE + 647, 5, 0, "E01EJAID3");
    fields[42] = fieldE01EJAITI =
    new CharacterField(message, HEADERSIZE + 652, 26, "E01EJAITI");
    fields[43] = fieldE01EJACCY =
    new CharacterField(message, HEADERSIZE + 678, 3, "E01EJACCY");
    fields[44] = fieldE01EJACCN =
    new CharacterField(message, HEADERSIZE + 681, 45, "E01EJACCN");
    fields[45] = fieldE01EJAATY =
    new CharacterField(message, HEADERSIZE + 726, 4, "E01EJAATY");
    fields[46] = fieldE01EJARTB =
    new CharacterField(message, HEADERSIZE + 730, 1, "E01EJARTB");
    fields[47] = fieldE01EJATRM =
    new DecimalField(message, HEADERSIZE + 731, 8, 0, "E01EJATRM");
    fields[48] = fieldE01EJACUS =
    new DecimalField(message, HEADERSIZE + 739, 10, 0, "E01EJACUS");
    fields[49] = fieldE01EJACUN =
    new CharacterField(message, HEADERSIZE + 749, 45, "E01EJACUN");
    fields[50] = fieldE01EJAPER =
    new DecimalField(message, HEADERSIZE + 794, 11, 6, "E01EJAPER");
    fields[51] = fieldE01EJAPEA =
    new DecimalField(message, HEADERSIZE + 805, 17, 2, "E01EJAPEA");
    fields[52] = fieldE01CODPRD =
    new CharacterField(message, HEADERSIZE + 822, 4, "E01CODPRD");
    fields[53] = fieldE01DESPRD =
    new CharacterField(message, HEADERSIZE + 826, 45, "E01DESPRD");

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
  * Set field E01EJAUSR using a String value.
  */
  public void setE01EJAUSR(String newvalue)
  {
    fieldE01EJAUSR.setString(newvalue);
  }

  /**
  * Get value of field E01EJAUSR as a String.
  */
  public String getE01EJAUSR()
  {
    return fieldE01EJAUSR.getString();
  }

  /**
  * Set field E01EJACD1 using a String value.
  */
  public void setE01EJACD1(String newvalue)
  {
    fieldE01EJACD1.setString(newvalue);
  }

  /**
  * Get value of field E01EJACD1 as a String.
  */
  public String getE01EJACD1()
  {
    return fieldE01EJACD1.getString();
  }

  /**
  * Set field E01EJASUP using a String value.
  */
  public void setE01EJASUP(String newvalue)
  {
    fieldE01EJASUP.setString(newvalue);
  }

  /**
  * Get value of field E01EJASUP as a String.
  */
  public String getE01EJASUP()
  {
    return fieldE01EJASUP.getString();
  }

  /**
  * Set field E01EJACD2 using a String value.
  */
  public void setE01EJACD2(String newvalue)
  {
    fieldE01EJACD2.setString(newvalue);
  }

  /**
  * Get value of field E01EJACD2 as a String.
  */
  public String getE01EJACD2()
  {
    return fieldE01EJACD2.getString();
  }

  /**
  * Set field E01EJAUSN using a String value.
  */
  public void setE01EJAUSN(String newvalue)
  {
    fieldE01EJAUSN.setString(newvalue);
  }

  /**
  * Get value of field E01EJAUSN as a String.
  */
  public String getE01EJAUSN()
  {
    return fieldE01EJAUSN.getString();
  }

  /**
  * Set field E01EJARD1 using a String value.
  */
  public void setE01EJARD1(String newvalue)
  {
    fieldE01EJARD1.setString(newvalue);
  }

  /**
  * Get value of field E01EJARD1 as a String.
  */
  public String getE01EJARD1()
  {
    return fieldE01EJARD1.getString();
  }

  /**
  * Set numeric field E01EJARD1 using a BigDecimal value.
  */
  public void setE01EJARD1(BigDecimal newvalue)
  {
    fieldE01EJARD1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EJARD1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EJARD1()
  {
    return fieldE01EJARD1.getBigDecimal();
  }

  /**
  * Set field E01EJARD2 using a String value.
  */
  public void setE01EJARD2(String newvalue)
  {
    fieldE01EJARD2.setString(newvalue);
  }

  /**
  * Get value of field E01EJARD2 as a String.
  */
  public String getE01EJARD2()
  {
    return fieldE01EJARD2.getString();
  }

  /**
  * Set numeric field E01EJARD2 using a BigDecimal value.
  */
  public void setE01EJARD2(BigDecimal newvalue)
  {
    fieldE01EJARD2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EJARD2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EJARD2()
  {
    return fieldE01EJARD2.getBigDecimal();
  }

  /**
  * Set field E01EJARD3 using a String value.
  */
  public void setE01EJARD3(String newvalue)
  {
    fieldE01EJARD3.setString(newvalue);
  }

  /**
  * Get value of field E01EJARD3 as a String.
  */
  public String getE01EJARD3()
  {
    return fieldE01EJARD3.getString();
  }

  /**
  * Set numeric field E01EJARD3 using a BigDecimal value.
  */
  public void setE01EJARD3(BigDecimal newvalue)
  {
    fieldE01EJARD3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EJARD3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EJARD3()
  {
    return fieldE01EJARD3.getBigDecimal();
  }

  /**
  * Set field E01EJARTI using a String value.
  */
  public void setE01EJARTI(String newvalue)
  {
    fieldE01EJARTI.setString(newvalue);
  }

  /**
  * Get value of field E01EJARTI as a String.
  */
  public String getE01EJARTI()
  {
    return fieldE01EJARTI.getString();
  }

  /**
  * Set field E01EJAAD1 using a String value.
  */
  public void setE01EJAAD1(String newvalue)
  {
    fieldE01EJAAD1.setString(newvalue);
  }

  /**
  * Get value of field E01EJAAD1 as a String.
  */
  public String getE01EJAAD1()
  {
    return fieldE01EJAAD1.getString();
  }

  /**
  * Set numeric field E01EJAAD1 using a BigDecimal value.
  */
  public void setE01EJAAD1(BigDecimal newvalue)
  {
    fieldE01EJAAD1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EJAAD1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EJAAD1()
  {
    return fieldE01EJAAD1.getBigDecimal();
  }

  /**
  * Set field E01EJAAD2 using a String value.
  */
  public void setE01EJAAD2(String newvalue)
  {
    fieldE01EJAAD2.setString(newvalue);
  }

  /**
  * Get value of field E01EJAAD2 as a String.
  */
  public String getE01EJAAD2()
  {
    return fieldE01EJAAD2.getString();
  }

  /**
  * Set numeric field E01EJAAD2 using a BigDecimal value.
  */
  public void setE01EJAAD2(BigDecimal newvalue)
  {
    fieldE01EJAAD2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EJAAD2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EJAAD2()
  {
    return fieldE01EJAAD2.getBigDecimal();
  }

  /**
  * Set field E01EJAAD3 using a String value.
  */
  public void setE01EJAAD3(String newvalue)
  {
    fieldE01EJAAD3.setString(newvalue);
  }

  /**
  * Get value of field E01EJAAD3 as a String.
  */
  public String getE01EJAAD3()
  {
    return fieldE01EJAAD3.getString();
  }

  /**
  * Set numeric field E01EJAAD3 using a BigDecimal value.
  */
  public void setE01EJAAD3(BigDecimal newvalue)
  {
    fieldE01EJAAD3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EJAAD3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EJAAD3()
  {
    return fieldE01EJAAD3.getBigDecimal();
  }

  /**
  * Set field E01EJAATI using a String value.
  */
  public void setE01EJAATI(String newvalue)
  {
    fieldE01EJAATI.setString(newvalue);
  }

  /**
  * Get value of field E01EJAATI as a String.
  */
  public String getE01EJAATI()
  {
    return fieldE01EJAATI.getString();
  }

  /**
  * Set field E01EJAREF using a String value.
  */
  public void setE01EJAREF(String newvalue)
  {
    fieldE01EJAREF.setString(newvalue);
  }

  /**
  * Get value of field E01EJAREF as a String.
  */
  public String getE01EJAREF()
  {
    return fieldE01EJAREF.getString();
  }

  /**
  * Set numeric field E01EJAREF using a BigDecimal value.
  */
  public void setE01EJAREF(BigDecimal newvalue)
  {
    fieldE01EJAREF.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EJAREF as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EJAREF()
  {
    return fieldE01EJAREF.getBigDecimal();
  }

  /**
  * Set field E01EJAOPE using a String value.
  */
  public void setE01EJAOPE(String newvalue)
  {
    fieldE01EJAOPE.setString(newvalue);
  }

  /**
  * Get value of field E01EJAOPE as a String.
  */
  public String getE01EJAOPE()
  {
    return fieldE01EJAOPE.getString();
  }

  /**
  * Set field E01EJAOPN using a String value.
  */
  public void setE01EJAOPN(String newvalue)
  {
    fieldE01EJAOPN.setString(newvalue);
  }

  /**
  * Get value of field E01EJAOPN as a String.
  */
  public String getE01EJAOPN()
  {
    return fieldE01EJAOPN.getString();
  }

  /**
  * Set field E01EJAACD using a String value.
  */
  public void setE01EJAACD(String newvalue)
  {
    fieldE01EJAACD.setString(newvalue);
  }

  /**
  * Get value of field E01EJAACD as a String.
  */
  public String getE01EJAACD()
  {
    return fieldE01EJAACD.getString();
  }

  /**
  * Set field E01EJASTS using a String value.
  */
  public void setE01EJASTS(String newvalue)
  {
    fieldE01EJASTS.setString(newvalue);
  }

  /**
  * Get value of field E01EJASTS as a String.
  */
  public String getE01EJASTS()
  {
    return fieldE01EJASTS.getString();
  }

  /**
  * Set field E01EJASTN using a String value.
  */
  public void setE01EJASTN(String newvalue)
  {
    fieldE01EJASTN.setString(newvalue);
  }

  /**
  * Get value of field E01EJASTN as a String.
  */
  public String getE01EJASTN()
  {
    return fieldE01EJASTN.getString();
  }

  /**
  * Set field E01EJARMK using a String value.
  */
  public void setE01EJARMK(String newvalue)
  {
    fieldE01EJARMK.setString(newvalue);
  }

  /**
  * Get value of field E01EJARMK as a String.
  */
  public String getE01EJARMK()
  {
    return fieldE01EJARMK.getString();
  }

  /**
  * Set field E01EJARTE using a String value.
  */
  public void setE01EJARTE(String newvalue)
  {
    fieldE01EJARTE.setString(newvalue);
  }

  /**
  * Get value of field E01EJARTE as a String.
  */
  public String getE01EJARTE()
  {
    return fieldE01EJARTE.getString();
  }

  /**
  * Set numeric field E01EJARTE using a BigDecimal value.
  */
  public void setE01EJARTE(BigDecimal newvalue)
  {
    fieldE01EJARTE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EJARTE as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EJARTE()
  {
    return fieldE01EJARTE.getBigDecimal();
  }

  /**
  * Set field E01EJAAMT using a String value.
  */
  public void setE01EJAAMT(String newvalue)
  {
    fieldE01EJAAMT.setString(newvalue);
  }

  /**
  * Get value of field E01EJAAMT as a String.
  */
  public String getE01EJAAMT()
  {
    return fieldE01EJAAMT.getString();
  }

  /**
  * Set numeric field E01EJAAMT using a BigDecimal value.
  */
  public void setE01EJAAMT(BigDecimal newvalue)
  {
    fieldE01EJAAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EJAAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EJAAMT()
  {
    return fieldE01EJAAMT.getBigDecimal();
  }

  /**
  * Set field E01EJAPTY using a String value.
  */
  public void setE01EJAPTY(String newvalue)
  {
    fieldE01EJAPTY.setString(newvalue);
  }

  /**
  * Get value of field E01EJAPTY as a String.
  */
  public String getE01EJAPTY()
  {
    return fieldE01EJAPTY.getString();
  }

  /**
  * Set field E01EJAACR using a String value.
  */
  public void setE01EJAACR(String newvalue)
  {
    fieldE01EJAACR.setString(newvalue);
  }

  /**
  * Get value of field E01EJAACR as a String.
  */
  public String getE01EJAACR()
  {
    return fieldE01EJAACR.getString();
  }

  /**
  * Set numeric field E01EJAACR using a BigDecimal value.
  */
  public void setE01EJAACR(BigDecimal newvalue)
  {
    fieldE01EJAACR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EJAACR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EJAACR()
  {
    return fieldE01EJAACR.getBigDecimal();
  }

  /**
  * Set field E01EJAACA using a String value.
  */
  public void setE01EJAACA(String newvalue)
  {
    fieldE01EJAACA.setString(newvalue);
  }

  /**
  * Get value of field E01EJAACA as a String.
  */
  public String getE01EJAACA()
  {
    return fieldE01EJAACA.getString();
  }

  /**
  * Set numeric field E01EJAACA using a BigDecimal value.
  */
  public void setE01EJAACA(BigDecimal newvalue)
  {
    fieldE01EJAACA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EJAACA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EJAACA()
  {
    return fieldE01EJAACA.getBigDecimal();
  }

  /**
  * Set field E01EJATYP using a String value.
  */
  public void setE01EJATYP(String newvalue)
  {
    fieldE01EJATYP.setString(newvalue);
  }

  /**
  * Get value of field E01EJATYP as a String.
  */
  public String getE01EJATYP()
  {
    return fieldE01EJATYP.getString();
  }

  /**
  * Set field E01EJATYN using a String value.
  */
  public void setE01EJATYN(String newvalue)
  {
    fieldE01EJATYN.setString(newvalue);
  }

  /**
  * Get value of field E01EJATYN as a String.
  */
  public String getE01EJATYN()
  {
    return fieldE01EJATYN.getString();
  }

  /**
  * Set field E01EJAIUS using a String value.
  */
  public void setE01EJAIUS(String newvalue)
  {
    fieldE01EJAIUS.setString(newvalue);
  }

  /**
  * Get value of field E01EJAIUS as a String.
  */
  public String getE01EJAIUS()
  {
    return fieldE01EJAIUS.getString();
  }

  /**
  * Set field E01EJACD3 using a String value.
  */
  public void setE01EJACD3(String newvalue)
  {
    fieldE01EJACD3.setString(newvalue);
  }

  /**
  * Get value of field E01EJACD3 as a String.
  */
  public String getE01EJACD3()
  {
    return fieldE01EJACD3.getString();
  }

  /**
  * Set field E01EJAIUN using a String value.
  */
  public void setE01EJAIUN(String newvalue)
  {
    fieldE01EJAIUN.setString(newvalue);
  }

  /**
  * Get value of field E01EJAIUN as a String.
  */
  public String getE01EJAIUN()
  {
    return fieldE01EJAIUN.getString();
  }

  /**
  * Set field E01EJAID1 using a String value.
  */
  public void setE01EJAID1(String newvalue)
  {
    fieldE01EJAID1.setString(newvalue);
  }

  /**
  * Get value of field E01EJAID1 as a String.
  */
  public String getE01EJAID1()
  {
    return fieldE01EJAID1.getString();
  }

  /**
  * Set numeric field E01EJAID1 using a BigDecimal value.
  */
  public void setE01EJAID1(BigDecimal newvalue)
  {
    fieldE01EJAID1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EJAID1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EJAID1()
  {
    return fieldE01EJAID1.getBigDecimal();
  }

  /**
  * Set field E01EJAID2 using a String value.
  */
  public void setE01EJAID2(String newvalue)
  {
    fieldE01EJAID2.setString(newvalue);
  }

  /**
  * Get value of field E01EJAID2 as a String.
  */
  public String getE01EJAID2()
  {
    return fieldE01EJAID2.getString();
  }

  /**
  * Set numeric field E01EJAID2 using a BigDecimal value.
  */
  public void setE01EJAID2(BigDecimal newvalue)
  {
    fieldE01EJAID2.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EJAID2 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EJAID2()
  {
    return fieldE01EJAID2.getBigDecimal();
  }

  /**
  * Set field E01EJAID3 using a String value.
  */
  public void setE01EJAID3(String newvalue)
  {
    fieldE01EJAID3.setString(newvalue);
  }

  /**
  * Get value of field E01EJAID3 as a String.
  */
  public String getE01EJAID3()
  {
    return fieldE01EJAID3.getString();
  }

  /**
  * Set numeric field E01EJAID3 using a BigDecimal value.
  */
  public void setE01EJAID3(BigDecimal newvalue)
  {
    fieldE01EJAID3.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EJAID3 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EJAID3()
  {
    return fieldE01EJAID3.getBigDecimal();
  }

  /**
  * Set field E01EJAITI using a String value.
  */
  public void setE01EJAITI(String newvalue)
  {
    fieldE01EJAITI.setString(newvalue);
  }

  /**
  * Get value of field E01EJAITI as a String.
  */
  public String getE01EJAITI()
  {
    return fieldE01EJAITI.getString();
  }

  /**
  * Set field E01EJACCY using a String value.
  */
  public void setE01EJACCY(String newvalue)
  {
    fieldE01EJACCY.setString(newvalue);
  }

  /**
  * Get value of field E01EJACCY as a String.
  */
  public String getE01EJACCY()
  {
    return fieldE01EJACCY.getString();
  }

  /**
  * Set field E01EJACCN using a String value.
  */
  public void setE01EJACCN(String newvalue)
  {
    fieldE01EJACCN.setString(newvalue);
  }

  /**
  * Get value of field E01EJACCN as a String.
  */
  public String getE01EJACCN()
  {
    return fieldE01EJACCN.getString();
  }

  /**
  * Set field E01EJAATY using a String value.
  */
  public void setE01EJAATY(String newvalue)
  {
    fieldE01EJAATY.setString(newvalue);
  }

  /**
  * Get value of field E01EJAATY as a String.
  */
  public String getE01EJAATY()
  {
    return fieldE01EJAATY.getString();
  }

  /**
  * Set field E01EJARTB using a String value.
  */
  public void setE01EJARTB(String newvalue)
  {
    fieldE01EJARTB.setString(newvalue);
  }

  /**
  * Get value of field E01EJARTB as a String.
  */
  public String getE01EJARTB()
  {
    return fieldE01EJARTB.getString();
  }

  /**
  * Set field E01EJATRM using a String value.
  */
  public void setE01EJATRM(String newvalue)
  {
    fieldE01EJATRM.setString(newvalue);
  }

  /**
  * Get value of field E01EJATRM as a String.
  */
  public String getE01EJATRM()
  {
    return fieldE01EJATRM.getString();
  }

  /**
  * Set numeric field E01EJATRM using a BigDecimal value.
  */
  public void setE01EJATRM(BigDecimal newvalue)
  {
    fieldE01EJATRM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EJATRM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EJATRM()
  {
    return fieldE01EJATRM.getBigDecimal();
  }

  /**
  * Set field E01EJACUS using a String value.
  */
  public void setE01EJACUS(String newvalue)
  {
    fieldE01EJACUS.setString(newvalue);
  }

  /**
  * Get value of field E01EJACUS as a String.
  */
  public String getE01EJACUS()
  {
    return fieldE01EJACUS.getString();
  }

  /**
  * Set numeric field E01EJACUS using a BigDecimal value.
  */
  public void setE01EJACUS(BigDecimal newvalue)
  {
    fieldE01EJACUS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EJACUS as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EJACUS()
  {
    return fieldE01EJACUS.getBigDecimal();
  }

  /**
  * Set field E01EJACUN using a String value.
  */
  public void setE01EJACUN(String newvalue)
  {
    fieldE01EJACUN.setString(newvalue);
  }

  /**
  * Get value of field E01EJACUN as a String.
  */
  public String getE01EJACUN()
  {
    return fieldE01EJACUN.getString();
  }

  /**
  * Set field E01EJAPER using a String value.
  */
  public void setE01EJAPER(String newvalue)
  {
    fieldE01EJAPER.setString(newvalue);
  }

  /**
  * Get value of field E01EJAPER as a String.
  */
  public String getE01EJAPER()
  {
    return fieldE01EJAPER.getString();
  }

  /**
  * Set numeric field E01EJAPER using a BigDecimal value.
  */
  public void setE01EJAPER(BigDecimal newvalue)
  {
    fieldE01EJAPER.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EJAPER as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EJAPER()
  {
    return fieldE01EJAPER.getBigDecimal();
  }

  /**
  * Set field E01EJAPEA using a String value.
  */
  public void setE01EJAPEA(String newvalue)
  {
    fieldE01EJAPEA.setString(newvalue);
  }

  /**
  * Get value of field E01EJAPEA as a String.
  */
  public String getE01EJAPEA()
  {
    return fieldE01EJAPEA.getString();
  }

  /**
  * Set numeric field E01EJAPEA using a BigDecimal value.
  */
  public void setE01EJAPEA(BigDecimal newvalue)
  {
    fieldE01EJAPEA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01EJAPEA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01EJAPEA()
  {
    return fieldE01EJAPEA.getBigDecimal();
  }

  /**
  * Set field E01CODPRD using a String value.
  */
  public void setE01CODPRD(String newvalue)
  {
    fieldE01CODPRD.setString(newvalue);
  }

  /**
  * Get value of field E01CODPRD as a String.
  */
  public String getE01CODPRD()
  {
    return fieldE01CODPRD.getString();
  }

  /**
  * Set field E01DESPRD using a String value.
  */
  public void setE01DESPRD(String newvalue)
  {
    fieldE01DESPRD.setString(newvalue);
  }

  /**
  * Get value of field E01DESPRD as a String.
  */
  public String getE01DESPRD()
  {
    return fieldE01DESPRD.getString();
  }

}