package datapro.eibs.beans;

import datapro.eibs.sockets.*;
import java.io.*;
import java.math.*;

import java.util.*;

/**
* Class generated by AS/400 CRTCLASS command from EIBSDD physical file definition.
* 
* File level identifier is 1030121191932.
* Record format level identifier is 4B1831476C672.
*/

public class EIBSDDMessage extends MessageRecord
{
  final static String fldnames[] = {
                                     "IBSBNK",
                                     "IBSBRN",
                                     "IBSCCY",
                                     "IBSGLN",
                                     "IBSACC",
                                     "IBSNA1",
                                     "IBSNME",
                                     "IBSDSC",
                                     "IBSNAR",
                                     "IBSSHN",
                                     "IBSIDE",
                                     "IBSPRD",
                                     "IBSCNF",
                                     "IBSCN6",
                                     "IBSACD",
                                     "IBSLFX",
                                     "IBSDLC",
                                     "IBSCTR",
                                     "IBSCTY",
                                     "IBSZPC",
                                     "IBSPOB",
                                     "IBSTLR",
                                     "IBSTBL",
                                     "IBSBUN",
                                     "IBSTIM",
                                     "IBSLNE",
                                     "IBSCFX",
                                     "IBSTCD",
                                     "IBSCLS",
                                     "IBSCCN",
                                     "IBSBTH",
                                     "IBSTRM",
                                     "IBSSEQ",
                                     "IBSPYT",
                                     "IBSDRR",
                                     "IBSRTE",
                                     "IBSCUN",
                                     "IBSVDR",
                                     "IBSCKN",
                                     "IBSEXR",
                                     "IBSAMT",
                                     "IBSAM1",
                                     "IBSAVG",
                                     "IBSINT"
                                   };
  final static String tnames[] = {
                                   "IBSBNK",
                                   "IBSBRN",
                                   "IBSCCY",
                                   "IBSGLN",
                                   "IBSACC",
                                   "IBSNA1",
                                   "IBSNME",
                                   "IBSDSC",
                                   "IBSNAR",
                                   "IBSSHN",
                                   "IBSIDE",
                                   "IBSPRD",
                                   "IBSCNF",
                                   "IBSCN6",
                                   "IBSACD",
                                   "IBSLFX",
                                   "IBSDLC",
                                   "IBSCTR",
                                   "IBSCTY",
                                   "IBSZPC",
                                   "IBSPOB",
                                   "IBSTLR",
                                   "IBSTBL",
                                   "IBSBUN",
                                   "IBSTIM",
                                   "IBSLNE",
                                   "IBSCFX",
                                   "IBSTCD",
                                   "IBSCLS",
                                   "IBSCCN",
                                   "IBSBTH",
                                   "IBSTRM",
                                   "IBSSEQ",
                                   "IBSPYT",
                                   "IBSDRR",
                                   "IBSRTE",
                                   "IBSCUN",
                                   "IBSVDR",
                                   "IBSCKN",
                                   "IBSEXR",
                                   "IBSAMT",
                                   "IBSAM1",
                                   "IBSAVG",
                                   "IBSINT"
                                 };
  final static String fid = "1030121191932";
  final static String rid = "4B1831476C672";
  final static String fmtname = "EIBSDD";
  final int FIELDCOUNT = 44;
  private static Hashtable tlookup = new Hashtable();
  private CharacterField fieldIBSBNK = null;
  private DecimalField fieldIBSBRN = null;
  private CharacterField fieldIBSCCY = null;
  private DecimalField fieldIBSGLN = null;
  private DecimalField fieldIBSACC = null;
  private CharacterField fieldIBSNA1 = null;
  private CharacterField fieldIBSNME = null;
  private CharacterField fieldIBSDSC = null;
  private CharacterField fieldIBSNAR = null;
  private CharacterField fieldIBSSHN = null;
  private CharacterField fieldIBSIDE = null;
  private CharacterField fieldIBSPRD = null;
  private CharacterField fieldIBSCNF = null;
  private CharacterField fieldIBSCN6 = null;
  private CharacterField fieldIBSACD = null;
  private CharacterField fieldIBSLFX = null;
  private CharacterField fieldIBSDLC = null;
  private CharacterField fieldIBSCTR = null;
  private CharacterField fieldIBSCTY = null;
  private CharacterField fieldIBSZPC = null;
  private CharacterField fieldIBSPOB = null;
  private CharacterField fieldIBSTLR = null;
  private CharacterField fieldIBSTBL = null;
  private DecimalField fieldIBSBUN = null;
  private DecimalField fieldIBSTIM = null;
  private DecimalField fieldIBSLNE = null;
  private DecimalField fieldIBSCFX = null;
  private DecimalField fieldIBSTCD = null;
  private DecimalField fieldIBSCLS = null;
  private DecimalField fieldIBSCCN = null;
  private DecimalField fieldIBSBTH = null;
  private DecimalField fieldIBSTRM = null;
  private DecimalField fieldIBSSEQ = null;
  private DecimalField fieldIBSPYT = null;
  private DecimalField fieldIBSDRR = null;
  private DecimalField fieldIBSRTE = null;
  private DecimalField fieldIBSCUN = null;
  private DecimalField fieldIBSVDR = null;
  private DecimalField fieldIBSCKN = null;
  private DecimalField fieldIBSEXR = null;
  private DecimalField fieldIBSAMT = null;
  private DecimalField fieldIBSAM1 = null;
  private DecimalField fieldIBSAVG = null;
  private DecimalField fieldIBSINT = null;

