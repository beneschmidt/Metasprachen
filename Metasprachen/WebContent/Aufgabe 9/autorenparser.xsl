<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
	<xsl:output encoding="utf-8" indent="no" method="text"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" />

	<xsl:template match="/autoren/autor[sprache='deutsch' and nobelpreis]">
		<xsl:apply-templates select=".">
			<xsl:sort select="nobelpreis" order="descending" data-type="number"/>
		</xsl:apply-templates>
	</xsl:template>
	
	<xsl:template match="autor">
		<xsl:value-of select="nachname"/>, <xsl:value-of select="vorname"/>, <xsl:value-of select="nobelpreis"/><br/>
	</xsl:template>

</xsl:stylesheet>