<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
	<xsl:output encoding="ISO-8859-1" method="html"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" />

	<xsl:template match="hochschule">
		<html>
			<head>
				<title>Studenten</title>
			</head>
			<body>
				<h1>Studenten:</h1>
				<xsl:apply-templates select="studenten/student">
					<xsl:sort select="name/nachname" order="ascending" />
					<xsl:sort select="name/vorname" order="ascending" />
				</xsl:apply-templates>
				<h1>Dozenten:</h1>
				<xsl:apply-templates select="dozenten/dozent">
					<xsl:sort select="name/nachname" order="ascending" />
					<xsl:sort select="name/vorname" order="ascending" />
				</xsl:apply-templates>
				<h1>Vorlesungen:</h1>
				<xsl:apply-templates select="vorlesungen/vorlesung">
					<xsl:sort select="titel" order="ascending" />
				</xsl:apply-templates>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="student">
		<h3>
			Name:
			<xsl:value-of select="name/vorname" />
			<xsl:text> </xsl:text>
			<xsl:value-of select="name/nachname" />
			<xsl:text> </xsl:text>
			(MatrikelNr:
			<xsl:value-of select="@matrikelnr" />
			)
		</h3>
		<xsl:apply-templates select="adresse" />
		<xsl:apply-templates
			select="../../prüfungen/prüfung/note[@matrikelnr=current()/@matrikelnr]" />
	</xsl:template>

	<xsl:template match="adresse">
		<h3>
			Adresse: (
			<xsl:value-of select="@art" />
			)
		</h3>
		<p>
			- Strasse:
			<xsl:value-of select="strasse" />
		</p>
		<p>
			- Hausnummer:
			<xsl:value-of select="hausnummer" />
		</p>
		<p>
			- Land:
			<xsl:value-of select="land" />
		</p>
		<p>
			- PLZ:
			<xsl:value-of select="plz" />
		</p>
		<p>
			- Ort:
			<xsl:value-of select="ort" />
		</p>
	</xsl:template>

	<xsl:template match="note">
		<p>
			<xsl:number format="I. " value="position()" />
			Vorlesung:
			<a href="#{id(../@vorlesungnr)/@vorlesungnr}">
				<xsl:value-of select="id(../@vorlesungnr)/titel" />
			</a>
			Note:
			<xsl:value-of select="." />
			<!-- DAS GEHT ZWAR AUCH, ist aber net so elegant <xsl:value-of select="../../../vorlesungen/vorlesung/titel[../@vorlesungnr=current()/../@vorlesungnr]"/> -->
		</p>
	</xsl:template>

	<xsl:template match="dozent">
		<h3>
			<a id="{@dozentnr}">
				Name:
				<xsl:value-of select="name/vorname" />
				<xsl:text> </xsl:text>
				<xsl:value-of select="name/nachname" />
				<xsl:text> </xsl:text>
				(DozentNr:
				<xsl:value-of select="@dozentnr" />
				)
			</a>
		</h3>
	</xsl:template>

	<xsl:template match="vorlesung">
		<a id="{@vorlesungnr}">
			<h3>
				Titel:
				<xsl:value-of select="titel" />
			</h3>
			<p>
				SWS:
				<xsl:value-of select="sws" />
			</p>
			<p>
				<xsl:if test="kurzbeschreibung">
					Kurzbeschreibung:
					<xsl:value-of select="kurzbeschreibung" />
				</xsl:if>
				<xsl:if test="link">
					Link:
					<xsl:value-of select="link" />
				</xsl:if>
			</p>
			<p>
				Name Dozent:
				<a href="#{id(@dozentnr)/@dozentnr}">
					<xsl:value-of select="id(@dozentnr)/name/vorname" />
					<xsl:text> </xsl:text>
					<xsl:value-of select="id(@dozentnr)/name/nachname" />
				</a>
			</p>
		</a>
	</xsl:template>

	<xsl:template match="dozent" mode="name">
	</xsl:template>

	<xsl:template match="prüfung">

	</xsl:template>
</xsl:stylesheet>