  /**
  * Constructor for EIBSDDMessage.
  */
  public EIBSDDMessage()
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
    recordsize = 524;
    fileid = fid;
    recordid = rid;
    message = new byte[getByteLength()];
    formatname = fmtname;
    fieldnames = fldnames;
    tagnames = tnames;
    fields = new MessageField[FIELDCOUNT];

    fields[0] = fieldIBSBNK =
    new CharacterField(message, HEADERSIZE + 0, 2, "IBSBNK");
    fields[1] = fieldIBSBRN =
    new DecimalField(message, HEADERSIZE + 2, 4, 0, "IBSBRN");
    fields[2] = fieldIBSCCY =
    new CharacterField(message, HEADERSIZE + 6, 3, "IBSCCY");
    fields[3] = fieldIBSGLN =
    new DecimalField(message, HEADERSIZE + 9, 17, 0, "IBSGLN");
    fields[4] = fieldIBSACC =
    new DecimalField(message, HEADERSIZE + 26, 13, 0, "IBSACC");
    fields[5] = fieldIBSNA1 =
    new CharacterField(message, HEADERSIZE + 39, 45, "IBSNA1");
    fields[6] = fieldIBSNME =
    new CharacterField(message, HEADERSIZE + 84, 35, "IBSNME");
    fields[7] = fieldIBSDSC =
    new CharacterField(message, HEADERSIZE + 119, 35, "IBSDSC");
    fields[8] = fieldIBSNAR =
    new CharacterField(message, HEADERSIZE + 154, 30, "IBSNAR");
    fields[9] = fieldIBSSHN =
    new CharacterField(message, HEADERSIZE + 184, 15, "IBSSHN");
    fields[10] = fieldIBSIDE =
    new CharacterField(message, HEADERSIZE + 199, 15, "IBSIDE");
    fields[11] = fieldIBSPRD =
    new CharacterField(message, HEADERSIZE + 214, 4, "IBSPRD");
    fields[12] = fieldIBSCNF =
    new CharacterField(message, HEADERSIZE + 218, 4, "IBSCNF");
    fields[13] = fieldIBSCN6 =
    new CharacterField(message, HEADERSIZE + 222, 6, "IBSCN6");
    fields[14] = fieldIBSACD =
    new CharacterField(message, HEADERSIZE + 228, 2, "IBSACD");
    fields[15] = fieldIBSLFX =
    new CharacterField(message, HEADERSIZE + 230, 3, "IBSLFX");
    fields[16] = fieldIBSDLC =
    new CharacterField(message, HEADERSIZE + 233, 8, "IBSDLC");
    fields[17] = fieldIBSCTR =
    new CharacterField(message, HEADERSIZE + 241, 20, "IBSCTR");
    fields[18] = fieldIBSCTY =
    new CharacterField(message, HEADERSIZE + 261, 30, "IBSCTY");
    fields[19] = fieldIBSZPC =
    new CharacterField(message, HEADERSIZE + 291, 15, "IBSZPC");
    fields[20] = fieldIBSPOB =
    new CharacterField(message, HEADERSIZE + 306, 10, "IBSPOB");
    fields[21] = fieldIBSTLR =
    new CharacterField(message, HEADERSIZE + 316, 7, "IBSTLR");
    fields[22] = fieldIBSTBL =
    new CharacterField(message, HEADERSIZE + 323, 2, "IBSTBL");
    fields[23] = fieldIBSBUN =
    new DecimalField(message, HEADERSIZE + 325, 13, 0, "IBSBUN");
    fields[24] = fieldIBSTIM =
    new DecimalField(message, HEADERSIZE + 338, 7, 0, "IBSTIM");
    fields[25] = fieldIBSLNE =
    new DecimalField(message, HEADERSIZE + 345, 5, 0, "IBSLNE");
    fields[26] = fieldIBSCFX =
    new DecimalField(message, HEADERSIZE + 350, 5, 0, "IBSCFX");
    fields[27] = fieldIBSTCD =
    new DecimalField(message, HEADERSIZE + 355, 5, 0, "IBSTCD");
    fields[28] = fieldIBSCLS =
    new DecimalField(message, HEADERSIZE + 360, 3, 0, "IBSCLS");
    fields[29] = fieldIBSCCN =
    new DecimalField(message, HEADERSIZE + 363, 9, 0, "IBSCCN");
    fields[30] = fieldIBSBTH =
    new DecimalField(message, HEADERSIZE + 372, 5, 0, "IBSBTH");
    fields[31] = fieldIBSTRM =
    new DecimalField(message, HEADERSIZE + 377, 5, 0, "IBSTRM");
    fields[32] = fieldIBSSEQ =
    new DecimalField(message, HEADERSIZE + 382, 6, 0, "IBSSEQ");
    fields[33] = fieldIBSPYT =
    new DecimalField(message, HEADERSIZE + 388, 6, 0, "IBSPYT");
    fields[34] = fieldIBSDRR =
    new DecimalField(message, HEADERSIZE + 394, 8, 0, "IBSDRR");
    fields[35] = fieldIBSRTE =
    new DecimalField(message, HEADERSIZE + 402, 11, 6, "IBSRTE");
    fields[36] = fieldIBSCUN =
    new DecimalField(message, HEADERSIZE + 413, 10, 0, "IBSCUN");
    fields[37] = fieldIBSVDR =
    new DecimalField(message, HEADERSIZE + 423, 10, 0, "IBSVDR");
    fields[38] = fieldIBSCKN =
    new DecimalField(message, HEADERSIZE + 433, 10, 0, "IBSCKN");
    fields[39] = fieldIBSEXR =
    new DecimalField(message, HEADERSIZE + 443, 13, 6, "IBSEXR");
    fields[40] = fieldIBSAMT =
    new DecimalField(message, HEADERSIZE + 456, 17, 2, "IBSAMT");
    fields[41] = fieldIBSAM1 =
    new DecimalField(message, HEADERSIZE + 473, 15, 2, "IBSAM1");
    fields[42] = fieldIBSAVG =
    new DecimalField(message, HEADERSIZE + 488, 19, 2, "IBSAVG");
    fields[43] = fieldIBSINT =
    new DecimalField(message, HEADERSIZE + 507, 17, 4, "IBSINT");

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
  * Set field IBSBNK using a String value.
  */
  public void setIBSBNK(String newvalue)
  {
    fieldIBSBNK.setString(newvalue);
  }

