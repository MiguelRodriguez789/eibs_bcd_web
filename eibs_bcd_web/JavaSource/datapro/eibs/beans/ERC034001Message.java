package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from ERC034001 physical file definition.
* 
* File level identifier is 1161013153559.
* Record format level identifier is 3FEDC7E06713A.
*/

public class ERC034001Message extends MessageRecord
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
                                     "E01BRMEID",
                                     "E01BRMNME",
                                     "E01BRMAD1",
                                     "E01BRMAD2",
                                     "E01BRMAD3",
                                     "E01BRMETY",
                                     "E01BRMEOD",
                                     "E01BRMA1D",
                                     "E01BRMA1E",
                                     "E01BRMA1A",
                                     "E01BRMA2D",
                                     "E01BRMA2E",
                                     "E01BRMA2A",
                                     "E01BRMA3D",
                                     "E01BRMA3E",
                                     "E01BRMA3A",
                                     "E01BRMA4D",
                                     "E01BRMA4E",
                                     "E01BRMA4A",
                                     "E01BRMA5D",
                                     "E01BRMA5E",
                                     "E01BRMA5A",
                                     "E01BRMNMC",
                                     "E01BRMPHN",
                                     "E01BRMPXT",
                                     "E01BRMPH1",
                                     "E01BRMFAX",
                                     "E01BRMEMC",
                                     "E01BRMER1",
                                     "E01BRMER2",
                                     "E01BRMER3",
                                     "E01BRMER4",
                                     "E01BRMRE1",
                                     "E01BRMRE2",
                                     "E01BRMRE3",
                                     "E01BRMMCH",
                                     "E01BRMRCH",
                                     "E01BRMDAC",
                                     "E01BRMCGN",
                                     "E01BRMCTA",
                                     "E01BRMFNM",
                                     "E01BRMIPA",
                                     "E01BRMACC"
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
                                   "E01BRMEID",
                                   "E01BRMNME",
                                   "E01BRMAD1",
                                   "E01BRMAD2",
                                   "E01BRMAD3",
                                   "E01BRMETY",
                                   "E01BRMEOD",
                                   "E01BRMA1D",
                                   "E01BRMA1E",
                                   "E01BRMA1A",
                                   "E01BRMA2D",
                                   "E01BRMA2E",
                                   "E01BRMA2A",
                                   "E01BRMA3D",
                                   "E01BRMA3E",
                                   "E01BRMA3A",
                                   "E01BRMA4D",
                                   "E01BRMA4E",
                                   "E01BRMA4A",
                                   "E01BRMA5D",
                                   "E01BRMA5E",
                                   "E01BRMA5A",
                                   "E01BRMNMC",
                                   "E01BRMPHN",
                                   "E01BRMPXT",
                                   "E01BRMPH1",
                                   "E01BRMFAX",
                                   "E01BRMEMC",
                                   "E01BRMER1",
                                   "E01BRMER2",
                                   "E01BRMER3",
                                   "E01BRMER4",
                                   "E01BRMRE1",
                                   "E01BRMRE2",
                                   "E01BRMRE3",
                                   "E01BRMMCH",
                                   "E01BRMRCH",
                                   "E01BRMDAC",
                                   "E01BRMCGN",
                                   "E01BRMCTA",
                                   "E01BRMFNM",
                                   "E01BRMIPA",
                                   "E01BRMACC"
                                 };
  final static String fid = "1161013153559";
  final static String rid = "3FEDC7E06713A";
  final static String fmtname = "ERC034001";
  final int FIELDCOUNT = 52;
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
  private CharacterField fieldE01BRMEID = null;
  private CharacterField fieldE01BRMNME = null;
  private CharacterField fieldE01BRMAD1 = null;
  private CharacterField fieldE01BRMAD2 = null;
  private CharacterField fieldE01BRMAD3 = null;
  private CharacterField fieldE01BRMETY = null;
  private CharacterField fieldE01BRMEOD = null;
  private DecimalField fieldE01BRMA1D = null;
  private CharacterField fieldE01BRMA1E = null;
  private DecimalField fieldE01BRMA1A = null;
  private DecimalField fieldE01BRMA2D = null;
  private CharacterField fieldE01BRMA2E = null;
  private DecimalField fieldE01BRMA2A = null;
  private DecimalField fieldE01BRMA3D = null;
  private CharacterField fieldE01BRMA3E = null;
  private DecimalField fieldE01BRMA3A = null;
  private DecimalField fieldE01BRMA4D = null;
  private CharacterField fieldE01BRMA4E = null;
  private DecimalField fieldE01BRMA4A = null;
  private DecimalField fieldE01BRMA5D = null;
  private CharacterField fieldE01BRMA5E = null;
  private DecimalField fieldE01BRMA5A = null;
  private CharacterField fieldE01BRMNMC = null;
  private DecimalField fieldE01BRMPHN = null;
  private DecimalField fieldE01BRMPXT = null;
  private DecimalField fieldE01BRMPH1 = null;
  private DecimalField fieldE01BRMFAX = null;
  private CharacterField fieldE01BRMEMC = null;
  private CharacterField fieldE01BRMER1 = null;
  private CharacterField fieldE01BRMER2 = null;
  private CharacterField fieldE01BRMER3 = null;
  private CharacterField fieldE01BRMER4 = null;
  private CharacterField fieldE01BRMRE1 = null;
  private CharacterField fieldE01BRMRE2 = null;
  private CharacterField fieldE01BRMRE3 = null;
  private DecimalField fieldE01BRMMCH = null;
  private DecimalField fieldE01BRMRCH = null;
  private DecimalField fieldE01BRMDAC = null;
  private DecimalField fieldE01BRMCGN = null;
  private CharacterField fieldE01BRMCTA = null;
  private CharacterField fieldE01BRMFNM = null;
  private CharacterField fieldE01BRMIPA = null;
  private DecimalField fieldE01BRMACC = null;

  /**
  * Constructor for ERC034001Message.
  */
  public ERC034001Message()
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
    recordsize = 1215;
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
    fields[9] = fieldE01BRMEID =
    new CharacterField(message, HEADERSIZE + 42, 4, "E01BRMEID");
    fields[10] = fieldE01BRMNME =
    new CharacterField(message, HEADERSIZE + 46, 45, "E01BRMNME");
    fields[11] = fieldE01BRMAD1 =
    new CharacterField(message, HEADERSIZE + 91, 45, "E01BRMAD1");
    fields[12] = fieldE01BRMAD2 =
    new CharacterField(message, HEADERSIZE + 136, 45, "E01BRMAD2");
    fields[13] = fieldE01BRMAD3 =
    new CharacterField(message, HEADERSIZE + 181, 45, "E01BRMAD3");
    fields[14] = fieldE01BRMETY =
    new CharacterField(message, HEADERSIZE + 226, 1, "E01BRMETY");
    fields[15] = fieldE01BRMEOD =
    new CharacterField(message, HEADERSIZE + 227, 1, "E01BRMEOD");
    fields[16] = fieldE01BRMA1D =
    new DecimalField(message, HEADERSIZE + 228, 4, 0, "E01BRMA1D");
    fields[17] = fieldE01BRMA1E =
    new CharacterField(message, HEADERSIZE + 232, 60, "E01BRMA1E");
    fields[18] = fieldE01BRMA1A =
    new DecimalField(message, HEADERSIZE + 292, 17, 2, "E01BRMA1A");
    fields[19] = fieldE01BRMA2D =
    new DecimalField(message, HEADERSIZE + 309, 4, 0, "E01BRMA2D");
    fields[20] = fieldE01BRMA2E =
    new CharacterField(message, HEADERSIZE + 313, 60, "E01BRMA2E");
    fields[21] = fieldE01BRMA2A =
    new DecimalField(message, HEADERSIZE + 373, 17, 2, "E01BRMA2A");
    fields[22] = fieldE01BRMA3D =
    new DecimalField(message, HEADERSIZE + 390, 4, 0, "E01BRMA3D");
    fields[23] = fieldE01BRMA3E =
    new CharacterField(message, HEADERSIZE + 394, 60, "E01BRMA3E");
    fields[24] = fieldE01BRMA3A =
    new DecimalField(message, HEADERSIZE + 454, 17, 2, "E01BRMA3A");
    fields[25] = fieldE01BRMA4D =
    new DecimalField(message, HEADERSIZE + 471, 4, 0, "E01BRMA4D");
    fields[26] = fieldE01BRMA4E =
    new CharacterField(message, HEADERSIZE + 475, 60, "E01BRMA4E");
    fields[27] = fieldE01BRMA4A =
    new DecimalField(message, HEADERSIZE + 535, 17, 2, "E01BRMA4A");
    fields[28] = fieldE01BRMA5D =
    new DecimalField(message, HEADERSIZE + 552, 4, 0, "E01BRMA5D");
    fields[29] = fieldE01BRMA5E =
    new CharacterField(message, HEADERSIZE + 556, 60, "E01BRMA5E");
    fields[30] = fieldE01BRMA5A =
    new DecimalField(message, HEADERSIZE + 616, 17, 2, "E01BRMA5A");
    fields[31] = fieldE01BRMNMC =
    new CharacterField(message, HEADERSIZE + 633, 45, "E01BRMNMC");
    fields[32] = fieldE01BRMPHN =
    new DecimalField(message, HEADERSIZE + 678, 16, 0, "E01BRMPHN");
    fields[33] = fieldE01BRMPXT =
    new DecimalField(message, HEADERSIZE + 694, 5, 0, "E01BRMPXT");
    fields[34] = fieldE01BRMPH1 =
    new DecimalField(message, HEADERSIZE + 699, 16, 0, "E01BRMPH1");
    fields[35] = fieldE01BRMFAX =
    new DecimalField(message, HEADERSIZE + 715, 16, 0, "E01BRMFAX");
    fields[36] = fieldE01BRMEMC =
    new CharacterField(message, HEADERSIZE + 731, 60, "E01BRMEMC");
    fields[37] = fieldE01BRMER1 =
    new CharacterField(message, HEADERSIZE + 791, 1, "E01BRMER1");
    fields[38] = fieldE01BRMER2 =
    new CharacterField(message, HEADERSIZE + 792, 1, "E01BRMER2");
    fields[39] = fieldE01BRMER3 =
    new CharacterField(message, HEADERSIZE + 793, 1, "E01BRMER3");
    fields[40] = fieldE01BRMER4 =
    new CharacterField(message, HEADERSIZE + 794, 1, "E01BRMER4");
    fields[41] = fieldE01BRMRE1 =
    new CharacterField(message, HEADERSIZE + 795, 60, "E01BRMRE1");
    fields[42] = fieldE01BRMRE2 =
    new CharacterField(message, HEADERSIZE + 855, 60, "E01BRMRE2");
    fields[43] = fieldE01BRMRE3 =
    new CharacterField(message, HEADERSIZE + 915, 60, "E01BRMRE3");
    fields[44] = fieldE01BRMMCH =
    new DecimalField(message, HEADERSIZE + 975, 17, 2, "E01BRMMCH");
    fields[45] = fieldE01BRMRCH =
    new DecimalField(message, HEADERSIZE + 992, 17, 2, "E01BRMRCH");
    fields[46] = fieldE01BRMDAC =
    new DecimalField(message, HEADERSIZE + 1009, 13, 0, "E01BRMDAC");
    fields[47] = fieldE01BRMCGN =
    new DecimalField(message, HEADERSIZE + 1022, 17, 0, "E01BRMCGN");
    fields[48] = fieldE01BRMCTA =
    new CharacterField(message, HEADERSIZE + 1039, 20, "E01BRMCTA");
    fields[49] = fieldE01BRMFNM =
    new CharacterField(message, HEADERSIZE + 1059, 128, "E01BRMFNM");
    fields[50] = fieldE01BRMIPA =
    new CharacterField(message, HEADERSIZE + 1187, 15, "E01BRMIPA");
    fields[51] = fieldE01BRMACC =
    new DecimalField(message, HEADERSIZE + 1202, 13, 0, "E01BRMACC");

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
  * Set field E01BRMEID using a String value.
  */
  public void setE01BRMEID(String newvalue)
  {
    fieldE01BRMEID.setString(newvalue);
  }

  /**
  * Get value of field E01BRMEID as a String.
  */
  public String getE01BRMEID()
  {
    return fieldE01BRMEID.getString();
  }

  /**
  * Set field E01BRMNME using a String value.
  */
  public void setE01BRMNME(String newvalue)
  {
    fieldE01BRMNME.setString(newvalue);
  }

  /**
  * Get value of field E01BRMNME as a String.
  */
  public String getE01BRMNME()
  {
    return fieldE01BRMNME.getString();
  }

  /**
  * Set field E01BRMAD1 using a String value.
  */
  public void setE01BRMAD1(String newvalue)
  {
    fieldE01BRMAD1.setString(newvalue);
  }

  /**
  * Get value of field E01BRMAD1 as a String.
  */
  public String getE01BRMAD1()
  {
    return fieldE01BRMAD1.getString();
  }

  /**
  * Set field E01BRMAD2 using a String value.
  */
  public void setE01BRMAD2(String newvalue)
  {
    fieldE01BRMAD2.setString(newvalue);
  }

  /**
  * Get value of field E01BRMAD2 as a String.
  */
  public String getE01BRMAD2()
  {
    return fieldE01BRMAD2.getString();
  }

  /**
  * Set field E01BRMAD3 using a String value.
  */
  public void setE01BRMAD3(String newvalue)
  {
    fieldE01BRMAD3.setString(newvalue);
  }

  /**
  * Get value of field E01BRMAD3 as a String.
  */
  public String getE01BRMAD3()
  {
    return fieldE01BRMAD3.getString();
  }

  /**
  * Set field E01BRMETY using a String value.
  */
  public void setE01BRMETY(String newvalue)
  {
    fieldE01BRMETY.setString(newvalue);
  }

  /**
  * Get value of field E01BRMETY as a String.
  */
  public String getE01BRMETY()
  {
    return fieldE01BRMETY.getString();
  }

  /**
  * Set field E01BRMEOD using a String value.
  */
  public void setE01BRMEOD(String newvalue)
  {
    fieldE01BRMEOD.setString(newvalue);
  }

  /**
  * Get value of field E01BRMEOD as a String.
  */
  public String getE01BRMEOD()
  {
    return fieldE01BRMEOD.getString();
  }

  /**
  * Set field E01BRMA1D using a String value.
  */
  public void setE01BRMA1D(String newvalue)
  {
    fieldE01BRMA1D.setString(newvalue);
  }

  /**
  * Get value of field E01BRMA1D as a String.
  */
  public String getE01BRMA1D()
  {
    return fieldE01BRMA1D.getString();
  }

  /**
  * Set numeric field E01BRMA1D using a BigDecimal value.
  */
  public void setE01BRMA1D(BigDecimal newvalue)
  {
    fieldE01BRMA1D.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BRMA1D as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BRMA1D()
  {
    return fieldE01BRMA1D.getBigDecimal();
  }

  /**
  * Set field E01BRMA1E using a String value.
  */
  public void setE01BRMA1E(String newvalue)
  {
    fieldE01BRMA1E.setString(newvalue);
  }

  /**
  * Get value of field E01BRMA1E as a String.
  */
  public String getE01BRMA1E()
  {
    return fieldE01BRMA1E.getString();
  }

  /**
  * Set field E01BRMA1A using a String value.
  */
  public void setE01BRMA1A(String newvalue)
  {
    fieldE01BRMA1A.setString(newvalue);
  }

  /**
  * Get value of field E01BRMA1A as a String.
  */
  public String getE01BRMA1A()
  {
    return fieldE01BRMA1A.getString();
  }

  /**
  * Set numeric field E01BRMA1A using a BigDecimal value.
  */
  public void setE01BRMA1A(BigDecimal newvalue)
  {
    fieldE01BRMA1A.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BRMA1A as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BRMA1A()
  {
    return fieldE01BRMA1A.getBigDecimal();
  }

  /**
  * Set field E01BRMA2D using a String value.
  */
  public void setE01BRMA2D(String newvalue)
  {
    fieldE01BRMA2D.setString(newvalue);
  }

  /**
  * Get value of field E01BRMA2D as a String.
  */
  public String getE01BRMA2D()
  {
    return fieldE01BRMA2D.getString();
  }

  /**
  * Set numeric field E01BRMA2D using a BigDecimal value.
  */
  public void setE01BRMA2D(BigDecimal newvalue)
  {
    fieldE01BRMA2D.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BRMA2D as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BRMA2D()
  {
    return fieldE01BRMA2D.getBigDecimal();
  }

  /**
  * Set field E01BRMA2E using a String value.
  */
  public void setE01BRMA2E(String newvalue)
  {
    fieldE01BRMA2E.setString(newvalue);
  }

  /**
  * Get value of field E01BRMA2E as a String.
  */
  public String getE01BRMA2E()
  {
    return fieldE01BRMA2E.getString();
  }

  /**
  * Set field E01BRMA2A using a String value.
  */
  public void setE01BRMA2A(String newvalue)
  {
    fieldE01BRMA2A.setString(newvalue);
  }

  /**
  * Get value of field E01BRMA2A as a String.
  */
  public String getE01BRMA2A()
  {
    return fieldE01BRMA2A.getString();
  }

  /**
  * Set numeric field E01BRMA2A using a BigDecimal value.
  */
  public void setE01BRMA2A(BigDecimal newvalue)
  {
    fieldE01BRMA2A.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BRMA2A as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BRMA2A()
  {
    return fieldE01BRMA2A.getBigDecimal();
  }

  /**
  * Set field E01BRMA3D using a String value.
  */
  public void setE01BRMA3D(String newvalue)
  {
    fieldE01BRMA3D.setString(newvalue);
  }

  /**
  * Get value of field E01BRMA3D as a String.
  */
  public String getE01BRMA3D()
  {
    return fieldE01BRMA3D.getString();
  }

  /**
  * Set numeric field E01BRMA3D using a BigDecimal value.
  */
  public void setE01BRMA3D(BigDecimal newvalue)
  {
    fieldE01BRMA3D.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BRMA3D as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BRMA3D()
  {
    return fieldE01BRMA3D.getBigDecimal();
  }

  /**
  * Set field E01BRMA3E using a String value.
  */
  public void setE01BRMA3E(String newvalue)
  {
    fieldE01BRMA3E.setString(newvalue);
  }

  /**
  * Get value of field E01BRMA3E as a String.
  */
  public String getE01BRMA3E()
  {
    return fieldE01BRMA3E.getString();
  }

  /**
  * Set field E01BRMA3A using a String value.
  */
  public void setE01BRMA3A(String newvalue)
  {
    fieldE01BRMA3A.setString(newvalue);
  }

  /**
  * Get value of field E01BRMA3A as a String.
  */
  public String getE01BRMA3A()
  {
    return fieldE01BRMA3A.getString();
  }

  /**
  * Set numeric field E01BRMA3A using a BigDecimal value.
  */
  public void setE01BRMA3A(BigDecimal newvalue)
  {
    fieldE01BRMA3A.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BRMA3A as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BRMA3A()
  {
    return fieldE01BRMA3A.getBigDecimal();
  }

  /**
  * Set field E01BRMA4D using a String value.
  */
  public void setE01BRMA4D(String newvalue)
  {
    fieldE01BRMA4D.setString(newvalue);
  }

  /**
  * Get value of field E01BRMA4D as a String.
  */
  public String getE01BRMA4D()
  {
    return fieldE01BRMA4D.getString();
  }

  /**
  * Set numeric field E01BRMA4D using a BigDecimal value.
  */
  public void setE01BRMA4D(BigDecimal newvalue)
  {
    fieldE01BRMA4D.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BRMA4D as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BRMA4D()
  {
    return fieldE01BRMA4D.getBigDecimal();
  }

  /**
  * Set field E01BRMA4E using a String value.
  */
  public void setE01BRMA4E(String newvalue)
  {
    fieldE01BRMA4E.setString(newvalue);
  }

  /**
  * Get value of field E01BRMA4E as a String.
  */
  public String getE01BRMA4E()
  {
    return fieldE01BRMA4E.getString();
  }

  /**
  * Set field E01BRMA4A using a String value.
  */
  public void setE01BRMA4A(String newvalue)
  {
    fieldE01BRMA4A.setString(newvalue);
  }

  /**
  * Get value of field E01BRMA4A as a String.
  */
  public String getE01BRMA4A()
  {
    return fieldE01BRMA4A.getString();
  }

  /**
  * Set numeric field E01BRMA4A using a BigDecimal value.
  */
  public void setE01BRMA4A(BigDecimal newvalue)
  {
    fieldE01BRMA4A.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BRMA4A as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BRMA4A()
  {
    return fieldE01BRMA4A.getBigDecimal();
  }

  /**
  * Set field E01BRMA5D using a String value.
  */
  public void setE01BRMA5D(String newvalue)
  {
    fieldE01BRMA5D.setString(newvalue);
  }

  /**
  * Get value of field E01BRMA5D as a String.
  */
  public String getE01BRMA5D()
  {
    return fieldE01BRMA5D.getString();
  }

  /**
  * Set numeric field E01BRMA5D using a BigDecimal value.
  */
  public void setE01BRMA5D(BigDecimal newvalue)
  {
    fieldE01BRMA5D.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BRMA5D as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BRMA5D()
  {
    return fieldE01BRMA5D.getBigDecimal();
  }

  /**
  * Set field E01BRMA5E using a String value.
  */
  public void setE01BRMA5E(String newvalue)
  {
    fieldE01BRMA5E.setString(newvalue);
  }

  /**
  * Get value of field E01BRMA5E as a String.
  */
  public String getE01BRMA5E()
  {
    return fieldE01BRMA5E.getString();
  }

  /**
  * Set field E01BRMA5A using a String value.
  */
  public void setE01BRMA5A(String newvalue)
  {
    fieldE01BRMA5A.setString(newvalue);
  }

  /**
  * Get value of field E01BRMA5A as a String.
  */
  public String getE01BRMA5A()
  {
    return fieldE01BRMA5A.getString();
  }

  /**
  * Set numeric field E01BRMA5A using a BigDecimal value.
  */
  public void setE01BRMA5A(BigDecimal newvalue)
  {
    fieldE01BRMA5A.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BRMA5A as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BRMA5A()
  {
    return fieldE01BRMA5A.getBigDecimal();
  }

  /**
  * Set field E01BRMNMC using a String value.
  */
  public void setE01BRMNMC(String newvalue)
  {
    fieldE01BRMNMC.setString(newvalue);
  }

  /**
  * Get value of field E01BRMNMC as a String.
  */
  public String getE01BRMNMC()
  {
    return fieldE01BRMNMC.getString();
  }

  /**
  * Set field E01BRMPHN using a String value.
  */
  public void setE01BRMPHN(String newvalue)
  {
    fieldE01BRMPHN.setString(newvalue);
  }

  /**
  * Get value of field E01BRMPHN as a String.
  */
  public String getE01BRMPHN()
  {
    return fieldE01BRMPHN.getString();
  }

  /**
  * Set numeric field E01BRMPHN using a BigDecimal value.
  */
  public void setE01BRMPHN(BigDecimal newvalue)
  {
    fieldE01BRMPHN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BRMPHN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BRMPHN()
  {
    return fieldE01BRMPHN.getBigDecimal();
  }

  /**
  * Set field E01BRMPXT using a String value.
  */
  public void setE01BRMPXT(String newvalue)
  {
    fieldE01BRMPXT.setString(newvalue);
  }

  /**
  * Get value of field E01BRMPXT as a String.
  */
  public String getE01BRMPXT()
  {
    return fieldE01BRMPXT.getString();
  }

  /**
  * Set numeric field E01BRMPXT using a BigDecimal value.
  */
  public void setE01BRMPXT(BigDecimal newvalue)
  {
    fieldE01BRMPXT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BRMPXT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BRMPXT()
  {
    return fieldE01BRMPXT.getBigDecimal();
  }

  /**
  * Set field E01BRMPH1 using a String value.
  */
  public void setE01BRMPH1(String newvalue)
  {
    fieldE01BRMPH1.setString(newvalue);
  }

  /**
  * Get value of field E01BRMPH1 as a String.
  */
  public String getE01BRMPH1()
  {
    return fieldE01BRMPH1.getString();
  }

  /**
  * Set numeric field E01BRMPH1 using a BigDecimal value.
  */
  public void setE01BRMPH1(BigDecimal newvalue)
  {
    fieldE01BRMPH1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BRMPH1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BRMPH1()
  {
    return fieldE01BRMPH1.getBigDecimal();
  }

  /**
  * Set field E01BRMFAX using a String value.
  */
  public void setE01BRMFAX(String newvalue)
  {
    fieldE01BRMFAX.setString(newvalue);
  }

  /**
  * Get value of field E01BRMFAX as a String.
  */
  public String getE01BRMFAX()
  {
    return fieldE01BRMFAX.getString();
  }

  /**
  * Set numeric field E01BRMFAX using a BigDecimal value.
  */
  public void setE01BRMFAX(BigDecimal newvalue)
  {
    fieldE01BRMFAX.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BRMFAX as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BRMFAX()
  {
    return fieldE01BRMFAX.getBigDecimal();
  }

  /**
  * Set field E01BRMEMC using a String value.
  */
  public void setE01BRMEMC(String newvalue)
  {
    fieldE01BRMEMC.setString(newvalue);
  }

  /**
  * Get value of field E01BRMEMC as a String.
  */
  public String getE01BRMEMC()
  {
    return fieldE01BRMEMC.getString();
  }

  /**
  * Set field E01BRMER1 using a String value.
  */
  public void setE01BRMER1(String newvalue)
  {
    fieldE01BRMER1.setString(newvalue);
  }

  /**
  * Get value of field E01BRMER1 as a String.
  */
  public String getE01BRMER1()
  {
    return fieldE01BRMER1.getString();
  }

  /**
  * Set field E01BRMER2 using a String value.
  */
  public void setE01BRMER2(String newvalue)
  {
    fieldE01BRMER2.setString(newvalue);
  }

  /**
  * Get value of field E01BRMER2 as a String.
  */
  public String getE01BRMER2()
  {
    return fieldE01BRMER2.getString();
  }

  /**
  * Set field E01BRMER3 using a String value.
  */
  public void setE01BRMER3(String newvalue)
  {
    fieldE01BRMER3.setString(newvalue);
  }

  /**
  * Get value of field E01BRMER3 as a String.
  */
  public String getE01BRMER3()
  {
    return fieldE01BRMER3.getString();
  }

  /**
  * Set field E01BRMER4 using a String value.
  */
  public void setE01BRMER4(String newvalue)
  {
    fieldE01BRMER4.setString(newvalue);
  }

  /**
  * Get value of field E01BRMER4 as a String.
  */
  public String getE01BRMER4()
  {
    return fieldE01BRMER4.getString();
  }

  /**
  * Set field E01BRMRE1 using a String value.
  */
  public void setE01BRMRE1(String newvalue)
  {
    fieldE01BRMRE1.setString(newvalue);
  }

  /**
  * Get value of field E01BRMRE1 as a String.
  */
  public String getE01BRMRE1()
  {
    return fieldE01BRMRE1.getString();
  }

  /**
  * Set field E01BRMRE2 using a String value.
  */
  public void setE01BRMRE2(String newvalue)
  {
    fieldE01BRMRE2.setString(newvalue);
  }

  /**
  * Get value of field E01BRMRE2 as a String.
  */
  public String getE01BRMRE2()
  {
    return fieldE01BRMRE2.getString();
  }

  /**
  * Set field E01BRMRE3 using a String value.
  */
  public void setE01BRMRE3(String newvalue)
  {
    fieldE01BRMRE3.setString(newvalue);
  }

  /**
  * Get value of field E01BRMRE3 as a String.
  */
  public String getE01BRMRE3()
  {
    return fieldE01BRMRE3.getString();
  }

  /**
  * Set field E01BRMMCH using a String value.
  */
  public void setE01BRMMCH(String newvalue)
  {
    fieldE01BRMMCH.setString(newvalue);
  }

  /**
  * Get value of field E01BRMMCH as a String.
  */
  public String getE01BRMMCH()
  {
    return fieldE01BRMMCH.getString();
  }

  /**
  * Set numeric field E01BRMMCH using a BigDecimal value.
  */
  public void setE01BRMMCH(BigDecimal newvalue)
  {
    fieldE01BRMMCH.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BRMMCH as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BRMMCH()
  {
    return fieldE01BRMMCH.getBigDecimal();
  }

  /**
  * Set field E01BRMRCH using a String value.
  */
  public void setE01BRMRCH(String newvalue)
  {
    fieldE01BRMRCH.setString(newvalue);
  }

  /**
  * Get value of field E01BRMRCH as a String.
  */
  public String getE01BRMRCH()
  {
    return fieldE01BRMRCH.getString();
  }

  /**
  * Set numeric field E01BRMRCH using a BigDecimal value.
  */
  public void setE01BRMRCH(BigDecimal newvalue)
  {
    fieldE01BRMRCH.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BRMRCH as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BRMRCH()
  {
    return fieldE01BRMRCH.getBigDecimal();
  }

  /**
  * Set field E01BRMDAC using a String value.
  */
  public void setE01BRMDAC(String newvalue)
  {
    fieldE01BRMDAC.setString(newvalue);
  }

  /**
  * Get value of field E01BRMDAC as a String.
  */
  public String getE01BRMDAC()
  {
    return fieldE01BRMDAC.getString();
  }

  /**
  * Set numeric field E01BRMDAC using a BigDecimal value.
  */
  public void setE01BRMDAC(BigDecimal newvalue)
  {
    fieldE01BRMDAC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BRMDAC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BRMDAC()
  {
    return fieldE01BRMDAC.getBigDecimal();
  }

  /**
  * Set field E01BRMCGN using a String value.
  */
  public void setE01BRMCGN(String newvalue)
  {
    fieldE01BRMCGN.setString(newvalue);
  }

  /**
  * Get value of field E01BRMCGN as a String.
  */
  public String getE01BRMCGN()
  {
    return fieldE01BRMCGN.getString();
  }

  /**
  * Set numeric field E01BRMCGN using a BigDecimal value.
  */
  public void setE01BRMCGN(BigDecimal newvalue)
  {
    fieldE01BRMCGN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BRMCGN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BRMCGN()
  {
    return fieldE01BRMCGN.getBigDecimal();
  }

  /**
  * Set field E01BRMCTA using a String value.
  */
  public void setE01BRMCTA(String newvalue)
  {
    fieldE01BRMCTA.setString(newvalue);
  }

  /**
  * Get value of field E01BRMCTA as a String.
  */
  public String getE01BRMCTA()
  {
    return fieldE01BRMCTA.getString();
  }

  /**
  * Set field E01BRMFNM using a String value.
  */
  public void setE01BRMFNM(String newvalue)
  {
    fieldE01BRMFNM.setString(newvalue);
  }

  /**
  * Get value of field E01BRMFNM as a String.
  */
  public String getE01BRMFNM()
  {
    return fieldE01BRMFNM.getString();
  }

  /**
  * Set field E01BRMIPA using a String value.
  */
  public void setE01BRMIPA(String newvalue)
  {
    fieldE01BRMIPA.setString(newvalue);
  }

  /**
  * Get value of field E01BRMIPA as a String.
  */
  public String getE01BRMIPA()
  {
    return fieldE01BRMIPA.getString();
  }

  /**
  * Set field E01BRMACC using a String value.
  */
  public void setE01BRMACC(String newvalue)
  {
    fieldE01BRMACC.setString(newvalue);
  }

  /**
  * Get value of field E01BRMACC as a String.
  */
  public String getE01BRMACC()
  {
    return fieldE01BRMACC.getString();
  }

  /**
  * Set numeric field E01BRMACC using a BigDecimal value.
  */
  public void setE01BRMACC(BigDecimal newvalue)
  {
    fieldE01BRMACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01BRMACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01BRMACC()
  {
    return fieldE01BRMACC.getBigDecimal();
  }

}
