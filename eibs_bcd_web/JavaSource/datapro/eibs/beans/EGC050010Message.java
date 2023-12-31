package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EGC050010 physical file definition.
* 
* File level identifier is 1130611113200.
* Record format level identifier is 3FDE64D6F2479.
*/

public class EGC050010Message extends MessageRecord
{
  final static String fldnames[] = {
                                     "H10USERID",
                                     "H10PROGRM",
                                     "H10TIMSYS",
                                     "H10SCRCOD",
                                     "H10OPECOD",
                                     "H10FLGMAS",
                                     "H10FLGWK1",
                                     "H10FLGWK2",
                                     "H10FLGWK3",
                                     "H10CODACC",
                                     "E10GCRUT",
                                     "E10GCNMBC",
                                     "E10GCNOPR",
                                     "E10GCGPRD",
                                     "E10GCGMND",
                                     "E10GCSTAT",
                                     "E10GCINTR",
                                     "E10GCCUPA",
                                     "E10GCSPRD",
                                     "E10GCCUPU",
                                     "E10GCVENY",
                                     "E10GCVENM",
                                     "E10GCVEND",
                                     "E10GCTPLN",
                                     "E10GCNCPA",
                                     "E10GCPRUT",
                                     "E10GCLCUP",
                                     "E10GCVCUO",
                                     "E10GCSCAP",
                                     "E10GCPRVY",
                                     "E10GCPRVM",
                                     "E10GCPRVD",
                                     "E10GCIPAC",
                                     "E10GCTTAS",
                                     "E10GCFPAG",
                                     "E10GCCUVY",
                                     "E10GCCUVM",
                                     "E10GCCUVD",
                                     "E10GCNRNO",
                                     "E10GCCOMM",
                                     "E10GCFNDO",
                                     "E10GCLNCA",
                                     "E10INDOPE"
                                   };
  final static String tnames[] = {
                                   "H10USERID",
                                   "H10PROGRM",
                                   "H10TIMSYS",
                                   "H10SCRCOD",
                                   "H10OPECOD",
                                   "H10FLGMAS",
                                   "H10FLGWK1",
                                   "H10FLGWK2",
                                   "H10FLGWK3",
                                   "H10CODACC",
                                   "E10GCRUT",
                                   "E10GCNMBC",
                                   "E10GCNOPR",
                                   "E10GCGPRD",
                                   "E10GCGMND",
                                   "E10GCSTAT",
                                   "E10GCINTR",
                                   "E10GCCUPA",
                                   "E10GCSPRD",
                                   "E10GCCUPU",
                                   "E10GCVENY",
                                   "E10GCVENM",
                                   "E10GCVEND",
                                   "E10GCTPLN",
                                   "E10GCNCPA",
                                   "E10GCPRUT",
                                   "E10GCLCUP",
                                   "E10GCVCUO",
                                   "E10GCSCAP",
                                   "E10GCPRVY",
                                   "E10GCPRVM",
                                   "E10GCPRVD",
                                   "E10GCIPAC",
                                   "E10GCTTAS",
                                   "E10GCFPAG",
                                   "E10GCCUVY",
                                   "E10GCCUVM",
                                   "E10GCCUVD",
                                   "E10GCNRNO",
                                   "E10GCCOMM",
                                   "E10GCFNDO",
                                   "E10GCLNCA",
                                   "E10INDOPE"
                                 };
  final static String fid = "1130611113200";
  final static String rid = "3FDE64D6F2479";
  final static String fmtname = "EGC050010";
  final int FIELDCOUNT = 43;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldH10USERID = null;
  private CharacterField fieldH10PROGRM = null;
  private CharacterField fieldH10TIMSYS = null;
  private CharacterField fieldH10SCRCOD = null;
  private CharacterField fieldH10OPECOD = null;
  private CharacterField fieldH10FLGMAS = null;
  private CharacterField fieldH10FLGWK1 = null;
  private CharacterField fieldH10FLGWK2 = null;
  private CharacterField fieldH10FLGWK3 = null;
  private CharacterField fieldH10CODACC = null;
  private CharacterField fieldE10GCRUT = null;
  private CharacterField fieldE10GCNMBC = null;
  private DecimalField fieldE10GCNOPR = null;
  private CharacterField fieldE10GCGPRD = null;
  private CharacterField fieldE10GCGMND = null;
  private CharacterField fieldE10GCSTAT = null;
  private DecimalField fieldE10GCINTR = null;
  private DecimalField fieldE10GCCUPA = null;
  private DecimalField fieldE10GCSPRD = null;
  private DecimalField fieldE10GCCUPU = null;
  private DecimalField fieldE10GCVENY = null;
  private DecimalField fieldE10GCVENM = null;
  private DecimalField fieldE10GCVEND = null;
  private CharacterField fieldE10GCTPLN = null;
  private DecimalField fieldE10GCNCPA = null;
  private DecimalField fieldE10GCPRUT = null;
  private DecimalField fieldE10GCLCUP = null;
  private DecimalField fieldE10GCVCUO = null;
  private DecimalField fieldE10GCSCAP = null;
  private DecimalField fieldE10GCPRVY = null;
  private DecimalField fieldE10GCPRVM = null;
  private DecimalField fieldE10GCPRVD = null;
  private CharacterField fieldE10GCIPAC = null;
  private CharacterField fieldE10GCTTAS = null;
  private CharacterField fieldE10GCFPAG = null;
  private DecimalField fieldE10GCCUVY = null;
  private DecimalField fieldE10GCCUVM = null;
  private DecimalField fieldE10GCCUVD = null;
  private DecimalField fieldE10GCNRNO = null;
  private DecimalField fieldE10GCCOMM = null;
  private CharacterField fieldE10GCFNDO = null;
  private DecimalField fieldE10GCLNCA = null;
  private CharacterField fieldE10INDOPE = null;

