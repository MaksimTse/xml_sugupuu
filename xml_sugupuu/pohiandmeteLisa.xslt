<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes" encoding="utf-8"/>

	<xsl:template match="/">
		<h2>Kõik inimesed</h2>
		<table border="1">
			<thead>
				<tr>
					<th>Vanavanemad</th>
					<th>Vanemad</th>
					<th>Lapsed</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="sugupuu/inimene[lapsed]">
					<tr>
						<td>
							<p>
								<xsl:value-of select="nimi"/>,
								<xsl:value-of select="synniaasta"/>,
								<xsl:value-of select="synnikoht"/>
							</p>
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

						<td>
							<xsl:for-each select="lapsed/inimene/lapsed/inimene">
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
