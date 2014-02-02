<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="autoren">
		<xsl:apply-templates select="autor[sprache='deutsch' and nobelpreis]">
		<xsl:sort select="nobelpreis" data-type="number" order="descending"></xsl:sort>
		</xsl:apply-templates>
	</xsl:template>
	
	<xsl:template match="autor">
		<xsl:text>&#xa;</xsl:text>
		<xsl:value-of select="nachname"/>, <xsl:value-of select="vorname"/>, <xsl:value-of select="nobelpreis"/>
	</xsl:template>

</xsl:stylesheet>