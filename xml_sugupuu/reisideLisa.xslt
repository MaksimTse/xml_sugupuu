<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:key name="alternate-color" match="Reisid" use="position()" />

	<xsl:template match="/">
		<html>
			<head>
				<style>
					body { background-color: #454545; padding: 2%;}
					h1 { color: #212121; }
					h2 { font-size: 34px; color: #212121; }
					ul { list-style-type: disc; }
					.yellow-bg { background-color: yellow; }
					.table-container { background-color: #f8f8f0; padding: 1%; margin-bottom: 2%; border-radius: 20px; }
					table { width: 100%; border-collapse: collapse; }
					th, td { border: 1px solid black; padding: 8px; text-align: left; }
					tr:nth-child(even) { background-color: #f2f2f2; }
				</style>
			</head>
			<body>

				<div class="table-container">
					<h1>1-4. Kõik Reisid</h1>

					<xsl:for-each select="Reisid/Reisi">
						<xsl:if test="Lend">
							<h1>
								Sihtkoht:
								<span style="background-color: yellow;">
									<xsl:value-of select="Lend/Saabumine/Linn" />
								</span>
							</h1>

							<xsl:choose>
								<xsl:when test="Lend/Hind &gt; 1400">
									<span style="font-weight: bold; color: red;">Eriline pakkumine!</span>
								</xsl:when>
								<xsl:otherwise>
									<span>Standard reis</span>
								</xsl:otherwise>
							</xsl:choose>

							<ul>
								<li>
									Lennu hind: <xsl:value-of select="Lend/Hind" />
								</li>
								<li>
									Lennu aeg:
									<span style="background-color: yellow;">
										<xsl:value-of select="Lend/Valjumine/Aeg" />
									</span> -
									<span style="background-color: yellow;">
										<xsl:value-of select="Lend/Saabumine/Aeg" />
									</span>
								</li>
								<li>
									Lennu sihtkoht:
									<span style="background-color: yellow;">
										<xsl:value-of select="Lend/Saabumine/Linn" />
									</span>
								</li>
								<li>
									Transport Hind: <xsl:value-of select="Lend/TransportHind" />
								</li>
							</ul>
						</xsl:if>
						<hr/>
					</xsl:for-each>
				</div>

				<div class="table-container">
					<h2>5. Kogumaksumus Iga Reisi Kohta</h2>
					<ul>
						<xsl:for-each select="Reisid/Reisi">
							<xsl:variable name="sum" select="Lend/Hind + Lend/TransportHind" />
							<li>
								Reis number <xsl:value-of select="@reisi_id"/> - Koguhind: <xsl:value-of select="$sum" />
							</li>
						</xsl:for-each>
					</ul>
				</div>

				<div class="table-container">
					<h2>6. Reisid Lennureisiga</h2>
					<ul>
						<xsl:for-each select="Reisid/Reisi[Lend]">
							<li>
								Reis number: <xsl:value-of select="@reisi_id"/> - <xsl:value-of select="Lend/Saabumine/Linn" />
							</li>
						</xsl:for-each>
					</ul>
				</div>

				<div class="table-container">
					<h2>7. Sorteeritud Reisid (Hinna Järgi)</h2>
					<ul>
						<xsl:for-each select="Reisid/Reisi">
							<xsl:sort select="Lend/Hind" order="ascending" data-type="number" />
							<li>
								Reis number: <xsl:value-of select="@reisi_id"/> - Hind: <xsl:value-of select="Lend/Hind" />
							</li>
						</xsl:for-each>
					</ul>
				</div>

				<div class="table-container">
					<h2>8. Andmed Tabelina</h2>
					<table>
						<tr style="background-color: #8c8c8c">
							<th>Reisi number</th>
							<th>Lennu Hind</th>
							<th>Transport Hind</th>
							<th>Lennu lähtekoht</th>
							<th>Väljumine aeg</th>
							<th>Lennu Sihtkoht</th>
							<th>Saabumine aeg</th>
						</tr>
						<xsl:for-each select="Reisid/Reisi">
							<tr>
								<td>
									<xsl:value-of select="@reisi_id"/>
								</td>
								<td>
									<xsl:value-of select="Lend/Hind"/>
								</td>
								<td>
									<xsl:value-of select="Lend/TransportHind"/>
								</td>
								<td>
									<xsl:value-of select="Lend/Valjumine/Linn" />
								</td>
								<td>
									<xsl:value-of select="Lend/Valjumine/Aeg" />
								</td>
								<td>
									<xsl:value-of select="Lend/Saabumine/Linn"/>
								</td>
								<td>
									<xsl:value-of select="Lend/Saabumine/Aeg" />
								</td>
							</tr>
						</xsl:for-each>
					</table>
				</div>

			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
