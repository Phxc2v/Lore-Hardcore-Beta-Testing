<?xml version="1.0" encoding="utf-8"?>
<!--
    Lore-Hardcore — рынок Хаоса: фикс пропажи купленного коня Хаоса после сейв/лоада.
    См. подробное объяснение в tor_armors.xslt. Конь Хаоса (BaseGoods) → is_merchandise="true".
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" omit-xml-declaration="no" indent="yes"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- ⚠ РАСШИРЕНО 2026-06-15 (баг лута): ВСЕ chaos-кони/сбруя → merchandise=true (см. tor_armors.xslt). -->
    <xsl:template match="Item[starts-with(@id,'tor_chaos_') or starts-with(@id,'tor_chs_')]/@is_merchandise">
        <xsl:attribute name="is_merchandise">true</xsl:attribute>
    </xsl:template>
</xsl:stylesheet>
