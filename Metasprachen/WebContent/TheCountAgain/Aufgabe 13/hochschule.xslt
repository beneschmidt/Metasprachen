<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" doctype-system="about:legacy-compat" />

	<xsl:template match="hochschule">
		<html>
			<head>
				<title>Hochschule</title>
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
		<table border="1">
			<thead>
				<tr>
					<td>#</td>
					<td>Nachname</td>
					<td>Vorname</td>
					<td>Matrikelnummer</td>
					<td>Heimatadresse</td>
					<td>Semesteradresse</td>
					<td>Prüfungen</td>
				</tr>
			</thead>
			<xsl:apply-templates select="student">
				<xsl:sort select="name" />
			</xsl:apply-templates>
		</table>
	</xsl:template>

	<xsl:template match="student">
		<tr>
			<td>
				<xsl:number format="1. " value="position()" />
			</td>
			<td>
				<xsl:value-of select="name/nachname" />
			</td>
			<td>
				<xsl:value-of select="name/vorname" />
			</td>
			<td>
				<xsl:value-of select="@matrikelnr" />
			</td>
			<td>
				<xsl:value-of select="adresse[@art='Heimat']" />
			</td>
			<td>
				<xsl:value-of select="adresse[@art='Semester']" />
			</td>
			<td>
				<xsl:apply-templates select="../../prüfungen/prüfung/note[@matrikelnr=current()/@matrikelnr]" />
			</td>
		</tr>
	</xsl:template>

	<xsl:template select="adresse">
		<xsl:value-of select="strasse" />
		,
		<xsl:value-of select="hausnummer" />
		,
		<xsl:value-of select="land" />
		,
		<xsl:value-of select="plz" />
		,
		<xsl:value-of select="ort" />
		,
	</xsl:template>

	<xsl:template match="note">
		<xsl:number format="I. " value="position()" />
		<xsl:value-of select="../@datum" />
		=
		<xsl:value-of select="." />
		<br />
	</xsl:template>

	<xsl:template match="dozenten">
		<h1>Dozenten</h1>
		<table border="1">
			<thead>
				<tr>
					<td>#</td>
					<td>Nachname</td>
					<td>Vorname</td>
					<td>Dozentnummer</td>
				</tr>
			</thead>
			<xsl:apply-templates select="dozent">
				<xsl:sort select="name" />
			</xsl:apply-templates>
		</table>
	</xsl:template>

	<xsl:template match="dozent">
		<tr id="{@dozentnr}">
			<td>
				<xsl:number format="1. " value="position()" />
			</td>
			<td>
				<xsl:value-of select="name/nachname" />
			</td>
			<td>
				<xsl:value-of select="name/vorname" />
			</td>
			<td>
				<xsl:value-of select="@dozentnr" />
			</td>
		</tr>
	</xsl:template>


	<xsl:template match="vorlesungen">
		<h1>Vorlesungen</h1>
		<table border="1">
			<thead>
				<tr>
					<td>Nummer</td>
					<td>Typ</td>
					<td>Titel</td>
					<td>sws</td>
					<td>Kurzbeschreibung</td>
					<td>Link</td>
					<td>Dozentnachname</td>
				</tr>
			</thead>
			<xsl:apply-templates select="vorlesung">
				<xsl:sort select="titel" />
			</xsl:apply-templates>
		</table>
	</xsl:template>

	<xsl:template match="vorlesung">
		<tr>
			<td>
				<xsl:number format="I. " value="position()" />
			</td>
			<td>
				<xsl:value-of select="@art" />
			</td>
			<td>
				<xsl:value-of select="titel" />
			</td>
			<td>
				<xsl:value-of select="sws" />
			</td>
			<td>
				<xsl:value-of select="kurzbeschreibung" />
			</td>
			<td>
				<a href="{link}">
					<xsl:value-of select="link" />
				</a>
			</td>
			<td>
				<a href="#{@dozentnr}">
					<xsl:value-of select="id(@dozentnr)/name/nachname" />
				</a>
			</td>
		</tr>
	</xsl:template>

</xsl:stylesheet>