  /**
  * Get value of field IBSBNK as a String.
  */
  public String getIBSBNK()
  {
    return fieldIBSBNK.getString();
  }

  /**
  * Set field IBSBRN using a String value.
  */
  public void setIBSBRN(String newvalue)
  {
    fieldIBSBRN.setString(newvalue);
  }

  /**
  * Get value of field IBSBRN as a String.
  */
  public String getIBSBRN()
  {
    return fieldIBSBRN.getString();
  }

  /**
  * Set numeric field IBSBRN using a BigDecimal value.
  */
  public void setIBSBRN(BigDecimal newvalue)
  {
    fieldIBSBRN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IBSBRN as a BigDecimal.
  */
  public BigDecimal getBigDecimalIBSBRN()
  {
    return fieldIBSBRN.getBigDecimal();
  }

  /**
  * Set field IBSCCY using a String value.
  */
  public void setIBSCCY(String newvalue)
  {
    fieldIBSCCY.setString(newvalue);
  }

  /**
  * Get value of field IBSCCY as a String.
  */
  public String getIBSCCY()
  {
    return fieldIBSCCY.getString();
  }

  /**
  * Set field IBSGLN using a String value.
  */
  public void setIBSGLN(String newvalue)
  {
    fieldIBSGLN.setString(newvalue);
  }

  /**
  * Get value of field IBSGLN as a String.
  */
  public String getIBSGLN()
  {
    return fieldIBSGLN.getString();
  }

  /**
  * Set numeric field IBSGLN using a BigDecimal value.
  */
  public void setIBSGLN(BigDecimal newvalue)
  {
    fieldIBSGLN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IBSGLN as a BigDecimal.
  */
  public BigDecimal getBigDecimalIBSGLN()
  {
    return fieldIBSGLN.getBigDecimal();
  }

  /**
  * Set field IBSACC using a String value.
  */
  public void setIBSACC(String newvalue)
  {
    fieldIBSACC.setString(newvalue);
  }

  /**
  * Get value of field IBSACC as a String.
  */
  public String getIBSACC()
  {
    return fieldIBSACC.getString();
  }

  /**
  * Set numeric field IBSACC using a BigDecimal value.
  */
  public void setIBSACC(BigDecimal newvalue)
  {
    fieldIBSACC.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IBSACC as a BigDecimal.
  */
  public BigDecimal getBigDecimalIBSACC()
  {
    return fieldIBSACC.getBigDecimal();
  }

  /**
  * Set field IBSNA1 using a String value.
  */
  public void setIBSNA1(String newvalue)
  {
    fieldIBSNA1.setString(newvalue);
  }

  /**
  * Get value of field IBSNA1 as a String.
  */
  public String getIBSNA1()
  {
    return fieldIBSNA1.getString();
  }

  /**
  * Set field IBSNME using a String value.
  */
  public void setIBSNME(String newvalue)
  {
    fieldIBSNME.setString(newvalue);
  }

  /**
  * Get value of field IBSNME as a String.
  */
  public String getIBSNME()
  {
    return fieldIBSNME.getString();
  }

  /**
  * Set field IBSDSC using a String value.
  */
  public void setIBSDSC(String newvalue)
  {
    fieldIBSDSC.setString(newvalue);
  }

  /**
  * Get value of field IBSDSC as a String.
  */
  public String getIBSDSC()
  {
    return fieldIBSDSC.getString();
  }

  /**
  * Set field IBSNAR using a String value.
  */
  public void setIBSNAR(String newvalue)
  {
    fieldIBSNAR.setString(newvalue);
  }

  /**
  * Get value of field IBSNAR as a String.
  */
  public String getIBSNAR()
  {
    return fieldIBSNAR.getString();
  }

  /**
  * Set field IBSSHN using a String value.
  */
  public void setIBSSHN(String newvalue)
  {
    fieldIBSSHN.setString(newvalue);
  }

  /**
  * Get value of field IBSSHN as a String.
  */
  public String getIBSSHN()
  {
    return fieldIBSSHN.getString();
  }

  /**
  * Set field IBSIDE using a String value.
  */
  public void setIBSIDE(String newvalue)
  {
    fieldIBSIDE.setString(newvalue);
  }

  /**
  * Get value of field IBSIDE as a String.
  */
  public String getIBSIDE()
  {
    return fieldIBSIDE.getString();
  }

  /**
  * Set field IBSPRD using a String value.
  */
  public void setIBSPRD(String newvalue)
  {
    fieldIBSPRD.setString(newvalue);
  }

  /**
  * Get value of field IBSPRD as a String.
  */
  public String getIBSPRD()
  {
    return fieldIBSPRD.getString();
  }

  /**
  * Set field IBSCNF using a String value.
  */
  public void setIBSCNF(String newvalue)
  {
    fieldIBSCNF.setString(newvalue);
  }

  /**
  * Get value of field IBSCNF as a String.
  */
  public String getIBSCNF()
  {
    return fieldIBSCNF.getString();
  }

  /**
  * Set field IBSCN6 using a String value.
  */
  public void setIBSCN6(String newvalue)
  {
    fieldIBSCN6.setString(newvalue);
  }

  /**
  * Get value of field IBSCN6 as a String.
  */
  public String getIBSCN6()
  {
    return fieldIBSCN6.getString();
  }

  /**
  * Set field IBSACD using a String value.
  */
  public void setIBSACD(String newvalue)
  {
    fieldIBSACD.setString(newvalue);
  }

  /**
  * Get value of field IBSACD as a String.
  */
  public String getIBSACD()
  {
    return fieldIBSACD.getString();
  }

  /**
  * Set field IBSLFX using a String value.
  */
  public void setIBSLFX(String newvalue)
  {
    fieldIBSLFX.setString(newvalue);
  }

  /**
  * Get value of field IBSLFX as a String.
  */
  public String getIBSLFX()
  {
    return fieldIBSLFX.getString();
  }

  /**
  * Set field IBSDLC using a String value.
  */
  public void setIBSDLC(String newvalue)
  {
    fieldIBSDLC.setString(newvalue);
  }

  /**
  * Get value of field IBSDLC as a String.
  */
  public String getIBSDLC()
  {
    return fieldIBSDLC.getString();
  }

  /**
  * Set field IBSCTR using a String value.
  */
  public void setIBSCTR(String newvalue)
  {
    fieldIBSCTR.setString(newvalue);
  }

  /**
  * Get value of field IBSCTR as a String.
  */
  public String getIBSCTR()
  {
    return fieldIBSCTR.getString();
  }

  /**
  * Set field IBSCTY using a String value.
  */
  public void setIBSCTY(String newvalue)
  {
    fieldIBSCTY.setString(newvalue);
  }

  /**
  * Get value of field IBSCTY as a String.
  */
  public String getIBSCTY()
  {
    return fieldIBSCTY.getString();
  }

  /**
  * Set field IBSZPC using a String value.
  */
  public void setIBSZPC(String newvalue)
  {
    fieldIBSZPC.setString(newvalue);
  }

  /**
  * Get value of field IBSZPC as a String.
  */
  public String getIBSZPC()
  {
    return fieldIBSZPC.getString();
  }

  /**
  * Set field IBSPOB using a String value.
  */
  public void setIBSPOB(String newvalue)
  {
    fieldIBSPOB.setString(newvalue);
  }

  /**
  * Get value of field IBSPOB as a String.
  */
  public String getIBSPOB()
  {
    return fieldIBSPOB.getString();
  }

  /**
  * Set field IBSTLR using a String value.
  */
  public void setIBSTLR(String newvalue)
  {
    fieldIBSTLR.setString(newvalue);
  }

  /**
  * Get value of field IBSTLR as a String.
  */
  public String getIBSTLR()
  {
    return fieldIBSTLR.getString();
  }

  /**
  * Set field IBSTBL using a String value.
  */
  public void setIBSTBL(String newvalue)
  {
    fieldIBSTBL.setString(newvalue);
  }

  /**
  * Get value of field IBSTBL as a String.
  */
  public String getIBSTBL()
  {
    return fieldIBSTBL.getString();
  }

  /**
  * Set field IBSBUN using a String value.
  */
  public void setIBSBUN(String newvalue)
  {
    fieldIBSBUN.setString(newvalue);
  }

  /**
  * Get value of field IBSBUN as a String.
  */
  public String getIBSBUN()
  {
    return fieldIBSBUN.getString();
  }

  /**
  * Set numeric field IBSBUN using a BigDecimal value.
  */
  public void setIBSBUN(BigDecimal newvalue)
  {
    fieldIBSBUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IBSBUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalIBSBUN()
  {
    return fieldIBSBUN.getBigDecimal();
  }

  /**
  * Set field IBSTIM using a String value.
  */
  public void setIBSTIM(String newvalue)
  {
    fieldIBSTIM.setString(newvalue);
  }

  /**
  * Get value of field IBSTIM as a String.
  */
  public String getIBSTIM()
  {
    return fieldIBSTIM.getString();
  }

  /**
  * Set numeric field IBSTIM using a BigDecimal value.
  */
  public void setIBSTIM(BigDecimal newvalue)
  {
    fieldIBSTIM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IBSTIM as a BigDecimal.
  */
  public BigDecimal getBigDecimalIBSTIM()
  {
    return fieldIBSTIM.getBigDecimal();
  }

  /**
  * Set field IBSLNE using a String value.
  */
  public void setIBSLNE(String newvalue)
  {
    fieldIBSLNE.setString(newvalue);
  }

  /**
  * Get value of field IBSLNE as a String.
  */
  public String getIBSLNE()
  {
    return fieldIBSLNE.getString();
  }

  /**
  * Set numeric field IBSLNE using a BigDecimal value.
  */
  public void setIBSLNE(BigDecimal newvalue)
  {
    fieldIBSLNE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IBSLNE as a BigDecimal.
  */
  public BigDecimal getBigDecimalIBSLNE()
  {
    return fieldIBSLNE.getBigDecimal();
  }

  /**
  * Set field IBSCFX using a String value.
  */
  public void setIBSCFX(String newvalue)
  {
    fieldIBSCFX.setString(newvalue);
  }

  /**
  * Get value of field IBSCFX as a String.
  */
  public String getIBSCFX()
  {
    return fieldIBSCFX.getString();
  }

  /**
  * Set numeric field IBSCFX using a BigDecimal value.
  */
  public void setIBSCFX(BigDecimal newvalue)
  {
    fieldIBSCFX.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IBSCFX as a BigDecimal.
  */
  public BigDecimal getBigDecimalIBSCFX()
  {
    return fieldIBSCFX.getBigDecimal();
  }

  /**
  * Set field IBSTCD using a String value.
  */
  public void setIBSTCD(String newvalue)
  {
    fieldIBSTCD.setString(newvalue);
  }

  /**
  * Get value of field IBSTCD as a String.
  */
  public String getIBSTCD()
  {
    return fieldIBSTCD.getString();
  }

  /**
  * Set numeric field IBSTCD using a BigDecimal value.
  */
  public void setIBSTCD(BigDecimal newvalue)
  {
    fieldIBSTCD.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IBSTCD as a BigDecimal.
  */
  public BigDecimal getBigDecimalIBSTCD()
  {
    return fieldIBSTCD.getBigDecimal();
  }

  /**
  * Set field IBSCLS using a String value.
  */
  public void setIBSCLS(String newvalue)
  {
    fieldIBSCLS.setString(newvalue);
  }

  /**
  * Get value of field IBSCLS as a String.
  */
  public String getIBSCLS()
  {
    return fieldIBSCLS.getString();
  }

  /**
  * Set numeric field IBSCLS using a BigDecimal value.
  */
  public void setIBSCLS(BigDecimal newvalue)
  {
    fieldIBSCLS.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IBSCLS as a BigDecimal.
  */
  public BigDecimal getBigDecimalIBSCLS()
  {
    return fieldIBSCLS.getBigDecimal();
  }

  /**
  * Set field IBSCCN using a String value.
  */
  public void setIBSCCN(String newvalue)
  {
    fieldIBSCCN.setString(newvalue);
  }

  /**
  * Get value of field IBSCCN as a String.
  */
  public String getIBSCCN()
  {
    return fieldIBSCCN.getString();
  }

  /**
  * Set numeric field IBSCCN using a BigDecimal value.
  */
  public void setIBSCCN(BigDecimal newvalue)
  {
    fieldIBSCCN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IBSCCN as a BigDecimal.
  */
  public BigDecimal getBigDecimalIBSCCN()
  {
    return fieldIBSCCN.getBigDecimal();
  }

  /**
  * Set field IBSBTH using a String value.
  */
  public void setIBSBTH(String newvalue)
  {
    fieldIBSBTH.setString(newvalue);
  }

  /**
  * Get value of field IBSBTH as a String.
  */
  public String getIBSBTH()
  {
    return fieldIBSBTH.getString();
  }

  /**
  * Set numeric field IBSBTH using a BigDecimal value.
  */
  public void setIBSBTH(BigDecimal newvalue)
  {
    fieldIBSBTH.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IBSBTH as a BigDecimal.
  */
  public BigDecimal getBigDecimalIBSBTH()
  {
    return fieldIBSBTH.getBigDecimal();
  }

  /**
  * Set field IBSTRM using a String value.
  */
  public void setIBSTRM(String newvalue)
  {
    fieldIBSTRM.setString(newvalue);
  }

  /**
  * Get value of field IBSTRM as a String.
  */
  public String getIBSTRM()
  {
    return fieldIBSTRM.getString();
  }

  /**
  * Set numeric field IBSTRM using a BigDecimal value.
  */
  public void setIBSTRM(BigDecimal newvalue)
  {
    fieldIBSTRM.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IBSTRM as a BigDecimal.
  */
  public BigDecimal getBigDecimalIBSTRM()
  {
    return fieldIBSTRM.getBigDecimal();
  }

  /**
  * Set field IBSSEQ using a String value.
  */
  public void setIBSSEQ(String newvalue)
  {
    fieldIBSSEQ.setString(newvalue);
  }

  /**
  * Get value of field IBSSEQ as a String.
  */
  public String getIBSSEQ()
  {
    return fieldIBSSEQ.getString();
  }

  /**
  * Set numeric field IBSSEQ using a BigDecimal value.
  */
  public void setIBSSEQ(BigDecimal newvalue)
  {
    fieldIBSSEQ.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IBSSEQ as a BigDecimal.
  */
  public BigDecimal getBigDecimalIBSSEQ()
  {
    return fieldIBSSEQ.getBigDecimal();
  }

  /**
  * Set field IBSPYT using a String value.
  */
  public void setIBSPYT(String newvalue)
  {
    fieldIBSPYT.setString(newvalue);
  }

  /**
  * Get value of field IBSPYT as a String.
  */
  public String getIBSPYT()
  {
    return fieldIBSPYT.getString();
  }

  /**
  * Set numeric field IBSPYT using a BigDecimal value.
  */
  public void setIBSPYT(BigDecimal newvalue)
  {
    fieldIBSPYT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IBSPYT as a BigDecimal.
  */
  public BigDecimal getBigDecimalIBSPYT()
  {
    return fieldIBSPYT.getBigDecimal();
  }

  /**
  * Set field IBSDRR using a String value.
  */
  public void setIBSDRR(String newvalue)
  {
    fieldIBSDRR.setString(newvalue);
  }

  /**
  * Get value of field IBSDRR as a String.
  */
  public String getIBSDRR()
  {
    return fieldIBSDRR.getString();
  }

  /**
  * Set numeric field IBSDRR using a BigDecimal value.
  */
  public void setIBSDRR(BigDecimal newvalue)
  {
    fieldIBSDRR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IBSDRR as a BigDecimal.
  */
  public BigDecimal getBigDecimalIBSDRR()
  {
    return fieldIBSDRR.getBigDecimal();
  }

  /**
  * Set field IBSRTE using a String value.
  */
  public void setIBSRTE(String newvalue)
  {
    fieldIBSRTE.setString(newvalue);
  }

  /**
  * Get value of field IBSRTE as a String.
  */
  public String getIBSRTE()
  {
    return fieldIBSRTE.getString();
  }

  /**
  * Set numeric field IBSRTE using a BigDecimal value.
  */
  public void setIBSRTE(BigDecimal newvalue)
  {
    fieldIBSRTE.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IBSRTE as a BigDecimal.
  */
  public BigDecimal getBigDecimalIBSRTE()
  {
    return fieldIBSRTE.getBigDecimal();
  }

  /**
  * Set field IBSCUN using a String value.
  */
  public void setIBSCUN(String newvalue)
  {
    fieldIBSCUN.setString(newvalue);
  }

  /**
  * Get value of field IBSCUN as a String.
  */
  public String getIBSCUN()
  {
    return fieldIBSCUN.getString();
  }

  /**
  * Set numeric field IBSCUN using a BigDecimal value.
  */
  public void setIBSCUN(BigDecimal newvalue)
  {
    fieldIBSCUN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IBSCUN as a BigDecimal.
  */
  public BigDecimal getBigDecimalIBSCUN()
  {
    return fieldIBSCUN.getBigDecimal();
  }

  /**
  * Set field IBSVDR using a String value.
  */
  public void setIBSVDR(String newvalue)
  {
    fieldIBSVDR.setString(newvalue);
  }

  /**
  * Get value of field IBSVDR as a String.
  */
  public String getIBSVDR()
  {
    return fieldIBSVDR.getString();
  }

  /**
  * Set numeric field IBSVDR using a BigDecimal value.
  */
  public void setIBSVDR(BigDecimal newvalue)
  {
    fieldIBSVDR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IBSVDR as a BigDecimal.
  */
  public BigDecimal getBigDecimalIBSVDR()
  {
    return fieldIBSVDR.getBigDecimal();
  }

  /**
  * Set field IBSCKN using a String value.
  */
  public void setIBSCKN(String newvalue)
  {
    fieldIBSCKN.setString(newvalue);
  }

  /**
  * Get value of field IBSCKN as a String.
  */
  public String getIBSCKN()
  {
    return fieldIBSCKN.getString();
  }

  /**
  * Set numeric field IBSCKN using a BigDecimal value.
  */
  public void setIBSCKN(BigDecimal newvalue)
  {
    fieldIBSCKN.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IBSCKN as a BigDecimal.
  */
  public BigDecimal getBigDecimalIBSCKN()
  {
    return fieldIBSCKN.getBigDecimal();
  }

  /**
  * Set field IBSEXR using a String value.
  */
  public void setIBSEXR(String newvalue)
  {
    fieldIBSEXR.setString(newvalue);
  }

  /**
  * Get value of field IBSEXR as a String.
  */
  public String getIBSEXR()
  {
    return fieldIBSEXR.getString();
  }

  /**
  * Set numeric field IBSEXR using a BigDecimal value.
  */
  public void setIBSEXR(BigDecimal newvalue)
  {
    fieldIBSEXR.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IBSEXR as a BigDecimal.
  */
  public BigDecimal getBigDecimalIBSEXR()
  {
    return fieldIBSEXR.getBigDecimal();
  }

  /**
  * Set field IBSAMT using a String value.
  */
  public void setIBSAMT(String newvalue)
  {
    fieldIBSAMT.setString(newvalue);
  }

  /**
  * Get value of field IBSAMT as a String.
  */
  public String getIBSAMT()
  {
    return fieldIBSAMT.getString();
  }

  /**
  * Set numeric field IBSAMT using a BigDecimal value.
  */
  public void setIBSAMT(BigDecimal newvalue)
  {
    fieldIBSAMT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IBSAMT as a BigDecimal.
  */
  public BigDecimal getBigDecimalIBSAMT()
  {
    return fieldIBSAMT.getBigDecimal();
  }

  /**
  * Set field IBSAM1 using a String value.
  */
  public void setIBSAM1(String newvalue)
  {
    fieldIBSAM1.setString(newvalue);
  }

  /**
  * Get value of field IBSAM1 as a String.
  */
  public String getIBSAM1()
  {
    return fieldIBSAM1.getString();
  }

  /**
  * Set numeric field IBSAM1 using a BigDecimal value.
  */
  public void setIBSAM1(BigDecimal newvalue)
  {
    fieldIBSAM1.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IBSAM1 as a BigDecimal.
  */
  public BigDecimal getBigDecimalIBSAM1()
  {
    return fieldIBSAM1.getBigDecimal();
  }

  /**
  * Set field IBSAVG using a String value.
  */
  public void setIBSAVG(String newvalue)
  {
    fieldIBSAVG.setString(newvalue);
  }

  /**
  * Get value of field IBSAVG as a String.
  */
  public String getIBSAVG()
  {
    return fieldIBSAVG.getString();
  }

  /**
  * Set numeric field IBSAVG using a BigDecimal value.
  */
  public void setIBSAVG(BigDecimal newvalue)
  {
    fieldIBSAVG.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IBSAVG as a BigDecimal.
  */
  public BigDecimal getBigDecimalIBSAVG()
  {
    return fieldIBSAVG.getBigDecimal();
  }

  /**
  * Set field IBSINT using a String value.
  */
  public void setIBSINT(String newvalue)
  {
    fieldIBSINT.setString(newvalue);
  }

  /**
  * Get value of field IBSINT as a String.
  */
  public String getIBSINT()
  {
    return fieldIBSINT.getString();
  }

  /**
  * Set numeric field IBSINT using a BigDecimal value.
  */
  public void setIBSINT(BigDecimal newvalue)
  {
    fieldIBSINT.setBigDecimal(newvalue);
  }

  /**
  * Return value of numeric field IBSINT as a BigDecimal.
  */
  public BigDecimal getBigDecimalIBSINT()
  {
    return fieldIBSINT.getBigDecimal();
  }

}