  /**
  * Constructor for EGC050010Message.
  */
  public EGC050010Message()
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
    recordsize = 287;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldH10USERID =
    new CharacterField(message, HEADERSIZE + 0, 10, "H10USERID");
    fields[1] = fieldH10PROGRM =
    new CharacterField(message, HEADERSIZE + 10, 10, "H10PROGRM");
    fields[2] = fieldH10TIMSYS =
    new CharacterField(message, HEADERSIZE + 20, 12, "H10TIMSYS");
    fields[3] = fieldH10SCRCOD =
    new CharacterField(message, HEADERSIZE + 32, 2, "H10SCRCOD");
    fields[4] = fieldH10OPECOD =
    new CharacterField(message, HEADERSIZE + 34, 4, "H10OPECOD");
    fields[5] = fieldH10FLGMAS =
    new CharacterField(message, HEADERSIZE + 38, 1, "H10FLGMAS");
    fields[6] = fieldH10FLGWK1 =
    new CharacterField(message, HEADERSIZE + 39, 1, "H10FLGWK1");
    fields[7] = fieldH10FLGWK2 =
    new CharacterField(message, HEADERSIZE + 40, 1, "H10FLGWK2");
    fields[8] = fieldH10FLGWK3 =
    new CharacterField(message, HEADERSIZE + 41, 1, "H10FLGWK3");
    fields[9] = fieldH10CODACC =
    new CharacterField(message, HEADERSIZE + 42, 4, "H10CODACC");
    fields[10] = fieldE10GCRUT =
    new CharacterField(message, HEADERSIZE + 46, 25, "E10GCRUT");
    fields[11] = fieldE10GCNMBC =
    new CharacterField(message, HEADERSIZE + 71, 45, "E10GCNMBC");
    fields[12] = fieldE10GCNOPR =
    new DecimalField(message, HEADERSIZE + 116, 13, 0, "E10GCNOPR");
    fields[13] = fieldE10GCGPRD =
    new CharacterField(message, HEADERSIZE + 129, 4, "E10GCGPRD");
    fields[14] = fieldE10GCGMND =
    new CharacterField(message, HEADERSIZE + 133, 3, "E10GCGMND");
    fields[15] = fieldE10GCSTAT =
    new CharacterField(message, HEADERSIZE + 136, 1, "E10GCSTAT");
    fields[16] = fieldE10GCINTR =
    new DecimalField(message, HEADERSIZE + 137, 13, 6, "E10GCINTR");
    fields[17] = fieldE10GCCUPA =
    new DecimalField(message, HEADERSIZE + 150, 6, 0, "E10GCCUPA");
    fields[18] = fieldE10GCSPRD =
    new DecimalField(message, HEADERSIZE + 156, 13, 6, "E10GCSPRD");
    fields[19] = fieldE10GCCUPU =
    new DecimalField(message, HEADERSIZE + 169, 6, 0, "E10GCCUPU");
    fields[20] = fieldE10GCVENY =
    new DecimalField(message, HEADERSIZE + 175, 5, 0, "E10GCVENY");
    fields[21] = fieldE10GCVENM =
    new DecimalField(message, HEADERSIZE + 180, 3, 0, "E10GCVENM");
    fields[22] = fieldE10GCVEND =
    new DecimalField(message, HEADERSIZE + 183, 3, 0, "E10GCVEND");
    fields[23] = fieldE10GCTPLN =
    new CharacterField(message, HEADERSIZE + 186, 4, "E10GCTPLN");
    fields[24] = fieldE10GCNCPA =
    new DecimalField(message, HEADERSIZE + 190, 6, 0, "E10GCNCPA");
    fields[25] = fieldE10GCPRUT =
    new DecimalField(message, HEADERSIZE + 196, 6, 0, "E10GCPRUT");
    fields[26] = fieldE10GCLCUP =
    new DecimalField(message, HEADERSIZE + 202, 6, 0, "E10GCLCUP");
    fields[27] = fieldE10GCVCUO =
    new DecimalField(message, HEADERSIZE + 208, 17, 2, "E10GCVCUO");
    fields[28] = fieldE10GCSCAP =
    new DecimalField(message, HEADERSIZE + 225, 17, 2, "E10GCSCAP");
    fields[29] = fieldE10GCPRVY =
    new DecimalField(message, HEADERSIZE + 242, 5, 0, "E10GCPRVY");
    fields[30] = fieldE10GCPRVM =
    new DecimalField(message, HEADERSIZE + 247, 3, 0, "E10GCPRVM");
    fields[31] = fieldE10GCPRVD =
    new DecimalField(message, HEADERSIZE + 250, 3, 0, "E10GCPRVD");
    fields[32] = fieldE10GCIPAC =
    new CharacterField(message, HEADERSIZE + 253, 1, "E10GCIPAC");
    fields[33] = fieldE10GCTTAS =
    new CharacterField(message, HEADERSIZE + 254, 1, "E10GCTTAS");
    fields[34] = fieldE10GCFPAG =
    new CharacterField(message, HEADERSIZE + 255, 1, "E10GCFPAG");
    fields[35] = fieldE10GCCUVY =
    new DecimalField(message, HEADERSIZE + 256, 5, 0, "E10GCCUVY");
    fields[36] = fieldE10GCCUVM =
    new DecimalField(message, HEADERSIZE + 261, 3, 0, "E10GCCUVM");
    fields[37] = fieldE10GCCUVD =
    new DecimalField(message, HEADERSIZE + 264, 3, 0, "E10GCCUVD");
    fields[38] = fieldE10GCNRNO =
    new DecimalField(message, HEADERSIZE + 267, 6, 0, "E10GCNRNO");
    fields[39] = fieldE10GCCOMM =
    new DecimalField(message, HEADERSIZE + 273, 6, 0, "E10GCCOMM");
    fields[40] = fieldE10GCFNDO =
    new CharacterField(message, HEADERSIZE + 279, 1, "E10GCFNDO");
    fields[41] = fieldE10GCLNCA =
    new DecimalField(message, HEADERSIZE + 280, 6, 0, "E10GCLNCA");
    fields[42] = fieldE10INDOPE =
    new CharacterField(message, HEADERSIZE + 286, 1, "E10INDOPE");

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
  * Set field H10USERID using a String value.
  */
  public void setH10USERID(String newvalue)
  {
    fieldH10USERID.setString(newvalue);
  }

