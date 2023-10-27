package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EDL084801 physical file definition.
* 
* File level identifier is 1160226095642.
* Record format level identifier is 485532A954DFA.
*/

public class EDL084801Message extends MessageRecord
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
                                     "E01DLRRTP",
                                     "E01DLRCOD",
                                     "E01DLRNME",
                                     "E01DLRAD1",
                                     "E01DLRAD2",
                                     "E01DLRAD3",
                                     "E01DLRAD4",
                                     "E01DLRAD5",
                                     "E01DLRAD6",
                                     "E01DLRAD7",
                                     "E01DLRAD8",
                                     "E01DLRPHN",
                                     "E01DLRIDN",
                                     "E01DLRCIT",
                                     "E01DLRCIU",
                                     "E01DLRSTE",
                                     "E01DLRZPC",
                                     "E01DLRPOB",
                                     "E01DLRCTR",
                                     "E01DLRCOC",
                                     "E01DLRDCA",
                                     "E01DLRDNE",
                                     "E01DLRDNI",
                                     "E01DLRDCO",
                                     "E01DLRDMU",
                                     "E01DLRDES",
                                     "E01DLRCES",
                                     "E01DLRCOM",
                                     "D01DLRNME",
                                     "E01DLRBRN",
                                     "D01DLRBRN",
                                     "E01DLRF01",
                                     "E01DLRFLG",
                                     "E01DLRFL2",
                                     "E01DLROPE"
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
                                   "E01DLRRTP",
                                   "E01DLRCOD",
                                   "E01DLRNME",
                                   "E01DLRAD1",
                                   "E01DLRAD2",
                                   "E01DLRAD3",
                                   "E01DLRAD4",
                                   "E01DLRAD5",
                                   "E01DLRAD6",
                                   "E01DLRAD7",
                                   "E01DLRAD8",
                                   "E01DLRPHN",
                                   "E01DLRIDN",
                                   "E01DLRCIT",
                                   "E01DLRCIU",
                                   "E01DLRSTE",
                                   "E01DLRZPC",
                                   "E01DLRPOB",
                                   "E01DLRCTR",
                                   "E01DLRCOC",
                                   "E01DLRDCA",
                                   "E01DLRDNE",
                                   "E01DLRDNI",
                                   "E01DLRDCO",
                                   "E01DLRDMU",
                                   "E01DLRDES",
                                   "E01DLRCES",
                                   "E01DLRCOM",
                                   "D01DLRNME",
                                   "E01DLRBRN",
                                   "D01DLRBRN",
                                   "E01DLRF01",
                                   "E01DLRFLG",
                                   "E01DLRFL2",
                                   "E01DLROPE"
                                 };
  final static String fid = "1160226095642";
  final static String rid = "485532A954DFA";
  final static String fmtname = "EDL084801";
  final int FIELDCOUNT = 44;
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
  private CharacterField fieldE01DLRRTP = null;
  private CharacterField fieldE01DLRCOD = null;
  private CharacterField fieldE01DLRNME = null;
  private CharacterField fieldE01DLRAD1 = null;
  private CharacterField fieldE01DLRAD2 = null;
  private CharacterField fieldE01DLRAD3 = null;
  private CharacterField fieldE01DLRAD4 = null;
  private CharacterField fieldE01DLRAD5 = null;
  private CharacterField fieldE01DLRAD6 = null;
  private CharacterField fieldE01DLRAD7 = null;
  private CharacterField fieldE01DLRAD8 = null;
  private DecimalField fieldE01DLRPHN = null;
  private CharacterField fieldE01DLRIDN = null;
  private CharacterField fieldE01DLRCIT = null;
  private CharacterField fieldE01DLRCIU = null;
  private CharacterField fieldE01DLRSTE = null;
  private CharacterField fieldE01DLRZPC = null;
  private CharacterField fieldE01DLRPOB = null;
  private CharacterField fieldE01DLRCTR = null;
  private CharacterField fieldE01DLRCOC = null;
  private CharacterField fieldE01DLRDCA = null;
  private CharacterField fieldE01DLRDNE = null;
  private CharacterField fieldE01DLRDNI = null;
  private CharacterField fieldE01DLRDCO = null;
  private CharacterField fieldE01DLRDMU = null;
  private CharacterField fieldE01DLRDES = null;
  private CharacterField fieldE01DLRCES = null;
  private CharacterField fieldE01DLRCOM = null;
  private CharacterField fieldD01DLRNME = null;
  private DecimalField fieldE01DLRBRN = null;
  private CharacterField fieldD01DLRBRN = null;
  private CharacterField fieldE01DLRF01 = null;
  private CharacterField fieldE01DLRFLG = null;
  private CharacterField fieldE01DLRFL2 = null;
  private CharacterField fieldE01DLROPE = null;

  /**
  * Constructor for EDL084801Message.
  */
  public EDL084801Message()
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
    recordsize = 879;
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
    fields[9] = fieldE01DLRRTP =
    new CharacterField(message, HEADERSIZE + 42, 2, "E01DLRRTP");
    fields[10] = fieldE01DLRCOD =
    new CharacterField(message, HEADERSIZE + 44, 6, "E01DLRCOD");
    fields[11] = fieldE01DLRNME =
    new CharacterField(message, HEADERSIZE + 50, 45, "E01DLRNME");
    fields[12] = fieldE01DLRAD1 =
    new CharacterField(message, HEADERSIZE + 95, 45, "E01DLRAD1");
    fields[13] = fieldE01DLRAD2 =
    new CharacterField(message, HEADERSIZE + 140, 45, "E01DLRAD2");
    fields[14] = fieldE01DLRAD3 =
    new CharacterField(message, HEADERSIZE + 185, 45, "E01DLRAD3");
    fields[15] = fieldE01DLRAD4 =
    new CharacterField(message, HEADERSIZE + 230, 45, "E01DLRAD4");
    fields[16] = fieldE01DLRAD5 =
    new CharacterField(message, HEADERSIZE + 275, 45, "E01DLRAD5");
    fields[17] = fieldE01DLRAD6 =
    new CharacterField(message, HEADERSIZE + 320, 45, "E01DLRAD6");
    fields[18] = fieldE01DLRAD7 =
    new CharacterField(message, HEADERSIZE + 365, 45, "E01DLRAD7");
    fields[19] = fieldE01DLRAD8 =
    new CharacterField(message, HEADERSIZE + 410, 45, "E01DLRAD8");
    fields[20] = fieldE01DLRPHN =
    new DecimalField(message, HEADERSIZE + 455, 16, 0, "E01DLRPHN");
    fields[21] = fieldE01DLRIDN =
    new CharacterField(message, HEADERSIZE + 471, 25, "E01DLRIDN");
    fields[22] = fieldE01DLRCIT =
    new CharacterField(message, HEADERSIZE + 496, 4, "E01DLRCIT");
    fields[23] = fieldE01DLRCIU =
    new CharacterField(message, HEADERSIZE + 500, 30, "E01DLRCIU");
    fields[24] = fieldE01DLRSTE =
    new CharacterField(message, HEADERSIZE + 530, 4, "E01DLRSTE");
    fields[25] = fieldE01DLRZPC =
    new CharacterField(message, HEADERSIZE + 534, 15, "E01DLRZPC");
    fields[26] = fieldE01DLRPOB =
    new CharacterField(message, HEADERSIZE + 549, 10, "E01DLRPOB");
    fields[27] = fieldE01DLRCTR =
    new CharacterField(message, HEADERSIZE + 559, 35, "E01DLRCTR");
    fields[28] = fieldE01DLRCOC =
    new CharacterField(message, HEADERSIZE + 594, 4, "E01DLRCOC");
    fields[29] = fieldE01DLRDCA =
    new CharacterField(message, HEADERSIZE + 598, 40, "E01DLRDCA");
    fields[30] = fieldE01DLRDNE =
    new CharacterField(message, HEADERSIZE + 638, 10, "E01DLRDNE");
    fields[31] = fieldE01DLRDNI =
    new CharacterField(message, HEADERSIZE + 648, 10, "E01DLRDNI");
    fields[32] = fieldE01DLRDCO =
    new CharacterField(message, HEADERSIZE + 658, 30, "E01DLRDCO");
    fields[33] = fieldE01DLRDMU =
    new CharacterField(message, HEADERSIZE + 688, 30, "E01DLRDMU");
    fields[34] = fieldE01DLRDES =
    new CharacterField(message, HEADERSIZE + 718, 45, "E01DLRDES");
    fields[35] = fieldE01DLRCES =
    new CharacterField(message, HEADERSIZE + 763, 4, "E01DLRCES");
    fields[36] = fieldE01DLRCOM =
    new CharacterField(message, HEADERSIZE + 767, 4, "E01DLRCOM");
    fields[37] = fieldD01DLRNME =
    new CharacterField(message, HEADERSIZE + 771, 45, "D01DLRNME");
    fields[38] = fieldE01DLRBRN =
    new DecimalField(message, HEADERSIZE + 816, 5, 0, "E01DLRBRN");
    fields[39] = fieldD01DLRBRN =
    new CharacterField(message, HEADERSIZE + 821, 45, "D01DLRBRN");
    fields[40] = fieldE01DLRF01 =
    new CharacterField(message, HEADERSIZE + 866, 10, "E01DLRF01");
    fields[41] = fieldE01DLRFLG =
    new CharacterField(message, HEADERSIZE + 876, 1, "E01DLRFLG");
    fields[42] = fieldE01DLRFL2 =
    new CharacterField(message, HEADERSIZE + 877, 1, "E01DLRFL2");
    fields[43] = fieldE01DLROPE =
    new CharacterField(message, HEADERSIZE + 878, 1, "E01DLROPE");

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
  * Set field E01DLRRTP using a String value.
  */
  public void setE01DLRRTP(String newvalue)
  {
    fieldE01DLRRTP.setString(newvalue);
  }

  /**
  * Get value of field E01DLRRTP as a String.
  */
  public String getE01DLRRTP()
  {
    return fieldE01DLRRTP.getString();
  }

  /**
  * Set field E01DLRCOD using a String value.
  */
  public void setE01DLRCOD(String newvalue)
  {
    fieldE01DLRCOD.setString(newvalue);
  }

  /**
  * Get value of field E01DLRCOD as a String.
  */
  public String getE01DLRCOD()
  {
    return fieldE01DLRCOD.getString();
  }

  /**
  * Set field E01DLRNME using a String value.
  */
  public void setE01DLRNME(String newvalue)
  {
    fieldE01DLRNME.setString(newvalue);
  }

  /**
  * Get value of field E01DLRNME as a String.
  */
  public String getE01DLRNME()
  {
    return fieldE01DLRNME.getString();
  }

  /**
  * Set field E01DLRAD1 using a String value.
  */
  public void setE01DLRAD1(String newvalue)
  {
    fieldE01DLRAD1.setString(newvalue);
  }

  /**
  * Get value of field E01DLRAD1 as a String.
  */
  public String getE01DLRAD1()
  {
    return fieldE01DLRAD1.getString();
  }

  /**
  * Set field E01DLRAD2 using a String value.
  */
  public void setE01DLRAD2(String newvalue)
  {
    fieldE01DLRAD2.setString(newvalue);
  }

  /**
  * Get value of field E01DLRAD2 as a String.
  */
  public String getE01DLRAD2()
  {
    return fieldE01DLRAD2.getString();
  }

  /**
  * Set field E01DLRAD3 using a String value.
  */
  public void setE01DLRAD3(String newvalue)
  {
    fieldE01DLRAD3.setString(newvalue);
  }

  /**
  * Get value of field E01DLRAD3 as a String.
  */
  public String getE01DLRAD3()
  {
    return fieldE01DLRAD3.getString();
  }

  /**
  * Set field E01DLRAD4 using a String value.
  */
  public void setE01DLRAD4(String newvalue)
  {
    fieldE01DLRAD4.setString(newvalue);
  }

  /**
  * Get value of field E01DLRAD4 as a String.
  */
  public String getE01DLRAD4()
  {
    return fieldE01DLRAD4.getString();
  }

  /**
  * Set field E01DLRAD5 using a String value.
  */
  public void setE01DLRAD5(String newvalue)
  {
    fieldE01DLRAD5.setString(newvalue);
  }

  /**
  * Get value of field E01DLRAD5 as a String.
  */
  public String getE01DLRAD5()
  {
    return fieldE01DLRAD5.getString();
  }

  /**
  * Set field E01DLRAD6 using a String value.
  */
  public void setE01DLRAD6(String newvalue)
  {
    fieldE01DLRAD6.setString(newvalue);
  }

  /**
  * Get value of field E01DLRAD6 as a String.
  */
  public String getE01DLRAD6()
  {
    return fieldE01DLRAD6.getString();
  }

  /**
  * Set field E01DLRAD7 using a String value.
  */
  public void setE01DLRAD7(String newvalue)
  {
    fieldE01DLRAD7.setString(newvalue);
  }

  /**
  * Get value of field E01DLRAD7 as a String.
  */
  public String getE01DLRAD7()
  {
    return fieldE01DLRAD7.getString();
  }

  /**
  * Set field E01DLRAD8 using a String value.
  */
  public void setE01DLRAD8(String newvalue)
  {
    fieldE01DLRAD8.setString(newvalue);
  }

  /**
  * Get value of field E01DLRAD8 as a String.
  */
  public String getE01DLRAD8()
  {
    return fieldE01DLRAD8.getString();
  }

  /**
  * Set field E01DLRPHN using a String value.
  */
  public void setE01DLRPHN(String newvalue)
  {
    fieldE01DLRPHN.setString(newvalue);
  }

  /**
  * Get value of field E01DLRPHN as a String.
  */
  public String getE01DLRPHN()
  {
    return fieldE01DLRPHN.getString();
  }

  /**
  * Set numeric field E01DLRPHN using a BigDecimal value.
  */
  public void setE01DLRPHN(BigDecimal newvalue)
  {
    fieldE01DLRPHN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DLRPHN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DLRPHN()
  {
    return fieldE01DLRPHN.getBigDecimal();
  }

  /**
  * Set field E01DLRIDN using a String value.
  */
  public void setE01DLRIDN(String newvalue)
  {
    fieldE01DLRIDN.setString(newvalue);
  }

  /**
  * Get value of field E01DLRIDN as a String.
  */
  public String getE01DLRIDN()
  {
    return fieldE01DLRIDN.getString();
  }

  /**
  * Set field E01DLRCIT using a String value.
  */
  public void setE01DLRCIT(String newvalue)
  {
    fieldE01DLRCIT.setString(newvalue);
  }

  /**
  * Get value of field E01DLRCIT as a String.
  */
  public String getE01DLRCIT()
  {
    return fieldE01DLRCIT.getString();
  }

  /**
  * Set field E01DLRCIU using a String value.
  */
  public void setE01DLRCIU(String newvalue)
  {
    fieldE01DLRCIU.setString(newvalue);
  }

  /**
  * Get value of field E01DLRCIU as a String.
  */
  public String getE01DLRCIU()
  {
    return fieldE01DLRCIU.getString();
  }

  /**
  * Set field E01DLRSTE using a String value.
  */
  public void setE01DLRSTE(String newvalue)
  {
    fieldE01DLRSTE.setString(newvalue);
  }

  /**
  * Get value of field E01DLRSTE as a String.
  */
  public String getE01DLRSTE()
  {
    return fieldE01DLRSTE.getString();
  }

  /**
  * Set field E01DLRZPC using a String value.
  */
  public void setE01DLRZPC(String newvalue)
  {
    fieldE01DLRZPC.setString(newvalue);
  }

  /**
  * Get value of field E01DLRZPC as a String.
  */
  public String getE01DLRZPC()
  {
    return fieldE01DLRZPC.getString();
  }

  /**
  * Set field E01DLRPOB using a String value.
  */
  public void setE01DLRPOB(String newvalue)
  {
    fieldE01DLRPOB.setString(newvalue);
  }

  /**
  * Get value of field E01DLRPOB as a String.
  */
  public String getE01DLRPOB()
  {
    return fieldE01DLRPOB.getString();
  }

  /**
  * Set field E01DLRCTR using a String value.
  */
  public void setE01DLRCTR(String newvalue)
  {
    fieldE01DLRCTR.setString(newvalue);
  }

  /**
  * Get value of field E01DLRCTR as a String.
  */
  public String getE01DLRCTR()
  {
    return fieldE01DLRCTR.getString();
  }

  /**
  * Set field E01DLRCOC using a String value.
  */
  public void setE01DLRCOC(String newvalue)
  {
    fieldE01DLRCOC.setString(newvalue);
  }

  /**
  * Get value of field E01DLRCOC as a String.
  */
  public String getE01DLRCOC()
  {
    return fieldE01DLRCOC.getString();
  }

  /**
  * Set field E01DLRDCA using a String value.
  */
  public void setE01DLRDCA(String newvalue)
  {
    fieldE01DLRDCA.setString(newvalue);
  }

  /**
  * Get value of field E01DLRDCA as a String.
  */
  public String getE01DLRDCA()
  {
    return fieldE01DLRDCA.getString();
  }

  /**
  * Set field E01DLRDNE using a String value.
  */
  public void setE01DLRDNE(String newvalue)
  {
    fieldE01DLRDNE.setString(newvalue);
  }

  /**
  * Get value of field E01DLRDNE as a String.
  */
  public String getE01DLRDNE()
  {
    return fieldE01DLRDNE.getString();
  }

  /**
  * Set field E01DLRDNI using a String value.
  */
  public void setE01DLRDNI(String newvalue)
  {
    fieldE01DLRDNI.setString(newvalue);
  }

  /**
  * Get value of field E01DLRDNI as a String.
  */
  public String getE01DLRDNI()
  {
    return fieldE01DLRDNI.getString();
  }

  /**
  * Set field E01DLRDCO using a String value.
  */
  public void setE01DLRDCO(String newvalue)
  {
    fieldE01DLRDCO.setString(newvalue);
  }

  /**
  * Get value of field E01DLRDCO as a String.
  */
  public String getE01DLRDCO()
  {
    return fieldE01DLRDCO.getString();
  }

  /**
  * Set field E01DLRDMU using a String value.
  */
  public void setE01DLRDMU(String newvalue)
  {
    fieldE01DLRDMU.setString(newvalue);
  }

  /**
  * Get value of field E01DLRDMU as a String.
  */
  public String getE01DLRDMU()
  {
    return fieldE01DLRDMU.getString();
  }

  /**
  * Set field E01DLRDES using a String value.
  */
  public void setE01DLRDES(String newvalue)
  {
    fieldE01DLRDES.setString(newvalue);
  }

  /**
  * Get value of field E01DLRDES as a String.
  */
  public String getE01DLRDES()
  {
    return fieldE01DLRDES.getString();
  }

  /**
  * Set field E01DLRCES using a String value.
  */
  public void setE01DLRCES(String newvalue)
  {
    fieldE01DLRCES.setString(newvalue);
  }

  /**
  * Get value of field E01DLRCES as a String.
  */
  public String getE01DLRCES()
  {
    return fieldE01DLRCES.getString();
  }

  /**
  * Set field E01DLRCOM using a String value.
  */
  public void setE01DLRCOM(String newvalue)
  {
    fieldE01DLRCOM.setString(newvalue);
  }

  /**
  * Get value of field E01DLRCOM as a String.
  */
  public String getE01DLRCOM()
  {
    return fieldE01DLRCOM.getString();
  }

  /**
  * Set field D01DLRNME using a String value.
  */
  public void setD01DLRNME(String newvalue)
  {
    fieldD01DLRNME.setString(newvalue);
  }

  /**
  * Get value of field D01DLRNME as a String.
  */
  public String getD01DLRNME()
  {
    return fieldD01DLRNME.getString();
  }

  /**
  * Set field E01DLRBRN using a String value.
  */
  public void setE01DLRBRN(String newvalue)
  {
    fieldE01DLRBRN.setString(newvalue);
  }

  /**
  * Get value of field E01DLRBRN as a String.
  */
  public String getE01DLRBRN()
  {
    return fieldE01DLRBRN.getString();
  }

  /**
  * Set numeric field E01DLRBRN using a BigDecimal value.
  */
  public void setE01DLRBRN(BigDecimal newvalue)
  {
    fieldE01DLRBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E01DLRBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalE01DLRBRN()
  {
    return fieldE01DLRBRN.getBigDecimal();
  }

  /**
  * Set field D01DLRBRN using a String value.
  */
  public void setD01DLRBRN(String newvalue)
  {
    fieldD01DLRBRN.setString(newvalue);
  }

  /**
  * Get value of field D01DLRBRN as a String.
  */
  public String getD01DLRBRN()
  {
    return fieldD01DLRBRN.getString();
  }

  /**
  * Set field E01DLRF01 using a String value.
  */
  public void setE01DLRF01(String newvalue)
  {
    fieldE01DLRF01.setString(newvalue);
  }

  /**
  * Get value of field E01DLRF01 as a String.
  */
  public String getE01DLRF01()
  {
    return fieldE01DLRF01.getString();
  }

  /**
  * Set field E01DLRFLG using a String value.
  */
  public void setE01DLRFLG(String newvalue)
  {
    fieldE01DLRFLG.setString(newvalue);
  }

  /**
  * Get value of field E01DLRFLG as a String.
  */
  public String getE01DLRFLG()
  {
    return fieldE01DLRFLG.getString();
  }

  /**
  * Set field E01DLRFL2 using a String value.
  */
  public void setE01DLRFL2(String newvalue)
  {
    fieldE01DLRFL2.setString(newvalue);
  }

  /**
  * Get value of field E01DLRFL2 as a String.
  */
  public String getE01DLRFL2()
  {
    return fieldE01DLRFL2.getString();
  }

  /**
  * Set field E01DLROPE using a String value.
  */
  public void setE01DLROPE(String newvalue)
  {
    fieldE01DLROPE.setString(newvalue);
  }

  /**
  * Get value of field E01DLROPE as a String.
  */
  public String getE01DLROPE()
  {
    return fieldE01DLROPE.getString();
  }

}
