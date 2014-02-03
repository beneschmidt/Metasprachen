<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="ISO-8859-1" indent="no" method="xml"/>

	<xsl:template match="//autoren">
		<xsl:element name="bücher">
			<xsl:apply-templates select="autor/buch">
				<xsl:sort select="erscheinungsjahr" data-type="number" order="descending" />
				<xsl:sort select="../nachname" data-type="text" order="descending" />
			</xsl:apply-templates>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="buch">
		<xsl:copy>
			<xsl:attribute name="sprache">
				<xsl:value-of select="../sprache" />
			</xsl:attribute>
			<xsl:copy-of select="./titel" />
			<xsl:copy-of select="./erscheinungsjahr" />
			<xsl:apply-templates select=".." />
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="autor">
		<xsl:copy>
			<xsl:copy-of select="./nachname" />
			<xsl:copy-of select="./vorname" />
			<xsl:if test="./nobelpreis">
				<xsl:attribute name="nobelpreis">
					<xsl:value-of select="./nobelpreis"/>
				</xsl:attribute>
			</xsl:if>
		</xsl:copy>
	</xsl:template>

</xsl:stylesheet>