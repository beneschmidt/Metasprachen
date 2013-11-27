<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="html" />

	<xsl:variable name="link" select="//vorlesungen/vorlesung/link" />

	<xsl:template match="hochschule">
		<html>
			<head>
				<title>Studium</title>
			</head>
			<body>
				<xsl:apply-templates select="studenten" />
				<xsl:apply-templates select="dozenten" />
				<xsl:apply-templates select="vorlesungen" />
			</body>
		</html>
	</xsl:template>

	<xsl:template match="studenten">
		<h1>Studenten</h1>
		<xsl:apply-templates select="student">
			<xsl:sort select="name"></xsl:sort>
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="student">
		<h2>
			<xsl:number format="1. " value="position()" />
			<xsl:apply-templates select="name" />
			(Matr.Nr.=
			<xsl:value-of select="@matrikelnr" />
			)
		</h2>
		<xsl:apply-templates select="adresse" />
		<br />
		<h3>Prüfungen</h3>
		<xsl:apply-templates
			select="../../prüfungen/prüfung/note[@matrikelnr=current()/@matrikelnr]" />
	</xsl:template>

	<xsl:template match="name">
		<xsl:value-of select="vorname" />
		<xsl:text> </xsl:text>
		<xsl:value-of select="nachname" />
	</xsl:template>

	<xsl:template match="adresse">
		<h3>
			Adresse (
			<xsl:value-of select="@art" />
			)
		</h3>
		Straße:
		<xsl:value-of select="strasse" />
		<br />
		Hausnummer:
		<xsl:value-of select="hausnummer" />
		<br />
		Land:
		<xsl:value-of select="land" />
		<br />
		PLZ:
		<xsl:value-of select="plz" />
		<br />
		Ort:
		<xsl:value-of select="ort" />
	</xsl:template>

	<xsl:template match="note">
		<xsl:number format="I. " value="position()" />
		<xsl:value-of select="id(../@vorlesungnr)/titel" />
		(
		<xsl:value-of select="../@datum" />
		):
		<xsl:value-of select="." />
		<br />

	</xsl:template>

	<xsl:template match="dozenten">
		<h1>Dozenten</h1>
		<xsl:apply-templates select="dozent">
			<xsl:sort select="name" />
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="dozent">
		<h2>
			<!-- Anker erstellen -->
			<xsl:text disable-output-escaping="yes">&lt;a name=&quot;</xsl:text>
			<xsl:value-of select="@dozentnr" />
			<xsl:text disable-output-escaping="yes">&quot;&gt;
		</xsl:text>
			<!-- Nummerierung -->
			<xsl:number format="1. " value="position()" />
			<!-- Name ausgeben -->
			<xsl:apply-templates select="name" />
			<xsl:text disable-output-escaping="yes">&lt;/a&gt;</xsl:text>
		</h2>
		Dozent-Nummer:
		<xsl:value-of select="@dozentnr" />
	</xsl:template>

	<!-- Vorlesungen, Sortierung nach Titel -->
	<xsl:template match="vorlesungen">
		<h1>Vorlesungen</h1>
		<xsl:apply-templates select="vorlesung">
			<xsl:sort select="titel" />
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="vorlesung">
		<h2>
			<xsl:value-of select="titel" />
			(Nummer:
			<xsl:value-of select="@vorlesungnr" />
			)
		</h2>
		Semesterwochenstunden:
		<xsl:value-of select="sws" />
		<br />
		Kurzbeschreibung:
		<xsl:value-of select="kurzbeschreibung" />
		<br />
		Dozent:
		<!-- Dozentenverknüpfung mit Anker auf entsprechende Stelle -->
		<xsl:text disable-output-escaping="yes">&lt;a href=&quot;#</xsl:text>
		<xsl:value-of select="@dozentnr" />
		<xsl:text disable-output-escaping="yes">&quot;&gt;
		</xsl:text>
		<xsl:value-of select="id(@dozentnr)/name" />
		<xsl:text disable-output-escaping="yes">&lt;/a&gt;
		</xsl:text>
		<br />
		<!-- Link anzeigen -->
		<xsl:text disable-output-escaping="yes">&lt;a href=&quot;
		</xsl:text>
		<xsl:value-of select="link" />
		<xsl:text disable-output-escaping="yes">&quot;&gt;Link zur Vorlesung&lt;/a&gt;</xsl:text>
		<br />
	</xsl:template>
</xsl:stylesheet>