  /**
  * Get value of field H10USERID as a String.
  */
  public String getH10USERID()
  {
    return fieldH10USERID.getString();
  }

  /**
  * Set field H10PROGRM using a String value.
  */
  public void setH10PROGRM(String newvalue)
  {
    fieldH10PROGRM.setString(newvalue);
  }

  /**
  * Get value of field H10PROGRM as a String.
  */
  public String getH10PROGRM()
  {
    return fieldH10PROGRM.getString();
  }

  /**
  * Set field H10TIMSYS using a String value.
  */
  public void setH10TIMSYS(String newvalue)
  {
    fieldH10TIMSYS.setString(newvalue);
  }

  /**
  * Get value of field H10TIMSYS as a String.
  */
  public String getH10TIMSYS()
  {
    return fieldH10TIMSYS.getString();
  }

  /**
  * Set field H10SCRCOD using a String value.
  */
  public void setH10SCRCOD(String newvalue)
  {
    fieldH10SCRCOD.setString(newvalue);
  }

  /**
  * Get value of field H10SCRCOD as a String.
  */
  public String getH10SCRCOD()
  {
    return fieldH10SCRCOD.getString();
  }

  /**
  * Set field H10OPECOD using a String value.
  */
  public void setH10OPECOD(String newvalue)
  {
    fieldH10OPECOD.setString(newvalue);
  }

