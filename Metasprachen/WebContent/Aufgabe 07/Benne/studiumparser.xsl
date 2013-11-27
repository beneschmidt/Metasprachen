<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
	<xsl:output encoding="utf-8" indent="no" method="xml"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" />

	<xsl:template match="studium">
		<html xmlns="http://www.w3.org/1999/xhtml" lang="de" xml:lang="de">
			<head>
				<meta charset="utf-8" />
				<title>Aufgabe 7.7.1</title>
			</head>
			<body>
				<h1>Studenten</h1>
				<xsl:apply-templates select="student">
					<xsl:sort select="name" />
				</xsl:apply-templates>

				<h1>Dozenten</h1>
				<xsl:apply-templates select="dozent">
					<xsl:sort select="name" />
				</xsl:apply-templates>

				<h1>Vorlesungen</h1>
				<xsl:apply-templates select="vorlesung">
					<xsl:sort select="titel" />
				</xsl:apply-templates>

				<h1>Prüfungen</h1>
				<xsl:apply-templates select="prüfung">
					<xsl:sort select="datum" />
				</xsl:apply-templates>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="student">
		<h2>Student</h2>
		<xsl:apply-templates select="@matrikelnummer" />
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="name">
		<xsl:apply-templates select="vorname" />
		<xsl:apply-templates select="nachname" />
	</xsl:template>

	<xsl:template match="vorname">
		<p>
			Vorname:
			<xsl:value-of select="." />
		</p>
	</xsl:template>

	<xsl:template match="nachname">
		<p>
			Nachname:
			<xsl:value-of select="." />
		</p>
	</xsl:template>

	<xsl:template match="@matrikelnummer">
		<p>
			Matrikelnummer:
			<xsl:value-of select="." />
		</p>
	</xsl:template>

	<xsl:template match="anschrift">
		<p>
			<h3>
				<xsl:value-of select="@art" />
				-Anschrift
			</h3>
			<xsl:value-of select="straße" />
			<xsl:value-of select="hausnummer" />
			in
			<xsl:value-of select="plz" />
			,
			<xsl:value-of select="ort" />
			,
			<xsl:value-of select="land" />
		</p>
	</xsl:template>

	<xsl:template match="dozent">
		<h2>Dozent</h2>
		<xsl:apply-templates />
	</xsl:template>


	<xsl:template match="vorlesung">
		<h2>
			<xsl:value-of select="titel" />
			-
			<xsl:value-of select="@art" />
		</h2>
		<p>
			Semeseterwochenstunden:
			<xsl:value-of select="sws" />
			<br />
			Beschreibung:
			<xsl:value-of select="kurzbeschreibung" />
			<br />

		</p>
	</xsl:template>

	<xsl:template match="prüfung">
	<h2>Zur Vorlesung <xsl:value-of select="@vorlesung"/></h2>
	<p>
		Datum: <xsl:value-of select="datum"/><br/>
		<h3>Teilnehmer</h3>
		<xsl:apply-templates select="teilnahme">
			<xsl:sort select="note"></xsl:sort>
		</xsl:apply-templates>
	</p>
	</xsl:template>
	
	<xsl:template match="teilnahme">
		<p>Teilnehmer: <xsl:value-of select="@teilnehmer"></xsl:value-of><br/>
		Note: <xsl:value-of select="note"/>
		</p>
	</xsl:template>

</xsl:stylesheet>