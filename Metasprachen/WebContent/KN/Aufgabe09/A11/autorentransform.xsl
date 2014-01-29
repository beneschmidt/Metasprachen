<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="ISO-8859-1" method="xml" />
	<xsl:template match="autoren">
		<xsl:apply-templates select="autor">
			<xsl:sort select="nobelpreis" order="ascending" />
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="autor">
		<xsl:if test="sprache='deutsch' and nobelpreis">
			<preistraeger>
				<xsl:value-of select="nachname" />, <xsl:value-of select="vorname" />, <xsl:value-of select="nobelpreis" />
			</preistraeger>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>