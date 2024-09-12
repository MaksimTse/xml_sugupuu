<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/">
		<h3>1) Autod, mille väljastamise aasta on suurem kui 2008</h3>
		<table border="1">
			<tr>
				<th>Mark</th>
				<th>Registrinumber</th>
				<th>Väljastamise aasta</th>
			</tr>
			<xsl:for-each select="autod/auto[vaasta &gt; 2008]">
				<tr>
					<td>
						<xsl:value-of select="mark"/>
					</td>
					<td>
						<xsl:value-of select="registrinumber"/>
					</td>
					<td>
						<xsl:value-of select="vaasta"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<h3>2) Autod, mille registrinumber algab tähega "B" ja värvige see punaseks</h3>
		<table border="1">
			<tr>
				<th>Mark</th>
				<th>Registrinumber</th>
				<th>Omanik</th>
			</tr>
			<xsl:for-each select="autod/auto[starts-with(substring-after(registrinumber, ' '), 'B')]">
				<tr>
					<td>
						<xsl:value-of select="mark"/>
					</td>
					<td>
						<xsl:variable name="regNum" select="registrinumber"/>
						<!-- Muutujaga nimega regNum, mis valib registrinumbri -->
						<xsl:variable name="firstPart" select="substring-before($regNum, ' ')"/>
						<!-- Muutujaga nimega firstPart, mis valib esimese osa enne tühikut muutujast regNum -->
						<xsl:variable name="secondPart" select="substring-after($regNum, ' ')"/>
						<!-- Muutujaga nimega secondPart, mis valib teise osa pärast tühikut muutujast regNum -->

						<xsl:choose>
							<xsl:when test="starts-with($secondPart, 'B')">
								<!-- Kasutades teist osa numbrist, otsime alguses tähte B -->
								<xsl:value-of select="$firstPart"/>
								<!-- Väljund muutuja abil esimene osa numbrist -->
								<span style="color: red;"> B</span>
								<!-- Kirjutame punase tähe B -->
								<xsl:value-of select="substring($secondPart, 2)"/>
								<!-- Võtame teise osa numbrist muutuja kaudu ja alustame teisest tähest, nii et väljundiks on numbrid + värviline täht ja 2 viimast tähte -->
							</xsl:when>
						</xsl:choose>
					</td>
					<td>
						<xsl:value-of select="omanik"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		
		<h3>Autode üldkogus xml jadas</h3>
		<br/>
		kasutame count() funktsioon, vastus on
		<xsl:value-of select="count(autod/auto)"/>
		
		<hr/>
		<h3>Autode üldkogus, mis on vaasta=2000</h3>
		<br/>
		kasutame count() funktsioon, vastus on 
		<xsl:value-of select="count(autod/auto[vaasta='2000'])"/>

		<hr/>
		<h3>1) Trüki välja (eralda komaga) auto registrinumbri numbrite osa</h3>
		<br/>
		kasutame substring(), vastus on
		<xsl:for-each select="autod/auto">
			<xsl:value-of select="substring(registrinumber, 1, 3)"/>,
		</xsl:for-each>

		<hr/>
		<h3>2) Trüki välja (eralda komaga) omaniku nime viimane täht</h3>
		<br/>
		kasutame substring(), vastus on
		<xsl:for-each select="autod/auto">
			<xsl:value-of select="substring(omanik, string-length(omanik), 1)"/>,
		</xsl:for-each>
		
	<hr/>
		<h3>3) Auto omanikud, mis sisaldavad O täht</h3>
		<br/>
		kasutame contains() funktsioon, vastus on
		<ul>
			<xsl:for-each select="autod/auto[contains(omanik, 'O') or contains(omanik, 'o')]">
				<li>
					<xsl:value-of select="omanik"/>
				</li>
			</xsl:for-each>
		</ul>

		<hr/>
		<h3>4) Leia, mitme auto registrimärgi numbritest viimane on 2</h3>
		<br/>
		kasutame count() ja substring(), vastus on
		<ul>
			<xsl:for-each select="autod/auto[substring(translate(registrinumber, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ', ''), string-length(translate(registrinumber, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ ', '')), 1) = '2']">
				<li>
					<xsl:value-of select="registrinumber"/>
				</li>
			</xsl:for-each>
		</ul>

		<hr/>
		<h3>5) Teeta iga registrinumbri puhul, milles kuus auto ülevaatus on</h3>
		<br/>
		kasutame substring() funktsioon, vastus on
		<br/>
		<ul>
			<xsl:for-each select="autod/auto">
				<xsl:variable name="value" select="substring(registrinumber, 3, 1) + 2"/> 
				<li>
					<strong>Registri Number: </strong> <xsl:value-of select="registrinumber"/> -
					<xsl:choose>
						<xsl:when test="$value &gt; 9">
							<span style="color: red;">
								<xsl:value-of select="$value"/>
							</span>
						</xsl:when>
						<xsl:otherwise>
							<span style="color: green;">
								<xsl:value-of select="$value"/>
							</span>
						</xsl:otherwise>
					</xsl:choose>
				</li>
			</xsl:for-each>
		</ul>





		<hr/>
		<h3>Auto regnumbrid mis algavad 2:</h3>
		<br/>
		Kasutame starts-with funktsioonis
		<ul>
			<xsl:for-each select="autod/auto[starts-with(registrinumber, 2)]">
				<xsl:sort select="vaasta" order="descending"/>
			<li>
				<xsl:value-of select="concat(mark, ', ',registrinumber)"/>
			</li>
			</xsl:for-each>
		</ul>
		
		<h2>Autod tabelina</h2>
		<table border="1">
			<tr>
				<th>Reg Number</th>
				<th>Mark</th>
				<th>Väljustamise aasta</th>
				<th>Omanik</th>
				<th>Ülevaatlus</th>
			</tr>
			<xsl:for-each select="autod/auto">
				<tr>
					<td>
						<p>
							<xsl:value-of select="registrinumber"/>
						</p>
					</td>
					<td>
						<p>
							<xsl:value-of select="mark"/>
						</p>
					</td>
					<td>
						<p>
							<xsl:value-of select="vaasta"/>
						</p>
					</td>
					<td>
						<p>
							<xsl:value-of select="omanik"/>
						</p>
					</td>
					<td>
						<p>
							<xsl:variable name="value" select="substring(registrinumber, 3, 1) + 2"/>
							<!-- Loome muutuja nimega 'value', mis salvestab meie numbrid edasiseks kasutamiseks värvimiseks -->
							<xsl:choose>
								<xsl:when test="$value &gt; 9">
									<!-- Kontrollime muutujat, kas see on suurem kui 9, ja värvime punaseks, väljendades sama muutujat -->
									<span style="color: red;">
										<xsl:value-of select="$value"/>
									</span>
								</xsl:when>
								<xsl:otherwise>
									<!-- Muul juhul värvime roheliseks, väljendades sama muutujat -->
									<span style="color: green;">
										<xsl:value-of select="$value"/>
									</span>
								</xsl:otherwise>
							</xsl:choose>
						</p>

					</td>
				</tr>
			</xsl:for-each>
		</table>
    </xsl:template>
</xsl:stylesheet>
