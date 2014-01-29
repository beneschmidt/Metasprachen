<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="ISO-8859-1" indent="no" method="xml" />

	<xsl:template match="autoren">
		<xml>
			<buecher>
				<xsl:apply-templates select="autor/buch">
					<xsl:sort select="erscheinungsjahr" order="ascending" />
					<xsl:sort select="../nachname" order="ascending" />
				</xsl:apply-templates>
			</buecher>
		</xml>
	</xsl:template>

	<xsl:template match="buch">
		<buch>
			<titel>
				<xsl:value-of select="titel" />
			</titel>
			<erscheinungsjahr>
				<xsl:value-of select="erscheinungsjahr" />
			</erscheinungsjahr>
			<sprache>
				<xsl:value-of select="../sprache" />
			</sprache>

			<xsl:apply-templates select=".." />

		</buch>
	</xsl:template>

	<xsl:template match="autor">
		<autor>
			<xsl:if test="nobelpreis">
				<xsl:attribute name="nobelpreis">
					<xsl:value-of select="nobelpreis" />
				</xsl:attribute>
			</xsl:if>
			<nachname>
				<xsl:value-of select="nachname" />
			</nachname>
			<vorname>
				<xsl:value-of select="vorname" />
			</vorname>

		</autor>
	</xsl:template>
</xsl:stylesheet>