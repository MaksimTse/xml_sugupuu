<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="html" indent="yes" encoding="utf-8"/>
	
	<xsl:template match="/">
		<h1>Inimese nimi:</h1>
		<p>
			<xsl:value-of select="sugupuu/inimene[1]/nimi"/>
		</p>
		<h2>Kõik inimesd</h2>
		<table border="1">
			<thead>
				<tr>
					<th>Nimi</th>
					<th>Sünniaasta</th>
					<th>Sünnikoht</th>
					<th>Lapsed</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="sugupuu/inimene">
					<tr>
						<td>
							<xsl:value-of select="nimi"/>
						</td>
						<td>
							<xsl:value-of select="synniaasta"/>
						</td>
						<td>
							<xsl:value-of select="synnikoht"/>
						</td>
						<td>
							<xsl:for-each select="lapsed/inimene">
								<p>
									<xsl:value-of select="nimi"/>,
									<xsl:value-of select="synniaasta"/>,
									<xsl:value-of select="synnikoht"/>
								</p>
							</xsl:for-each>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
