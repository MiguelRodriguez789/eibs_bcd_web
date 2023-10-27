<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
  <h2>Codificacion de Campos de EForms</h2>
  <xsl:apply-templates/>
  </body>
  </html>
</xsl:template>

<xsl:template match="eIBSDataGroup">
  <h3> <xsl:value-of select="@s-Label"/> </h3>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th>Nombre del Campo</th>
      <th>Codigo</th>
    </tr>
   <xsl:apply-templates select="eIBSDataField"/>
  </table>
  
  
  <br/>
</xsl:template>

<xsl:template match="eIBSDataField">
 
    <xsl:for-each select=".">
     
        <tr>
          <td><xsl:value-of select="@s-Label"/></td>
          <td><xsl:value-of select="parent::*/attribute::eIBSCode"/>_<xsl:value-of select="@eIBSCode"/></td>
        </tr>
     
    </xsl:for-each>

</xsl:template>

</xsl:stylesheet>