  /**
  * Get value of field H10OPECOD as a String.
  */
  public String getH10OPECOD()
  {
    return fieldH10OPECOD.getString();
  }

  /**
  * Set field H10FLGMAS using a String value.
  */
  public void setH10FLGMAS(String newvalue)
  {
    fieldH10FLGMAS.setString(newvalue);
  }

  /**
  * Get value of field H10FLGMAS as a String.
  */
  public String getH10FLGMAS()
  {
    return fieldH10FLGMAS.getString();
  }

  /**
  * Set field H10FLGWK1 using a String value.
  */
  public void setH10FLGWK1(String newvalue)
  {
    fieldH10FLGWK1.setString(newvalue);
  }

  /**
  * Get value of field H10FLGWK1 as a String.
  */
  public String getH10FLGWK1()
  {
    return fieldH10FLGWK1.getString();
  }

  /**
  * Set field H10FLGWK2 using a String value.
  */
  public void setH10FLGWK2(String newvalue)
  {
    fieldH10FLGWK2.setString(newvalue);
  }

  /**
  * Get value of field H10FLGWK2 as a String.
  */
  public String getH10FLGWK2()
  {
    return fieldH10FLGWK2.getString();
  }

  /**
  * Set field H10FLGWK3 using a String value.
  */
  public void setH10FLGWK3(String newvalue)
  {
    fieldH10FLGWK3.setString(newvalue);
  }

  /**
  * Get value of field H10FLGWK3 as a String.
  */
  public String getH10FLGWK3()
  {
    return fieldH10FLGWK3.getString();
  }

  /**
  * Set field H10CODACC using a String value.
  */
  public void setH10CODACC(String newvalue)
  {
    fieldH10CODACC.setString(newvalue);
  }

  /**
  * Get value of field H10CODACC as a String.
  */
  public String getH10CODACC()
  {
    return fieldH10CODACC.getString();
  }

  /**
  * Set field E10GCRUT using a String value.
  */
  public void setE10GCRUT(String newvalue)
  {
    fieldE10GCRUT.setString(newvalue);
  }

  /**
  * Get value of field E10GCRUT as a String.
  */
  public String getE10GCRUT()
  {
    return fieldE10GCRUT.getString();
  }

  /**
  * Set field E10GCNMBC using a String value.
  */
  public void setE10GCNMBC(String newvalue)
  {
    fieldE10GCNMBC.setString(newvalue);
  }

  /**
  * Get value of field E10GCNMBC as a String.
  */
  public String getE10GCNMBC()
  {
    return fieldE10GCNMBC.getString();
  }

  /**
  * Set field E10GCNOPR using a String value.
  */
  public void setE10GCNOPR(String newvalue)
  {
    fieldE10GCNOPR.setString(newvalue);
  }

  /**
  * Get value of field E10GCNOPR as a String.
  */
  public String getE10GCNOPR()
  {
    return fieldE10GCNOPR.getString();
  }

