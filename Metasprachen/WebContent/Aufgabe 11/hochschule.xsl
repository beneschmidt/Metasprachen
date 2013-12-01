<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" doctype-system="about:legacy-compat" />

	<xsl:template match="hochschule">

		<html>
			<head>
				<meta charset="utf-8" />
				<title>Studium</title>
			</head>
			<body>
				<xsl:apply-templates select="studenten" />
				<hr />
				<xsl:apply-templates select="dozenten" />
				<hr />
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

	<!-- Name = Vorname Nachname -->
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
		<!-- Nummerierung -->
		<xsl:number format="I. " value="position()" />
		<!-- Verlinkung auf die Vorlesung -->
		<a href="#{id(../@vorlesungnr)/@vorlesungnr}">
			<xsl:value-of select="id(../@vorlesungnr)/titel" />
		</a>
		(
		<xsl:value-of select="../@datum" />
		):
		<xsl:value-of select="." />
		<br />

	</xsl:template>

	<!-- Dozenten, sortiert nach Name -->
	<xsl:template match="dozenten">
		<h1>Dozenten</h1>
		<xsl:apply-templates select="dozent">
			<xsl:sort select="name" />
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template match="dozent">
		<h2>
			<!-- Anker zum Verlinken -->
			<a name="{@dozentnr}">
				<!-- Nummerierung -->
				<xsl:number format="1. " value="position()" />
				<!-- Name ausgeben -->
				<xsl:apply-templates select="name" />
			</a>
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
			<!-- Anker zum Verlinken -->
			<a name="{@vorlesungnr}">
				<xsl:value-of select="titel" />
			</a>
		</h2>
		Vorlesungsnummer:
		<xsl:value-of select="@vorlesungnr" />
		<br />
		Semesterwochenstunden:
		<xsl:value-of select="sws" />
		<br />
		Kurzbeschreibung:
		<xsl:value-of select="kurzbeschreibung" />
		<br />
		Dozent:
		<!-- Dozentenverknüpfung mit Anker auf entsprechende Stelle -->
		<a href="#{@dozentnr}">
			<xsl:apply-templates select="id(@dozentnr)/name" />
		</a>
		<br />
		<!-- Link anzeigen -->
		<a href="{link}">Link zur Vorlesung</a>
		<br />
	</xsl:template>
</xsl:stylesheet>