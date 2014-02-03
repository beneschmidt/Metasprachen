<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
	<xsl:output encoding="ISO-8859-1" method="html"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" />

	<xsl:template match="hochschule">
		<html>
			<head>
				<title>Hochschule</title>
			</head>
			<body>
				<h1>Übersicht</h1>
				<h2>Studenten:</h2>
				<xsl:apply-templates select="student">
					<xsl:sort select="name/nachname" order="ascending" />
				</xsl:apply-templates>

				<h2>Dozenten:</h2>
				<xsl:apply-templates select="dozent">
					<xsl:sort select="name/nachname" order="ascending" />
				</xsl:apply-templates>

				<h2>Vorlesungen:</h2>
				<xsl:apply-templates select="vorlesung">
					<xsl:sort select="titel" order="ascending" />
				</xsl:apply-templates>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="student">
		<p>
			Name:
			<xsl:value-of select="./name" />
			, MatrikelNr:
			<xsl:value-of select="@matrikelNr" />
		</p>
		<xsl:apply-templates select="anschrift" />

	</xsl:template>

	<xsl:template match="anschrift">
		<p>
			Typ:
			<xsl:value-of select="@typ" />
			<br />
			Laenderkuerzel:
			<xsl:value-of select="./länderkürzel" />
			<br />
			plz:
			<xsl:value-of select="./plz" />
			<br />
			ort:
			<xsl:value-of select="./ort" />
			<br />
			strasse:
			<xsl:value-of select="./straße" />
			<br />
			hausnummer:
			<xsl:value-of select="./hausnummer" />
			<br />
		</p>
	</xsl:template>

	<xsl:template match="dozent">
		<p>
			Name:
			<xsl:value-of select="./name" />
	, dozentID:
	<xsl:value-of select="@dozentID" />
		</p>
	</xsl:template>

	<xsl:template match="vorlesung">
		<p>
			Titel:
			<xsl:value-of select="./titel" />
			, Art:
			<xsl:value-of select="@art" />
						, dozentID:
			<xsl:value-of select="@dozentID" />
						, vorlesungsNr:
			<xsl:value-of select="@vorlesungsNr" />
						, SWS:
			<xsl:value-of select="./sws" />
						, Kurzbeschreibung/Link:
			<xsl:value-of select="kurzbeschreibung" />
			<xsl:value-of select="link" />
		</p>
	</xsl:template>

</xsl:stylesheet>