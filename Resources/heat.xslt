<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:wix="http://wixtoolset.org/schemas/v4/wxs"
                xmlns="http://wixtoolset.org/schemas/v4/wxs"
                exclude-result-prefixes="xsl wix">

  <xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />

  <xsl:strip-space elements="*"/>

  <!-- Keys for file extentions to be removed during heat process-->
  <xsl:key name="ExeToRemove"
           match="wix:Component[contains(wix:File/@Source, '.exe')]"
           use="@Id" />
  <xsl:key name="PdbToRemove"
           match="wix:Component[contains(wix:File/@Source, '.pdb')]"
           use="@Id" />
  <xsl:key name="SsisManifestRemove"
           match="wix:Component[contains(wix:File/@Source, '.SSISDeploymentManifest')]"
           use="@Id" />
  <xsl:key name="DevelopmentJsonRemove"
           match="wix:Component[contains(wix:File/@Source, '.Development.json')]"
           use="@Id" />
  
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- Remove the files from heat generated file -->
  <xsl:template match="*[self::wix:Component or self::wix:ComponentRef]
                        [key('ExeToRemove', @Id)]" />
  <xsl:template match="*[self::wix:Component or self::wix:ComponentRef]
                        [key('PdbToRemove', @Id)]" />
  <xsl:template match="*[self::wix:Component or self::wix:ComponentRef]
                        [key('SsisManifestRemove', @Id)]" />
  <xsl:template match="*[self::wix:Component or self::wix:ComponentRef]
                        [key('DevelopmentJsonRemove', @Id)]" />

</xsl:stylesheet>