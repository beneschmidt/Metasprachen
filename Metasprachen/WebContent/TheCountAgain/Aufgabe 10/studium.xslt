<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" method="html" />
	<xsl:template match="hochschule">
		<html>
			<head>
				<title>Hochschul-Verwaltung</title>
			</head>
			<body>
				<xsl:apply-templates select="studenten" />
				<xsl:apply-templates select="dozenten" />
				<xsl:apply-templates select="vorlesungen" />
				<xsl:apply-templates select="prüfungen" />
			</body>
		</html>
	</xsl:template>

	<xsl:template match="studenten">
		<h1>Stundenten</h1>
		<table border="1">
			<thead>
				<tr>
					<td>Vorname</td>
					<td>Nachname</td>
					<td>Land</td>
					<td>PLZ</td>
					<td>Ort</td>
					<td>Straße</td>
				</tr>
			</thead>
			<xsl:apply-templates select="student" >
					<xsl:sort select="name"/>
			</xsl:apply-templates>
		</table>
	</xsl:template>

	<xsl:template match="student">
		<tr>
			<td>
				<xsl:value-of select="name/vorname" />
			</td>
			<td>
				<xsl:value-of select="name/nachname" />
			</td>
			<td>
				<xsl:value-of select="anschrift/land" />
			</td>
			<td>
				<xsl:value-of select="anschrift/plz" />
			</td>
			<td>
				<xsl:value-of select="anschrift/ort" />
			</td>
			<td>
				<xsl:value-of select="anschrift/strasse" />
				<xsl:value-of select="anschrift/hausnummer" />
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="adresse">

	</xsl:template>


	<xsl:template match="dozenten">
		<h1>Dozenten</h1>
		<table border="1">
			<thead>
				<tr>
					<td>Vorname</td>
					<td>Nachname</td>
				</tr>
			</thead>
			<xsl:apply-templates select="dozent" >
					<xsl:sort select="name"/>
			</xsl:apply-templates>
		</table>
	</xsl:template>

	<xsl:template match="dozent">
		<tr>
			<td>
				<xsl:value-of select="name/vorname" />
			</td>
			<td>
				<xsl:value-of select="name/nachname" />
			</td>
		</tr>
	</xsl:template>


	<xsl:template match="vorlesungen">
		<h1>Vorlesungen</h1>
		<table border="1">
			<thead>
				<tr>
					<td>Vorlesungsnummer</td>
					<td>Titel</td>
					<td>Typ</td>
					<td>Dozentnummer</td>
					<td>SWS</td>
					<td>Beschreibung/Link</td>
				</tr>
			</thead>
			<xsl:apply-templates select="vorlesung" >
					<xsl:sort select="titel"/>
			</xsl:apply-templates>
		</table>
	</xsl:template>

	<xsl:template match="vorlesung">
		<tr>
			<td>
				<xsl:value-of select="@vorlesungnr" />
			</td>
			<td>
				<xsl:value-of select="titel" />
			</td>
			<td>
				<xsl:value-of select="@type" />
			</td>
			<td>
				<xsl:value-of select="@dozentnr" />
			</td>
			<td>
				<xsl:value-of select="sws" />
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="link">
						<xsl:value-of select="link" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="kurzbeschreibung" />
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="prüfungen">
		<h1>Dozenten</h1>
		<table border="1">
			<thead>
				<tr>
					<td>Datum</td>
					<td>Vorlesung</td>
					<td>Teilnehmer+Note</td>
				</tr>
			</thead>
			<xsl:apply-templates select="prüfung" />
		</table>
	</xsl:template>

	<xsl:template match="prüfung">
		<tr>
			<td>
				<xsl:value-of select="@datum" />
			</td>
			<td>
				<xsl:value-of select="@vorlesung" />
			</td>
			<td>
				<table>
					<xsl:apply-templates select="note" />
				</table>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="note">
		<tr>
			<td>
				<xsl:value-of select="@teilnehmer" />
			</td>
			<td>
				<xsl:value-of select="." />
			</td>
		</tr>
	</xsl:template>

</xsl:stylesheet>