  /**
  * Set numeric field E10GCNOPR using a BigDecimal value.
  */
  public void setE10GCNOPR(BigDecimal newvalue)
  {
    fieldE10GCNOPR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E10GCNOPR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE10GCNOPR()
  {
    return fieldE10GCNOPR.getBigDecimal();
  }

  /**
  * Set field E10GCGPRD using a String value.
  */
  public void setE10GCGPRD(String newvalue)
  {
    fieldE10GCGPRD.setString(newvalue);
  }

  /**
  * Get value of field E10GCGPRD as a String.
  */
  public String getE10GCGPRD()
  {
    return fieldE10GCGPRD.getString();
  }

  /**
  * Set field E10GCGMND using a String value.
  */
  public void setE10GCGMND(String newvalue)
  {
    fieldE10GCGMND.setString(newvalue);
  }

  /**
  * Get value of field E10GCGMND as a String.
  */
  public String getE10GCGMND()
  {
    return fieldE10GCGMND.getString();
  }

  /**
  * Set field E10GCSTAT using a String value.
  */
  public void setE10GCSTAT(String newvalue)
  {
    fieldE10GCSTAT.setString(newvalue);
  }

  /**
  * Get value of field E10GCSTAT as a String.
  */
  public String getE10GCSTAT()
  {
    return fieldE10GCSTAT.getString();
  }

  /**
  * Set field E10GCINTR using a String value.
  */
  public void setE10GCINTR(String newvalue)
  {
    fieldE10GCINTR.setString(newvalue);
  }

  /**
  * Get value of field E10GCINTR as a String.
  */
  public String getE10GCINTR()
  {
    return fieldE10GCINTR.getString();
  }

  /**
  * Set numeric field E10GCINTR using a BigDecimal value.
  */
  public void setE10GCINTR(BigDecimal newvalue)
  {
    fieldE10GCINTR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E10GCINTR as a BigDecimal.
  */
  public BigDecimal getBigDecimalE10GCINTR()
  {
    return fieldE10GCINTR.getBigDecimal();
  }

  /**
  * Set field E10GCCUPA using a String value.
  */
  public void setE10GCCUPA(String newvalue)
  {
    fieldE10GCCUPA.setString(newvalue);
  }

  /**
  * Get value of field E10GCCUPA as a String.
  */
  public String getE10GCCUPA()
  {
    return fieldE10GCCUPA.getString();
  }

  /**
  * Set numeric field E10GCCUPA using a BigDecimal value.
  */
  public void setE10GCCUPA(BigDecimal newvalue)
  {
    fieldE10GCCUPA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E10GCCUPA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE10GCCUPA()
  {
    return fieldE10GCCUPA.getBigDecimal();
  }

  /**
  * Set field E10GCSPRD using a String value.
  */
  public void setE10GCSPRD(String newvalue)
  {
    fieldE10GCSPRD.setString(newvalue);
  }

  /**
  * Get value of field E10GCSPRD as a String.
  */
  public String getE10GCSPRD()
  {
    return fieldE10GCSPRD.getString();
  }

  /**
  * Set numeric field E10GCSPRD using a BigDecimal value.
  */
  public void setE10GCSPRD(BigDecimal newvalue)
  {
    fieldE10GCSPRD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E10GCSPRD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE10GCSPRD()
  {
    return fieldE10GCSPRD.getBigDecimal();
  }

  /**
  * Set field E10GCCUPU using a String value.
  */
  public void setE10GCCUPU(String newvalue)
  {
    fieldE10GCCUPU.setString(newvalue);
  }

  /**
  * Get value of field E10GCCUPU as a String.
  */
  public String getE10GCCUPU()
  {
    return fieldE10GCCUPU.getString();
  }

  /**
  * Set numeric field E10GCCUPU using a BigDecimal value.
  */
  public void setE10GCCUPU(BigDecimal newvalue)
  {
    fieldE10GCCUPU.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E10GCCUPU as a BigDecimal.
  */
  public BigDecimal getBigDecimalE10GCCUPU()
  {
    return fieldE10GCCUPU.getBigDecimal();
  }

  /**
  * Set field E10GCVENY using a String value.
  */
  public void setE10GCVENY(String newvalue)
  {
    fieldE10GCVENY.setString(newvalue);
  }

  /**
  * Get value of field E10GCVENY as a String.
  */
  public String getE10GCVENY()
  {
    return fieldE10GCVENY.getString();
  }

  /**
  * Set numeric field E10GCVENY using a BigDecimal value.
  */
  public void setE10GCVENY(BigDecimal newvalue)
  {
    fieldE10GCVENY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E10GCVENY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE10GCVENY()
  {
    return fieldE10GCVENY.getBigDecimal();
  }

  /**
  * Set field E10GCVENM using a String value.
  */
  public void setE10GCVENM(String newvalue)
  {
    fieldE10GCVENM.setString(newvalue);
  }

  /**
  * Get value of field E10GCVENM as a String.
  */
  public String getE10GCVENM()
  {
    return fieldE10GCVENM.getString();
  }

  /**
  * Set numeric field E10GCVENM using a BigDecimal value.
  */
  public void setE10GCVENM(BigDecimal newvalue)
  {
    fieldE10GCVENM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E10GCVENM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE10GCVENM()
  {
    return fieldE10GCVENM.getBigDecimal();
  }

  /**
  * Set field E10GCVEND using a String value.
  */
  public void setE10GCVEND(String newvalue)
  {
    fieldE10GCVEND.setString(newvalue);
  }

  /**
  * Get value of field E10GCVEND as a String.
  */
  public String getE10GCVEND()
  {
    return fieldE10GCVEND.getString();
  }

  /**
  * Set numeric field E10GCVEND using a BigDecimal value.
  */
  public void setE10GCVEND(BigDecimal newvalue)
  {
    fieldE10GCVEND.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E10GCVEND as a BigDecimal.
  */
  public BigDecimal getBigDecimalE10GCVEND()
  {
    return fieldE10GCVEND.getBigDecimal();
  }

  /**
  * Set field E10GCTPLN using a String value.
  */
  public void setE10GCTPLN(String newvalue)
  {
    fieldE10GCTPLN.setString(newvalue);
  }

  /**
  * Get value of field E10GCTPLN as a String.
  */
  public String getE10GCTPLN()
  {
    return fieldE10GCTPLN.getString();
  }

  /**
  * Set field E10GCNCPA using a String value.
  */
  public void setE10GCNCPA(String newvalue)
  {
    fieldE10GCNCPA.setString(newvalue);
  }

  /**
  * Get value of field E10GCNCPA as a String.
  */
  public String getE10GCNCPA()
  {
    return fieldE10GCNCPA.getString();
  }

  /**
  * Set numeric field E10GCNCPA using a BigDecimal value.
  */
  public void setE10GCNCPA(BigDecimal newvalue)
  {
    fieldE10GCNCPA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E10GCNCPA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE10GCNCPA()
  {
    return fieldE10GCNCPA.getBigDecimal();
  }

  /**
  * Set field E10GCPRUT using a String value.
  */
  public void setE10GCPRUT(String newvalue)
  {
    fieldE10GCPRUT.setString(newvalue);
  }

  /**
  * Get value of field E10GCPRUT as a String.
  */
  public String getE10GCPRUT()
  {
    return fieldE10GCPRUT.getString();
  }

  /**
  * Set numeric field E10GCPRUT using a BigDecimal value.
  */
  public void setE10GCPRUT(BigDecimal newvalue)
  {
    fieldE10GCPRUT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E10GCPRUT as a BigDecimal.
  */
  public BigDecimal getBigDecimalE10GCPRUT()
  {
    return fieldE10GCPRUT.getBigDecimal();
  }

  /**
  * Set field E10GCLCUP using a String value.
  */
  public void setE10GCLCUP(String newvalue)
  {
    fieldE10GCLCUP.setString(newvalue);
  }

  /**
  * Get value of field E10GCLCUP as a String.
  */
  public String getE10GCLCUP()
  {
    return fieldE10GCLCUP.getString();
  }

  /**
  * Set numeric field E10GCLCUP using a BigDecimal value.
  */
  public void setE10GCLCUP(BigDecimal newvalue)
  {
    fieldE10GCLCUP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E10GCLCUP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE10GCLCUP()
  {
    return fieldE10GCLCUP.getBigDecimal();
  }

  /**
  * Set field E10GCVCUO using a String value.
  */
  public void setE10GCVCUO(String newvalue)
  {
    fieldE10GCVCUO.setString(newvalue);
  }

  /**
  * Get value of field E10GCVCUO as a String.
  */
  public String getE10GCVCUO()
  {
    return fieldE10GCVCUO.getString();
  }

  /**
  * Set numeric field E10GCVCUO using a BigDecimal value.
  */
  public void setE10GCVCUO(BigDecimal newvalue)
  {
    fieldE10GCVCUO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E10GCVCUO as a BigDecimal.
  */
  public BigDecimal getBigDecimalE10GCVCUO()
  {
    return fieldE10GCVCUO.getBigDecimal();
  }

  /**
  * Set field E10GCSCAP using a String value.
  */
  public void setE10GCSCAP(String newvalue)
  {
    fieldE10GCSCAP.setString(newvalue);
  }

  /**
  * Get value of field E10GCSCAP as a String.
  */
  public String getE10GCSCAP()
  {
    return fieldE10GCSCAP.getString();
  }

  /**
  * Set numeric field E10GCSCAP using a BigDecimal value.
  */
  public void setE10GCSCAP(BigDecimal newvalue)
  {
    fieldE10GCSCAP.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E10GCSCAP as a BigDecimal.
  */
  public BigDecimal getBigDecimalE10GCSCAP()
  {
    return fieldE10GCSCAP.getBigDecimal();
  }

  /**
  * Set field E10GCPRVY using a String value.
  */
  public void setE10GCPRVY(String newvalue)
  {
    fieldE10GCPRVY.setString(newvalue);
  }

  /**
  * Get value of field E10GCPRVY as a String.
  */
  public String getE10GCPRVY()
  {
    return fieldE10GCPRVY.getString();
  }

  /**
  * Set numeric field E10GCPRVY using a BigDecimal value.
  */
  public void setE10GCPRVY(BigDecimal newvalue)
  {
    fieldE10GCPRVY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E10GCPRVY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE10GCPRVY()
  {
    return fieldE10GCPRVY.getBigDecimal();
  }

  /**
  * Set field E10GCPRVM using a String value.
  */
  public void setE10GCPRVM(String newvalue)
  {
    fieldE10GCPRVM.setString(newvalue);
  }

  /**
  * Get value of field E10GCPRVM as a String.
  */
  public String getE10GCPRVM()
  {
    return fieldE10GCPRVM.getString();
  }

  /**
  * Set numeric field E10GCPRVM using a BigDecimal value.
  */
  public void setE10GCPRVM(BigDecimal newvalue)
  {
    fieldE10GCPRVM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E10GCPRVM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE10GCPRVM()
  {
    return fieldE10GCPRVM.getBigDecimal();
  }

  /**
  * Set field E10GCPRVD using a String value.
  */
  public void setE10GCPRVD(String newvalue)
  {
    fieldE10GCPRVD.setString(newvalue);
  }

  /**
  * Get value of field E10GCPRVD as a String.
  */
  public String getE10GCPRVD()
  {
    return fieldE10GCPRVD.getString();
  }

  /**
  * Set numeric field E10GCPRVD using a BigDecimal value.
  */
  public void setE10GCPRVD(BigDecimal newvalue)
  {
    fieldE10GCPRVD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E10GCPRVD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE10GCPRVD()
  {
    return fieldE10GCPRVD.getBigDecimal();
  }

  /**
  * Set field E10GCIPAC using a String value.
  */
  public void setE10GCIPAC(String newvalue)
  {
    fieldE10GCIPAC.setString(newvalue);
  }

  /**
  * Get value of field E10GCIPAC as a String.
  */
  public String getE10GCIPAC()
  {
    return fieldE10GCIPAC.getString();
  }

  /**
  * Set field E10GCTTAS using a String value.
  */
  public void setE10GCTTAS(String newvalue)
  {
    fieldE10GCTTAS.setString(newvalue);
  }

  /**
  * Get value of field E10GCTTAS as a String.
  */
  public String getE10GCTTAS()
  {
    return fieldE10GCTTAS.getString();
  }

  /**
  * Set field E10GCFPAG using a String value.
  */
  public void setE10GCFPAG(String newvalue)
  {
    fieldE10GCFPAG.setString(newvalue);
  }

  /**
  * Get value of field E10GCFPAG as a String.
  */
  public String getE10GCFPAG()
  {
    return fieldE10GCFPAG.getString();
  }

  /**
  * Set field E10GCCUVY using a String value.
  */
  public void setE10GCCUVY(String newvalue)
  {
    fieldE10GCCUVY.setString(newvalue);
  }

  /**
  * Get value of field E10GCCUVY as a String.
  */
  public String getE10GCCUVY()
  {
    return fieldE10GCCUVY.getString();
  }

  /**
  * Set numeric field E10GCCUVY using a BigDecimal value.
  */
  public void setE10GCCUVY(BigDecimal newvalue)
  {
    fieldE10GCCUVY.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E10GCCUVY as a BigDecimal.
  */
  public BigDecimal getBigDecimalE10GCCUVY()
  {
    return fieldE10GCCUVY.getBigDecimal();
  }

  /**
  * Set field E10GCCUVM using a String value.
  */
  public void setE10GCCUVM(String newvalue)
  {
    fieldE10GCCUVM.setString(newvalue);
  }

  /**
  * Get value of field E10GCCUVM as a String.
  */
  public String getE10GCCUVM()
  {
    return fieldE10GCCUVM.getString();
  }

  /**
  * Set numeric field E10GCCUVM using a BigDecimal value.
  */
  public void setE10GCCUVM(BigDecimal newvalue)
  {
    fieldE10GCCUVM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E10GCCUVM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE10GCCUVM()
  {
    return fieldE10GCCUVM.getBigDecimal();
  }

  /**
  * Set field E10GCCUVD using a String value.
  */
  public void setE10GCCUVD(String newvalue)
  {
    fieldE10GCCUVD.setString(newvalue);
  }

  /**
  * Get value of field E10GCCUVD as a String.
  */
  public String getE10GCCUVD()
  {
    return fieldE10GCCUVD.getString();
  }

  /**
  * Set numeric field E10GCCUVD using a BigDecimal value.
  */
  public void setE10GCCUVD(BigDecimal newvalue)
  {
    fieldE10GCCUVD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E10GCCUVD as a BigDecimal.
  */
  public BigDecimal getBigDecimalE10GCCUVD()
  {
    return fieldE10GCCUVD.getBigDecimal();
  }

  /**
  * Set field E10GCNRNO using a String value.
  */
  public void setE10GCNRNO(String newvalue)
  {
    fieldE10GCNRNO.setString(newvalue);
  }

  /**
  * Get value of field E10GCNRNO as a String.
  */
  public String getE10GCNRNO()
  {
    return fieldE10GCNRNO.getString();
  }

  /**
  * Set numeric field E10GCNRNO using a BigDecimal value.
  */
  public void setE10GCNRNO(BigDecimal newvalue)
  {
    fieldE10GCNRNO.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E10GCNRNO as a BigDecimal.
  */
  public BigDecimal getBigDecimalE10GCNRNO()
  {
    return fieldE10GCNRNO.getBigDecimal();
  }

  /**
  * Set field E10GCCOMM using a String value.
  */
  public void setE10GCCOMM(String newvalue)
  {
    fieldE10GCCOMM.setString(newvalue);
  }

  /**
  * Get value of field E10GCCOMM as a String.
  */
  public String getE10GCCOMM()
  {
    return fieldE10GCCOMM.getString();
  }

  /**
  * Set numeric field E10GCCOMM using a BigDecimal value.
  */
  public void setE10GCCOMM(BigDecimal newvalue)
  {
    fieldE10GCCOMM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E10GCCOMM as a BigDecimal.
  */
  public BigDecimal getBigDecimalE10GCCOMM()
  {
    return fieldE10GCCOMM.getBigDecimal();
  }

  /**
  * Set field E10GCFNDO using a String value.
  */
  public void setE10GCFNDO(String newvalue)
  {
    fieldE10GCFNDO.setString(newvalue);
  }

  /**
  * Get value of field E10GCFNDO as a String.
  */
  public String getE10GCFNDO()
  {
    return fieldE10GCFNDO.getString();
  }

  /**
  * Set field E10GCLNCA using a String value.
  */
  public void setE10GCLNCA(String newvalue)
  {
    fieldE10GCLNCA.setString(newvalue);
  }

  /**
  * Get value of field E10GCLNCA as a String.
  */
  public String getE10GCLNCA()
  {
    return fieldE10GCLNCA.getString();
  }

  /**
  * Set numeric field E10GCLNCA using a BigDecimal value.
  */
  public void setE10GCLNCA(BigDecimal newvalue)
  {
    fieldE10GCLNCA.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field E10GCLNCA as a BigDecimal.
  */
  public BigDecimal getBigDecimalE10GCLNCA()
  {
    return fieldE10GCLNCA.getBigDecimal();
  }

  /**
  * Set field E10INDOPE using a String value.
  */
  public void setE10INDOPE(String newvalue)
  {
    fieldE10INDOPE.setString(newvalue);
  }

  /**
  * Get value of field E10INDOPE as a String.
  */
  public String getE10INDOPE()
  {
    return fieldE10INDOPE.getString();
  }

}
