<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="ISO-8859-1" />

<xsl:template match="buch">
<xsl:comment>jetzt kommt ein buch:</xsl:comment>
  Ein Buch
        <xsl:apply-templates select="autor"/>
</xsl:template>

<xsl:template match="autor">
        <au>Ein Autor</au>
        <xsl:apply-templates/>
</xsl:template>

<xsl:template match="nachname">
        <xsl:value-of select="."/>
</xsl:template>

</xsl:stylesheet>