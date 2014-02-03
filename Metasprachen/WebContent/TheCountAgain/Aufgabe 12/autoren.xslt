<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="autoren">
		<bücher>
			<xsl:apply-templates select="autor/buch">
				<xsl:sort select="erscheinungsjahr" data-type="number"
					order="ascending" />
				<xsl:sort select="../nachname" data-type="text" order="ascending" />
			</xsl:apply-templates>
		</bücher>
	</xsl:template>

	<xsl:template match="buch">
		<xsl:copy>
			<xsl:attribute name="sprache">
				<xsl:value-of select="../sprache" />
			</xsl:attribute>
			<xsl:copy-of select="./titel" />
			<xsl:copy-of select="./erscheinungsjahr" />
			<xsl:apply-templates select="..">
			</xsl:apply-templates>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="autor">
		<xsl:copy>
			<xsl:if test="nobelpreis">
				<xsl:attribute name="nobelpreis">
					<xsl:value-of select="./nobelpreis" />
				</xsl:attribute>
			</xsl:if>
			<xsl:copy-of select="nachname" />
			<xsl:copy-of select="vorname" />
		</xsl:copy>
	</xsl:template>

</xsl:stylesheet>