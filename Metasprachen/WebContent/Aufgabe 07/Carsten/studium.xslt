<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="ISO-8859-1" indent="yes" method="html"/>

	<xsl:template match="studium">
		<html>
			<head>
				<title>Studium</title>
			</head>
			<body>
				<xsl:apply-templates select="student">
					<xsl:sort select="name"/>
				</xsl:apply-templates>
				<xsl:apply-templates select="dozent">
					<xsl:sort select="name"/>
				</xsl:apply-templates>
				<xsl:apply-templates select="vorlesung">
					<xsl:sort select="@titel"/>
				</xsl:apply-templates>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="student">
		<h1>
			Student
		</h1>
			<xsl:apply-templates select="@matrikelnummer"/>
			<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="name">
		<p>
			Name : <xsl:value-of select="."/>
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	
	<xsl:template match="vorname">
		<p>
			Vorname : <xsl:value-of select="."/>
		</p>
	</xsl:template>
	
	<xsl:template match="@matrikelnummer">
		<p>
			Matrikelnummer : <xsl:value-of select="."/>
		</p>
	</xsl:template>
	
	<xsl:template match="anschrift">
		<h2>
			Anschrift
		</h2>
			<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="plz">
		<p>
			PLZ : <xsl:value-of select="."/>
		</p>
	</xsl:template>
	
	<xsl:template match="kuerzel">
		<p>
			Kuerzel : <xsl:value-of select="."/>
		</p>
	</xsl:template>
	
	<xsl:template match="ort">
		<p>
			Ort : <xsl:value-of select="."/>
		</p>
	</xsl:template>
	
	<xsl:template match="strasse">
		<p>
			Strasse : <xsl:value-of select="."/>
		</p>
	</xsl:template>
	
	<xsl:template match="hausnummer">
		<p>
			Hausnummer : <xsl:value-of select="."/>
		</p>
	</xsl:template>
	
	<xsl:template match="dozent">
		<h1>
			Dozent
		</h1>
			<xsl:apply-templates select="@identifier"/>
			<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="@identifier">
		<p>
			ID : <xsl:value-of select="."/>
		</p>
	</xsl:template>
	
	<xsl:template match="vorlesung">
		<h1>
			Vorlesung
		</h1>
			<xsl:apply-templates select="@titel"/>
			<xsl:apply-templates select="@art"/>
			<xsl:apply-templates select="@dozent"/>
			<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="@titel">
		<p>
			Titel : <xsl:value-of select="."/>
		</p>
	</xsl:template>
	
	<xsl:template match="@art">
		<p>
			Art : <xsl:value-of select="."/>
		</p>
	</xsl:template>

	<xsl:template match="@dozent">
		<p>
			Dozent-ID : <xsl:value-of select="."/>
		</p>
	</xsl:template>
	
	<xsl:template match="semestercount">
		<p>
			Anzahl : <xsl:value-of select="."/>
		</p>
	</xsl:template>
	
	<xsl:template match="link">
		<p>
			Link : <xsl:value-of select="."/>
		</p>
	</xsl:template>
	
	<xsl:template match="beschreibung">
		<p>
			Beschreibung : <xsl:value-of select="."/>
		</p>
	</xsl:template>
	
</xsl:stylesheet>